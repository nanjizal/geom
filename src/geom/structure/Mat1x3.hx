package geom.structure;
/** 
   { x, y, z }
**/
@:structInit
class Mat1x3 {
    public var x = 0.; 
    public var y = 0.;
    public var z = 0.; 
    function new( x: Float, y: Float, z: Float ){
        this.x = x; 
        this.y = y;
        this.z = z;
    }
}