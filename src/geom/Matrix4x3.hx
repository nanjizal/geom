package geom;
#if js
#if (haxe_ver <= 4.0 )
import js.html.Float32Array;
#else
import js.lib.Float32Array;
#end
#end
import geom.tydef.*;
@:forward // treat like 4x4 matrix but don't store last row!
abstract Matrix4x3( geom.structure.Mat4x3 ) from geom.structure.Mat4x3 to geom.structure.Mat4x3 {
    public inline
    function new( m: geom.structure.Mat4x3 ){ this = m; }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.zero() == new Matrix4x3({ a: 0., b: 0., c: 0., d: 0.
     * ...                                   , e: 0., f: 0., g: 0., h: 0.
     * ...                                   , i: 0., j: 0., k: 0., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static inline
    function zero(): Matrix4x3 {
        return new Matrix4x3({ a: 0., b: 0., c: 0., d: 0.
                             , e: 0., f: 0., g: 0., h: 0.
                             , i: 0., j: 0., k: 0., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... Matrix4x3.unit() == new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
     * ...                                   , e: 0., f: 1., g: 0., h: 0.
     * ...                                   , i: 0., j: 0., k: 1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static inline
    function unit(): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: 1., g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    public static inline
    function radianX( theta: Float ): Matrix4x3 {
        var c = Math.cos( theta ); var s = Math.sin( theta );
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: c,  g: -s, h: 0.
                             , i: 0., j: s,  k: c,  l: 0. } );
    }
    public inline
    function rotateX( theta: Float ) : Matrix4x3 { return this * radianX( theta ); }
    public static inline
    function radianY( theta: Float ): Matrix4x3 {
        var c = Math.cos( theta ); var s = Math.sin( theta );
        return new Matrix4x3({ a: c,   b: 0.,  c: s,  d: 0.
                             , e: 0.,  f: 1.,  g: 0., h: 0.
                             , i: -s,  j: 0.,  k: c,  l: 0. } );
    }
    public inline
    function rotateY( theta: Float ) : Matrix4x3 { return this * radianY( theta ); }
    public static inline
    function radianZ( theta: Float ): Matrix4x3 {
        var c = Math.cos( theta ); var s = Math.sin( theta );
        return new Matrix4x3({ a: c,  b: -s, c: 0.,  d: 0.
                             , e: s,  f: c,  g: 0.,  h: 0.
                             , i: 0., j: 0., k: 1.,  l: 0. } );
    }
    public inline
    function rotateZ( theta: Float ) : Matrix4x3 { return this * radianZ( theta ); }
    public static inline
    function sxyz( x: Float, y: Float, z: Float ): Matrix4x3 {
        return new Matrix4x3({ a: x,  b: 0., c: 0., d: 0.
                             , e: 0., f: y,  g: 0., h: 0.
                             , i: 0., j: 0., k: z,  l: 0. } );
    }
    public inline
    function scaleXYZ( x: Float, y: Float, z: Float ){ return this * sxyz( x, y, z ); }
    public static inline
    function sx( x: Float ): Matrix4x3 {
        return new Matrix4x3({ a: x,  b: 0., c: 0., d: 0.
                             , e: 0., f: 1., g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    public inline
    function scaleX( x: Float ): Matrix4x3 { return this * sx( x ); }
    public static inline
    function sy( y: Float ): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: y,  g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    public inline
    function scaleY( y: Float ): Matrix4x3 { return this * sy( y ); }
    public static inline
    function sz( z: Float ): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: 1., g: 0., h: 0.
                             , i: 0., j: 0., k: z,  l: 0. } );
    }
    public inline
    function scaleZ( z: Float ): Matrix4x3 { return this * sz( z ); }
    public inline
    function scale( s: Float ): Matrix4x3 { return this * scaleXYZ( s, s, s ); }
    public static inline
    function txyz( x: Float, y: Float, z: Float ): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: x
                             , e: 0., f: 1., g: 0., h: y
                             , i: 0., j: 0., k: 1., l: z } );
    }
    public inline
    function translateXYZ( x: Float, y: Float, z: Float ): Matrix4x3 { return this * txyz( x, y, z ); }
    public static inline
    function tx( x: Float ): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: x
                             , e: 0., f: 1., g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    public inline
    function translateX( x: Float ): Matrix4x3 { return this * tx( x ); }
    public static inline
    function ty( y: Float ): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: 1., g: 0., h: y
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    public inline
    function translateY( y: Float ): Matrix4x3 { return this * ty( y ); }
    public static inline
    function tz( z: Float ): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: 1., g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: z } );
    }
    public inline
    function translateZ( z: Float ): Matrix4x3 { return this * tz( z ); }
    public static inline
    function txy( x: Float, y: Float ): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: x
                             , e: 0., f: 1., g: 0., h: y
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    public inline
    function translateXY( x: Float, y: Float ): Matrix4x3 { return this * txy( x, y ); }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix4x3({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9., j:10., k:11., l:12. });
     * ... var b = new Matrix4x3({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9., j:10., k:11., l:12. });
     * ... a == b; }) == true
     * </code></pre>
     */
    @:op( A == B )
    public static inline
    function equal( a: Matrix4x3, b: Matrix4x3 ): Bool {
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
            || Math.abs(a.j - b.j) >= delta
            || Math.abs(a.k - b.k) >= delta
            || Math.abs(a.l - b.l) >= delta
        );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix4x3({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9., j:10., k:11., l:12. });
     * ... var b = new Matrix4x3({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9., j:10., k:11., l:11. });
     * ... a != b; }) == true
     * </code></pre>
     */
    @:op(A != B) public static inline
    function notEqual( a: Matrix4x3, b:Matrix4x3 ): Bool {
        return !equal( a, b );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix4x3.unit();
     * ... a + a == new Matrix4x3( { a: 2., b: 0., c: 0., d: 0.
     * ...                         , e: 0., f: 2., g: 0., h: 0.
     * ...                         , i: 0., j: 0., k: 2., l: 0. } ); }) == true
     * </code></pre>
     */
    @:op(A + B) public static inline
    function add( m0: Matrix4x3, m1: Matrix4x3 ): Matrix4x3 {
        return new Matrix4x3( { a: m0.a + m1.a, b: m0.b + m1.b, c: m0.c + m1.c, d: m0.d + m1.d
                              , e: m0.e + m1.e, f: m0.f + m1.f, g: m0.d + m1.d, h: m0.h + m1.h
                              , i: m0.i + m1.i, j: m0.j + m1.j, k: m0.k + m1.k, l: m0.l + m1.l } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix4x3.unit();
     * ... a - a == Matrix4x3.zero(); }) == true
     * </code></pre>
     */
    @:op(A - B) public static inline
    function sub( m0: Matrix4x3, m1: Matrix4x3 ): Matrix4x3 {
        return new Matrix4x3( { a: m0.a - m1.a, b: m0.b - m1.b, c: m0.c - m1.c, d: m0.d - m1.d
                              , e: m0.e - m1.e, f: m0.f - m1.f, g: m0.d - m1.d, h: m0.h - m1.h
                              , i: m0.i - m1.i, j: m0.j - m1.j, k: m0.k - m1.k, l: m0.l - m1.l } );
    }
    @:op(A * B) public static inline
    function scaleMultiply1( p: Matrix1x4, m: Matrix4x3 ): Matrix4x3 {
        return new Matrix4x3( { a: m.a*p.x, b: m.b,     c: m.c,     d: m.d
                              , e: m.e,     f: m.f*p.y, g: m.g,     h: m.h
                              , i: m.i,     j: m.j,     k: m.k*p.z, l: m.l } );
    }
    @:op(A * B) public static inline
    function scaleMultiply2( m: Matrix4x3, p: Matrix1x4 ): Matrix4x3 {
        return new Matrix4x3( { a: m.a*p.x, b: m.b,     c: m.c,     d: m.d
                              , e: m.e,     f: m.f*p.y, g: m.g,     h: m.h
                              , i: m.i,     j: m.j,     k: m.k*p.z, l: m.l } );
    }
    @:op(A / B) public static inline
    function scaleDivide( m: Matrix4x3, p: Matrix1x4 ): Matrix4x3 {
        var pd = 1 / p;  
        return new Matrix4x3( { a: m.a*pd.x, b: m.b,      c: m.c,      d: m.d
                              , e: m.e,      f: m.f*pd.y, g: m.g,      h: m.h
                              , i: m.i,      j: m.j,      k: m.k*pd.z, l: m.l } );
    }
    @:op(A * B) public static inline // emulates 4x4 matrib with assumption last row is 0,0,0,1.
    function multiply( r: Matrix4x3, s: Matrix4x3 ): Matrix4x3 {
        return new Matrix4x3(
        { a: r.a*s.a+r.b*s.e+r.c*s.i, b: r.a*s.b+r.b*s.f+r.c*s.j
                                , c: r.a*s.c+r.b*s.g+r.c+s.k, d: r.a*s.d+r.b*s.h+r.c*s.l+r.d
        , e: r.e*s.a+r.f*s.e+r.g*s.i, f: r.e*s.b+r.f*s.f+r.g*s.j
                                , g: r.e*s.c+r.f*s.g+r.g*s.k, h: r.e*s.d+r.f*s.h+r.g*s.l+r.h
        , i: r.i*s.a+r.j*s.e+r.k*s.i, j: r.i*s.b+r.j*s.f+r.k*s.j
                                , k: r.i*s.c+r.j*s.g+r.k*s.k, l: r.i*s.d+r.j*s.h+r.k*s.l+r.l
                                
        } );
    }
    public inline // https://www.mathsisfun.com/algebra/matrix-determinant.html
    function cofactor( a: Float, b: Float, c: Float,
                       d: Float, e: Float, f: Float,
                       g: Float, h: Float, i: Float): Float {
        return a * ( e * i - f * h ) - b * ( d * i - f * g ) + c * ( d * h - e * g );
    }
    public inline
    function det(): Float {
        var m = 0.; var n = 0.; var o = 0.; var p = 1.;
        return   this.a * cofactor( this.f, this.g, this.h
                                  , this.j, this.k, this.l
                                  , n, o, p ) 
               - this.b * cofactor( this.e, this.g, this.h
                                  , this.i, this.k, this.l
                                  , m, o, p )
               + this.c * cofactor( this.e, this.f, this.h
                                  , this.i, this.j, this.l
                                  , m, p, n )
               - this.d * cofactor( this.e, this.f, this.g
                                  , this.i, this.j, this.k
                                  , m, n, o );
    }
    // could optimize?
    public inline
    function inverse(): Matrix4x3 {
        var a = this.a; var b = this.b; var c = this.c; var d = this.d;
        var e = this.e; var f = this.f; var g = this.g; var h = this.h;
        var i = this.i; var j = this.j; var k = this.k; var l = this.l;
        var m = 0.; var n = 0.; var o = 0.; var p = 1.;
        var q = j*o*h - n*k*h + n*g*l - f*o*l - j*g*p + f*k*p;
        var r = m*k*h - i*o*h - m*g*l + e*o*l + i*g*p - e*k*p;
        var s = i*n*h - m*j*h + m*f*l - e*n*l - i*f*p + e*j*p;
        var t = m*j*g - i*n*g - m*f*k + e*n*k + i*f*o - e*j*o;
        var det = a * q + b * r + c * s + d * t;
        return if( det == 0 ){
            null;
        } else {
            var detI = 1 / det;
            new Matrix4x3( {
                    a: q * detI
                  , b: ( n*k*d - j*o*d - n*c*l + b*o*l + j*c*p - b*k*p ) * detI
                  , c: ( f*o*d - n*g*d + n*c*h - b*o*h - f*c*p + b*g*p ) * detI
                  , d: ( j*g*d - f*k*d - j*c*h + b*k*h + f*c*l - b*g*l ) * detI
                  , e: r * detI
                  , f: ( i*o*d - m*k*d + m*c*l - a*o*l - i*c*p + a*k*p ) * detI
                  , g: ( m*g*d - e*o*d - m*c*h + a*o*h + e*c*p - a*g*p ) * detI
                  , h: ( e*k*d - i*g*d + i*c*h - a*k*h - e*c*l + a*g*l ) * detI
                  , i: s * detI
                  , j: ( m*j*d - i*n*d - m*b*l + a*n*l + i*b*p - a*j*p ) * detI
                  , k: ( e*n*d - m*f*d + m*b*h - a*n*h - e*b*p + a*f*p ) * detI
                  , l: ( i*f*d - e*j*d - i*b*h + a*j*h + e*b*l - a*f*l ) * detI
            });
        }
    }
    public static inline
    function projectionWindow( wid: Float, hi: Float, fov: Float ):  Matrix4x3 {
        var halfWid = wid/2; var halfHi  = hi/2;
        var tanHalf = Math.tan( fov/2 );
        var scale = halfWid/tanHalf;
        return new Matrix4x3( { a: scale, b: -0.,    c: -scale,          d: 0.
                              , e: 0.,    f: -scale, g: -halfHi/tanHalf, h: 0.
                              , i: 0.,    j: 0.,     k: -1,              l: 0. } );
    }
    public static inline// Maps 0,0,0 to pos,maps x-axis to dir,maps y-axis to up.maps z-axis to the right.
    function orientation( pos: Matrix1x4, dir: Matrix1x4, up: Matrix1x4 ): Matrix4x3 {
        var right = dir.cross( up );
        return new Matrix4x3( { a: dir.x, b: up.x, c: right.x, d: pos.x
                              , e: dir.y, f: up.y, g: right.y, h: pos.y
                              , i: dir.z, j: up.z, k: right.z, l: pos.z  } );
    }
    public inline // check if Z should be included
    function applyRotation( p: Matrix1x4 ): Matrix1x4 {
        return new Matrix1x4({ x: this.a * p.x + this.b * p.y + this.c * p.z
                             , y: this.e * p.x + this.f * p.y + this.g * p.z
                             , z: this.h * p.x + this.i * p.y + this.j * p.z
                             , w: 1. });
    }
    public inline
    function applyInverseRotation( p: Matrix1x4 ): Matrix1x4 {
        return new Matrix1x4({ x: this.a * p.x + this.e * p.y + this.i * p.z
                             , y: this.b * p.x + this.f * p.y + this.j * p.z
                             , z: this.c * p.x + this.g * p.y + this.k * p.z
                             , w: 1. });
    }
    public inline
    function orthonormalizeRotation(){
        var new_x = new Matrix1x4({ x: this.a, y: this.e, z: this.i, w: 1. } ).normalize();
        var new_z = ( new_x.cross( new Matrix1x4( { x: this.b, y: this.f, z: this.j, w: 1. } ) ) ).normalize();
        var new_y = new_z.cross( new_x );
        this.a = new_x.x; this.b = new_y.x; this.c = new_z.x;
        this.e = new_x.y; this.f = new_y.y; this.g = new_z.y;
        this.i = new_x.z; this.j = new_y.z; this.k = new_z.z;
        return this;
    }
    public inline // Swap x & z axes, negate z axis (even number of swaps
    function makeViewFromOrientation(): Matrix4x3 { // maintains right-handedness).
        var m = new Matrix4x3({ a: this.c,  b: this.b, c: -this.a, d: this.d
                              , e: this.g,  f: this.f, g: -this.e, h: this.h
                              , i: this.k,  j: this.j, k: -this.i, l: this.l } );
        return m.invertNormalized();
    }
    public inline
    function invertNormalizedRotation( ): Matrix4x3 {
        return new Matrix4x3( { a: this.a, b: this.e, c: this.i, d: 0.
                              , e: this.b, f: this.f, g: this.j, h: 0.
                              , i: this.c, j: this.g, k: this.k, l: 0. } );
    }
    public inline
    function invertNormalized(): Matrix4x3 {
        var m = invertNormalizedRotation();
        var trans_prime = new Matrix1x4( { x: this.d, y: this.h, z: this.l, w: 1. } ).transformPoint( m );
        m.d = -trans_prime.x; m.h = -trans_prime.y; m.l = -trans_prime.z;
        return m;
    }
    @:to
    public inline
    function toAffineMatrix(): TAffineMatrix {
      return { e0: this.a, e4: this.b, e8: this.c, e12: this.d
             , e1: this.e, e5: this.f, e9: this.g, e13: this.h
             , e2: this.i, e6: this.j, e10: this.k, e14: this.l };
    }
    @:from
    public static inline 
    function fromNumbered( m: Tmatrix4x4numbered ): Matrix4x3 {
        return new Matrix4x3( { a: m._00, b: m._10, c: m._20, d: m._30
                              , e: m._01, f: m._11, g: m._21, h: m._31
                              , i: m._02, j: m._12, k: m._22, l: m._32 } );
    }
    @:to
    public inline
    function toNumbered(): Tmatrix4x4numbered {
        return { _00: this.a, _10: this.b, _20: this.c, _30: this.d
               , _01: this.e, _11: this.f, _21: this.g, _31: this.h
               , _02: this.i, _12: this.j, _22: this.k, _32: this.l
               , _03: 0.,     _13: 0.,     _23: 0.,     _33: 1. };
    }
    @:from
    public static inline
    function fromArr( arr: Array<Float> ){
        return new Matrix4x3( { a: arr[0],  b: arr[1],  c: arr[2],  d: arr[3]
                              , e: arr[4],  f: arr[5],  g: arr[6],  h: arr[7]
                              , i: arr[8],  j: arr[9],  k: arr[10], l: arr[11] } );
    }
    @:to
    public inline
    function toArray(): Array<Float> {
        return [ this.a, this.b, this.c, this.d
               , this.e, this.f, this.g, this.h
               , this.i, this.j, this.k, this.l ];
    }
    @:from
    public static inline
    function fromVec( v: haxe.ds.Vector<Float> ){
        return new Matrix4x3( { a: v.get(0),  b: v.get(1),  c: v.get(2),  d: v.get(3)
                              , e: v.get(4),  f: v.get(5),  g: v.get(6),  h: v.get(7)
                              , i: v.get(8),  j: v.get(9),  k: v.get(10), l: v.get(11) } );
    }
    @:from // assumes z == 0
    public static inline
    function from2x2( m2: Matrix2x2 ){
        return new Matrix4x3( { a: m2.a,  b: m2.b,  c: 0.,  d: 0.
                              , e: m2.c,  f: m2.d,  g: 0.,  h: 0.
                              , i: 0.,    j: 0.,    k: 1.,  l: 0. } );
    }
    @:to
    public inline
    function to2x2(): Matrix2x2 {
        return new Matrix2x2( { a: this.a,  b: this.b
                              , c: this.e,  d: this.f } );
    }  
    @:from
    public static inline
    function from3x3( m3: Matrix3x3 ){
        return new Matrix4x3( { a: m3.a,  b: m3.b,  c: m3.c,  d: 0.
                              , e: m3.d,  f: m3.e,  g: m3.f,  h: 0.
                              , i: m3.g,  j: m3.h,  k: m3.i,  l: 0. } );
    }
    @:to
    public inline
    function to3x3(): Matrix3x3 {
        return new Matrix3x3( { a: this.a,  b: this.b,  c: this.c
                              , d: this.e,  e: this.f,  f: this.g
                              , g: this.i,  h: this.j,  i: this.k } );
    } 
    @:to
    public inline
    function toVector(): haxe.ds.Vector<Float> {
        var vec = new haxe.ds.Vector<Float>(12);
        vec.set( 0, this.a ); vec.set( 1, this.b ); vec.set( 2,  this.c ); vec.set( 3,  this.d );
        vec.set( 4, this.e ); vec.set( 5, this.f ); vec.set( 6,  this.g ); vec.set( 7,  this.h );
        vec.set( 8, this.i ); vec.set( 9, this.j ); vec.set( 10, this.k ); vec.set( 11, this.l );
        return vec;
    }
    public inline function setXY( x: Int, y: Int, v: Float  ): Float {
        return switch [ x, y ] {
    case [ 0,0 ]: this.a = v; case [ 0,1 ]: this.b = v; case [ 0,2 ]: this.c = v; case [ 0,3 ]: this.d = v;
    case [ 1,0 ]: this.e = v; case [ 1,1 ]: this.f = v; case [ 1,2 ]: this.g = v; case [ 1,3 ]: this.h = v;
    case [ 2,0 ]: this.i = v; case [ 2,1 ]: this.j = v; case [ 2,2 ]: this.k = v; case [ 2,3 ]: this.l = v;
    case _: throw ('bad set $x, $y on Matrix4x4' ); }
    }
    public inline function getXY( x: Int, y: Int  ): Float {
        return switch [ x, y ] {
            case [ 0, 0 ]: this.a; case [ 0, 1 ]: this.b; case [ 0, 2 ]: this.c; case [ 0, 3 ]: this.d;
            case [ 1, 0 ]: this.e; case [ 1, 1 ]: this.f; case [ 1, 2 ]: this.g; case [ 1, 3 ]: this.h;
            case [ 2, 0 ]: this.i; case [ 2, 1 ]: this.j; case [ 2, 2 ]: this.k; case [ 2, 3 ]: this.l;
            case _: throw ('bad get $x, $y on Matrix4x3' ); }
    }
    #if js
    public inline
    function toFloat32Array( arr: Float32Array ): Float32Array {
        arr.set([ this.a, this.b, this.c, this.d
                , this.e, this.f, this.g, this.h
                , this.i, this.j, this.k, this.l
                , 0.,         0.,     0.,      1. ]);
        return arr;
    }
    #end
}
