package geom.curve;
import geom.matrix.Matrix1x2;
class Bezier {
    // Compute an approximation to int (1 + 4x^2) ^ -0.25 dx
    // This isn't especially good but will do.
    public static inline
    function approxInterval( x: Float ) {
       var d = 0.67; 
       return x / (1 - d + Math.pow(Math.pow(d, 4) + 0.25 * x * x, 0.25));
    }
    // Approximate the inverse of the function above.
    // This is better.
    public static inline
    function approxInverseInterval( x: Float ) {
        var b = 0.39;
        return x * (1 - b + Math.sqrt(b * b + 0.25 * x * x));
    }
    // The maximum error between a chord and the quadratic Bezier.
    // Note: this isn't quite right for extreme examples.
    public static inline
    function quadError( p0: Matrix1x2, p1: Matrix1x2, p2: Matrix1x2 ): Float {
        var p10: Matrix1x2 = p1 - p0;
        var p20: Matrix1x2 = p2 - p0;
        var t = ( p10 * p20 ).sumXY() / ( p20 * p20 ).sumXY();
        var p = p0.lerpClampT( p20, t );
        return 0.5 * p.distanceBetweenSquare_( p10 );///distanceBetweenSquare_
    }
    // Subdivide using fancy algorithm.
    public static inline 
    function subdiv( tol: Float, p0: Matrix1x2, p1: Matrix1x2, p2: Matrix1x2 ){
        // Determine the x values and scaling to map to y=x^2
        // map_to_basic() {
        var dd = 2*p1 - p0 - p2;
        var p10 = p1 - p0;
        var p21 = p2 - p1;
        var p20 = p2 - p0;
        var u0 = ( p10 * dd ).sumXY();
        var u2 = ( p20 * dd ).sumXY();
        var cross: Float = p20.perp( dd );
        var x0 = u0 / cross;
        var x2 = u2 / cross;
        // There's probably a more elegant formulation of this...
        var scale: Float = Math.abs( cross ) / ( dd.magnitude * Math.abs( x2 - x0 ) );
        // subdivide
        var a0 = approxInterval( x0 );
        var a2 = approxInterval( x2 );
        var count =  0.5 * Math.abs( a2 - a0 ) * Math.sqrt( scale / tol );
        var n = Math.ceil( count );
        var u0 = approxInverseInterval( a0 );
        var u2 = approxInverseInterval( a2 );
        var result = [ 0. ];
        for( i in 1...n ){
            var u = approxInverseInterval( a0 + ((a2 - a0) * i) / n );
            var t = (u - u0) / (u2 - u0);
            result[ i ] = t;
        }
        result[ n ] = 1.;
        return result;
    }
    // Subdivide using method from Sederberg's CAGD notes
    /*
    public static inline
    function sederberg( tol: Float , roundToPow2, p0: Matrix1x2, p1: Matrix1x2, p2: Matrix1x2 ){
        var dd = 2 * p1 - p0 - p2;
        dd = dd.magnitude;
        var n = Math.ceil( Math.sqrt(0.25 * dd / tol ) );
        if( roundToPow2 ) {
            n = 1 << 32 - Math.clz32(n - 1);
        }
        let result = [];
        for (let i = 0; i < n; i++) {
            const t = i / n;
            result.push(t);
        }
        result.push(1);
        return result;
    }*/
    
    /**
     * provides curveThru so c is mid point on curve
     *
     */
    public static inline
    function quadraticThru( t: Float, s: Float, c: Float, e: Float ): Float {
        c = 2*c - 0.5*( s + c );
        quadratic( t, s, c, e );
    }
    public static inline
    function quadratic( t: Float, s: Float, c: Float, e: Float ): Float {
        var u = 1 - t;
        return Math.pow( u, 2 )*s + 2*u*t*c + Math.pow( t, 2 )*e;
    }
    public static inline
    function quadSegment( t0: Float, t1: Float, s: Float, c: Float, e: Float ){
        var u = t1 - t0;
        return s + (c - s + t0 * (e - 2 * c + s)) * u;
    }
    public static inline
    function cubic( t: Float, s: Float, c1: Float, c2: Float, e: Float ): Float {
        var u = 1 - t;
        return  Math.pow( u, 3 )*s + 3*Math.pow( u, 2 )*t*c1 + 3*u*Math.pow( t, 2 )*c2 + Math.pow( t, 3 )*e;
    }
}
