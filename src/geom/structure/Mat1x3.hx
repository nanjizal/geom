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
    // for rough debug, perhaps remove later.
    public function values(){
        return x + ' ' + y + ' ' + z;
    }
    public function clone(): Mat1x3 {
        return { x: this.x, y: this.y, z: this.z };
    }
}