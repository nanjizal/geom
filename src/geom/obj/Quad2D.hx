package geom.obj;
import geom.matrix.Matrix1x2;
@:structInit
class Quad2D {
    public var A: Matrix1x2; 
    public var B: Matrix1x2;
    public var C: Matrix1x2;
    public var D: Matrix1x2;
    function new( A: Matrix1x2, B: Matrix1x2, C: Matrix1x2, D: Matrix1x2 ){
        this.A = A; 
        this.B = B;
        this.C = C;
        this.D = D;
    }
}
