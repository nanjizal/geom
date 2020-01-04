package curve.geom;

// Hyperbolic functions not provided in Haxe but present in languages like Javascript.
// Created using polyfills.
// Untested.
class Hyperbolic {
    public static inline
    function sinh( x: Float ): Float {
        var y = Math.exp( x );
        return ( y - 1. / y ) / 2.;
    }
    public static inline
    function cosh( x: Float ): Float {
      var y = Math.exp( x );
      return ( y + 1. / y ) / 2.;
    }
    public static inline
    function tanh( x: Float ): Float {
        var a = Math.exp( x );
        var b = Math.exp( -x );
        return if( a == Math.POSITIVE_INFINITY ){
            1.
        } else {
            if( b == Math.POSITIVE_INFINITY ){
                -1
            } else {
                (a - b) / (a + b);
            }
        }
    }
    public static inline
    function acosh( x: Float ): Float {
        return Math.log( x + Math.sqrt( x * x - 1.) );
    }
    public static inline
    function asinh( x: Float ): Float {
        return Math.log( x + Math.sqrt( x * x + 1. ));
    }
    public static inline
    function atanh function( x: Float ): Float {
        return Math.log( ( 1. + x ) / ( 1. - x ) ) / 2.;
    }
}
