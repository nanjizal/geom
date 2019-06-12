package geom.structure;
/** 
   { x, y, z, w, u, v }
**/
@:structInit
class Vertex {
    public var x = 0.; 
    public var y = 0.;
    public var z = 0.; 
    @:optional public var w = 1.;
    public var u = 0.;
    public var v = 0.;
    function new( x: Float, y: Float, z: Float, w: Float = 1., u: Float, v: Float ){
        this.x = x; 
        this.y = y;
        this.z = z;
        this.w = w;
        this.u = u;
        this.v = v;
    }
}