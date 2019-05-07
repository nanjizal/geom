package geom.structure;
/* 
   x, y
*/
@:structInit
class Mat1x2 {
    public var x = 0.; 
    public var y = 0.;
    function new( x: Float, y: Float ){
        this.x = x; 
        this.y = y;
    }
}