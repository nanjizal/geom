package geom.matrixConversion;
import geom.matrix.Matrix2x2;
import geom.structure.Mat2x2;
import geom.tydef.Tmatrix2x2;
import geom.tydef.Tmatrix2x2numbered;
import geom.tydef.Alternate2x2numbered;
/** 
   ![2x2](../bootstrap/img/matrix2x2.png)  
   because you can't have same typedef signature auto conversion.
**/
@:forward
abstract Matrix2x2Alternate( geom.matrix.Matrix2x2 ) from geom.matrix.Matrix2x2 to geom.matrix.Matrix2x2 {
    public inline
    function new( malt: Matrix2x2 ){ this = malt; }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix2x2Alternate = new Matrix2x2Alternate( Matrix2x2._1234() );
     * ... var b: Alternate2x2numbered = { _00: 1., _01: 2., _10: 3., _11: 4. };
     * ... var c: Alternate2x2numbered = a;
     * ... Equal.equals( b, c ); }) == true
     * </code></pre>
     */
    @:to public inline
    function toAlternate2x2numbered(): Alternate2x2numbered {
        var am: Alternate2x2numbered = { _00: this.a, _01: this.b, _10: this.c, _11: this.d };
        return am;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix2x2Alternate = new Matrix2x2Alternate( Matrix2x2._1234() );
     * ... var b: Alternate2x2numbered = { _00: 1., _01: 2., _10: 3., _11: 4. };
     * ... var c: Matrix2x2Alternate = b;
     * ... Equal.equals( a, c ); }) == true
     * </code></pre>
     */
    @:from public static inline
    function fromAlternate2x2numbered( am: Alternate2x2numbered ): Matrix2x2Alternate {
        return new Matrix2x2Alternate( new Matrix2x2( { a: am._00, b: am._01, c: am._10, d: am._11 } ) );
    }
}
