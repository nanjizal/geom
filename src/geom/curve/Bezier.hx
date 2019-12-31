package geom.curve;
// considering a Raph tweet on Beziers on segmentation, porting and distorting from js slowly.
// currently only quadratic and cubic used.
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
        var p10 = p1 - p0;
        var p20 = p2 - p0;
        var t = ( p10 * p20 ) / ( p20 * p20 );
        var p = p0.lerpClampT( p20, t );
        return 0.5 * p.distanceBetweenSquare_( p10 );
    }
    // Subdivide using fancy algorithm.
    public static inline 
    function subdiv( tol: Float, p0: Matrix1x2, p1: Matrix1x2, p2: Matrix1x2 ){
        // Determine the x values and scaling to map to y=x^2
        // map_to_basic
        var dd = 2*p1 - p0 - p2;
        var p10 = p1 - p0;
        var p21 = p2 - p1;
        var p20 = p2 - p0;
        var u0 = p10 * dd;
        var u2 = p20 * dd;
        var cross = p20 * dd;
        var x0 = u0 / cross;
        var x2 = u2 / cross;
        // There's probably a more elegant formulation of this...
        var scale = Math.abs( cross ) / ( dd.magnitude * Math.abs( x2 - x0 ) );
        // subdivide
        var a0 = approx_myint( x0 );
        var a2 = approx_myint( x2 );
        var count =  0.5 * Math.abs( a2 - a0 ) * Math.sqrt( params.scale / tol );
        var n = Math.ceil( count );
        var u0 = approx_inv_myint( a0 );
        var u2 = approx_inv_myint( a2 );
        var result = [ 0. ];
        for( i in 1...n ){
            var u = approx_inv_myint( a0 + ((a2 - a0) * i) / n );
            var t = (u - u0) / (u2 - u0);
            result[ i ] = t;
        }
        result[ n ] = 1.;
        return result;
    }
    public static inline
    function quadratic ( t: Float, s: Float, c: Float, e: Float ): Float {
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
