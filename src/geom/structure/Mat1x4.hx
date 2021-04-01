package geom.structure;
/** 
   { x, y, z, w }
**/
@:structInit
class Mat1x4 {
    public var x = 0.; 
    public var y = 0.;
    public var z = 0.; 
    @:optional public var w = 1.;
    function new( x: Float, y: Float, z: Float, w: Float = 1. ){
        this.x = x; 
        this.y = y;
        this.z = z;
        this.w = w;
    }
    // for rough debug, perhaps remove later.
    public function values(){
        return x + ' ' + y + ' ' + z + ' ' + w;
    }
    public function clone(): Mat1x4 {
        return { x: this.x, y: this.y, z: this.z, w: this.w };
    }
}