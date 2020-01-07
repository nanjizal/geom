package geom.curve;
import geom.Numerical;// MathConstants
class Logarithmic {
    public static inline
    function expm1( v: Float ): Float {
      return Math.exp( v ) - 1.;
    }
    public static inline
    function log1p( x: Float ): Float {
        return Math.log( 1. + x );
    }
    public static inline
    function log10( x: Float ): Float {
        var v: Float = MathConstants.LOG10E;
        return Math.log( x ) * v;
    }
    public static inline
    function log2( x: Float ): Float {
        var v: Float = MathConstants.LOG2E;
        return Math.log( x ) * v;
    }
}
