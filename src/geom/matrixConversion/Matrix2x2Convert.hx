package geom.matrixConversion;
import geom.matrix.Matrix2x2;
import geom.structure.Mat2x2;
import geom.tydef.Tmatrix2x2;
import geom.tydef.Tmatrix2x2numbered;
import geom.tydef.Alternate2x2numbered;
/** 
   ![2x2](../../bootstrap/img/matrix2x2.png)
**/
@:forward
abstract Matrix2x2Convert( geom.matrix.Matrix2x2 ) from geom.matrix.Matrix2x2 to geom.matrix.Matrix2x2 {
    public inline
    function new( m: Matrix2x2 ){ this = m; }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix2x2Convert = new Matrix2x2Convert( Matrix2x2._1234 );
     * ... var b: Tmatrix2x2 = { a: 1., b: 2., c: 3., d: 4. };
     * ... var c: Tmatrix2x2 = a;
     * ... Equal.equals( b, c ); }) == true
     * </code></pre>
     */
    @:to public inline
    function toTmatrix2x2(): Tmatrix2x2 {
        var tm: Tmatrix2x2 = { a: this.a, b: this.b, c: this.c, d: this.d };
        return tm;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix2x2Convert = new Matrix2x2Convert( Matrix2x2._1234 );
     * ... var b: Tmatrix2x2 = { a: 1., b: 2., c: 3., d: 4. };
     * ... var c: Matrix2x2Convert = b;
     * ... Equal.equals( a, c ); }) == true
     * </code></pre>
     */
    @:from public static inline
    function fromTmatrix2x2( tm: Tmatrix2x2 ): Matrix2x2Convert {
        var m2x2: Mat2x2 = cast tm;
        return new Matrix2x2Convert( m2x2 );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix2x2Convert = new Matrix2x2Convert( Matrix2x2._1234 );
     * ... var b: Tmatrix2x2numbered = { _00: 1., _10: 2., _01: 3., _11: 4. };
     * ... var c: Tmatrix2x2numbered = a;
     * ... Equal.equals( b, c ); }) == true
     * </code></pre>
     */
    @:to public inline
    function toTmatrix2x2numbered(): Tmatrix2x2numbered {
        var tm: Tmatrix2x2numbered = { _00: this.a, _10: this.b, _01: this.c, _11: this.d };
        return tm;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a: Matrix2x2Convert = new Matrix2x2Convert( Matrix2x2._1234 );
     * ... var b: Tmatrix2x2numbered = { _00: 1., _10: 2., _01: 3., _11: 4. };
     * ... var c: Matrix2x2Convert  = b;
     * ... Equal.equals( a, c ); }) == true
     * </code></pre>
     */
    @:from public static inline
    function fromTmatrix2x2numbered( tm: Tmatrix2x2numbered ): Matrix2x2Convert {
        return new Matrix2x2Convert( new Matrix2x2( { a: tm._00, b: tm._10, c: tm._01, d: tm._11 } ) );
    }
}
