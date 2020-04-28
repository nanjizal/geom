package geom.structure;
/** 
   { s, x, y, z, w, xy, xz, xw, yz, wy, zw, zyx, xyw, wzx, yzw, xyzw }
**/
@:structInit
class MVec4 {
    public var s: Float;
    public var x: Float;
    public var y: Float;
    public var z: Float;
    public var w: Float;
    public var xy: Float; //12
    public var xz: Float; //13
    public var xw: Float; //14
    public var yz: Float; //23
    public var wy: Float; //42
    public var zw: Float; //34
    public var zyx: Float;//321
    public var xyw: Float;//124
    public var wzx: Float;//431
    public var yzw: Float;//234
    public var xyzw: Float;//1234
    function new( s: Float, x: Float, y: Float, z: Float, w: Float, xy: Float, xz: Float, xw: Float, yz: Float, wy: Float, zw: Float, zyx: Float, xyw: Float, wzx: Float, yzw: Float, xyzw: Float ){
        this.s = s;
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
        this.xy = xy;
        this.xz = xz;
        this.xw = xw;
        this.yz = yz;
        this.wy = wy;
        this.zw = zw;
        this.zyx = zyx;
        this.xyw = xyw;
        this.wzx = wzx;
        this.yzw = yzw;
        this.xyzw = xyzw;
    }
}