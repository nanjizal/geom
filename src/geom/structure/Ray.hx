package geom.structure;
import geom.matrix.Matrix1x4;
/** 
   { dist, edge, norm, refl }
**/
@:structInit
class Ray {
    public var dist = 0.; 
    public var edge = 0.;
    public var norm: Matrix1x4;
    public var refl:  Matrix1x4;
    function new( dist: Float, edge: Float, norm: Matrix1x4, refl: Matrix1x4 ){
        this.dist  = dist; 
        this.edge  = edge;
        this.norm = norm;
        this.refl  = refl;
    }
}
