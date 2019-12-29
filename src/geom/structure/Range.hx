package geom.structure;
/** 
   { u, l }
**/
@:structInit
class Range {
    public var u = 0.; 
    public var l = 0.;
    function new( u: Float, l: Float ){
        this.u = u; 
        this.l = l;
    }
}