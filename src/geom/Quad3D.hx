package geom;
import geom.Matrix1x4;
@:structInit
class Quad3D {
    public var A: Matrix1x4; 
    public var B: Matrix1x4;
    public var C: Matrix1x4;
    public var D: Matrix1x4;
    function new( A_: Matrix1x4, B_: Matrix1x4, C_: Matrix1x4, D_: Matrix1x4 ){
        A = A_; 
        B = B_;
        C = C_;
        D = D_;
    }
}