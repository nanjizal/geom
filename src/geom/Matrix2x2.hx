package geom;
#if avoid_typedef
// some haxe targets might perform better with a class so you can switch if you want.
class Tmatrix2x2 {
    public var a: Float = 0.;
    public var b: Float = 0.;
    
    public var d: Float = 0.;
    public var e: Float = 0.;
    
    private // so has to be used same as typedef
    function new( a: Float, b: Float
                , c: Float, d: Float ){
        this.a = a; this.b = b;
        this.c = c; this.d = d;
    }
}
#else
typedef Tmatrix2x2 = {
    var a: Float;
    var b: Float;
    
    var c: Float;
    var d: Float;
}
#end
typedef Tmatrix2x2numbered = {
    var _00: Float;
    var _10: Float;
    
    var _01: Float;     
    var _11: Float;
}
@:forward
abstract Matrix2x2( Tmatrix2x2 ) from Tmatrix2x2 to Tmatrix2x2 {
    public inline
    function new( m: Tmatrix2x2 ){
      	this = m;
    }
    public inline 
    function clone(): Matrix2x2 {
        return new Matrix2x2( { a: this.a, b: this.b 
                             , c: this.c, d: this.d } );
    }
    public inline
    function create( a: Float, b: Float, c: Float, d: Float ): Matrix2x2 {
        this = new Matrix2x2( { a:a, b:b 
                             , c:c, d:d } );
        return this;
    }
    public static inline
    function unit(): Matrix2x2 {
        return new Matrix2x2( { a: 1., b: 0.
                             , c: 0., d: 1. } );
    }
    public static inline
    function zero(): Matrix2x2 {
        return new Matrix2x2( { a: 0., b: 0.
                             , c: 0., d: 0. } );
    }
    public static inline
    function scale( p: Apoint ): Matrix2x2 {
        return new Matrix2x2( { a: p.x, b: 0.
                              ,c: 0.,   d: p.y } );
    }
    public static inline
    function rotation( alpha: Float ): Matrix2x2 {
        return new Matrix2x2( { a: Math.cos( alpha ), b: -Math.sin( alpha )
                            ,  c: Math.sin(alpha),   d: Math.cos(alpha) } );
    }
    public inline
    function transpose(): Matrix2x2 {
        return new Matrix2x2( { a: this.a, b: this.c
                             , c: this.b, d: this.d } );
    }
    @:op(A + B)
    public static inline
    function add( m0: Matrix2x2, m1: Matrix2x2 ): Matrix2x2 {
        return new Matrix2x2( { a: m0.a + m1.a, b: m0.b + m1.b
                             , c: m0.c + m1.c, d: m0.d + m1.d } );
    }
    @:op(A - B)
    public static inline
    function sub( m0: Matrix2x2, m1: Matrix2x2 ): Matrix2x2 {
        return new Matrix2x2( { a: m0.a - m1.a, b: m0.b - m1.b
                             , c: m0.c - m1.c, d: m0.d - m1.d } );
    }
    @:op(A * B)
    public static inline
    function multiplyValue( v: Float, m: Matrix2x2 ): Matrix2x2 {
        return new Matrix2x2( {a: m.a*v, b: m.b*v
                             ,c: m.c*v, d: m.d*v } );
    }
    @:op(A * B)
    public static inline
    function scaleMultiply( p: Apoint2, m: Matrix2x2 ): Matrix2x2 {
        return new Matrix2x2( {a: m.a*p.x, b: m.b
                             ,c: m.c,     d: m.d*p.y } );
    }
    @:op(A * B)
    public static inline
    function multiply( a2: Matrix2x2, b2: Matrix2x2 ): Matrix2x2 {
        return new Matrix2x2( {a: a2.a*b2.a + a2.b*b2.c, b: a2.a*b2.b + a2.b*b2.d
                             ,c: a2.c*b2.a + a2.d*b2.c, d: a2.c*b2.b + a2.d*b2.d } );
    }
    public inline
    function multiplyPoint( p: Apoint2 ): Matrix2x2 {
        var x = this.a * p.x + this.c * p.y;
        var y = this.b * p.x + this.d * p.y;
        return new Apoint( { x: x, y: y } );
    }
    public inline
    function det(){
      return this.a*this.d - this.b*this.c;
    }
    public inline
    function inverse(): Matrix2x2 {
        var d = det();
        return if( d == 0 ) {
            return null;
        } else {
            var adj = new Matrix2x2({ a: this.d,  b: -this.b
                                   , c: -this.c, d: this.a } );
            (1/d)*adj;
        }
    }
    @:from
    public static inline
    function fromArr( arr: Array<Float> ): Matrix2x2 {
        return new Matrix2x2( { a: arr[0], b: arr[1]
                             , c: arr[2], d: arr[3] } );
    }
    @:to
    public inline
    function toArray(): Array<Float> {
        return [ this.a, this.b
               , this.c, this.d ];
    }
    @:from
    public static inline
    function fromVec( vec: haxe.ds.Vector<Float> ): Matrix2x2 {
        return new Matrix2x2( { a: vec.get(0), b: vec.get(1),
                               c: vec.get(2), d: vec.get(3) } );
    }
    @:to
    public inline
    function toVector(): haxe.ds.Vector<Float> {
        var vec = new haxe.ds.Vector<Float>(4);
        vec.set(0, this.a);
        vec.set(1, this.b);
        vec.set(2, this.c);
        vec.set(3, this.d);
        return vec;
    }
    public inline function setXY( x: Int, y: Int, val: Float  ): Float {
        return switch [ x, y ] {
            case [ 0, 0 ]:
                this.a = val;
            case [ 0, 1 ]:
                this.b = val;
            case [ 1, 0 ]:
                this.c = val;
            case [ 1, 1 ]:
                this.d = val;
            case _:
                throw ('bad set $x, $y on Matrix2x2' );
        }
    }
    public inline function getXY( x: Int, y: Int  ): Float {
        return switch [ x, y ] {
            case [ 0, 0 ]:
                this.a;
            case [ 0, 1 ]:
                this.b;
            case [ 1, 0 ]:
                this.c;
            case [ 1, 1 ]:
                this.d;
            case _:
                throw ('bad get $x, $y on Matrix2x2' );
        }
    }
}
