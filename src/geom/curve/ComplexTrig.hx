package geom.curve;
import geom.matrix.Complex;
import geom.curve.Hyperbolic;
// untested
// needs testing unsure on how?
// need inverse functions?
class ComplexTrig {
    public static inline 
    function sin( c: Complex ): Complex {
       return if( c.isReal() == true ){
            new Complex({ x: Math.sin( c.real ), y: 0 });
        } else { 
            new Complex({ x: Math.sin(c.real) * Hyperbolic.cosh(c.i)
                        , y: Math.cos(c.real) * Hyperbolic.sinh(c.i) });
        }
    }
    public static inline
    function cos( c: Complex ):Complex {
        return if( c.isReal() == true ){
            new Complex({ x: Math.cos( c.real ), y: 0 } );
        } else {
            new Complex({ x: Math.cos(c.real) * Hyperbolic.cosh(c.i)
                        , y: -Math.sin(c.real) * Hyperbolic.sinh(c.i) });
        }
    }
    public static inline 
    function tan( c: Complex ): Complex {
        return if( c.isReal() == true ){
            new Complex({ x: Math.tan( c.real ), y: 0 });
        } else {
            var s = sin(c);
            var c = cos(c);
            s/c;
        }
    }
    public static inline
    function sinh( c: Complex ): Complex {
        return if( c.isReal() == true ){
             new Complex({ x: Hyperbolic.sinh( c.real ), y: 0 });
         } else { 
             new Complex({ x: Hyperbolic.sinh(c.real) * Math.cos(c.i)
                         , y: Hyperbolic.cosh(c.real) * Math.sin(c.i) });
         }
    }
    public static inline
    function cosh( c: Complex ): Complex {
        return if( c.isReal() == true ){
             new Complex({ x: Hyperbolic.cosh( c.real ), y: 0 });
         } else { 
             new Complex({ x: Hyperbolic.cosh(c.real) * Math.cos(c.i)
                         , y: Hyperbolic.sinh(c.real) * Math.sin(c.i) });
         }
    }
    public static inline
    function tanh( c: Complex ): Complex {
        return if( c.isReal() == true ){
             new Complex({ x: Hyperbolic.tanh( c.real ), y: 0 });
         } else { 
             var hx = Hyperbolic.tanh( c.real );
             var ty = Math.tan( c.i );
             var n = new Complex({ x: hx, y: ty });
             var d = new Complex({ x: 1,  y: hx * ty });
             n/d;
         }
    }
}
