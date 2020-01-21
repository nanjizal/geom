package geom.matrix;
import geom.matrix.Matrix1x2;
import geom.matrix.Matrix4x3;
/** 
   ![3x3](../../bootstrap/img/matrix3x3.png)
**/
@:forward
abstract Matrix3x3( geom.structure.Mat3x3 ) from geom.structure.Mat3x3 to geom.structure.Mat3x3 {
    public inline
    function new( m: geom.structure.Mat3x3 ){ this = m; }
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
    @:op(A + B) public static inline
    function add( m0: Matrix3x3, m1: Matrix3x3 ): Matrix3x3 {
        return new Matrix3x3( { a: m0.a + m1.a, b: m0.b + m1.b, c: m0.c + m1.c
                              , d: m0.d + m1.d, e: m0.e + m1.e, f: m0.f + m1.f
                              , g: m0.d + m1.d, h: m0.h + m1.h, i: m0.i + m1.i } );
    }
    @:op(A - B) public static inline
    function subtract( m0: Matrix3x3, m1: Matrix3x3 ): Matrix3x3 {
        return new Matrix3x3( { a: m0.a - m1.a, b: m0.b - m1.b, c: m0.c - m1.c
                              , d: m0.d - m1.d, e: m0.e - m1.e, f: m0.f - m1.f
                              , g: m0.g - m1.g, h: m0.h - m1.h, i: m0.i - m1.i } );
    }
    @:op(A * B) public static inline
    function scaleMultiply4D( p: Matrix1x4, m: Matrix3x3 ): Matrix3x3 {
        return new Matrix3x3( { a: m.a*p.x, b: m.b,     c: m.c
                              , d: m.d,     e: m.e*p.y, f: m.f
                              , g: m.g,     h: m.h,     i: m.i*p.z } );
    }
    @:op(A * B) public static inline
    function scaleMultiply2D( p: Matrix1x2, m: Matrix3x3 ): Matrix3x3 {
        return new Matrix3x3( { a: m.a*p.x, b: m.b,     c: m.c
                              , d: m.d,     e: m.e*p.y, f: m.f
                              , g: m.g,     h: m.h,     i: m.i } );
    }
    @:op(A * B) public static inline
    function scaleMultiply3D( p: geom.tydef.Tmatrix1x3, m: Matrix3x3 ): Matrix3x3 {
        return new Matrix3x3( { a: m.a*p.x, b: m.b,     c: m.c
                              , d: m.d,     e: m.e*p.y, f: m.f
                              , g: m.g,     h: m.h,     i: m.i*p.y } );
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
        var delta = 0.0000001;
        return !(
               Math.abs(a.a - b.a) >= delta
            || Math.abs(a.b - b.b) >= delta
            || Math.abs(a.c - b.c) >= delta
            || Math.abs(a.d - b.d) >= delta
            || Math.abs(a.e - b.e) >= delta
            || Math.abs(a.f - b.f) >= delta
            || Math.abs(a.g - b.g) >= delta
            || Math.abs(a.h - b.h) >= delta
            || Math.abs(a.i - b.i) >= delta
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
    function fromArr( arr: Array<Float> ){
        return new Matrix3x3( { a: arr[0], b: arr[1], c: arr[2]
                             , d: arr[3], e: arr[4], f: arr[5]
                             , g: arr[6], h: arr[7], i: arr[8] } );
    }
    @:to public inline
    function toArray(): Array<Float> {
        return [ this.a, this.b, this.c 
               , this.d, this.e, this.f
               , this.g, this.h, this.i ];
    }
    @:to public inline
    function to2x2():Matrix2x2 {
        return new Matrix2x2( { a: this.a, b: this.b
                              , c: this.d, d: this.e } );
    }
    // assumes z is set to 0 for 3D use.
    public static inline
    function to3D( m2: Matrix2x2 ): Matrix3x3 {
        return new Matrix3x3( { a: m2.a, b: m2.b, c: 0.
                              , d: m2.c, e: m2.d, f: 0.
                              , g: 0.,   h: 0,    i: 0. } );
    }
    // assumes z is set to 1 for 2D use, default 
    @:from public static inline
    function from2x2( m2: Matrix2x2 ): Matrix3x3 {
        return new Matrix3x3( { a: m2.a, b: m2.b, c: 0.
                              , d: m2.c, e: m2.d, f: 0.
                              , g: 0.,   h: 0,    i: 1. } );
    }
    @:to public inline
    function to4x3():Matrix4x3 {
        return new Matrix4x3({ a: this.a, b: this.b, c: this.c, d: 0.
                             , e: this.d, f: this.e, g: this.f, h: 0.
                             , i: this.g, j: this.h, k: this.i, l: 0. } );
    }
    @:from public static inline // does not apply translations just discards 4th row and column. 
    function from4x3( m4: Matrix4x3 ): Matrix3x3 {
        return new Matrix3x3( { a: m4.a, b: m4.b, c: m4.c
                              , d: m4.e, e: m4.f, f: m4.g
                              , g: m4.i, h: m4.j, i: m4.k } );
    }
    @:from public static inline
    function fromVec( vec: haxe.ds.Vector<Float> ){
        return new Matrix3x3( { a: vec.get(0), b: vec.get(1), c: vec.get(2)
                              , d: vec.get(3), e: vec.get(4), f: vec.get(5)
                              , g: vec.get(6), h: vec.get(7), i: vec.get(8) } );
    }
    @:to public inline
    function toVector(): haxe.ds.Vector<Float> {
        var v = new haxe.ds.Vector<Float>(8);
        v.set( 0, this.a ); v.set( 1, this.b ); v.set( 2, this.c );
        v.set( 3, this.d ); v.set( 4, this.e ); v.set( 5, this.f );
      	v.set( 6, this.g ); v.set( 7, this.h ); v.set( 8, this.i );
        return v;
    }
    public inline function setXY( x: Int, y: Int, v: Float  ): Float {
        return switch [ x, y ] {
            case [ 0,0 ]: this.a = v; case [ 0,1 ]: this.b = v; case [ 0,2 ]: this.c = v;
            case [ 1,0 ]: this.d = v; case [ 1,1 ]: this.e = v; case [ 1,2 ]: this.f = v;
            case [ 2,0 ]: this.g = v; case [ 2,1 ]: this.h = v; case [ 2,2 ]: this.i = v;
            case _: throw ('bad set $x, $y on Matrix3x3' ); }
    }
    public inline function getXY( x: Int, y: Int  ): Float {
        return switch [ x, y ] {
            case [ 0,0 ]: this.a; case [ 0,1 ]: this.b; case [ 0,2 ]: this.c;
            case [ 1,0 ]: this.d; case [ 1,1 ]: this.e; case [ 1,2 ]: this.f; 
            case [ 2,0 ]: this.g; case [ 2,1 ]: this.h; case [ 2,2 ]: this.i;
            case _: throw ('bad get $x, $y on Matrix3x3' ); }
    }
}
