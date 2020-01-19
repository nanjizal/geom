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
abstract Matrix3x3Convert( geom.matrix.Matrix3x3 ) from geom.matrix.Matrix3x3 to geom.matrix.Matrix3x3 {
    public inline
    function new( m: Matrix3x3 ){ this = m; }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix3x3Convert = new Matrix3x3Convert( Matrix3x3._123456789 );
     * ... var b: Tmatrix3x3 = { a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9. };
     * ... var c: Tmatrix3x3 = a;
     * ... Equal.equals( b, c ); }) == true
     * </code></pre>
     */
    @:to public inline
    function toTmatrix3x3(): Tmatrix3x3 {
        var tm: Tmatrix3x3 = { a: this.a, b: this.b, c: this.c, d: this.d, e: this.e, f: this.f, g: this.g, h: this.h, i: this.i };
        return tm;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix3x3Convert = new Matrix3x3Convert( Matrix3x3._123456789 );
     * ... var b: Tmatrix3x3 = { a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9. };
     * ... var c: Matrix3x3Convert = b;
     * ... Equal.equals( a, c ); }) == true
     * </code></pre>
     */
    @:from public static inline
    function fromTmatrix3x3( tm: Tmatrix3x3 ): Matrix3x3Convert {
        var m3x3: Mat3x3 = cast tm;
        return new Matrix3x3Convert( m3x3 );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix3x3Convert = new Matrix3x3Convert( Matrix3x3._123456789 );
     * ... var b: Tmatrix3x3numbered = { _00: 1., _10: 2., _20: 3., _01: 4., _11: 5., _21: 6., _02: 7., _12: 8., _22: 9. };
     * ... var c: Tmatrix3x3numbered = a;
     * ... Equal.equals( b, c ); }) == true
     * </code></pre>
     */
    @:to public inline
    function toTmatrix3x3numbered(): Tmatrix3x3numbered {
        var tm: Tmatrix3x3numbered = { _00: this.a, _10: this.b, _20: this.c
                                     , _01: this.d, _11: this.e, _21: this.f
                                     , _02: this.g, _12: this.h, _22: this.i };
        return tm;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix3x3Convert = new Matrix3x3Convert( Matrix3x3._123456789 );
     * ... var b: Tmatrix3x3numbered = { _00: 1., _10: 2., _20: 3., _01: 4., _11: 5., _21: 6., _02: 7., _12: 8., _22: 9. };
     * ... var c: Matrix3x3Convert  = b;
     * ... Equal.equals( a, c ); }) == true
     * </code></pre>
     */
    @:from public static inline
    function fromTmatrix3x3numbered( tm: Tmatrix3x3numbered ): Matrix3x3Convert {
        return new Matrix3x3Convert( new Matrix3x3( { a: tm._00, b: tm._10, c: tm._20
                                                    , d: tm._01, e: tm._11, f: tm._21
                                                    , g: tm._02, h: tm._12, i: tm._22 } ) );
    }
}