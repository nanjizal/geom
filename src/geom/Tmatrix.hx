package geom;
typedef Tmatrix2 = {
    var a: Float;
    var b: Float;
    
    var c: Float;
    var d: Float;
}
typedef Tmatrix3 = {
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
typedef Tmatrix4 = {
    var a: Float;
    var b: Float;
    var c: Float;
    var d: Float;
    
    var e: Float;
    var f: Float;
    var g: Float;
    var h: Float;
    
    var i: Float;
    var j: Float;
    var k: Float;
    var l: Float;
    
    var m: Float;
    var n: Float;
    var o: Float;
    var p: Float;
}
typedef Tmatrix4numbered = {
    var _00: Float;
    var _10: Float;
    var _20: Float;
    var _30: Float;
    var _01: Float;     
    var _11: Float;
    var _21: Float;
    var _31: Float;
    var _02: Float;
    var _12: Float;
    var _22: Float;
    var _32: Float;
    var _03: Float;
    var _13: Float;
    var _23: Float;
    var _33: Float;
}
class Cmatrix2 {
    public var a: Float = 0.;
    public var b: Float = 0.;
    
    public var c: Float = 0.;
    public var d: Float = 0.;
    public function new(){}
}
class Cmatrix3 {
    public var a: Float = 0.;
    public var b: Float = 0.;
    public var c: Float = 0.;
    
    public var d: Float = 0.;
    public var e: Float = 0.;
    public var f: Float = 0.;
    
    public var g: Float = 0.;
    public var h: Float = 0.;
    public var i: Float = 0.;
    
    public function new(){}
}
class Cmatrix4 {
    public var a: Float = 0.;
    public var b: Float = 0.;
    public var c: Float = 0.;
    public var d: Float = 0.;
    
    public var e: Float = 0.;
    public var f: Float = 0.;
    public var g: Float = 0.;
    public var h: Float = 0.;
    
    public var i: Float = 0.;
    public var j: Float = 0.;
    public var k: Float = 0.;
    public var l: Float = 0.;
    
    public var m: Float = 0.;
    public var n: Float = 0.;
    public var o: Float = 0.;
    public var p: Float = 0.;
    
    public function new(){}
}

@:forward
abstract Amatrix2( Tmatrix2 ) from Tmatrix2 to Tmatrix2 {
    public inline
    function new( m: Tmatrix2 ){
      	this = m;
    }
    public inline 
    function clone(): Amatrix2 {
        return new Amatrix2( { a: this.a, b: this.b 
                             , c: this.c, d: this.d } );
    }
    public inline
    function create( a: Float, b: Float, c: Float, d: Float ): Amatrix2 {
        this = new Amatrix2( { a:a, b:b 
                             , c:c, d:d } );
        return this;
    }
    public static inline
    function unit(): Amatrix2 {
        return new Amatrix2( { a: 1., b: 0.
                             , c: 0., d: 1. } );
    }
    public static inline
    function zero(): Amatrix2 {
        return new Amatrix2( { a: 0., b: 0.
                             , c: 0., d: 0. } );
    }
    public static inline
    function scale( p: Apoint ): Amatrix2 {
        return new Amatrix2( { a: p.x, b: 0.
                              ,c: 0.,   d: p.y } );
    }
    public static inline
    function rotation( alpha: Float ): Amatrix2 {
        return new Amatrix2( { a: Math.cos( alpha ), b: -Math.sin( alpha )
                            ,  c: Math.sin(alpha),   d: Math.cos(alpha) } );
    }
    public inline
    function transpose(): Amatrix2 {
        return new Amatrix2( { a: this.a, b: this.c
                             , c: this.b, d: this.d } );
    }
    @:op(A + B)
    public static inline
    function add( m0: Amatrix2, m1: Amatrix2 ): Amatrix2 {
        return new Amatrix2( { a: m0.a + m1.a, b: m0.b + m1.b
                             , c: m0.c + m1.c, d: m0.d + m1.d } );
    }
    @:op(A - B)
    public static inline
    function sub( m0: Amatrix2, m1: Amatrix2 ): Amatrix2 {
        return new Amatrix2( { a: m0.a - m1.a, b: m0.b - m1.b
                             , c: m0.c - m1.c, d: m0.d - m1.d } );
    }
    @:op(A * B)
    public static inline
    function multiplyValue( v: Float, m: Amatrix2 ): Amatrix2 {
        return new Amatrix2( {a: m.a*v, b: m.b*v
                             ,c: m.c*v, d: m.d*v } );
    }
    @:op(A * B)
    public static inline
    function scaleMultiply( p: Apoint2, m: Amatrix2 ): Amatrix2 {
        return new Amatrix2( {a: m.a*p.x, b: m.b
                             ,c: m.c,     d: m.d*p.y } );
    }
    @:op(A * B)
    public static inline
    function multiply( a2: Amatrix2, b2: Amatrix2 ): Amatrix2 {
        return new Amatrix2( {a: a2.a*b2.a + a2.b*b2.c, b: a2.a*b2.b + a2.b*b2.d
                             ,c: a2.c*b2.a + a2.d*b2.c, d: a2.c*b2.b + a2.d*b2.d } );
    }
    public inline
    function multiplyPoint( p: Apoint2 ): Amatrix2 {
        var x = this.a * p.x + this.c * p.y;
        var y = this.b * p.x + this.d * p.y;
        return new Apoint( { x: x, y: y } );
    }
    public inline
    function det(){
      return this.a*this.d - this.b*this.c;
    }
    public inline
    function inverse(): Amatrix2 {
        var d = det();
        return if( d == 0 ) {
            return null;
        } else {
            var adj = new Amatrix2({ a: this.d,  b: -this.b
                                   , c: -this.c, d: this.a } );
            (1/d)*adj;
        }
    }
    @:from
    public static inline
    function fromArr( arr: Array<Float> ): Amatrix2 {
        return new Amatrix2( { a: arr[0], b: arr[1]
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
    function fromVec( vec: haxe.ds.Vector<Float> ): Amatrix2 {
        return new Amatrix2( { a: vec.get(0), b: vec.get(1),
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
                throw ('bad set $x, $y on Amatrix2' );
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
                throw ('bad get $x, $y on Amatrix2' );
        }
    }
}
@:forward
abstract Amatrix3( Tmatrix3 ) from Tmatrix3 to Tmatrix3 {
    /* a b c
       d e f
       g h i    */
    public inline
    function new( m: Tmatrix3 ){
        this = m;
    }
    public static inline
    function unit(): Amatrix3 {
      	return new Amatrix3({ a: 1., b: 0., c: 0.
                            , d: 0., e: 1., f: 0.
                            , g: 0., h: 0., i: 1. });
    }
    public static inline
    function zero(): Amatrix3 {
        return new Amatrix3({ a: 0., b: 0., c: 0.
                            , d: 0., e: 0., f: 0.
                            , g: 0., h: 0., i: 0. });
    }
    @:op(A + B)
    public static inline
    function add( m0: Amatrix3, m1: Amatrix3 ): Amatrix3 {
        return new Amatrix3( { a: m0.a + m1.a, b: m0.b + m1.b, c: m0.c + m1.c
                             , d: m0.d + m1.d, e: m0.e + m1.e, f: m0.f + m1.f
                             , g: m0.d + m1.d, h: m0.h + m1.h, i: m0.i + m1.i } );
    }
    @:op(A - B)
    public static inline
    function sub( m0: Amatrix3, m1: Amatrix3 ): Amatrix3 {
        return new Amatrix3( { a: m0.a - m1.a, b: m0.b - m1.b, c: m0.c - m1.c
                             , d: m0.d - m1.d, e: m0.e - m1.e, f: m0.f - m1.f
                             , g: m0.g - m1.g, h: m0.h - m1.h, i: m0.i - m1.i } );
    }
    @:op(A * B)
    public static inline
    function scaleMultiply( p: Apoint4, m: Amatrix3 ): Amatrix3 {
        return new Amatrix3( { a: m.a*p.x, b: m.b,     c: m.c
                             , d: m.d,     e: m.e*p.y, f: m.f
                             , g: m.g,     h: m.h,     i: m.i*p.z } );
    }
    @:op(A * B)
    public static inline
    function multiplyV( v: Float, m: Amatrix3 ): Amatrix3 {
        return new Amatrix3( { a: m.a*v, 	b: m.b*v,   c: m.c*v
                             , d: m.d*v,  e: m.e*v,   f: m.f*v
                             , g: m.g*v,  h: m.h*v,   i: m.i*v} );
    }
    @:op(A * B)
    public static inline
    function multiply( p: Amatrix3, q: Amatrix3 ): Amatrix3 {
        /* a b c    a b c
           d e f    d e f
           g h i    g h i   */
        return new Amatrix3(
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
    function inverse(): Amatrix3 {
        var d = det();
        return if( d == 0 ){
            null;
        } else {
        var adj  = new Amatrix3( { 
          a: (this.e*this.i-this.f*this.h), b: -(this.d*this.i-this.f*this.g), c: (this.d*this.h-this.e*this.g)
        , d: -(this.b*this.i-this.c*this.h), e: (this.a*this.i-this.c*this.g), f: -(this.a*this.h-this.b*this.g)
        , g: (this.b*this.f-this.c*this.e), h: -(this.a*this.f-this.c*this.d), i: (this.a*this.e-this.b*this.d) } );
            (1/d)*adj;
        }
    }
    @:from
    public static inline
    function fromArr( arr: Array<Float> ){
        return new Amatrix3( { a: arr[0], b: arr[1], c: arr[2]
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
        return new Amatrix3( { a: vec.get(0), b: vec.get(1), c: vec.get(2)
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
                throw ('bad set $x, $y on Amatrix3' );
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
                throw ('bad get $x, $y on Amatrix3' );
        }
    }
}
@:forward
abstract Amatrix4( Tmatrix4 ) from Tmatrix4 to Tmatrix4 {
    /* a b c d
       e f g h
       i j k l
       m n o p  */
    public inline
    function new( m: Tmatrix4 ){
    		this = m;
    }
    public static inline
    function unit(): Amatrix4 {
        return new Amatrix4({ a: 1., b: 0., c: 0., d: 0.
                            , e: 0., f: 1., g: 0., h: 0.
                            , i: 0., j: 0., k: 1., l: 0.
                            , m: 0., n: 0., o: 0., p: 1. } );
    }
    public static inline
    function zero(): Amatrix4 {
        return new Amatrix4({ a: 0., b: 0., c: 0., d: 0.
                            , e: 0., f: 0., g: 0., h: 0.
                            , i: 0., j: 0., k: 0., l: 0.
                            , m: 0., n: 0., o: 0., p: 0. } );
    }
    @:op(A + B)
    public static inline
    function add( m0: Amatrix4, m1: Amatrix4 ): Amatrix4 {
        return new Amatrix4( { a: m0.a + m1.a, b: m0.b + m1.b, c: m0.c + m1.c, d: m0.d + m1.d
                             , e: m0.e + m1.e, f: m0.f + m1.f, g: m0.d + m1.d, h: m0.h + m1.h
                             , i: m0.i + m1.i, j: m0.j + m1.j, k: m0.k + m1.k, l: m0.l + m1.l
                             , m: m0.l + m1.l, n: m0.n + m1.n, o: m0.o + m1.o, p: m0.p + m1.p } );
    }
    @:op(A - B)
    public static inline
    function sub( m0: Amatrix4, m1: Amatrix4 ): Amatrix4 {
        return new Amatrix4( { a: m0.a - m1.a, b: m0.b - m1.b, c: m0.c - m1.c, d: m0.d - m1.d
                             , e: m0.e - m1.e, f: m0.f - m1.f, g: m0.d - m1.d, h: m0.h - m1.h
                             , i: m0.i - m1.i, j: m0.j - m1.j, k: m0.k - m1.k, l: m0.l - m1.l
                             , m: m0.l - m1.l, n: m0.n - m1.n, o: m0.o - m1.o, p: m0.p - m1.p } );
    }
    @:op(A * B)
    public static inline
    function scaleMultiply( p: Apoint4, m: Amatrix4 ): Amatrix4 {
        return new Amatrix4( { a: m.a*p.x, b: m.b,     c: m.c,     d: m.d
                             , e: m.e,     f: m.f*p.y, g: m.g,     h: m.h
                             , i: m.i,     j: m.j,     k: m.k*p.z, l: m.l
                             , m: m.m,     n: m.n,     o: m.o,     p: m.p*p.w } );
    }
    @:op(A * B)
    public static inline
    function multiply( r: Amatrix4, s: Amatrix4 ): Amatrix4 {
        /* a b c d   a b c d
           e f g h   e f g h
           i j k l   i j k l
           m n o p   m n o p    */
        return new Amatrix4(
        { a: r.a*s.a+r.b*s.e+r.c*s.i+r.d*s.m, b: r.a*s.b+r.b*s.f+r.c*s.j+r.d*s.n
                                , c: r.a*s.c+r.b*s.g+r.c+s.k+r.d*s.o, d: r.a*s.d+r.b*s.h+r.c*s.l+r.d*s.p
                                  
        , e: r.e*s.a+r.f*s.e+r.g*s.i+r.h*s.m, f: r.e*s.b+r.f*s.f+r.g*s.j+r.h*s.n
                                , g: r.e*s.c+r.f*s.g+r.g*s.k+r.h*s.o, h: r.e*s.d+r.f*s.h+r.g*s.l+r.h*s.p 
                                
        , i: r.i*s.a+r.j*s.e+r.k*s.i+r.l*s.m, j: r.i*s.b+r.j*s.f+r.k*s.j+r.l*s.n
                                , k: r.i*s.c+r.j*s.g+r.k*s.k+r.l*s.o, l: r.i*s.d+r.j*s.h+r.k*s.l+r.l*s.p
                                
        , m: r.m*s.a+r.n*s.e+r.o*s.i+r.p*s.m, n: r.m*s.b+r.n*s.f+r.o*s.j+r.p*s.n
                                , o: r.m+s.c+r.n*s.g+r.o*s.k+r.p*s.o, p: r.m*s.d+r.n*s.h+r.o*s.l+r.p*s.p } );
    }
    // https://www.mathsisfun.com/algebra/matrix-determinant.html
    public inline
    function cofactor( a: Float, b: Float, c: Float,
                       d: Float, e: Float, f: Float,
                       g: Float, h: Float, i: Float): Float {
        return a * ( e * i - f * h ) - b * ( d * i - f * g ) + c * ( d * h - e * g );
    }
    public inline
    function det(): Float {
        return   this.a * cofactor( this.f, this.g, this.h
                                  , this.j, this.k, this.l
                                  , this.n, this.o, this.p ) 
               - this.b * cofactor( this.e, this.g, this.h
                                  , this.i, this.k, this.l
                                  , this.m, this.o, this.p )
               + this.c * cofactor( this.e, this.f, this.h
                                  , this.i, this.j, this.l
                                  , this.m, this.p, this.n )
               - this.d * cofactor( this.e, this.f, this.g
                                  , this.i, this.j, this.k
                                  , this.m, this.n, this.o );
    }
    public inline
    function inverse(): Amatrix4 {
        var a = this.a;
        var b = this.b; 
        var c = this.c;
        var d = this.d;
        var e = this.e;
        var f = this.f;
        var g = this.g;
        var h = this.h;
        var i = this.i;
        var j = this.j;
        var k = this.k;
        var l = this.l;
        var m = this.m;
        var n = this.n;
        var o = this.o;
        var p = this.p;
        var q = j*o*h - n*k*h + n*g*l - f*o*l - j*g*p + f*k*p;
        var r = m*k*h - i*o*h - m*g*l + e*o*l + i*g*p - e*k*p;
        var s = i*n*h - m*j*h + m*f*l - e*n*l - i*f*p + e*j*p;
        var t = m*j*g - i*n*g - m*f*k + e*n*k + i*f*o - e*j*o;
        var det = a * q + b * r + c * s + d * t;
        return if( det == 0 ){
            null;
        } else {
            var detI = 1 / det;
            new Amatrix4( {
                    a: q * detI
                  , b: ( n*k*d - j*o*d - n*c*l + b*o*l + j*c*p - b*k*p ) * detI
                  , c: ( f*o*d - n*g*d + n*c*h - b*o*h - f*c*p + b*g*p ) * detI
                  , d: ( j*g*d - f*k*d - j*c*h + b*k*h + f*c*l - b*g*l ) * detI
                  , e: r * detI
                  , f: ( i*o*d - m*k*d + m*c*l - a*o*l - i*c*p + a*k*p ) * detI
                  , g: ( m*g*d - e*o*d - m*c*h + a*o*h + e*c*p - a*g*p ) * detI
                  , h: ( e*k*d - i*g*d + i*c*h - a*k*h - e*c*l + a*g*l ) * detI
                  , i: s * detI
                  , j: ( m*j*d - i*n*d - m*b*l + a*n*l + i*b*p - a*j*p ) * detI
                  , k: ( e*n*d - m*f*d + m*b*h - a*n*h - e*b*p + a*f*p ) * detI
                  , l: ( i*f*d - e*j*d - i*b*h + a*j*h + e*b*l - a*f*l ) * detI
                  , m: t * detI
                  , n: ( i*n*c - m*j*c + m*b*k - a*n*k - i*b*o + a*j*o ) * detI
                  , o: ( m*f*c - e*n*c - m*b*g + a*n*g + e*b*o - a*f*o ) * detI
                  , p: ( e*j*c - i*f*c + i*b*g - a*j*g - e*b*k + a*f*k ) * detI
            });
        }
    }
    @:from
    public static inline 
    function fromNumbered( m: Tmatrix4numbered ): Amatrix4 {
        return new Amatrix4( { 
                           a: m._00, b: m._10, c: m._20, d: m._30
                         , e: m._01, f: m._11, g: m._21, h: m._31
                         , i: m._02, j: m._12, k: m._22, l: m._32
                         , m: m._03, n: m._13, o: m._23, p: m._33 } );
    }
    @:to
    public inline
    function toNumbered(): Tmatrix4numbered {
        return { _00: this.a, _10: this.b, _20: this.c, _30: this.d
               , _01: this.e, _11: this.f, _21: this.g, _31: this.h
               , _02: this.i, _12: this.j, _22: this.k, _32: this.l
               , _03: this.m, _13: this.n, _23: this.o, _33: this.p };
    }
    @:from
    public static inline
    function fromArr( arr: Array<Float> ){
        return new Amatrix4( { a: arr[0],  b: arr[1],  c: arr[2],  d: arr[3]
                             , e: arr[4],  f: arr[5],  g: arr[6],  h: arr[7]
                             , i: arr[8],  j: arr[9],  k: arr[10], l: arr[11]
                             , m: arr[12], n: arr[13], o: arr[14], p: arr[15] } );
    }
    @:to
    public inline
    function toArray(): Array<Float> {
        return [ this.a, this.b, this.c, this.d
               , this.e, this.f, this.g, this.h
               , this.i, this.j, this.k, this.l
               , this.m, this.n, this.o, this.p ];
    }
    @:from
    public static inline
    function fromVec( vec: haxe.ds.Vector<Float> ){
        return new Amatrix4( { a: vec.get(0),  b: vec.get(1),  c: vec.get(2),  d: vec.get(3)
                             , e: vec.get(4),  f: vec.get(5),  g: vec.get(6),  h: vec.get(7)
                             , i: vec.get(8),  j: vec.get(9),  k: vec.get(10), l: vec.get(11)
                             , m: vec.get(12), n: vec.get(13), o: vec.get(14), p: vec.get(15) } );
    }
    @:to
    public inline
    function toVector(): haxe.ds.Vector<Float> {
        var vec = new haxe.ds.Vector<Float>(16);
        vec.set( 0, this.a );
        vec.set( 1, this.b );
        vec.set( 2, this.c );
        vec.set( 3, this.d );
        
        vec.set( 4, this.e );
        vec.set( 5, this.f );
        vec.set( 6, this.g );
        vec.set( 7, this.h );
        
        vec.set( 8,  this.i );
        vec.set( 9,  this.j );
        vec.set( 10, this.k );
        vec.set( 11, this.l );
        
        vec.set( 12, this.m );
        vec.set( 13, this.n );
        vec.set( 14, this.o );
        vec.set( 15, this.p );
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
            case [ 0, 3 ]:
                this.d = val;
                
            case [ 1, 0 ]:
                this.e = val;
            case [ 1, 1 ]:
                this.f = val;
            case [ 1, 2 ]:
                this.g = val;
            case [ 1, 3 ]:
                this.h = val;
                
            case [ 2, 0 ]:
                this.i = val;
            case [ 2, 1 ]:
                this.j = val;
            case [ 2, 2 ]:
                this.k = val;
            case [ 2, 3 ]:
                this.l = val;
            
            case [ 3, 0 ]:
                this.m = val;
            case [ 3, 1 ]:
                this.n = val;
            case [ 3, 2 ]:
                this.o = val;
            case [ 3, 3 ]:
                this.p = val;
                
            case _:
                throw ('bad set $x, $y on Amatrix4' );
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
            case [ 0, 3 ]:
                this.d;
            
            case [ 1, 0 ]:
                this.e;
            case [ 1, 1 ]:
                this.f;
            case [ 1, 2 ]:
                this.g;
            case [ 1, 3 ]:
                this.h;
            
            case [ 2, 0 ]:
                this.i;
            case [ 2, 1 ]:
                this.j;
            case [ 2, 2 ]:
                this.k;
            case [ 2, 3 ]:
                this.l;
        
            case [ 3, 0 ]:
                this.m;
            case [ 3, 1 ]:
                this.n;
            case [ 3, 2 ]:
                this.o;
            case [ 3, 3 ]:
                this.p;
            case _:
                throw ('bad get $x, $y on Amatrix4' );
        }
    }
}
/*
// For later...?
// Confused on exact context, and divergence from my expectation but think this maybe useful later...
a b c
d e f
g h i
a b 0 c
d e 0 f
0 0 0 0
g h 0 i
*/
/*
public static inline
function matrix3to4( m: M3 ): M4 {
    return new M4(  m.a,  m.b,  0.,  m.c
                          ,  m.d,  m.e,  0.,  m.f
                          ,     0.,    0.,   1.,     0.
                          ,  m.g,  m.h,  0,   m.i );
}*/