package geom;
// provides implementations for Math functions not in Haxe but in browser or otherwise, thought is required about decimal places.
enum abstract MathConstants( Float ){
    var LN2                = 0.69314718055994530941723212145817656807550013436025;
    var LN10               = 2.30258509299404568401799145468436420760110148862877;
    var LOG2E              = 1.442695040888963387;
    var LOG10E             = 0.4342944819032518;
    var SQRTS1_2           = 0.7071067811865476;
    var EPSILON            = 0.0000001;
    var napier             = 2.71828182845904523536028747135266249775724709369995; // e
    var toDegree           = 180/3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679;
    var toRadian           = 3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679/180;
    var archimedes         = 3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679;
    var halfPI             = 3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679/2;
    var ninty              = 3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679/4;
    var pythagoras         = 1.41421356237309504880168872420969807856967187537694807317667973799; // root 2
    var theodorus          = 1.73205080756887729352744634150587236; // root 3
    var root5              = 2.23606797749978969640917366873127623; // root 5
    var feigenbaum         = 4.669201609102990671853203821578;
    var feigenbaum2        = 2.502907875095892822283902873218;
    var goldenRatio        = 1.61803398874989484820458683436563811772030917980576;
    var aperys             = 1.20205690315959428539973816151144999076498629234049;
    var eulerMascheroni    = 0.57721566490153286060651209008240243104215933593992;
    var catalan            = 0.91596559417721901505460351493238411077414937428167;
    var lemniscate         = 5.24411510858423962092967917978223882736550990286324;
    var gammaQuarter       = 3.62560990822190831193068515586767200299516768288006;
    var gammaThird         = 2.67893853470774763365569294097467764412868937795730;
    var zeta               = 1.03692775514336992633136548645703416805708091950191;
    var khinchin           = 2.68545;
    var glaisher           = 1.28243;
    var mertens            = 0.261497;
    var twinPrime          = 0.660162;
}
class Numerical {
    public static inline
    function clz32( v: Float ): Int {
        // Let n be ToUint32(x).
        // Let p be the number of leading zero bits in 
        // the 32-bit binary representation of n.
        // Return p.
        var asUint = v >>> 0;
        if( asUint == 0. ) {
          return 32;
        }
        return 31 - ( Math.log( asUint ) / MathConstants.LN2 | 0) | 0; // the "| 0" acts like math.floor
    }
    public static inline
    function expm1( v: Float ): Float {
      return Math.exp( v ) - 1.;
    }
    public static inline
    function trunc( v: Float ): Int {
        return ( v < 0. )? Math.ceil( v ): Math.floor( v );
    }
    public static inline
    function sinh( x: Float ): Float {
        var y = Math.exp( x );
        return ( y - 1. / y ) / 2.;
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
    function cosh( x: Float ): Float {
      var y = Math.exp( x );
      return ( y + 1. / y ) / 2.;
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
    // cube root
    public static inline
    function cbrt( x: Float ): Float {
        var pow = Math.pow;
        return ( x < 0 )? -pow( -x, (1/3) ): pow( x, (1/3) );
    }
}