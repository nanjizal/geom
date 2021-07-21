package geom.structure;
/** 
   { phase, magnitude }
**/
@:structInit
class Polar {
    public var phase = 0.; 
    public var magnitude = 0.;
    function new( phase: Float, magnitude: Float ){
        this.phase = phase; 
        this.magnitude = magnitude;
    }
    // for rough debug, perhaps remove later.
    public function values(){
        return phase + ' ' + magnitude;
    }
    public function clone(): Polar {
        return { phase: this.phase, magnitude: this.magnitude };
    }
}
