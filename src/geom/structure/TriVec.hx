package geom.structure;
import geom.matrix.Matrix1x4;
/** 
   ![triVec](../../bootstrap/img/tri3D.png)
**/
@:structInit
class TriVec {
    public var a: Matrix1x4;
    public var b: Matrix1x4;
    public var c: Matrix1x4;
    function new( a: Matrix1x4, b: Matrix1x4, c: Matrix1x4 ){
        this.a = a;
        this.b = b;
        this.c = c;
    }
}