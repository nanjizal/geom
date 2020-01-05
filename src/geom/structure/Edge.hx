package geom.structure;
import geom.matrix.Matrix1x4;
/** 
   { dist, edge, point, norm }
**/
@:structInit
class Edge {
    public var dist = 0.; 
    public var edge = 0.;
    public var point: Matrix1x4;
    public var norm:  Matrix1x4;
    function new( dist: Float, edge: Float, point: Matrix1x4, norm: Matrix1x4 ){
        this.dist  = dist; 
        this.edge  = edge;
        this.point = point;
        this.norm  = norm;
    }
}
