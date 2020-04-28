package geom.structure;
/** 
   { s, x, y, z, xy, zx, yz, xyz }
**/
@:structInit
class MVec3 {
    public var s = 0.; 
    public var x = 0.;
    public var y = 0.; 
    public var z = 0.;
    public var xy = 0.;
    public var zx = 0.;
    public var yz = 0.;
    public var xyz= 0.;
    function new( s:    Float
                , x:   Float,  y: Float, z: Float
                , xy:  Float, zx: Float, yz: Float
                , xyz: Float ){
     this.s = s; 
     this.x = x;
     this.y = y; 
     this.z = z;
     this.xy = xy;
     this.zx = zx;
     this.yz = yz;
     this.xyz = xyz;
    }
}