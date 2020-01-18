package geom.matrixConversion;
import geom.matrix.Matrix3x3;
import geom.structure.Mat3x3;
import geom.tydef.Tmatrix3x3;
import geom.tydef.Tmatrix3x3numbered;
import geom.tydef.Alternate3x3numbered;
/** 
   ![2x2](../bootstrap/img/matrix3x3.png)
**/
@:forward
abstract Matrix3x3Alternate( geom.matrix.Matrix3x3 ) from geom.matrix.Matrix3x3 to geom.matrix.Matrix3x3 {
    public inline
    function new( malt: Matrix3x3 ){ this = malt; }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix3x3Alternate = new Matrix3x3Alternate( Matrix3x3._123456789() );
     * ... var b: Alternate3x3numbered = { _00: 1., _01: 2., _02: 3., _10: 4., _11: 5., _12: 6., _20: 7., _21: 8., _22: 9. };
     * ... var c: Tmatrix3x3numbered = a;
     * ... Equal.equals( b, c ); }) == true
     * </code></pre>
     */
    @:to public inline
    function toAlternate3x3numbered(): Alternate3x3numbered {
        var tm: Tmatrix3x3numbered = { _00: this.a, _01: this.b, _02: this.c
                                     , _10: this.d, _11: this.e, _12: this.f
                                     , _20: this.g, _21: this.h, _22: this.i };
        return tm;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix3x3Alternate= new Matrix3x3Alternate( Matrix3x3._123456789() );
     * ... var b: Alternate3x3numbered = { _00: 1., _01: 2., _02: 3., _10: 4., _11: 5., _12: 6., _20: 7., _21: 8., _22: 9. };
     * ... var c: Matrix3x3Alternate  = b;
     * ... Equal.equals( a, c ); }) == true
     * </code></pre>
     */
    @:from public static inline
    function fromAlternate3x3numbered( tm: Alternate3x3numbered ): Matrix3x3Alternate {
        return new Matrix3x3Alternate( new Matrix3x3( { a: tm._00, b: tm._01, c: tm._02
                                                    , d: tm._10, e: tm._11, f: tm._12
                                                    , g: tm._20, h: tm._21, i: tm._22 } ) );
    }
}