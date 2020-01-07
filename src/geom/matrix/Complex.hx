package geom.matrix;
import geom.matrix.Matrix1x2;
import geom.curve.Hyperbolic;
/**
   { x, y }
**/
@:forward
abstract Complex( geom.structure.Mat1x2 ) from geom.structure.Mat1x2 to geom.structure.Mat1x2 {
    public inline
    function new( m: geom.structure.Mat1x2 ){ this = m; }
        /**
     * <pre><code>
     * >>> Complex.zero() == new Complex({ x: 0., y: 0. })
     * </code></pre>
     */
    public static inline
    function zero(): Complex {
        return new Complex( { x: 0., y: 0. } );
    }
        /**
     * <pre><code>
     * >>> Complex.unit() == new Complex({ x: 1., y: 1.. })
     * </code></pre>
     */
    public static inline
    function unit(): Complex {
        return new Complex( { x: 1., y: 1. } );
    }
    public var i( get, set ): Float;
    inline
    function get_i(): Float {
       return this.y;
    }
    inline
    function set_i( v: Float ): Float {
        this.y = v;
        return v;
    }
    public var real( get, set ): Float;
    inline function get_real(): Float {
        return this.x;
    }
    inline function set_real( v: Float ): Float {
        this.x = v;
        return v;
    }
    public inline
    function clone():Complex {
        return new Complex( { x: this.x, y: this.y } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ x: 1., y: 2.. });
     * ... var b = new Complex({ x: 1., y: 2. });
     * ... a == b; }) == true
     * </code></pre>
     */
    @:op( A == B ) public static inline
    function equal( a: Complex, b: Complex ): Bool {
        var delta = 0.0000001;
        return !(
               Math.abs(a.x - b.x) >= delta
            || Math.abs(a.y - b.y) >= delta
        );
    }
     /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ x: 1., y: 2. });
     * ... var b = new Complex({ x: 1., y: 2. });
     * ... a != b; }) == true
     * </code></pre>
     */
    @:op(A != B) public static inline
    function notEqual( a: Complex, b:Complex ): Bool {
        return !equal( a, b );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Complex.unit();
     * ... a + a == new Complex({ x: 2., y: 2. }); 
     * ... }) == true
     * </code></pre>
     */
    @:op(A + B) public static inline
    function add( a: Complex, b: Complex ): Complex {
      	return new Complex({ x: a.x + b.x, y: a.y + b.y });
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Complex.unit();
     * ... a - a == Complex.zero(); 
     * ... }) == true
     * </code></pre>
     */
    @:op(A - B) public static inline
    function subtract( a: Complex, b: Complex ): Complex {
        return new Complex({ x: a.x - b.x, y: a.y - b.y });
    }
    /* <pre><code>
     * >>> ({ 
     * ... var a = 10.;
     * ... var b = new Complex({ x: 1., y: 7. });
     * ... a * b == new Complex({ x: 10, y: 70. });
     * ... }) == true
     * </code></pre>    
    */    
    @:op(A * B) public static inline
    function scale( a: Float, b: Complex ):Complex {
        return new Complex({ x: a * b.x , y: a * b.y });    
    }     
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ x: 3., y: 2. });
     * ... var b = new Complex({ x: 1., y: 7. });
     * ... a * b == new Complex({ x: -11., y: 23. });
     * ... }) == true
     * </code></pre>
     */    
    @:op(A * B) public static inline
    function multiply( a: Complex, b: Complex ):Complex {
        return new Complex({ x: ( a.x * b.y ) - ( a.y * b.y ), y: (a.x * b.y) + (a.y * b.x) });    
    }
    public inline
    function addExponents(){
        return real + i;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ x: 1., y: 2. });
     * ... var b = ~a;
     * ... b == new Complex({ x: 1., y: -2. }); }) == true
     * </code></pre>
     */
    @:op(~A) public static inline
    function conjugate( a: Complex ): Complex {
        return new Complex( { x: a.x, y: -a.y } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ x: 10., y: 5. });
     * ... var b = new Complex({ x: 3., y: 4. });
     * ... a / b == new Complex({ x:3., y: -4. });
     * ... }) == true
     * </code></pre>
     */    
    @:op(A / B) public static inline
    function divide( c1: Complex, c2: Complex ): Complex {
        var conj = ~c2; 
        var numr = c1 * conj;
        var demr = c2 * conj;    
        var dval = demr.real + demr.i; 
        return new Complex({ x: numr.real/dval, y: numr.i/dval } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ x: 1., y: 2. });
     * ... var b = -a;
     * ... b == new Complex({ x: -1., y: -2. }); }) == true
     * </code></pre>
     */
    @:op(-A) public static inline
    function negate( a: Complex ):Complex {
        return new Complex( { x: -a.x, y: -a.y } );
    } 
    public inline 
    function magnitudeSquared(): Float {
        return this.x * this.x + this.y * this.y;
    }
    public var magnitude( get, set ): Float;
    private inline
    function get_magnitude(): Float {
        return Math.sqrt( magnitudeSquared() );
    }
    private inline
    function set_magnitude( length: Float ): Float {
        var currentLength = get_magnitude();
        return if( currentLength == 0. ){ 
            0.;
        } else {
            var mul = length / currentLength;
            this.x *= mul;
            this.y *= mul;
            magnitude;
        }
    }
    public inline
    function phase(): Float {
        return Math.atan2( i, real );
    }
    public inline
    function isReal(): Bool {
        return i == 0;
    }
    public inline
    function isImaginary(): Bool {
        return real == 0;
    }
    public static inline
    function cis( angle: Float ): Complex {
       return new Complex({ x: Math.cos( angle ), y: Math.sin( angle ) });
    }
    public inline
    function fromCircle( r: Float , angle: Float ): Complex {
        return r* cis( angle ); 
    }
    public inline
    function square( c: Complex ): Complex {
       return if( c.isReal() == true ){
            new Complex({ x: c.real*c.real, y: 0 });
       } else {
            //return magnitude * cis( theta );
            var here = new Complex({ x: c.x, y: c.y });
            here*here;
       }
    }
    public static inline
    function exp( c: Complex ): Complex {
       return if( c.isReal() == true ){
            new Complex({ x: Math.exp( c.real ), y: 0 });
       } else {
            new Complex({ x: Math.exp(c.real) * Math.cos(c.i), y:Math.exp(c.real) * Math.sin(c.i) });
       }
    }
    public inline
    function reciprocal() {
        var scale = real*real + i*i;
        return new Complex({ x: real / scale, y: -i / scale });
    }
    //DeMoivre's Theorem    
    public static inline
    function pow( c: Complex, n: Float ): Complex {
        return if( c.isReal() == true ){
            new Complex({x: Math.pow( c.real, n ), y: 0 });
        } else {
            Math.pow( c.magnitude , n )*cis( n*c.phase() );
        }
    }
    public static inline
    function squareRoot( c: Complex ): Complex{
        return pow( c, 0.5 );
    }
    public inline
    function root2(): Complex {
        return squareRoot( this );
    }
}
