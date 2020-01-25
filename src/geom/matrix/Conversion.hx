package geom.matrix;
// TODO: consider a way to make haxe.io.Float32Array work!
#if js
#if (haxe_ver < 4.0 )
import js.html.Float32Array;
#else
import js.lib.Float32Array;
#end
#end
import geom.matrix.*;
import geom.tydef.*;
import geom.structure.*;
// collected matrix conversions
class Conversion {
    // 1x2
    public static inline
    function _1x2toTpoint( m1x2: Matrix1x2 ):geom.tydef.Tpoint {
        return { x: m1x2.x, y: m1x2.y };
    }
    public static inline
    function _1x2toVec3( m1x2: Matrix1x2 ): haxe.ds.Vector<Float>  {
        var vec = new haxe.ds.Vector<Float>(3);
        vec.set( 0, m1x2.x );
        vec.set( 1, m1x2.y );
        vec.set( 2, 1. );
        return vec;
    }
    public inline static 
    function Vectorto1x2( v: haxe.ds.Vector<Float>  ): Matrix1x2 {
        return new Matrix1x2( { x: v.get(0), y: v.get(1)} );
    }
    // 1x3
    public static inline
    function Vectorto1x3( vec: haxe.ds.Vector<Float> ): Matrix1x3 {
        return new Matrix1x3( { x: vec.get(0), y: vec.get(1), z: vec.get(2) } );
    }
    public static inline
    function _1x3toVector( m1x3: Matrix1x3 ): haxe.ds.Vector<Float> {
        var vec = new haxe.ds.Vector<Float>(3);
        vec.set( 0, m1x3.x );
        vec.set( 1, m1x3.y );
        vec.set( 2, m1x3.z );
        return vec;
    }
    public inline static 
    function Arrayto1x3( arr: Array<Float> ): Matrix1x3 {
        return new Matrix1x3( { x: arr[ 0 ], y: arr[ 1 ], z: arr[ 2 ] } );
    }
    public static inline
    function _1x3toArray( m1x3: Matrix1x3 ):Array<Float> {
        return [ m1x3.x, m1x3.y, m1x3.z ];
    }
    // 1x4
    public static inline
    function Vectorto1x4( vec: haxe.ds.Vector<Float> ): Matrix1x4 {
        return new Matrix1x4( { x: vec.get(0), y: vec.get(1), z: vec.get(2), w: vec.get(3) } );
    }
    public static inline
    function _1x4toVector( m1x4: Matrix1x4 ): haxe.ds.Vector<Float> {
        var vec = new haxe.ds.Vector<Float>(4);
        vec.set( 0, m1x4.x );
        vec.set( 1, m1x4.y );
        vec.set( 2, m1x4.z );
        vec.set( 3, m1x4.w );
        return vec;
    }
    public inline static
    function Arrayto1x4( arr: Array<Float> ): Matrix1x4 {
        return new Matrix1x4( { x: arr[ 0 ], y: arr[ 1 ], z: arr[ 2 ], w: arr[ 3 ] } );
    }
    public static inline
    function _1x4toArray( m1x4: Matrix1x4 ):Array<Float> {
        return [ m1x4.x, m1x4.y, m1x4.z, m1x4.w ];
    }
    // 2x2
    public static inline
    function Arrayto2x2( arr: Array<Float> ): Matrix2x2 {
        return new Matrix2x2( { a: arr[0], b: arr[1]
                             , c: arr[2], d: arr[3] } );
    }
    public static inline
    function _2x2toArray( m2x2: Matrix2x2 ): Array<Float> {
        return [ m2x2.a, m2x2.b
               , m2x2.c, m2x2.d ];
    }
    public static inline
    function Vectorto2x2( vec: haxe.ds.Vector<Float> ): Matrix2x2 {
        return new Matrix2x2( { a: vec.get(0), b: vec.get(1),
                               c: vec.get(2), d: vec.get(3) } );
    }
    public static inline
    function _2x2toVector( m2x2: Matrix2x2 ): haxe.ds.Vector<Float> {
        var vec = new haxe.ds.Vector<Float>(4);
        vec.set(0, m2x2.a); vec.set(1, m2x2.b);
        vec.set(2, m2x2.c); vec.set(3, m2x2.d);
        return vec;
    }
    public static inline
    function toTmatrix2x2( m2x2: Matrix2x2 ): Tmatrix2x2 {
        var tm: Tmatrix2x2 = { a: m2x2.a, b: m2x2.b, c: m2x2.c, d: m2x2.d };
        return tm;
    }
    public static inline
    function Tmatrix2x2to2x2( tm: Tmatrix2x2 ): Matrix2x2 {
        var m2x2: Mat2x2 = cast tm;
        return new Matrix2x2( m2x2 );
    }
    public static inline
    function _2x2toTmatrix2x2numbered( m2x2: Matrix2x2 ): Tmatrix2x2numbered {
        var tm: Tmatrix2x2numbered = { _00: m2x2.a, _10: m2x2.b, _01: m2x2.c, _11: m2x2.d };
        return tm;
    }
    public static inline
    function Tmatrix2x2numberedto2x2( tm: Tmatrix2x2numbered ): Matrix2x2 {
        return new Matrix2x2( { a: tm._00, b: tm._10, c: tm._01, d: tm._11 } );
    }
    public static inline
    function _2x2toAlternate2x2numbered( m2x2: Matrix2x2 ): Alternate2x2numbered {
        var am: Alternate2x2numbered = { _00: m2x2.a, _01: m2x2.b, _10: m2x2.c, _11: m2x2.d };
        return am;
    }
    public static inline
    function Alternate2x2numberedto2x2( am: Alternate2x2numbered ): Matrix2x2 {
        return new Matrix2x2( { a: am._00, b: am._01, c: am._10, d: am._11 } );
    }
    // 3x3
    public static inline
    function Arrayto3x3( arr: Array<Float> ){
        return new Matrix3x3( { a: arr[0], b: arr[1], c: arr[2]
                             , d: arr[3], e: arr[4], f: arr[5]
                             , g: arr[6], h: arr[7], i: arr[8] } );
    }
    public static inline
    function _3x3toArray( m3x3: Matrix3x3 ): Array<Float> {
        return [ m3x3.a, m3x3.b, m3x3.c 
               , m3x3.d, m3x3.e, m3x3.f
               , m3x3.g, m3x3.h, m3x3.i ];
    }
    
    public static inline // assumes z is set to 1 for 2D use, default
    function _2x2to3x3( m2: Matrix2x2 ): Matrix3x3 {
        return new Matrix3x3( { a: m2.a, b: m2.b, c: 0.
                              , d: m2.c, e: m2.d, f: 0.
                              , g: 0.,   h: 0,    i: 1. } );
    }
    public static inline
    function _3x3to2x2( m3x3: Matrix3x3 ):Matrix2x2 {
        return new Matrix2x2( { a: m3x3.a, b: m3x3.b
                              , c: m3x3.d, d: m3x3.e } );
    }
    public static inline
    function Vectorto3x3( vec: haxe.ds.Vector<Float> ){
        return new Matrix3x3( { a: vec.get(0), b: vec.get(1), c: vec.get(2)
                              , d: vec.get(3), e: vec.get(4), f: vec.get(5)
                              , g: vec.get(6), h: vec.get(7), i: vec.get(8) } );
    }
    public static inline
    function _3x3toVector( m3x3: Matrix3x3 ): haxe.ds.Vector<Float> {
        var v = new haxe.ds.Vector<Float>(8);
        v.set( 0, m3x3.a ); v.set( 1, m3x3.b ); v.set( 2, m3x3.c );
        v.set( 3, m3x3.d ); v.set( 4, m3x3.e ); v.set( 5, m3x3.f );
      	v.set( 6, m3x3.g ); v.set( 7, m3x3.h ); v.set( 8, m3x3.i );
        return v;
    }
    public static inline
    function _3x3toTmatrix3x3( m3x3: Matrix3x3 ): Tmatrix3x3 {
        var tm: Tmatrix3x3 = { a: m3x3.a, b: m3x3.b, c: m3x3.c, d: m3x3.d, e: m3x3.e, f: m3x3.f, g: m3x3.g, h: m3x3.h, i: m3x3.i };
        return tm;
    }
    public static inline
    function Tmatrix3x3to3x3( tm: Tmatrix3x3 ): Matrix3x3 {
        var m3x3: Mat3x3 = cast tm;
        return new Matrix3x3( m3x3 );
    }
    public static inline
    function _3x3toTmatrix3x3numbered( m3x3: Matrix3x3 ): Tmatrix3x3numbered {
        var tm: Tmatrix3x3numbered = { _00: m3x3.a, _10: m3x3.b, _20: m3x3.c
                                     , _01: m3x3.d, _11: m3x3.e, _21: m3x3.f
                                     , _02: m3x3.g, _12: m3x3.h, _22: m3x3.i };
        return tm;
    }
    public static inline
    function Tmatrix3x3numberedto3x3( tm: Tmatrix3x3numbered ): Matrix3x3 {
        return new Matrix3x3( { a: tm._00, b: tm._10, c: tm._20
                              , d: tm._01, e: tm._11, f: tm._21
                              , g: tm._02, h: tm._12, i: tm._22 } );
    }
    public static inline
    function _m3x3toAlternate3x3numbered( m3x3: Matrix3x3 ): Alternate3x3numbered {
        var tm: Tmatrix3x3numbered = { _00: m3x3.a, _01: m3x3.b, _02: m3x3.c
                                     , _10: m3x3.d, _11: m3x3.e, _12: m3x3.f
                                     , _20: m3x3.g, _21: m3x3.h, _22: m3x3.i };
        return tm;
    }
    public static inline
    function Alternate3x3numberedto3x3( tm: Alternate3x3numbered ): Matrix3x3 {
        return new Matrix3x3( { a: tm._00, b: tm._01, c: tm._02
                              , d: tm._10, e: tm._11, f: tm._12
                              , g: tm._20, h: tm._21, i: tm._22 } );
    }
    // 4x3
    public static inline
    function _2x2to4x3( m2: Matrix2x2 ): Matrix4x3 {
        return new Matrix4x3( { a: m2.a,  b: m2.b,  c: 0.,  d: 0.
                              , e: m2.c,  f: m2.d,  g: 0.,  h: 0.
                              , i: 0.,    j: 0.,    k: 1.,  l: 0. } );
    }
    public static inline
    function _4x3to2x2( m4x3: Matrix4x3 ): Matrix2x2 {
        return new Matrix2x2( { a: m4x3.a,  b: m4x3.b
                              , c: m4x3.e,  d: m4x3.f } );
    }  
    public static inline
    function _3x3to4x3( m3: Matrix3x3 ): Matrix4x3 {
        return new Matrix4x3( { a: m3.a,  b: m3.b,  c: m3.c,  d: 0.
                              , e: m3.d,  f: m3.e,  g: m3.f,  h: 0.
                              , i: m3.g,  j: m3.h,  k: m3.i,  l: 0. } );
    }
    public static inline
    function _4x3to3x3( m4x3: Matrix4x3 ): Matrix3x3 {// does not apply translations just discards 4th row and column.
        return new Matrix3x3( { a: m4x3.a,  b: m4x3.b,  c: m4x3.c
                              , d: m4x3.e,  e: m4x3.f,  f: m4x3.g
                              , g: m4x3.i,  h: m4x3.j,  i: m4x3.k } );
    }
    public static inline
    function ArraytoMatrix4x3( arr: Array<Float> ): Matrix4x3 {
        return new Matrix4x3( { a: arr[0],  b: arr[1],  c: arr[2],  d: arr[3]
                              , e: arr[4],  f: arr[5],  g: arr[6],  h: arr[7]
                              , i: arr[8],  j: arr[9],  k: arr[10], l: arr[11] } );
    }
    public static inline
    function _4x3toArray( m4x3: Matrix4x3 ): Array<Float> {
        return [ m4x3.a, m4x3.b, m4x3.c, m4x3.d
               , m4x3.e, m4x3.f, m4x3.g, m4x3.h
               , m4x3.i, m4x3.j, m4x3.k, m4x3.l ];
    }
    public static inline
    function _4x3toVector( m4x3: Matrix4x3 ): haxe.ds.Vector<Float> {
        var vec = new haxe.ds.Vector<Float>(12);
        vec.set( 0, m4x3.a ); vec.set( 1, m4x3.b ); vec.set( 2,  m4x3.c ); vec.set( 3,  m4x3.d );
        vec.set( 4, m4x3.e ); vec.set( 5, m4x3.f ); vec.set( 6,  m4x3.g ); vec.set( 7,  m4x3.h );
        vec.set( 8, m4x3.i ); vec.set( 9, m4x3.j ); vec.set( 10, m4x3.k ); vec.set( 11, m4x3.l );
        return vec;
    }
    public static inline
    function Vectorto4x3( v: haxe.ds.Vector<Float> ): Matrix4x3 {
        return new Matrix4x3( { a: v.get(0),  b: v.get(1),  c: v.get(2),  d: v.get(3)
                              , e: v.get(4),  f: v.get(5),  g: v.get(6),  h: v.get(7)
                              , i: v.get(8),  j: v.get(9),  k: v.get(10), l: v.get(11) } );
    } 
    // ideal if this can be haxe.io.Float32Array
    #if js  
    // Suited to WebGL version
    public static inline
    function _4x3toFloat32Array_( m4x3: Matrix4x3 ): Float32Array {
        return new Float32Array( [ m4x3.a, m4x3.e, m4x3.i, 0.
                                 , m4x3.b, m4x3.f, m4x3.j, 0.
                                 , m4x3.c, m4x3.g, m4x3.k, 0.
                                 , m4x3.d, m4x3.h, m4x3.l, 1.  ]);
    }
    // Suited to WebGL version
    public static inline
    function Float32Array_to4x3( arr: Float32Array ): Matrix4x3 {
        return new Matrix4x3( { a: arr[0],  b: arr[4],  c: arr[8],  d: arr[12]
                              , e: arr[1],  f: arr[5],  g: arr[9],  h: arr[13]
                              , i: arr[2],  j: arr[6],  k: arr[10], l: arr[14] } );
    }
    #end
    /**
     * check transpose
     */
    public static inline
    function _4x3toTAffineMatrix( m4x3: Matrix4x3 ): TAffineMatrix {
      return { e0: m4x3.a, e4: m4x3.b, e8: m4x3.c, e12: m4x3.d
             , e1: m4x3.e, e5: m4x3.f, e9: m4x3.g, e13: m4x3.h
             , e2: m4x3.i, e6: m4x3.j, e10: m4x3.k, e14: m4x3.l };
    }
    /**
     * check transpose
     */
    public static inline 
    function Tmatrix4x4numberedto4x3( m: Tmatrix4x4numbered ): Matrix4x3 {
        return new Matrix4x3( { a: m._00, b: m._10, c: m._20, d: m._30
                              , e: m._01, f: m._11, g: m._21, h: m._31
                              , i: m._02, j: m._12, k: m._22, l: m._32 } );
    }
    /**
     * check transpose
     */
    public static inline
    function _4x3toTmatrix4x4numbered( m4x3: Matrix4x3 ): Tmatrix4x4numbered {
        return { _00: m4x3.a, _10: m4x3.b, _20: m4x3.c, _30: m4x3.d
               , _01: m4x3.e, _11: m4x3.f, _21: m4x3.g, _31: m4x3.h
               , _02: m4x3.i, _12: m4x3.j, _22: m4x3.k, _32: m4x3.l
               , _03: 0.,     _13: 0.,     _23: 0.,     _33: 1. };
    }
    public static inline
    function _4x3toTmatrix4x3( m4x3: Matrix4x3 ): Tmatrix4x3 {
        var tm4x3: Tmatrix4x3 = { a: m4x3.a, b: m4x3.b, c: m4x3.c, d: m4x3.d
                                , e: m4x3.e, f: m4x3.f, g: m4x3.g, h: m4x3.h
                                , i: m4x3.i, j: m4x3.j, k: m4x3.k, l: m4x3.l };
        return tm4x3;
    }
    public static inline
    function Tmatrix4x3to4x3( tm: Tmatrix4x3 ): Matrix4x3 {
        var m4x3: Mat4x3 = { a: tm.a, b: tm.b, c: tm.c, d: tm.d
                           , e: tm.e, f: tm.f, g: tm.g, h: tm.h
                           , i: tm.i, j: tm.j, k: tm.k, l: tm.l };
        return new Matrix4x3( m4x3 );
    }
    // 4x4
    public static inline
    function _4x4toTmatrix4x4( m4x4: Matrix4x4 ): Tmatrix4x4 {
        var tm: Tmatrix4x4 = { a: m4x4.a, b: m4x4.b, c: m4x4.c, d: m4x4.d
                             , e: m4x4.e, f: m4x4.f, g: m4x4.g, h: m4x4.h
                             , i: m4x4.i, j: m4x4.j, k: m4x4.k, l: m4x4.l
                             , m: m4x4.m, n: m4x4.n, o: m4x4.o, p: m4x4.p };
        return tm;
    }
    public static inline
    function Tmatrix4x4to4x4( tm: Tmatrix4x4 ): Matrix4x4 {
        var m4x4: Mat4x4 = cast tm;
        return new Matrix4x4( m4x4 );
    }
    public static inline
    function _4x4toTmatrix4x4numbered( m4x4: Matrix4x4 ): Tmatrix4x4numbered {
        var tm: Tmatrix4x4numbered = { _00: m4x4.a, _10: m4x4.b, _20: m4x4.c, _30: m4x4.d
                                     , _01: m4x4.e, _11: m4x4.f, _21: m4x4.g, _31: m4x4.h
                                     , _02: m4x4.i, _12: m4x4.j, _22: m4x4.k, _32: m4x4.l
                                     , _03: m4x4.m, _13: m4x4.n, _23: m4x4.o, _33: m4x4.p };
        return tm;
    }
    public static inline
    function Tmatrix4x4numberedto4x4( tm: Tmatrix4x4numbered ): Matrix4x4 {
        return new Matrix4x4( { a: tm._00, b: tm._10, c: tm._20, d: tm._30
                                                    , e: tm._01, f: tm._11, g: tm._21, h: tm._31
                                                    , i: tm._02, j: tm._12, k: tm._22, l: tm._32
                                                    , m: tm._03, n: tm._13, o: tm._23, p: tm._33 } );
    }
    public static inline
    function _4x4toAlternate4x4numbered( m4x4: Matrix4x4 ): Alternate4x4numbered {
        var tm: Alternate4x4numbered = { _00: m4x4.a, _01: m4x4.b, _02: m4x4.c, _03: m4x4.d
                                       , _10: m4x4.e, _11: m4x4.f, _12: m4x4.g, _13: m4x4.h
                                       , _20: m4x4.i, _21: m4x4.j, _22: m4x4.k, _23: m4x4.l
                                       , _30: m4x4.m, _31: m4x4.n, _32: m4x4.o, _33: m4x4.p };
        return tm;
    }
    public static inline
    function Alternate4x4numberedto4x4( tm: Alternate4x4numbered ): Matrix4x4 {
        return new Matrix4x4( { a: tm._00, b: tm._01, c: tm._02, d: tm._03
                              , e: tm._10, f: tm._11, g: tm._12, h: tm._13
                              , i: tm._20, j: tm._21, k: tm._22, l: tm._23
                              , m: tm._30, n: tm._31, o: tm._32, p: tm._33 } );
    }
}