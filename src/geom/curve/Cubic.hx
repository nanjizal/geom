package geom.curve;

class Cubic {
    public static inline
    function cube( x: Float ){
        return x*x*x;
    }
    // cube root
    public static inline
    function cbrt( x: Float ): Float {
        var pow = Math.pow;
        return ( x < 0 )? -pow( -x, (1/3) ): pow( x, (1/3) );
    }
}
