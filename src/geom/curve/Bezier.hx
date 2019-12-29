package geom.curve;

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
    function approxInverseIterval( x: Float ) {
        var b = 0.39;
        return x * (1 - b + Math.sqrt(b * b + 0.25 * x * x));
    }
    // The maximum error between a chord and the quadratic BÃ©zier.
    // Note: this isn't quite right for extreme examples.
    public static inline
    function quadError( p0: Matrix1x2, p1: Matrix1x2, p2: Matrix1x2 ): Float {
        // clone points first?
        var p1_ = p1 - p0;
        var p2_ = p2 - p0;
        var t = ( p1_.x * p2_.x + p1_.y * p2_.y) / ( p2_.x * p2_.x + p2_.y * p2_.y );
        var u = Interval.unitFloat( t );
        var p = p0.lerp( p2_, u );
        return 0.5 * p.distanceBetweenSquare_(p1_);///distanceBetweenSquare_
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