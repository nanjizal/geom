package geom.curve;
import geom.matrix.Complex;
import geom.curve.Hyperbolic;
// untested
// needs testing unsure on how?
// need inverse functions?
class ComplexTrig {
    public static inline 
    function sin( c: Complex ): Complex {
       return if( Complex.isReal( c ) == true ){
            new Complex({ x: Math.sin( c.real ), y: 0 });
        } else { 
            new Complex({ x: Math.sin(c.real) * Hyperbolic.cosh(c.i), y: Math.cos(c.real) * Hyperbolic.sinh(c.i) });
        }
    }
    public static inline
    function cos( c: Complex ):Complex {
        return if( Complex.isReal( c ) == true ){
            new Complex({ x: Math.cos( c.real ), y: 0 } );
        } else {
            new Complex({ x: Math.cos(c.real) * Hyperbolic.cosh(c.i), y: -Math.sin(c.real) * Hyperbolic.sinh(c.i) });
        }
    }
    public static inline 
    function tan( c: Complex ): Complex {
        return if( Complex.isReal( c ) == true ){
            new Complex({ x: Math.tan2( c.real ), y: 0 });
        } else {
            var s = sin(c);
            var c = cos(c);
            s/c;
        }
    }
}
