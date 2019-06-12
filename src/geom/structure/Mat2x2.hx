package geom.structure;
/** 
   ![2x2](../../bootstrap/img/matrix2x2.png)
**/
@:structInit
class Mat2x2 {
    public var a = 0.; public var b = 0.;
    public var c = 0.; public var d = 0.;
    function new( a: Float, b: Float
                , c: Float, d: Float ){
        this.a = a; this.b = b;
        this.c = c; this.d = d;
    }
}