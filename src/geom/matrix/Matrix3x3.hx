package geom.matrix;
import geom.matrix.Matrix1x2;
import geom.matrix.Matrix4x3;
/** 
   ![3x3](../../bootstrap/img/matrix3x3.png)
**/
@:forward
abstract Matrix3x3( geom.structure.Mat3x3 ) from geom.structure.Mat3x3 to geom.structure.Mat3x3 {
    public static inline 
    final rows = 3;
    public static inline
    final columns = 3;
    public inline
    function new( m: geom.structure.Mat3x3 ){ this = m; }
                        //-------------------
                        // Common Functionality  
                        //-------------------
    /**
     * <pre><code>
     * >>> Matrix3x3.counting == Matrix3x3.counting.clone() 
     * </code></pre>
     */
    public inline 
    function clone(): Matrix3x3 {
        return new Matrix3x3( { a: this.a, b: this.b, c: this.c
                              , d: this.d, e: this.e, f: this.f
                              , g: this.g, h: this.h, i: this.i } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var m = Matrix3x3.counting;
     * ... var arr = new Array<Float>();
     * ... for( i in m ){
     * ...   arr.push(i); 
     * ... }
     * ... [1.,2.,3.,4.,5.,6.,7.,8.,9.].toString() == arr.toString(); }) == true
     * </code></pre>
     */
    public inline
    function iterator() {
        var arr = [ this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i ];
        return arr.iterator();
    }
    public var self(get,never):Matrix3x3;
    inline
    function get_self() return (cast this : Matrix3x3);
                        //-------------------
                        // Common Constants  
                        //-------------------
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix3x3.zero == new Matrix3x3( { a: 0., b: 0., c: 0.
     * ...                                    , d: 0., e: 0., f: 0.
     * ...                                    , g: 0., h: 0., i: 0. }); 
     * ... }) == true
     * </code></pre>
     */
    public static var zero( get, never ): Matrix3x3;
    static inline
    function get_zero(): Matrix3x3 {
        return new Matrix3x3({ a: 0., b: 0., c: 0.
                             , d: 0., e: 0., f: 0.
                             , g: 0., h: 0., i: 0. });
    }
    var nought( get, never ): Matrix3x3;
    inline
    function get_nought(): Matrix3x3 {
        return zero;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... Matrix3x3.unit == new Matrix3x3({ a: 1., b: 0., c: 0.
     * ...                                  , d: 0., e: 1., f: 0.
     * ...                                  , g: 0., h: 0., i: 1. });
     * ... }) == true
     * </code></pre>
     */
    public static var unit( get, never ): Matrix3x3;
    public static inline
    function get_unit(): Matrix3x3 {
      	return new Matrix3x3({ a: 1., b: 0., c: 0.
                             , d: 0., e: 1., f: 0.
                             , g: 0., h: 0., i: 1. });
    }
    var one( get, never): Matrix3x3;
    inline
    function get_one(): Matrix3x3 {
        return unit;
    }
    /**
     * <pre><code>
     * >>> Matrix3x3.minus1 == new Matrix3x3({ a: -1., b: 0., c: 0.
     * ...                                   , d: 0.,  e: -1., f: 0.
     * ...                                   , g: 0.,  h: 0., i: -1. })
     * </code></pre>
     */
    public static var minus1( get, never ): Matrix3x3;
    static inline
    function get_minus1(): Matrix3x3 {
        return -Matrix3x3.unit;
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix3x3.counting == new Matrix3x3( { a: 1., b: 2., c: 3.
     * ...                                      , d: 4., e: 5., f: 6.
     * ...                                      , g: 7., h: 8., i: 9. }); 
     * ... }) == true
     * </code></pre>
     */
    public static var counting( get, never ): Matrix3x3;
    static inline
    function get_counting(): Matrix3x3 {
        return new Matrix3x3({ a: 1., b: 2., c: 3.
                             , d: 4., e: 5., f: 6.
                             , g: 7., h: 8., i: 9. });
    }
    var testCount( get, never ): Matrix3x3;
    inline
    function get_testCount(): Matrix3x3 {
        return counting;
    }
    /**
     * Used for testing
     * <pre><code>
     * >>> ({
     * ... Matrix3x3._123456789 == new Matrix3x3({ a: 1., b: 2., c: 3.
     * ...                                         , d: 4., e: 5., f: 6.
     * ...                                         , g: 7., h: 8., i: 9. });
     * ... }) == true
     * </code></pre>
     */
    public static var _123456789( get, never ): Matrix3x3;
    static inline
    function get__123456789(): Matrix3x3 {
        return new Matrix3x3( { a: 1., b: 2., c: 3.
                              , d: 4., e: 5., f: 6.
                              , g: 7., h: 8., i: 9. } );
    }
    public static inline
    function radianX( theta: Float ): Matrix3x3 {
        var c = Math.cos( theta );
        var s = Math.sin( theta );
        return new Matrix3x3({ a: 1., b: 0., c: 0.
                             , d: 0., e: c,  f: -s
                             , g: 0., h: s,  i: c } );
    }
    public inline
    function rotateX( theta: Float ) : Matrix3x3 { return this * radianX( theta ); }
    public static inline
    function radianY( theta: Float ): Matrix3x3 {
        var c = Math.cos( theta );
        var s = Math.sin( theta );
        return new Matrix3x3({ a: c,  b: 0., c: s
                             , d: 0., e: 1., f: 0
                             , g: -s,  h: 0., i: c } );
    }
    public inline
    function rotateY( theta: Float ) : Matrix3x3 { return this * radianY( theta ); }
    public static inline
    function radianZ( theta: Float ): Matrix3x3 {
        var c = Math.cos( theta );
        var s = Math.sin( theta );
        return new Matrix3x3({ a: c,  b: -s, c: 0.
                             , d: s,  e: c,  f: 0.
                             , g: 0., h: 0., i: 1. } );
    }
    public inline
    function rotateZ( theta: Float ) : Matrix3x3 { return this * radianZ( theta ); }
    public inline// for 2D
    function rotate( theta: Float ) : Matrix3x3 { return this * radianZ( -theta ); }
    public static inline// for 2D
    function xShear( theta: Float ): Matrix3x3 {
        return new Matrix3x3({ a: 1., b: Math.tan( theta ), c: 0.
                             , d: 0,  e: 1.,                f: 0.
                             , g: 0., h: 0.,                i: 1. } );
    }
   
    public inline // for 2D
    function shearX( theta: Float ) : Matrix3x3 { return this * xShear( theta ); }
    public static inline // for 2D
    function yShear( theta: Float ): Matrix3x3 {
        return new Matrix3x3({ a: 1.,                 b: 0.,  c: 0.
                             , d: Math.tan( theta ),  e: 1.,  f: 0.
                             , g: 0.,                 h: 0.,  i: 1. } );
    }
    public inline // for 2D
    function shearY( theta: Float ): Matrix3x3 { return this * yShear( theta ); }
    public static inline // for 2D
    function xFlip(): Matrix3x3 {
        return new Matrix3x3({ a: 1., b: 0.,   c: 0.
                             , d: 0,  e: -1.,  f: 0.
                             , g: 0., h: 0.,   i: 1. } );
    }
    public inline // for 2D
    function flipX(): Matrix3x3 { return this * xFlip(); }
    public static inline // for 2D
    function yFlip(): Matrix3x3 {
        return new Matrix3x3({ a: -1., b: 0., c: 0.
                             , d: 0,  e: 1.,  f: 0.
                             , g: 0., h: 0.,  i: 1. } );
    }
    public inline // for 2D
    function flipY(): Matrix3x3 { return this * yFlip(); }
    public static inline 
    function xyFlip(): Matrix3x3 {
        return new Matrix3x3({ a: -1., b: 0.,  c: 0.
                             , d: 0,   e: -1., f: 0.
                             , g: 0.,  h: 0.,  i: 1. } );
    }
    public inline
    function flipXY(){ return this * xyFlip(); }
    public static inline
    function sxyz( x: Float, y: Float, z: Float ): Matrix3x3 {
        return new Matrix3x3({ a: x,  b: 0., c: 0.
                             , d: 0., e: y,  f: 0.
                             , g: 0., h: 0., i: z } );
    }
    public inline
    function scaleXYZ( x: Float, y: Float, z: Float ){ return this * sxyz( x, y, z ); }
    public static inline
    function sx( x: Float ): Matrix3x3 {
        return new Matrix3x3({ a: x,  b: 0., c: 0.
                             , d: 0., e: 1., f: 0.
                             , g: 0., h: 0., i: 1. } );
    }
    public inline
    function scaleX( x: Float ): Matrix3x3 { return this * sx( x ); }
    public static inline // only 3D
    function sy( y: Float ): Matrix3x3 {
        return new Matrix3x3({ a: 1., b: 0., c: 0.
                             , d: 0., e: y,  f: 0.
                             , g: 0., h: 0., i: 1. } );
    }
    public inline
    function scaleY( y: Float ): Matrix3x3 { return this * sy( y ); }
    public static inline
    function sz( z: Float ): Matrix3x3 {
        return new Matrix3x3({ a: 1., b: 0., c: 0.
                             , d: 0., e: 1., f: 0.
                             , g: 0., h: 0., i: z } );
    }
    public inline
    function scaleZ( z: Float ): Matrix3x3 {
        return this * sz( z );
    }
    public inline
    function scale( s: Float ): Matrix3x3 {
        return this * scaleXYZ( s, s, s );
    }
    public inline // for use with 2D
    function scale2D( s: Float ): Matrix3x3 {
        return this * new Matrix3x3({ a: s,  b: 0., c: 0.
                                    , d: 0., e: s,  f: 0.
                                    , g: 0., h: 0., i: 1. } );
    }
    public static inline // for use with 2D
    function tx( x: Float ): Matrix3x3 {
        return new Matrix3x3({ a: 1., b: 0., c: x
                             , d: 0., e: 1., f: 0.
                             , g: 0., h: 0., i: 1. } );
    }
    public inline // for use with 2D
    function translateX( x: Float ): Matrix3x3 {
        return this * tx( x );
    }
    public static inline // for use with 2D
    function ty( y: Float ): Matrix3x3 {
        return new Matrix3x3({ a: 1., b: 0., c: 0.
                             , d: 0., e: 1., f: y
                             , g: 0., h: 0., i: 1. } );
    }
    public static inline // for use with 2D
    function txy( x: Float, y: Float ): Matrix3x3 {
        return new Matrix3x3({ a: 1., b: 0., c: x
                             , d: 0., e: 1., f: y
                             , g: 0., h: 0., i: 1. } );
    }
    public inline // for use with 2D
    function translateXY( x: Float, y: Float ): Matrix3x3 {
        return this * txy( x, y );
    }
    public inline
    function transpose(): Matrix3x3 {
        return new Matrix3x3( { a: this.a, b: this.d, c: this.g
                              , d: this.b, e: this.e, f: this.h
                              , g: this.c, h: this.f, i: this.i } ); 
    }
    //-------------------
    // Common operators  
    //-------------------
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix3x3.counting;
     * ... var b = -a;
     * ... b == new Matrix3x3({ a: -1., b: -2., c: -3., d: -4., e: -5., f: -6., g: -7., h: -8., i: -9. }); }) == true
     * </code></pre>
     */
    @:op( -A ) public static inline
    function negating( a:Matrix3x3 ): Matrix3x3 {
      	return a.negate();
    }
    public inline
    function negate(): Matrix3x3 {
        return new Matrix3x3( { a: -this.a, b: -this.b, c: -this.c
                              , d: -this.d, e: -this.e, f: -this.f
                              , g: -this.g, h: -this.h, i: -this.i } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix3x3.unit;
     * ... a + a == new Matrix3x3( { a: 2., b: 0., c: 0.
     * ...                         , d: 0., e: 2., f: 0.
     * ...                         , g: 0., h: 0., i: 2. } ); }) == true
     * </code></pre>
     */ 
    @:op(A + B) public static inline
    function adding( a: Matrix3x3, b: Matrix3x3 ): Matrix3x3 {
        return a.add( b );
    }
    public inline
    function add( b: Matrix3x3 ): Matrix3x3 {
        return new Matrix3x3( { a: this.a + b.a, b: this.b + b.b, c: this.c + b.c
                              , d: this.d + b.d, e: this.e + b.e, f: this.f + b.f
                              , g: this.d + b.d, h: this.h + b.h, i: this.i + b.i } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix3x3.unit;
     * ... a - a == Matrix3x3.zero; }) == true
     * </code></pre>
     */
    @:op(A - B) public static inline
    function subtracting( a: Matrix3x3, b: Matrix3x3 ): Matrix3x3 {
        return a.subtract( b );
    }
    public inline
    function subtract( b: Matrix3x3 ): Matrix3x3 {
        return new Matrix3x3( { a: this.a - b.a, b: this.b - b.b, c: this.c - b.c
                              , d: this.d - b.d, e: this.e - b.e, f: this.f - b.f
                              , g: this.g - b.g, h: this.h - b.h, i: this.i - b.i } );
    }
    public inline
    function scaleVector4( p: Matrix1x4 ): Matrix3x3 {
        return new Matrix3x3( { a: this.a*p.x, b: this.b,     c: this.c
                              , d: this.d,     e: this.e*p.y, f: this.f
                              , g: this.g,     h: this.h,     i: this.i*p.z } );
    }
    public inline
    function scaleVector2( p: Matrix1x2 ): Matrix3x3 {
        return new Matrix3x3( { a: this.a*p.x, b: this.b,     c: this.c
                              , d: this.d,     e: this.e*p.y, f: this.f
                              , g: this.g,     h: this.h,     i: this.i } );
    }
    public inline
    function scaleVectorT3( p: geom.tydef.Tmatrix1x3 ): Matrix3x3 {
        return new Matrix3x3( { a: this.a*p.x, b: this.b,     c: this.c
                              , d: this.d,     e: this.e*p.y, f: this.f
                              , g: this.g,     h: this.h,     i: this.i*p.y } );
    }
    @:op(A * B) public static inline
    function multiplyV( v: Float, m: Matrix3x3 ): Matrix3x3 {
        return new Matrix3x3( { a: m.a*v, 	b: m.b*v,   c: m.c*v
                              , d: m.d*v,  e: m.e*v,   f: m.f*v
                              , g: m.g*v,  h: m.h*v,   i: m.i*v} );
    }
    @:op(A * B) public static inline
    function multiply( p: Matrix3x3, q: Matrix3x3 ): Matrix3x3 {
        return new Matrix3x3(
        { a: p.a*q.a+p.b*q.d+p.c*q.g, b: p.a*q.b+p.b*q.e+p.c*q.h, c: p.a*q.c+p.b*q.f+p.c*q.i
        , d: p.d*q.a+p.e*p.d+p.f*q.g, e: p.d*q.b+p.e*q.e+p.f*q.h, f: p.d*q.c+p.e*q.f+p.f*q.i
        , g: p.g*p.a+p.h*q.d+p.i*q.g, h: p.g*q.b+p.h*q.e+p.i*q.h, i: p.g*q.c+p.h*q.f+p.i*q.i } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix3x3({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9. });
     * ... var b = new Matrix3x3({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9. });
     * ... a == b; }) == true
     * </code></pre>
     */
    @:op( A == B )
    public static inline
    function equal( a: Matrix3x3, b: Matrix3x3 ): Bool {
        return a.isEqual( b );
    }
    public inline
    function isEqual( b: Matrix3x3 ): Bool {
        var delta = 0.0000001;
        return !(
               Math.abs(this.a - b.a) >= delta
            || Math.abs(this.b - b.b) >= delta
            || Math.abs(this.c - b.c) >= delta
            || Math.abs(this.d - b.d) >= delta
            || Math.abs(this.e - b.e) >= delta
            || Math.abs(this.f - b.f) >= delta
            || Math.abs(this.g - b.g) >= delta
            || Math.abs(this.h - b.h) >= delta
            || Math.abs(this.i - b.i) >= delta
        );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix3x3({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9. });
     * ... var b = new Matrix3x3({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 8. });
     * ... a != b; }) == true
     * </code></pre>
     */
    @:op(A != B) public static inline
    function notEqual( a: Matrix3x3, b:Matrix3x3 ): Bool {
        return !equal( a, b );
    }
    public inline
    function cofactor( a: Float, b: Float, c: Float, d: Float ){
        return a*d - b*c;
    }
    public inline
    function det(){
        return this.a * cofactor( this.e, this.f, this.h, this.i )
             - this.b * cofactor( this.d, this.f, this.g, this.i ) 
             + this.c * cofactor( this.d, this.e, this.g, this.h );
    }
    public inline
    function inverse(): Matrix3x3 {
        var d = det();
        return if( d == 0 ){
            null;
        } else {
        var adj  = new Matrix3x3( { 
          a: (this.e*this.i-this.f*this.h), b: -(this.d*this.i-this.f*this.g), c: (this.d*this.h-this.e*this.g)
        , d: -(this.b*this.i-this.c*this.h), e: (this.a*this.i-this.c*this.g), f: -(this.a*this.h-this.b*this.g)
        , g: (this.b*this.f-this.c*this.e), h: -(this.a*this.f-this.c*this.d), i: (this.a*this.e-this.b*this.d) } );
            (1/d)*adj;
        }
    }
    @:from public static inline
    function fromArr( arr: Array<Float> ): Matrix3x3 return Conversion.Arrayto3x3( arr );
    @:to public inline
    function toArray(): Array<Float> return Conversion._3x3toArray( this );
    @:to public inline
    function to2x2():Matrix2x2 return Conversion._3x3to2x2( this );
    // assumes z is set to 0 for 3D use.
    public static inline
    function to3D( m2: Matrix2x2 ): Matrix3x3 {
        return new Matrix3x3( { a: m2.a, b: m2.b, c: 0.
                              , d: m2.c, e: m2.d, f: 0.
                              , g: 0.,   h: 0,    i: 0. } );
    }
    // assumes z is set to 1 for 2D use, default 
    @:from public static inline
    function from2x2( m2: Matrix2x2 ): Matrix3x3 return Conversion._2x2to3x3( m2 );
    @:to public inline
    function to4x3():Matrix4x3 return Conversion._3x3to2x2( this );
    @:from public static inline // does not apply translations just discards 4th row and column. 
    function from4x3( m4: Matrix4x3 ): Matrix3x3 return Conversion._3x3to4x3( m4 );
    @:from public static inline
    function fromVec( vec: haxe.ds.Vector<Float> ): Matrix3x3 return Conversion.Vectorto3x3( vec );
    @:to public inline
    function toVector(): haxe.ds.Vector<Float> return Conversion._3x3toVector( this );
    public inline
    function setXY( x: Int, y: Int, v: Float  ): Float {
        return switch [ x, y ] {
            case [ 0,0 ]: this.a = v; case [ 0,1 ]: this.b = v; case [ 0,2 ]: this.c = v;
            case [ 1,0 ]: this.d = v; case [ 1,1 ]: this.e = v; case [ 1,2 ]: this.f = v;
            case [ 2,0 ]: this.g = v; case [ 2,1 ]: this.h = v; case [ 2,2 ]: this.i = v;
            case _: throw ('bad set $x, $y on Matrix3x3' ); }
    }
    public inline
    function getXY( x: Int, y: Int  ): Float {
        return switch [ x, y ] {
            case [ 0,0 ]: this.a; case [ 0,1 ]: this.b; case [ 0,2 ]: this.c;
            case [ 1,0 ]: this.d; case [ 1,1 ]: this.e; case [ 1,2 ]: this.f; 
            case [ 2,0 ]: this.g; case [ 2,1 ]: this.h; case [ 2,2 ]: this.i;
            case _: throw ('bad get $x, $y on Matrix3x3' ); }
    }
}
