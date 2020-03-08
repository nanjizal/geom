package geom.structure;
/**

**/
@:structInit
class Mat5x5 {
    public var a = 0.; public var b = 0.; public var c = 0.; public var d = 0.; public var e = 0.;
    public var f = 0.; public var g = 0.; public var h = 0.; public var i = 0.; public var j = 0.;
    public var k = 0.; public var l = 0.; public var m = 0.; public var n = 0.; public var o = 0.;
    public var p = 0.; public var q = 0.; public var r = 0.; public var s = 0.; public var t = 0.;
    public var u = 0.; public var v = 0.; public var w = 0.; public var x = 0.; public var y = 0.;
    
    function new( a: Float, b: Float, c: Float, d: Float, e: Float
                , f: Float, g: Float, h: Float, i: Float, j: Float
                , k: Float, l: Float, m: Float, n: Float, o: Float
                , p: Float, q: Float, r: Float, s: Float, t: Float
                , u: Float, v: Float, w: Float, x: Float, y: Float ){
        this.a = a; this.b = b; this.c = c; this.d = d; this.e = e; 
        this.f = f; this.g = g; this.h = h; this.i = i; this.j = j; 
        this.k = k; this.l = l; this.m = m; this.n = n; this.o = o;
        this.p = p; this.q = q; this.r = r; this.s = s; this.t = t;
        this.u = u; this.v = v; this.w = w; this.x = x; this.y = y;
    }
}