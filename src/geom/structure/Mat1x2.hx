package geom.structure;
/** 
   { x, y }
**/
@:structInit
class Mat1x2 {
    public var x = 0.; 
    public var y = 0.;
    function new( x: Float, y: Float ){
        this.x = x; 
        this.y = y;
    }
    // for rough debug, perhaps remove later.
    public function values(){
        return x + ' ' + y;
    }
    public function clone(): Mat1x2 {
        return { x: this.x, y: this.y };
    }
}