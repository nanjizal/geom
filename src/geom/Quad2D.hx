package geom;
import geom.Matrix1x2;
@:structInit
class Quad2D {
    public var A: Matrix1x2; 
    public var B: Matrix1x2;
    public var C: Matrix1x2;
    public var D: Matrix1x2;
    function new( A_: Matrix1x2, B_: Matrix1x2, C_: Matrix1x2, D_: Matrix1x2 ){
        A = A_; 
        B = B_;
        C = C_;
        D = D_;
    }
}
