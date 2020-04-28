package geom.structure;
/** 
   { s, x, y, xy }
**/
@:structInit
class MVec2 {
    public var s = 0.; 
    public var x = 0.;
    public var y = 0.; 
    public var xy = 0.;
    function new( s:    Float
                , x:   Float,  y: Float
                , xy:  Float ){
     this.s = s; 
     this.x = x;
     this.y = y; 
     this.xy = xy;
    }
}