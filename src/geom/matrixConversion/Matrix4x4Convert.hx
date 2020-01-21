package geom.matrixConversion;
import geom.matrix.Matrix4x4;
import geom.structure.Mat4x4;
import geom.tydef.Tmatrix4x3;
import geom.tydef.Tmatrix4x4;
import geom.tydef.Tmatrix4x4numbered;
import geom.tydef.Alternate4x4numbered;
/** 
   ![4x4](../../bootstrap/img/matrix4x4.png)
**/
@:forward
abstract Matrix4x4Convert( geom.matrix.Matrix4x4 ) from geom.matrix.Matrix4x4 to geom.matrix.Matrix4x4 {
    public inline
    function new( m: Matrix4x4 ){ this = m; }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix4x4Convert = new Matrix4x4Convert( Matrix4x4._1_16 );
     * ... var b: Tmatrix4x4 = { a: 1., b: 2., c: 3., d: 4.
     * ...                     , e: 5., f: 6., g: 7., h: 8.
     * ...                     , i: 9., j: 10., k: 11., l: 12.
     * ...                     , m: 13., n: 14., o: 15., p: 16. };
     * ... var c: Tmatrix4x4 = a;
     * ... Equal.equals( b, c ); }) == true
     * </code></pre>
     */
    @:to public inline
    function toTmatrix4x4(): Tmatrix4x4 {
        var tm: Tmatrix4x4 = { a: this.a, b: this.b, c: this.c, d: this.d
                             , e: this.e, f: this.f, g: this.g, h: this.h
                             , i: this.i, j: this.j, k: this.k, l: this.l
                             , m: this.m, n: this.n, o: this.o, p: this.p };
        return tm;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix4x4Convert = new Matrix4x4Convert( Matrix4x4._1_16 );
     * ... var b: Tmatrix4x4 = { a: 1., b: 2., c: 3., d: 4.
     * ...                     , e: 5., f: 6., g: 7., h: 8.
     * ...                     , i: 9., j: 10., k: 11., l: 12.
     * ...                     , m: 13., n: 14., o: 15., p: 16. };
     * ... var c: Matrix4x4Convert = b;
     * ... Equal.equals( a, c ); }) == true
     * </code></pre>
     */
    @:from public static inline
    function fromTmatrix4x4( tm: Tmatrix4x4 ): Matrix4x4Convert {
        var m4x4: Mat4x4 = cast tm;
        return new Matrix4x4Convert( m4x4 );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix4x4Convert = new Matrix4x4Convert( Matrix4x4.unit );
     * ... var b: Tmatrix4x3 = { a: 1., b: 0., c: 0., d: 0.
     * ...                     , e: 0., f: 1., g: 0., h: 0.
     * ...                     , i: 0., j: 0., k: 1., l: 0. };
     * ... var c: Tmatrix4x3 = a;
     * ... Equal.equals( b, c ); }) == true
     * </code></pre>
     */
    @:to public inline
    function toTmatrix4x3(): Tmatrix4x3 {
        var tm4x3: Tmatrix4x3 = { a: this.a, b: this.b, c: this.c, d: this.d
                                , e: this.e, f: this.f, g: this.g, h: this.h
                                , i: this.i, j: this.j, k: this.k, l: this.l };
        return tm4x3;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix4x4Convert = new Matrix4x4Convert( Matrix4x4.unit );
     * ... var b: Tmatrix4x3 = { a: 1., b: 0., c: 0., d: 0.
     * ...                     , e: 0., f: 1., g: 0., h: 0.
     * ...                     , i: 0., j: 0., k: 1., l: 0. };
     * ... var c: Matrix4x4Convert = b;
     * ... Equal.equals( a, c ); }) == true
     * </code></pre>
     */
    @:from public static inline
    function fromTmatrix4x3( tm: Tmatrix4x3 ): Matrix4x4Convert {
        var m4x4: Mat4x4 = { a: tm.a, b: tm.b, c: tm.c, d: tm.d
                           , e: tm.e, f: tm.f, g: tm.g, h: tm.h
                           , i: tm.i, j: tm.j, k: tm.k, l: tm.l
                           , m: 0., n: 0., o: 0., p: 1. };
        return new Matrix4x4Convert( m4x4 );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix4x4Convert = new Matrix4x4Convert( Matrix4x4._1_16 );
     * ... var b: Tmatrix4x4numbered = { _00: 1., _10: 2., _20: 3., _30: 4.
     * ...                              , _01: 5., _11: 6., _21: 7., _31: 8.
     * ...                              , _02: 9., _12: 10., _22: 11., _32: 12.
     * ...                              , _03: 13., _13: 14., _23: 15., _33: 16. };
     * ... var c: Tmatrix4x4numbered = a;
     * ... Equal.equals( b, c ); }) == true
     * </code></pre>
     */
    @:to public inline
    function toTmatrix4x4numbered(): Tmatrix4x4numbered {
        var tm: Tmatrix4x4numbered = { _00: this.a, _10: this.b, _20: this.c, _30: this.d
                                       , _01: this.e, _11: this.f, _21: this.g, _31: this.h
                                       , _02: this.i, _12: this.j, _22: this.k, _32: this.l
                                       , _03: this.m, _13: this.n, _23: this.o, _33: this.p };
        return tm;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix4x4Convert = new Matrix4x4Convert( Matrix4x4._1_16 );
     * ... var b: Tmatrix4x4numbered = { _00: 1., _10: 2., _20: 3., _30: 4.
     * ...                             , _01: 5., _11: 6., _21: 7., _31: 8.
     * ...                             , _02: 9., _12: 10., _22: 11., _32: 12.
     * ...                             , _03: 13., _13: 14., _23: 15., _33: 16. };
     * ... var c: Matrix4x4Convert  = b;
     * ... Equal.equals( a, c ); }) == true
     * </code></pre>
     */
    @:from public static inline
    function fromTmatrix4x4numbered( tm: Tmatrix4x4numbered ): Matrix4x4Convert {
        return new Matrix4x4Convert( new Matrix4x4( { a: tm._00, b: tm._10, c: tm._20, d: tm._30
                                                    , e: tm._01, f: tm._11, g: tm._21, h: tm._31
                                                    , i: tm._02, j: tm._12, k: tm._22, l: tm._32
                                                    , m: tm._03, n: tm._13, o: tm._23, p: tm._33 } ) );
    }
}