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
abstract Matrix4x4Alternate( geom.matrix.Matrix4x4 ) from geom.matrix.Matrix4x4 to geom.matrix.Matrix4x4 {
    public inline
    function new( m: Matrix4x4 ){ this = m; }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix4x4Alternate = new Matrix4x4Alternate( Matrix4x4._1_16 );
     * ... var b: Alternate4x4numbered = { _00: 1., _01: 2., _02: 3., _03: 4.
     * ...                              , _10: 5., _11: 6., _12: 7., _13: 8.
     * ...                              , _20: 9., _21: 10., _22: 11., _23: 12.
     * ...                              , _30: 13., _31: 14., _32: 15., _33: 16. };
     * ... var c: Alternate4x4numbered = a;
     * ... Equal.equals( b, c ); }) == true
     * </code></pre>
     */
    @:to public inline
    function toAlternate4x4numbered(): Alternate4x4numbered {
        var tm: Alternate4x4numbered = { _00: this.a, _01: this.b, _02: this.c, _03: this.d
                                       , _10: this.e, _11: this.f, _12: this.g, _13: this.h
                                       , _20: this.i, _21: this.j, _22: this.k, _23: this.l
                                       , _30: this.m, _31: this.n, _32: this.o, _33: this.p };
        return tm;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix4x4Alternate = new Matrix4x4Alternate( Matrix4x4._1_16 );
     * ... var b: Alternate4x4numbered = { _00: 1., _01: 2., _02: 3., _03: 4.
     * ...                             , _10: 5., _11: 6., _12: 7., _13: 8.
     * ...                             , _20: 9., _21: 10., _22: 11., _23: 12.
     * ...                             , _30: 13., _31: 14., _32: 15., _33: 16. };
     * ... var c: Matrix4x4Alternate  = b;
     * ... Equal.equals( a, c ); }) == true
     * </code></pre>
     */
    @:from public static inline
    function fromAlternate4x4numbered( tm: Alternate4x4numbered ): Matrix4x4Alternate {
        return new Matrix4x4Alternate( new Matrix4x4( { a: tm._00, b: tm._01, c: tm._02, d: tm._03
                                                    , e: tm._10, f: tm._11, g: tm._12, h: tm._13
                                                    , i: tm._20, j: tm._21, k: tm._22, l: tm._23
                                                    , m: tm._30, n: tm._31, o: tm._32, p: tm._33 } ) );
    }
}