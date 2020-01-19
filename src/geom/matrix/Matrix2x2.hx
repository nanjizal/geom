package geom.matrix;
/** 
   ![2x2](../bootstrap/img/matrix2x2.png)
**/
@:forward
abstract Matrix2x2( geom.structure.Mat2x2 ) from geom.structure.Mat2x2 to geom.structure.Mat2x2 {
    public inline
    function new( m: geom.structure.Mat2x2 ){ this = m; }
    public inline 
    function clone(): Matrix2x2 {
        return new Matrix2x2( { a: this.a, b: this.b 
                              , c: this.c, d: this.d } );
    }
    public inline
    function create( a: Float, b: Float, c: Float, d: Float ): Matrix2x2 {
        this = new Matrix2x2( { a:a, b:b 
                              , c:c, d:d } );
        return this;
    }
    /**
     * <pre><code>
     * >>> Matrix2x2.zero == new Matrix2x2( { a: 0., b: 0., c: 0., d: 0. } )
     * </code></pre>
     */
    public static var zero( get, never ): Matrix2x2;
    static inline
    function get_zero(): Matrix2x2 {
        return new Matrix2x2( { a: 0., b: 0.
                              , c: 0., d: 0. } );
    }
    /**
     * <pre><code>
     * >>> Matrix2x2.unit == new Matrix2x2( { a: 1., b: 0., c: 0., d: 1. } )
     * </code></pre>
     */
    public static var unit( get, never ): Matrix2x2;
    static inline
    function get_unit(): Matrix2x2 {
        return new Matrix2x2( { a: 1., b: 0.
                              , c: 0., d: 1. } );
    }
    /**
     * Used for testing
     * <pre><code>
     * >>> Matrix2x2._1234 == new Matrix2x2( { a: 1., b: 2., c: 3., d: 4. } )
     * </code></pre>
     */
    public static var _1234( get, never ): Matrix2x2;
    static inline
    function get__1234(): Matrix2x2 {
        return new Matrix2x2( { a: 1., b: 2.
                           , c: 3., d: 4.} );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix2x2.topLeft() == new Matrix2x2( { a: 1., b: 0.
     * ...                                       , c: 0., d: -1. } );
     * ... }) == true
     * </code></pre>
     */
    public static inline
    function topLeft(){
        return new Matrix2x2( { a: 1., b: 0.
                              , c: 0., d: -1. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix2x2.topRight() == new Matrix2x2( { a: 1., b: 0.
     * ...                                        , c: 0., d: 1. } );
     * ... }) == true
     * </code></pre>
     */
    public static inline
    function topRight(){
        return new Matrix2x2( { a: 1., b: 0.
                              , c: 0., d: 1. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix2x2.bottomLeft() == new Matrix2x2( { a: -1., b: 0.
     * ...                                          , c: 0., d: -1. } );
     * ... }) == true
     * </code></pre>
     */
    public static inline 
    function bottomLeft(){
         return new Matrix2x2( { a: -1., b: 0.
                               , c: 0., d: -1. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix2x2.bottomRight() == new Matrix2x2( { a: 1., b: 0.
     * ...                                           , c: 0., d: -1. } );
     * ... }) == true
     * </code></pre>
     */
    public static inline
    function bottomRight(){
        return new Matrix2x2( { a: 1., b: 0.
                              , c: 0., d: -1. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix2x2.north() == new Matrix2x2( { a: 0., b: 0.
     * ...                                     , c: 0., d: 1. } );
     * ... }) == true
     * </code></pre>
     */
    public static inline
    function north(){
        return new Matrix2x2( { a: 0., b: 0.
                              , c: 0., d: 1. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix2x2.south() == new Matrix2x2( { a: 0., b: 0.
     * ...                                     , c: 0., d: -1. } );
     * ... }) == true
     * </code></pre>
     */
    public static inline
    function south(){
        return new Matrix2x2( { a: 0., b: 0.
                              , c: 0., d: -1. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix2x2.west() == new Matrix2x2( { a: -1., b: 0.
     * ...                                    , c: 0.,  d: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static inline
    function west(){
        return new Matrix2x2( { a: -1., b: 0.
                              , c: 0.,  d: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix2x2.east() == new Matrix2x2( { a: 1., b: 0.
     * ...                                    , c: 0., d: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static inline
    function east(){
        return new Matrix2x2( { a: 1., b: 0.
                              , c: 0., d: 0. } );
    }
    
    /**
     * <pre><code>
     * >>> Matrix2x2.scale( new Matrix1x2( { x: 2., y: 2. } ) ) == new Matrix2x2( { a: 2., b: 0., c: 0.,  d: 2. } )
     * </code></pre>
     */
    public static inline
    function scale( p: Matrix1x2 ): Matrix2x2 {
        return new Matrix2x2( { a: p.x, b: 0.
                              , c: 0.,  d: p.y } );
    }
    /**
     * <pre><code>
     * >>> 
     * </code></pre>
     */
    public static inline
    function rotation( alpha: Float ): Matrix2x2 {
        return new Matrix2x2( { a: Math.cos( alpha ), b: -Math.sin( alpha )
                             ,  c: Math.sin( alpha ), d: Math.cos( alpha ) } );
    }
    /**
     * <pre><code>
     * >>> 
     * </code></pre>
     */
    public inline
    function transpose(): Matrix2x2 {
        return new Matrix2x2( { a: this.a, b: this.c
                              , c: this.b, d: this.d } );
    }    
    /**
     * <pre><code>
     * >>> ({
     * ... var a = Matrix2x2.unit;
     * ... a + a == new Matrix2x2({ a: 2., b: 0., c: 0., d: 2. });
     * ... }) == true
     * </code></pre>
     */
    @:op(A + B) public static inline
    function add( m0: Matrix2x2, m1: Matrix2x2 ): Matrix2x2 {
        return new Matrix2x2( { a: m0.a + m1.a, b: m0.b + m1.b
                              , c: m0.c + m1.c, d: m0.d + m1.d } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix2x2({ a: 1., b: 2., c: 3., d: 4. });
     * ... var b = new Matrix2x2({ a: 1., b: 2., c: 3., d: 4. });
     * ... a == b; }) == true
     * </code></pre>
     */
    @:op( A == B )
    public static inline
    function equal( a: Matrix2x2, b: Matrix2x2 ): Bool {
        var delta = 0.0000001;
        return !(
               Math.abs(a.a - b.a) >= delta
            || Math.abs(a.b - b.b) >= delta
            || Math.abs(a.c - b.c) >= delta
            || Math.abs(a.d - b.d) >= delta
        );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix2x2({ a: 1., b: 2., c: 3., d: 1. });
     * ... var b = new Matrix2x2({ a: 1., b: 2., c: 4., d: 1. });
     * ... a != b; }) == true
     * </code></pre>
     */
    @:op(A != B) public static inline
    function notEqual( a: Matrix2x2, b:Matrix2x2 ): Bool {
        return !equal( a, b );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... var a = Matrix2x2.unit;
     * ... a - a == Matrix2x2.zero;
     * ... }) == true
     * </code></pre>
     */
    @:op(A - B) public static inline
    function sub( m0: Matrix2x2, m1: Matrix2x2 ): Matrix2x2 {
        return new Matrix2x2( { a: m0.a - m1.a, b: m0.b - m1.b
                              , c: m0.c - m1.c, d: m0.d - m1.d } );
    }
    @:op(A * B) public static inline
    function multiplyValue( v: Float, m: Matrix2x2 ): Matrix2x2 {
        return new Matrix2x2( { a: m.a*v, b: m.b*v
                              , c: m.c*v, d: m.d*v } );
    }
    @:op(A * B) public static inline
    function scaleMultiply( p: Matrix1x2, m: Matrix2x2 ): Matrix2x2 {
        return new Matrix2x2( { a: m.a*p.x, b: m.b
                              , c: m.c,     d: m.d*p.y } );
    }
    @:op(A * B) public static inline
    function multiply( a2: Matrix2x2, b2: Matrix2x2 ): Matrix2x2 {
        return new Matrix2x2( { a: a2.a*b2.a + a2.b*b2.c, b: a2.a*b2.b + a2.b*b2.d
                              , c: a2.c*b2.a + a2.d*b2.c, d: a2.c*b2.b + a2.d*b2.d } );
    }
    public inline
    function multiplyPoint( p: Matrix1x2 ): Matrix1x2 {
        var x = this.a * p.x + this.c * p.y;
        var y = this.b * p.x + this.d * p.y;
        return new Matrix1x2( { x: x, y: y } );
    }
    public inline
    function det(){
      return this.a*this.d - this.b*this.c;
    }
    public inline
    function inverse(): Matrix2x2 {
        var d = det();
        return if( d == 0 ) {
            return null;
        } else {
            var adj = new Matrix2x2( { a: this.d,  b: -this.b
                                     , c: -this.c, d: this.a } );
            (1/d)*adj;
        }
    }
    @:to public inline // assumes 2D use, z == 1
    function to3x3(): Matrix3x3 {
        return new Matrix3x3( { a: this.a, b: this.b, c: 0.
                              , d: this.c, e: this.d, f: 0.
                              , g: 0.,     h: 0,      i: 1. } );
    }
    @:to public inline // assumes 3D use, z == 0
    function to4x3(): Matrix4x3 {
        return new Matrix4x3( { a: this.a, b: this.b, c: 0., d: 0.
                              , e: this.c, f: this.d, g: 0., h: 0.
                              , i: 0.,     j: 0.,     k: 0., l: 0. } );
    }
    @:from public static inline // no translate applied
    function from3x3( m3: Matrix3x3 ): Matrix2x2 {
        return new Matrix2x2( { a: m3.a, b: m3.b
                              , c: m3.d, d: m3.e } );
    }
    @:from public static inline // no 3d info applied
    function from4x3( m4: Matrix4x3 ): Matrix2x2 {
        return new Matrix2x2( { a: m4.a, b: m4.b
                              , c: m4.e, d: m4.f } );
    }
    @:from public static inline
    function fromArr( arr: Array<Float> ): Matrix2x2 {
        return new Matrix2x2( { a: arr[0], b: arr[1]
                             , c: arr[2], d: arr[3] } );
    }
    @:to public inline
    function toArray(): Array<Float> {
        return [ this.a, this.b
               , this.c, this.d ];
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix2x2.unit;
     * ... var b = haxe.ds.Vector.fromArrayCopy([ 1., 0., 0., 1. ]);
     * ... var c: Matrix2x2 = b;
     * ... a == c; 
     * ... }) == true
     * </code></pre>
     */
    @:from public static inline
    function fromVec( vec: haxe.ds.Vector<Float> ): Matrix2x2 {
        return new Matrix2x2( { a: vec.get(0), b: vec.get(1),
                               c: vec.get(2), d: vec.get(3) } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix2x2.unit;
     * ... var b: haxe.ds.Vector<Float> = a;
     * ... var c = haxe.ds.Vector.fromArrayCopy([ 1., 0., 0., 1. ]);
     * ... Equal.equals( b, c ); }) == true
     * </code></pre>
     */
    @:to public inline
    function toVector(): haxe.ds.Vector<Float> {
        var vec = new haxe.ds.Vector<Float>(4);
        vec.set(0, this.a); vec.set(1, this.b);
        vec.set(2, this.c); vec.set(3, this.d);
        return vec;
    }
    /**
     * <pre><code>
     * >>> ({
     * ... var a = Matrix2x2.unit;
     * ... a.setXY( 0, 0, 1. );
     * ... a.setXY( 1, 0, 2. );
     * ... a.setXY( 0, 1, 3. );
     * ... a.setXY( 1, 1, 4. );
     * ... var b = new Matrix2x2({ a: 1., b: 2., c: 3., d: 4. });
     * ... a == b;
     * ... }) == true
     * </code></pre>
     */
    
    public inline function setXY( x: Int, y: Int, v: Float  ): Matrix2x2 {
        switch [ x, y ] {
            case [ 0,0 ]: this.a = v; case [ 1,0 ]: this.b = v;
            case [ 0,1 ]: this.c = v; case [ 1,1 ]: this.d = v;
            case _: throw ('bad set $x, $y on Matrix2x2' ); }
        return this;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix2x2({ a: 1., b: 2., c: 3., d: 4. });
     * ... a.getXY( 0, 0 ) == 1 && a.getXY( 1, 0 ) == 2 && a.getXY( 0, 1 ) == 3 && a.getXY( 1, 1 ) == 4;
     * ... }) == true
     * </code></pre>
     */
    public inline function getXY( x: Int, y: Int  ): Float {
        return switch [ x, y ] {
            case [ 0, 0 ]: this.a; case [ 1, 0 ]: this.b;
            case [ 0, 1 ]: this.c; case [ 1, 1 ]: this.d;
            case _: throw ('bad get $x, $y on Matrix2x2' ); }
    }
}
