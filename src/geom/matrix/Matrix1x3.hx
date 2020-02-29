
package geom.matrix;
typedef Vec3 = Matrix1x3;
/** 
   { x, y, z }
   try to use 1x4 for 3D vectors.
**/
@:forward
abstract Matrix1x3( geom.structure.Mat1x3 ) from geom.structure.Mat1x3 to geom.structure.Mat1x3 {
    public inline
    function new( m: geom.structure.Mat1x3 ){ this = m; }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var m = Matrix1x3.counting;
     * ... var arr = new Array<Float>();
     * ... for( i in m ){
     * ...   arr.push(i); 
     * ... }
     * ... [1.,2.,3.].toString() == arr.toString(); }) == true
     * </code></pre>
     */
    public inline
    function iterator() {
        var arr = [ this.x, this.y, this.z ];
        return arr.iterator();
    }
    /**
     * <pre><code>
     * >>> Matrix1x3.zero == new Matrix1x3({ x: 0., y: 0., z: 0. })
     * </code></pre>
     */
    public static var zero( get, never ): Matrix1x3;
    static inline
    function get_zero(): Matrix1x3 {
        return new Matrix1x3( { x: 0., y: 0., z: 0. } );
    }
    /**
     * <pre><code>
     * >>> Matrix1x3.unit == new Matrix1x3({ x: 1., y: 1., z: 1. })
     * </code></pre>
     */
    public static var unit( get, never ): Matrix1x3;
    public static inline
    function get_unit(): Matrix1x3 {
        return new Matrix1x3( { x: 1., y: 1., z: 1. } );
    }
    /**
     * <pre><code>
     * >>> Matrix1x3.counting == new Matrix1x3({ x: 1., y: 2., z: 3. })
     * </code></pre>
     */
    public static var counting( get, never ): Matrix1x3;
    static inline
    function get_counting(): Matrix1x3 {
        return new Matrix1x3( { x: 1., y: 2., z: 3. } );
    }
    public inline
    function clone():Matrix1x3 {
        return new Matrix1x3( { x: this.x, y: this.y, z: this.z } );
    }
    /**
     * <pre><code>
     * >>> Matrix1x3.identity( Matrix1x3.zero ) == new Matrix1x3({ x: 1., y: 1., z: 1. })
     * </code></pre>
     */
    public static inline
    function identity( out: Matrix1x3 ):Matrix1x3 {
            out.x = 1.;
            out.y = 1.;
            out.z = 1.;
            return out;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix1x3({ x: 1., y: 2., z: 3. });
     * ... var b = Matrix1x3.zero;
     * ... var c = Matrix1x3.copy( a, b ); 
     * ... a == c; }) == true
     * </code></pre>
     */
    public inline static
    function copy( pin: Matrix1x3, pout: Matrix1x3 ): Matrix1x3 {
        pout.x = pin.x;
        pout.y = pin.y;
        pout.z = pin.z;
        return pout;
    }
    /**
     * <pre><code>
     * >>> ({ trace('"magnitude" untested'); true; }) == true
     * </code></pre>
     */
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
            this.z *= mul;
            magnitude;
        }
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix1x3({ x: 1., y: 2., z: 3. });
     * ... var b = new Matrix1x3({ x: 1., y: 2., z: 3. });
     * ... a == b; }) == true
     * </code></pre>
     */
    @:op( A == B )
    public static inline
    function equal( a: Matrix1x3, b: Matrix1x3 ): Bool {
        var delta = 0.0000001;
        return !(
               Math.abs(a.x - b.x) >= delta
            || Math.abs(a.y - b.y) >= delta
            || Math.abs(a.z - b.z) >= delta
        );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix1x3({ x: 1., y: 2., z: 3. });
     * ... var b = new Matrix1x3({ x: 1., y: 2., z: 4. });
     * ... a != b; }) == true
     * </code></pre>
     */
    @:op(A != B) public static inline
    function notEqual( a: Matrix1x3, b:Matrix1x3 ): Bool {
        return !equal( a, b );
    }
    /**
     * <pre><code>
     * >>> ({ trace('"magnitude" untested'); true; }) == true
     * </code></pre>
     */
    public inline 
    function magnitudeSquared(): Float {
        return this.x * this.x + this.y * this.y + this.z * this.z;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix1x3.unit;
     * ... a + a == new Matrix1x3({ x: 2., y: 2., z: 2. }); 
     * ... }) == true
     * </code></pre>
     */
    @:op(A + B) public static inline
    function add( a: Matrix1x3, b: Matrix1x3 ): Matrix1x3 {
      	return new Matrix1x3({ x: a.x + b.x, y: a.y + b.y, z: a.z + b.z });
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix1x3.unit;
     * ... a - a == Matrix1x3.zero;
     * ... }) == true
     * </code></pre>
     */
    @:op(A - B) public static inline
    function subtract( a: Matrix1x3, b: Matrix1x3 ): Matrix1x3 {
        return new Matrix1x3({ x: a.x - b.x, y: a.y - b.y, z: a.z - b.z });
    }
    /*
    Not sure this is useful - need some consideration.  see Matrx1x4 as taken commented out direct
    @:op(A * B) public static inline 
    function dot( a: Matrix1x3, b: Matrix1x3 ): Matrix1x3 {
        return new Matrix1x3({ x: a.x * b.x, y: a.y * b.y, z: a.z * b.z });
    }
    */
    // dot product
    public static inline
    function scalarProduct( a: Matrix1x3, b: Matrix1x3 ):Float {
        return a.x * b.x + a.y * b.y + a.z * b.z;
    }
    public inline
    function dotProd( b: Matrix1x3 ):Float {
        return this.x * b.x + this.y * b.y + this.z * b.z;
    }
    @:op(A * B) @:commutative
    public static inline 
    function scaleMultiply( a: Matrix1x3, v: Float ): Matrix1x3 {
        return new Matrix1x3({ x: a.x * v, y: a.y * v, z: a.z * v });
    }
    public inline
    function transformPoint( t: Matrix4x3 ): Matrix1x3 {
        return new Matrix1x3({  x: t.a * this.x + t.b * this.y + t.c * this.z + t.d
                              , y: t.e * this.x + t.f * this.y + t.g * this.z + t.h
                              , z: t.i * this.x + t.j * this.y + t.k * this.z + t.l  
                              });
    }
    @:op(A / B) public static inline
    function divide( a: Matrix1x3, v: Float ): Matrix1x3 {
        return a * ( 1 / v );
    }
    @:op( A / B ) public static inline
    function divide2( v: Float, a: Matrix1x3 ): Matrix1x3 {
        return new Matrix1x3( { x: v/a.x, y: v/a.y, z: v/a.z } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix1x3({ x: 1., y: 2., z: 3. });
     * ... var b = -a;
     * ... b == new Matrix1x3({ x: -1., y: -2., z: -3. }); }) == true
     * </code></pre>
     */
    @:op(-A) public static inline
    function negate( a: Matrix1x3 ):Matrix1x3 {
        return new Matrix1x3( { x: -a.x
                            , y: -a.y
                            , z: -a.z
                            } );
    }
    public inline 
    function cross(v: Matrix1x3): Matrix1x3 {
        return new Matrix1x3( { x: this.y * v.z - this.z * v.y
                              , y: this.z * v.x - this.x * v.z
                              , z: this.x * v.y - this.y * v.x } );
    }
    public inline
    function normalize(): Matrix1x3 {
        magnitude = 1.; 
        return this;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix1x3.unit;
     * ... var b = haxe.ds.Vector.fromArrayCopy([ 1., 1., 1. ]);
     * ... var c: Matrix1x3 = b;
     * ... a == b; }) == true
     * </code></pre>
     */
    @:from
    public static inline
    function fromVec( vec: haxe.ds.Vector<Float> ): Matrix1x3 return Conversion.Vectorto1x3( vec );
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix1x3.unit;
     * ... var b: haxe.ds.Vector<Float> = a;
     * ... var c = haxe.ds.Vector.fromArrayCopy([ 1., 1., 1. ]);
     * ... Equal.equals( b, c ); }) == true
     * </code></pre>
     */
    @:to
    public inline
    function toVector(): haxe.ds.Vector<Float> return Conversion._1x3toVector( this );
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix1x3.unit;
     * ... var b: Matrix1x3 = [ 1., 1., 1. ];
     * ... Equal.equals( a, b ); }) == true
     * </code></pre>
     */
    @:from
    public inline static function fromArray( arr: Array<Float> ): Matrix1x3 return Conversion.Arrayto1x3( arr );
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix1x3.unit;
     * ... var b: Array<Float> = a;
     * ... Equal.equals( b, [ 1., 1., 1. ] ); }) == true
     * </code></pre>
     */
    @:to
    public inline function toArray():Array<Float> return Conversion._1x3toArray( this );
}