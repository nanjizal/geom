package geom.structure;
/** 
   ![3x3](../../bootstrap/img/matrix3x3.png)
**/
@:structInit
class Mat3x3 {
    public var a = 0.; public var b = 0.; public var c = 0.;
    public var d = 0.; public var e = 0.; public var f = 0.;
    public var g = 0.; public var h = 0.; public var i = 0.;
    function new( a: Float, b: Float, c: Float
                , d: Float, e: Float, f: Float
                , g: Float, h: Float, i: Float ){
        this.a = a; this.b = b; this.c = c;
        this.d = d; this.e = e; this.f = f; 
        this.g = g; this.h = h; this.i = i;
    }
}