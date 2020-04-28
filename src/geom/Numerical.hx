package geom;
// provides implementations for Math functions not in Haxe but in browser or otherwise, thought is required about decimal places.
// move hyperbolic functions to curve.Hyperbolic
// move log stuff to curve.Logarithmic
enum abstract MathConstants( Float ) to Float from Float {
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
    var tau                = 2*3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679;
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
    /**
     * This is probably broken?  More investigation required.
     **/
    public static inline
    function clz32( v: Int ): Int {
        // Let n be ToUint32(x).
        // Let p be the number of leading zero bits in 
        // the 32-bit binary representation of n.
        // Return p.
        var asUint = v >>> 0;
        if( asUint == 0. ) {
          return 32;
        }
        var v: Float = MathConstants.LN2;
        var out = Math.floor( Math.log( asUint ) / v );
        return 31 - out;
    }
    /**
     *  Provides Math.max for Integer
    **/
    public static inline
    function maxInt2( a: Int, b: Int ): Int{
        return if( a > b ){
            a;
        } else {
            b;
        }
    }
    /**
     *  Provides Math.min for Integer
    **/
    public static inline
    function minInt2( a: Int, b: Int, c: Int ): Int {
        return if( a < b ){
            a;
        } else {
            b;
        }
    }
    /**
     *  Provides Math.min for 3 Integer 
    **/
    public static inline
    function minInt3( a: Int, b: Int, c: Int ): Int {
        return if( a < b ){
            if( a < c ){
                a;
            } else {
                c;
            }
        } else {
            if( b < c ){
                b;
            } else {
                c;
            }
        }
    }
    /**
     *  Provides Math.max for 3 Integer
    **/
    public static inline
    function maxInt3( a: Int, b: Int, c: Int ): Int{
        return if( a > b ){
            if( a > c ){
                a;
            } else {
                c;
            }
        } else {
            if( b > c ){
                b;
            } else {
                c;
            }
        }
    }
}
