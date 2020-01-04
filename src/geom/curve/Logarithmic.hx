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
        return Math.log( x ) * MathConstants.LOG10E;
    }
    public static inline
    function log2( x: Float ): Float {
        return Math.log( x ) * MathConstants.LOG2E;
    }
}
