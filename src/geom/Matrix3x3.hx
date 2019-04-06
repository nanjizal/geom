package geom;
#if avoid_typedef
// some haxe targets might perform better with a class so you can switch if you want.
class Tmatrix3x3 {
    public var a: Float = 0.;
    public var b: Float = 0.;
    public var c: Float = 0.;
    
    public var d: Float = 0.;
    public var e: Float = 0.;
    public var f: Float = 0.;
    
    public var g: Float = 0.;
    public var h: Float = 0.;
    public var i: Float = 0.;
    
    private // so has to be used same as typedef
    function new( a: Float, b: Float, c: Float
                , d: Float, e: Float, f: Float
                , g: Float, h: Float, i: Float ){
        this.a = a; this.b = b; this.c = c;
        this.d = d; this.e = e; this.f = f; 
        this.g = g; this.h = h; this.i = i;
    }
}
#else
typedef Tmatrix3x3 = {
    var a: Float;
    var b: Float;
    var c: Float;
    
    var d: Float;
    var e: Float;
    var f: Float;
    
    var g: Float;
    var h: Float;
    var i: Float;
}
#end
// To add
typedef Tmatrix3x3x3numbered = {
    var _00: Float;
    var _10: Float;
    var _20: Float;
    var _01: Float;
    var _11: Float;
    var _21: Float;
    var _02: Float;
    var _12: Float;
    var _22: Float;
}
@:forward
abstract Matrix3x3( Tmatrix3x3 ) from Tmatrix3x3 to Tmatrix3x3 {
    /* a b c
       d e f
       g h i    */
    public inline
    function new( m: Tmatrix3x3 ){
        this = m;
    }
    public static inline
    function unit(): Matrix3x3 {
      	return new Matrix3x3({ a: 1., b: 0., c: 0.
                            , d: 0., e: 1., f: 0.
                            , g: 0., h: 0., i: 1. });
    }
    public static inline
    function zero(): Matrix3x3 {
        return new Matrix3x3({ a: 0., b: 0., c: 0.
                            , d: 0., e: 0., f: 0.
                            , g: 0., h: 0., i: 0. });
    }
    @:op(A + B)
    public static inline
    function add( m0: Matrix3x3, m1: Matrix3x3 ): Matrix3x3 {
        return new Matrix3x3( { a: m0.a + m1.a, b: m0.b + m1.b, c: m0.c + m1.c
                             , d: m0.d + m1.d, e: m0.e + m1.e, f: m0.f + m1.f
                             , g: m0.d + m1.d, h: m0.h + m1.h, i: m0.i + m1.i } );
    }
    @:op(A - B)
    public static inline
    function sub( m0: Matrix3x3, m1: Matrix3x3 ): Matrix3x3 {
        return new Matrix3x3( { a: m0.a - m1.a, b: m0.b - m1.b, c: m0.c - m1.c
                             , d: m0.d - m1.d, e: m0.e - m1.e, f: m0.f - m1.f
                             , g: m0.g - m1.g, h: m0.h - m1.h, i: m0.i - m1.i } );
    }
    @:op(A * B)
    public static inline
    function scaleMultiply( p: Apoint4, m: Matrix3x3 ): Matrix3x3 {
        return new Matrix3x3( { a: m.a*p.x, b: m.b,     c: m.c
                             , d: m.d,     e: m.e*p.y, f: m.f
                             , g: m.g,     h: m.h,     i: m.i*p.z } );
    }
    @:op(A * B)
    public static inline
    function multiplyV( v: Float, m: Matrix3x3 ): Matrix3x3 {
        return new Matrix3x3( { a: m.a*v, 	b: m.b*v,   c: m.c*v
                             , d: m.d*v,  e: m.e*v,   f: m.f*v
                             , g: m.g*v,  h: m.h*v,   i: m.i*v} );
    }
    @:op(A * B)
    public static inline
    function multiply( p: Matrix3x3, q: Matrix3x3 ): Matrix3x3 {
        /* a b c    a b c
           d e f    d e f
           g h i    g h i   */
        return new Matrix3x3(
        { a: p.a*q.a+p.b*q.d+p.c*q.g, b: p.a*q.b+p.b*q.e+p.c*q.h, c: p.a*q.c+p.b*q.f+p.c*q.i
        , d: p.d*q.a+p.e*p.d+p.f*q.g, e: p.d*q.b+p.e*q.e+p.f*q.h, f: p.d*q.c+p.e*q.f+p.f*q.i
        , g: p.g*p.a+p.h*q.d+p.i*q.g, h: p.g*q.b+p.h*q.e+p.i*q.h, i: p.g*q.c+p.h*q.f+p.i*q.i } );
    }
    public inline
    function cofactor( a: Float, b: Float, c: Float, d: Float ){
        return a*d - b*c;
    }
    public inline
    function det(){
        return this.a * cofactor( this.e, this.f, this.h, this.i )
             - this.b * cofactor( this.d, this.f, this.g, this.i ) 
             + this.c * cofactor( this.d, this.e, this.g, this.h );
    }
    public inline
    function inverse(): Matrix3x3 {
        var d = det();
        return if( d == 0 ){
            null;
        } else {
        var adj  = new Matrix3x3( { 
          a: (this.e*this.i-this.f*this.h), b: -(this.d*this.i-this.f*this.g), c: (this.d*this.h-this.e*this.g)
        , d: -(this.b*this.i-this.c*this.h), e: (this.a*this.i-this.c*this.g), f: -(this.a*this.h-this.b*this.g)
        , g: (this.b*this.f-this.c*this.e), h: -(this.a*this.f-this.c*this.d), i: (this.a*this.e-this.b*this.d) } );
            (1/d)*adj;
        }
    }
    @:from
    public static inline
    function fromArr( arr: Array<Float> ){
        return new Matrix3x3( { a: arr[0], b: arr[1], c: arr[2]
                             , d: arr[3], e: arr[4], f: arr[5]
                             , g: arr[6], h: arr[7], i: arr[8] } );
    }
    @:to
    public inline
    function toArray(): Array<Float> {
        return [ this.a, this.b, this.c 
               , this.d, this.e, this.f
               , this.g, this.h, this.i ];
    }
    @:from
    public static inline
    function fromVec( vec: haxe.ds.Vector<Float> ){
        return new Matrix3x3( { a: vec.get(0), b: vec.get(1), c: vec.get(2)
                             , d: vec.get(3), e: vec.get(4), f: vec.get(5)
                             , g: vec.get(6), h: vec.get(7), i: vec.get(8) } );
    }
    @:to
    public inline
    function toVector(): haxe.ds.Vector<Float> {
        var vec = new haxe.ds.Vector<Float>(8);
        vec.set( 0, this.a );
        vec.set( 1, this.b );
        vec.set( 2, this.c );
        vec.set( 3, this.d );
        vec.set( 4, this.e );
        vec.set( 5, this.f );
      	vec.set( 6, this.g );
        vec.set( 7, this.h );
        vec.set( 8, this.i );
        return vec;
    }
    public inline function setXY( x: Int, y: Int, val: Float  ): Float {
        return switch [ x, y ] {
            case [ 0, 0 ]:
                this.a = val;
            case [ 0, 1 ]:
                this.b = val;
            case [ 0, 2 ]:
                this.c = val;
            case [ 1, 0 ]:
                this.d = val;
            case [ 1, 1 ]:
                this.e = val;
            case [ 1, 2 ]:
                this.f = val;
            case [ 2, 0]:
                this.g = val;
            case [ 2, 1 ]:
                this.h = val;
            case [ 2, 2 ]:
                this.i = val;
            case _:
                throw ('bad set $x, $y on Matrix3x3' );
        }
    }
    public inline function getXY( x: Int, y: Int  ): Float {
        return switch [ x, y ] {
            case [ 0, 0 ]:
                this.a;
            case [ 0, 1 ]:
                this.b;
            case [ 0, 2 ]:
                this.c;
            case [ 1, 0 ]:
                this.d;
            case [ 1, 1 ]:
                this.e;
            case [ 1, 2 ]:
                this.f;
            case [ 2, 0]:
                this.g;
            case [ 2, 1 ]:
                this.h;
            case [ 2, 2 ]:
                this.i;
            case _:
                throw ('bad get $x, $y on Matrix3x3' );
        }
    }
}
