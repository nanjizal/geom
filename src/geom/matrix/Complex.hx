package geom.matrix;
import geom.matrix.Matrix1x2;
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
    function unit(): Quaternion {
        return new Complex( { x: 1., y: 1. } );
    }}
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
    public var real( v: Float ): Float;
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
     /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ x: 3., y: 2. });
     * ... var b = new Complex({ x: 1., y: 7. });
     * ... a * b == new Complex({ x: -11., y: 23. });
     * ... }) == true
     * </code></pre>
     */    @:op(A * B) public static inline
    function multiply( a: Complex, b: Complex ):Complex {
        return new Complex({ x: ( a.x * b.b ) - ( a.y * b.y ), y: (a.x * b.y) + (a.y * b.x) });    
    }
    public static inline
    function addExponents(){
        return r + i;
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
    @:op(A / B) public static inline
    function divide( c1: Complex, c2: Complex ): Complex {
        var conj = ~c2; 
        var numr = c1 * conj;
        var demr = c2 * conjc2;    
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
    function theta(): Float {
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
    public inline function
    function fromCircle( r: Float , angle: Float ){
        return new Complex({ x:r*Math.cos( angle ), y:r*Math.sin( angle ) });
    }
}
