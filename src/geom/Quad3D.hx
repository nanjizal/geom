package geom.obj;
import geom.Matrix1x4;
@:structInit
class Quad3D {
    public var A: Matrix1x4; 
    public var B: Matrix1x4;
    public var C: Matrix1x4;
    public var D: Matrix1x4;
    function new( A: Matrix1x4, B: Matrix1x4, C: Matrix1x4, D: Matrix1x4 ){
        this.A = A; 
        this.B = B;
        this.C = C;
        this.D = D;
    }
}
