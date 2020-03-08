package geom.matrix;
import haxe.io.Float32Array;
import geom.tydef.*;
/** 
   ![4x4](../../bootstrap/img/matrix5x5.png)
**/
@:forward
abstract Matrix5x5( geom.structure.Mat5x5 ) from geom.structure.Mat5x5 to geom.structure.Mat5x5 {
    public static inline 
    final rows = 5;
    public static inline
    final columns = 5;
    public inline
    function new( m: geom.structure.Mat5x5 ){ this = m; }
    //-------------------
    // Common Functionality  
    //-------------------
    /**
     * <pre><code>
     * >>> Matrix5x5.counting == Matrix5x5.counting.clone() 
     * </code></pre>
     */
    public inline 
    function clone(): Matrix5x5 {
        return new Matrix5x5( { a: this.a, b: this.b, c: this.c, d: this.d, e: this.e
                              , f: this.f, g: this.g, h: this.h, i: this.i, j: this.j
                              , k: this.k, l: this.l, m: this.m, n: this.n, o: this.o
                              , p: this.p, q: this.q, r: this.r, s: this.s, t: this.t
                              , u: this.u, v: this.v, w: this.w, x: this.x, y: this.y } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var m = Matrix5x5.counting;
     * ... var arr = new Array<Float>();
     * ... for( i in m ){
     * ...   arr.push(i); 
     * ... } 
     * ... [1.,2.,3.,4.,5.,6.,7.,8.,9.,10.,11.,12.,13.,14.,15.,16.,17.,18.,19.,20.,21.,22.,23.,24.,25.].toString() == arr.toString(); }) == true
     * </code></pre>
     */
    public inline
    function iterator() {
        return [ this.a, this.b, this.c, this.d, this.e
               , this.f, this.g, this.h, this.i, this.j
               , this.k, this.l, this.m, this.n, this.o
               , this.p, this.q, this.r, this.s, this.t
               , this.u, this.v, this.w, this.x, this.y ].iterator();
    }
    public var self(get,never):Matrix5x5;
    inline function get_self() return (cast this : Matrix5x5);
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix5x5.zero == new Matrix5x5({ a: 0., b: 0., c: 0., d: 0., e: 0.
     * ...                                 , f: 0., g: 0., h: 0., i: 0., j: 0.
     * ...                                 , k: 0., l: 0., m: 0., n: 0., o: 0.
     * ...                                 , p: 0., q: 0., r: 0., s: 0., t: 0.
     * ...                                 , u: 0., v: 0., w: 0., x: 0., y: 0. } );
     * ... }) == true
     * </code></pre>
     */
                        //-------------------
                        // Common Constants  
                        //-------------------
    public static var zero( get, never ): Matrix5x5;
    static inline
    function get_zero(): Matrix5x5 {
        return new Matrix5x5({ a: 0., b: 0., c: 0., d: 0., e: 0.
                             , f: 0., g: 0., h: 0., i: 0., j: 0.
                             , k: 0., l: 0., m: 0., n: 0., o: 0.
                             , p: 0., q: 0., r: 0., s: 0., t: 0.
                             , u: 0., v: 0., w: 0., x: 0., y: 0. } );
    }
    var nought( get, never ): Matrix5x5;
    inline
    function get_nought(): Matrix5x5 {
        return zero;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... Matrix5x5.unit == new Matrix5x5({ a: 1., b: 0., c: 0., d: 0., e: 0.
     * ...                                 , f: 0., g: 1., h: 0., i: 0., j: 0.
     * ...                                 , k: 0., l: 0., m: 1., n: 0., o: 0.
     * ...                                 , p: 0., q: 0., r: 0., s: 1., t: 0.
     * ...                                 , u: 0., v: 0., w: 0., x: 0., y: 1. } );
     * ... }) == true
     * </code></pre>
     */
    public static var unit( get, never ): Matrix5x5;
    static inline
    function get_unit(): Matrix5x5 {
        return new Matrix5x5({ a: 1., b: 0., c: 0., d: 0., e: 0.
                             , f: 0., g: 1., h: 0., i: 0., j: 0.
                             , k: 0., l: 0., m: 1., n: 0., o: 0.
                             , p: 0., q: 0., r: 0., s: 1., t: 0.
                             , u: 0., v: 0., w: 0., x: 0., y: 1. } );
    }
    var one( get, never): Matrix5x5;
    inline
    function get_one(): Matrix5x5 {
        return unit;
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix5x5.minus1 == new Matrix5x5({ a: -1., b: 0., c: 0., d: 0., e: 0.
     * ...                                   , f: 0., g: -1., h: 0., i: 0., j: 0.
     * ...                                   , k: 0., l: 0., m: -1., n: 0., o: 0.
     * ...                                   , p: 0., q: 0., r: 0., s: -1., t: 0.
     * ...                                   , u: 0., v: 0., w: 0., x: 0., y: -1. } );
     * ... }) == true
     * </code></pre>
     */
    public static var minus1( get, never ): Matrix5x5;
    static inline
    function get_minus1(): Matrix5x5 {
        return -Matrix5x5.unit;
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix5x5.counting == new Matrix5x5({ a: 1.,  b: 2.,  c: 3.,  d: 4.,  e: 5.
     * ...                                     , f: 6.,  g: 7.,  h: 8.,  i: 9.,  j: 10.
     * ...                                     , k: 11., l: 12., m: 13., n: 14., o: 15.
     * ...                                     , p: 16., q: 17., r: 18., s: 19., t: 20.
     * ...                                     , u: 21., v: 22., w: 23., x: 24., y: 25. } );
     * ... }) == true
     * </code></pre>
     */
    public static var counting( get, never ): Matrix5x5;
    static inline
    function get_counting(): Matrix5x5 {
        return new Matrix5x5({ a: 1.,  b: 2.,  c: 3.,  d: 4.,  e: 5.
                             , f: 6.,  g: 7.,  h: 8.,  i: 9.,  j: 10.
                             , k: 11., l: 12., m: 13., n: 14., o: 15.
                             , p: 16., q: 17., r: 18., s: 19., t: 20.
                             , u: 21., v: 22., w: 23., x: 24., y: 25. } );
    }
    var testCount( get, never ): Matrix5x5;
    inline
    function get_testCount(): Matrix5x5 {
        return counting;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix5x5.counting;
     * ... var b = Matrix5x5.counting;
     * ... a == b; }) == true
     * </code></pre>
     */
    @:op( A == B )
    public static inline
    function equal( a: Matrix5x5, b: Matrix5x5 ): Bool {
        var delta = 0.0000001;
        return !(
               Math.abs(a.a - b.a) >= delta
            || Math.abs(a.b - b.b) >= delta
            || Math.abs(a.c - b.c) >= delta
            || Math.abs(a.d - b.d) >= delta
            || Math.abs(a.e - b.e) >= delta
            || Math.abs(a.f - b.f) >= delta
            || Math.abs(a.g - b.g) >= delta
            || Math.abs(a.h - b.h) >= delta
            || Math.abs(a.i - b.i) >= delta
            || Math.abs(a.j - b.j) >= delta
            || Math.abs(a.k - b.k) >= delta
            || Math.abs(a.l - b.l) >= delta
            || Math.abs(a.m - b.m) >= delta
            || Math.abs(a.n - b.n) >= delta
            || Math.abs(a.o - b.o) >= delta
            || Math.abs(a.p - b.p) >= delta
            || Math.abs(a.q - b.q) >= delta
            || Math.abs(a.r - b.r) >= delta
            || Math.abs(a.s - b.s) >= delta
            || Math.abs(a.t - b.t) >= delta
            || Math.abs(a.u - b.u) >= delta
            || Math.abs(a.v - b.v) >= delta
            || Math.abs(a.w - b.w) >= delta
            || Math.abs(a.x - b.x) >= delta
            || Math.abs(a.y - b.y) >= delta
        );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix5x5.counting;
     * ... var b = a + a;
     * ... a != b; }) == true
     * </code></pre>
     */
    @:op(A != B) public static inline
    function notEqual( a: Matrix5x5, b:Matrix5x5 ): Bool {
        return !equal( a, b );
    }
    //-------------------
    // Common operators  
    //-------------------
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix5x5.counting;
     * ... var b = -a;
     * ... b == new Matrix5x5({ a: -1., b: -2., c: -3., d: -4., e: -5.
     * ...                    , f: -6., g: -7., h: -8, i: -9., j: -10.
     * ...                    , k: -11., l: -12., m: -13., n: -14., o:-15.
     * ...                    , p: -16., q: -17., r: -18., s: -19., t: -20.
     * ...                    , u: -21., v: -22., w: -23., x: -24., y: -25. } ); 
     * ... }) == true
     * </code></pre>
     */
    @:op( -A ) public static inline
    function negating( a:Matrix5x5 ): Matrix5x5 {
      	return a.negate();
    }
    public inline
    function negate(): Matrix5x5 {
        return new Matrix5x5( { a: -this.a, b: -this.b, c: -this.c, d: -this.d, e: -this.e
                              , f: -this.f, g: -this.g, h: -this.h, i: -this.i, j: -this.j
                              , k: -this.k, l: -this.l, m: -this.m, n: -this.n, o: -this.o
                              , p: -this.p, q: -this.q, r: -this.r, s: -this.s, t: -this.t
                              , u: -this.u, v: -this.v, w: -this.w, x: -this.x, y: -this.y } );
    } 
    @:op(A * B)
    public static inline
    function multiply( r: Matrix5x5, s: Matrix5x5 ): Matrix5x5 {
        /** a b c d e   a b c d e
            f g h i j   f g h i j
            k l m n o   k l m n o
            p q r s t   p q r s t
            u v w x y   u v w x y
        **/
        return new Matrix5x5(
        { a: r.a*s.a
            +r.b*s.f
            +r.c*s.k
            +r.d*s.p
            +r.e*s.u
        , b: r.a*s.b
            +r.b*s.g
            +r.c*s.l
            +r.d*s.q
            +r.e*s.v
        , c: r.a*s.c
            +r.b*s.h
            +r.c*s.m
            +r.d*s.r
            +r.e*s.w
        , d: r.a*s.d
            +r.b*s.i
            +r.c*s.n
            +r.d*s.s
            +r.e*s.x
        , e: r.a*s.e
            +r.b*s.j
            +r.c*s.o
            +r.d*s.t
            +r.e*s.y
                    , f: r.f*s.a
                        +r.g*s.f
                        +r.h*s.k
                        +r.i*s.p
                        +r.j*s.u
                    , g: r.f*s.b
                        +r.g*s.g
                        +r.h*s.l
                        +r.i*s.q
                        +r.j*s.v
                    , h: r.f*s.c
                        +r.g*s.h
                        +r.h*s.m
                        +r.i*s.r
                        +r.j*s.w
                    , i: r.f*s.d
                        +r.g*s.i
                        +r.h*s.n
                        +r.i*s.s
                        +r.j*s.x
                    , j: r.f*s.e
                        +r.g*s.j
                        +r.h*s.o
                        +r.i*s.t
                        +r.j*s.y
                                , k: r.k*s.a
                                    +r.l*s.f
                                    +r.m*s.k
                                    +r.n*s.p
                                    +r.o*s.u
                                , l: r.k*s.b
                                    +r.l*s.g
                                    +r.m*s.l
                                    +r.n*s.q
                                    +r.o*s.v
                                , m: r.k*s.c
                                    +r.l*s.h
                                    +r.m*s.m
                                    +r.n*s.r
                                    +r.o*s.w
                                , n: r.k*s.d
                                    +r.l*s.i
                                    +r.m*s.n
                                    +r.n*s.s
                                    +r.o*s.x
                                , o: r.k*s.e
                                    +r.l*s.j
                                    +r.m*s.o
                                    +r.n*s.t
                                    +r.o*s.y
                                            , p: r.p*s.a
                                                +r.q*s.f
                                                +r.r*s.k
                                                +r.s*s.p
                                                +r.t*s.u
                                            , q: r.p*s.b
                                                +r.q*s.g
                                                +r.r*s.l
                                                +r.s*s.q
                                                +r.t*s.v
                                            , r: r.p*s.c
                                                +r.q*s.h
                                                +r.r*s.m
                                                +r.s*s.r
                                                +r.t*s.w
                                            , s: r.p*s.d
                                                +r.q*s.i
                                                +r.r*s.n
                                                +r.s*s.s
                                                +r.t*s.x
                                            , t: r.p*s.e
                                                +r.q*s.j
                                                +r.r*s.o
                                                +r.s*s.t
                                                +r.t*s.y
                                                         , u: r.u*s.a
                                                             +r.v*s.f
                                                             +r.w*s.k
                                                             +r.x*s.p
                                                             +r.y*s.u
                                                         , v: r.u*s.b
                                                             +r.v*s.g
                                                             +r.w*s.l
                                                             +r.x*s.q
                                                             +r.y*s.v
                                                         , w: r.u*s.c
                                                             +r.v*s.h
                                                             +r.w*s.m
                                                             +r.x*s.r
                                                             +r.y*s.w
                                                         , x: r.u*s.d
                                                             +r.v*s.i
                                                             +r.w*s.n
                                                             +r.x*s.s
                                                             +r.y*s.x
                                                         , y: r.u*s.e
                                                             +r.v*s.j
                                                             +r.w*s.o
                                                             +r.x*s.t
                                                             +r.y*s.y
        } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix5x5.unit;
     * ... a + a == new Matrix5x5( { a: 2., b: 0., c: 0., d: 0., e: 0.
     * ...                         , f: 0., g: 2., h: 0., i: 0., j: 0.
     * ...                         , k: 0., l: 0., m: 2., n: 0., o: 0.
     * ...                         , p: 0., q: 0., r: 0., s: 2., t: 0.
     * ...                         , u: 0., v: 0., w: 0., x: 0., y: 2. } ); }) == true
     * </code></pre>
     */
    @:op(A + B) public static inline
    function add( m0: Matrix5x5, m1: Matrix5x5 ): Matrix5x5 {
        return new Matrix5x5( { a: m0.a + m1.a, b: m0.b + m1.b, c: m0.c + m1.c, d: m0.d + m1.d, e: m0.e + m1.e
                              , f: m0.f + m1.f, g: m0.g + m1.g, h: m0.h + m1.h, i: m0.i + m1.i, j: m0.j + m1.j
                              , k: m0.k + m1.k, l: m0.l + m1.l, m: m0.m + m1.m, n: m0.n + m1.n, o: m0.o + m1.o
                              , p: m0.p + m1.p, q: m0.q + m1.q, r: m0.r + m1.r, s: m0.s + m1.s, t: m0.t + m1.t
                              , u: m0.u + m1.u, v: m0.v + m1.v, w: m0.w + m1.w, x: m0.x + m1.x, y: m0.y + m1.y
                              } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix5x5.unit;
     * ... a - a == Matrix5x5.zero; }) == true
     * </code></pre>
     */
    @:op(A - B) public static inline
    function sub( m0: Matrix5x5, m1: Matrix5x5 ): Matrix5x5 {
        return new Matrix5x5( { a: m0.a - m1.a, b: m0.b - m1.b, c: m0.c - m1.c, d: m0.d - m1.d, e: m0.e - m1.e
                              , f: m0.f - m1.f, g: m0.g - m1.g, h: m0.h - m1.h, i: m0.i - m1.i, j: m0.j - m1.j
                              , k: m0.k - m1.k, l: m0.l - m1.l, m: m0.m - m1.m, n: m0.n - m1.n, o: m0.o - m1.o
                              , p: m0.p - m1.p, q: m0.q - m1.q, r: m0.r - m1.r, s: m0.s - m1.s, t: m0.t - m1.t
                              , u: m0.u - m1.u, v: m0.v - m1.v, w: m0.w - m1.w, x: m0.x - m1.x, y: m0.y - m1.y
                              } );
    }
    public inline
    function transpose(): Matrix5x5 {
        return new Matrix5x5( { 
                           a: this.a, b: this.f, c: this.k, d: this.p, e: this.u
                         , f: this.b, g: this.g, h: this.l, i: this.q, j: this.v
                         , k: this.c, l: this.h, m: this.m, n: this.r, o: this.w
                         , p: this.d, q: this.i, r: this.n, s: this.s, t: this.x
                         , u: this.e, v: this.j, w: this.o, x: this.t, y: this.y } );
    } 
    public inline function setXY( x: Int, y: Int, v: Float  ): Float {
        return switch [ x, y ] {
    case [ 0,0 ]: this.a = v; case [ 0,1 ]: this.b = v; case [ 0,2 ]: this.c = v; case [ 0,3 ]: this.d = v; case [ 0,4 ]: this.e = v;
    case [ 1,0 ]: this.f = v; case [ 1,1 ]: this.g = v; case [ 1,2 ]: this.h = v; case [ 1,3 ]: this.i = v; case [ 1,4 ]: this.j = v;
    case [ 2,0 ]: this.k = v; case [ 2,1 ]: this.l = v; case [ 2,2 ]: this.m = v; case [ 2,3 ]: this.n = v; case [ 2,4 ]: this.o = v;
    case [ 3,0 ]: this.p = v; case [ 3,1 ]: this.q = v; case [ 3,2 ]: this.r = v; case [ 3,3 ]: this.s = v; case [ 3,4 ]: this.t = v;
    case [ 4,0 ]: this.u = v; case [ 4,1 ]: this.v = v; case [ 4,2 ]: this.w = v; case [ 4,3 ]: this.x = v; case [ 4,4 ]: this.y = v;
    case _: throw ('bad set $x, $y on Matrix5x5' ); }
    }
    public inline function getXY( x: Int, y: Int  ): Float {
        return switch [ x, y ] {
            case [ 0, 0 ]: this.a; case [ 0, 1 ]: this.b; case [ 0, 2 ]: this.c; case [ 0, 3 ]: this.d; case [ 0, 4 ]: this.e;
            case [ 1, 0 ]: this.f; case [ 1, 1 ]: this.g; case [ 1, 2 ]: this.h; case [ 1, 3 ]: this.i; case [ 1, 4 ]: this.j;
            case [ 2, 0 ]: this.k; case [ 2, 1 ]: this.l; case [ 2, 2 ]: this.m; case [ 2, 3 ]: this.n; case [ 2, 4 ]: this.o;
            case [ 3, 0 ]: this.p; case [ 3, 1 ]: this.q; case [ 3, 2 ]: this.r; case [ 3, 3 ]: this.s; case [ 3, 4 ]: this.t;
            case [ 4, 0 ]: this.u; case [ 4, 1 ]: this.v; case [ 4, 2 ]: this.w; case [ 4, 3 ]: this.x; case [ 4, 4 ]: this.y;
            case _: throw ('bad get $x, $y on Matrix5x5' ); }
    } 
    public inline
    function pretty( prec: Int ):String {
        var sa = floatToStringPrecision( this.a, prec );
        var sb = floatToStringPrecision( this.b, prec );
        var sc = floatToStringPrecision( this.c, prec );
        var sd = floatToStringPrecision( this.d, prec );
        var se = floatToStringPrecision( this.e, prec );
        var sf = floatToStringPrecision( this.f, prec );
        var sg = floatToStringPrecision( this.g, prec );
        var sh = floatToStringPrecision( this.h, prec );
        var si = floatToStringPrecision( this.i, prec );
        var sj = floatToStringPrecision( this.j, prec );
        var sk = floatToStringPrecision( this.k, prec );
        var sl = floatToStringPrecision( this.l, prec );
        var sm = floatToStringPrecision( this.m, prec );
        var sn = floatToStringPrecision( this.n, prec );
        var so = floatToStringPrecision( this.o, prec );
        var sp = floatToStringPrecision( this.p, prec );
        var sq = floatToStringPrecision( this.q, prec );
        var sr = floatToStringPrecision( this.r, prec );
        var ss = floatToStringPrecision( this.s, prec );
        var st = floatToStringPrecision( this.t, prec );
        var su = floatToStringPrecision( this.u, prec );
        var sv = floatToStringPrecision( this.v, prec );
        var sw = floatToStringPrecision( this.w, prec );
        var sx = floatToStringPrecision( this.x, prec );
        var sy = floatToStringPrecision( this.y, prec );
        var la = sa.length;
        var lb = sb.length;
        var lc = sc.length;
        var ld = sd.length;
        var le = se.length;
        var lf = sf.length;
        var lg = sg.length;
        var lh = sh.length;
        var li = si.length;
        var lj = sj.length;
        var lk = sk.length;
        var ll = sl.length;
        var lm = sm.length;
        var ln = sn.length;
        var lo = so.length;
        var lp = sp.length;
        var lq = sq.length;
        var lr = sr.length;
        var ls = ss.length;
        var lt = st.length;
        var lu = su.length;
        var lv = sv.length;
        var lw = sw.length;
        var lx = sx.length;
        var ly = sy.length;
        var r0: Int = max5( la, lf, lk, lp, lu );
        var r1: Int = max5( lb, lg, ll, lq, lv );
        var r2: Int = max5( lc, lh, lm, lr, lw );
        var r3: Int = max5( ld, li, ln, ls, lx );
        var r4: Int = max5( le, lj, lo, lt, ly );
        var spaces = '';
        for( n in 0...r0 ) spaces = spaces + ' ';
        sa = spaces.substr( 0, r0 - la ) + sa;
        sf = spaces.substr( 0, r0 - lf ) + sf;
        sk = spaces.substr( 0, r0 - lk ) + sk;
        sp = spaces.substr( 0, r0 - lp ) + sp;
        su = spaces.substr( 0, r0 - lu ) + su;
        var spaces = '';
        for( n in 0...r1 ) spaces = spaces + ' ';
        sb = spaces.substr( 0, r1 - lb ) + sb;
        sg = spaces.substr( 0, r1 - lg ) + sg;
        sl = spaces.substr( 0, r1 - ll ) + sl;
        sq = spaces.substr( 0, r1 - lq ) + sq;
        sv = spaces.substr( 0, r1 - lv ) + sv;
        var space = '';
        for( n in 0...r2 ) spaces = spaces + ' ';
        sc = spaces.substr( 0, r2 - lc ) + sc;
        sh = spaces.substr( 0, r2 - lh ) + sh;
        sm = spaces.substr( 0, r2 - lm ) + sm;
        sr = spaces.substr( 0, r2 - lr ) + sr;
        sw = spaces.substr( 0, r2 - lw ) + sw;
        var space = '';
        for( n in 0...r3 ) spaces = spaces + ' ';
        sd = spaces.substr( 0, r3 - ld ) + sd;
        si = spaces.substr( 0, r3 - li ) + si;
        sn = spaces.substr( 0, r3 - ln ) + sn;
        ss = spaces.substr( 0, r3 - ls ) + ss;
        sx = spaces.substr( 0, r3 - lx ) + sx;
        var space = '';
        for( n in 0...r4 ) spaces = spaces + ' ';
        se = spaces.substr( 0, r4 - le ) + se;
        sj = spaces.substr( 0, r4 - lj ) + sj;
        so = spaces.substr( 0, r4 - lo ) + so;
        st = spaces.substr( 0, r4 - lt ) + st;
        sy = spaces.substr( 0, r4 - ly ) + sy;
        return '\n'
             + '/ ' + sa + ', ' + sb + ', ' + sc + ', ' + sd + ', ' + se + ' \\\n'
             + '| ' + sf + ', ' + sg + ', ' + sh + ', ' + si + ', ' + sj + ' |\n'
             + '| ' + sk + ', ' + sl + ', ' + sm + ', ' + sn + ', ' + so + ' |\n'
             + '| ' + sp + ', ' + sq + ', ' + sr + ', ' + ss + ', ' + st + ' |\n'
             + '\\ ' + su + ', ' + sv + ', ' + sw + ', ' + sx +  ', ' + sy + ' /\n';
    }
    public static inline
    function max5( f0: Float, f1: Float, f2: Float, f3: Float, f4: Float ): Int {
        return Math.round( Math.max( Math.max( Math.max( Math.max( f0, f1 ), f2 ), f3 ), f4 ) );
    }
    /*
        credit: sea_jackel https://stackoverflow.com/questions/23689001/how-to-reliably-format-a-floating-point-number-to-a-specified-number-of-decimal
    */
    public static function floatToStringPrecision( n: Float, prec: Int ){
        if( n==0 ) return "0." + ([for(i in 0...prec) "0"].join("")); //quick return
        var minusSign:Bool = ( n < 0.0 );
        n = Math.abs( n );
        var intPart:Int = Math.floor( n );
        var p = Math.pow( 10, prec );
        var fracPart = Math.round( p*(n - intPart) );
        var buf: StringBuf = new StringBuf();
        if( minusSign ) buf.addChar( "-".code );
        buf.add( Std.string( intPart ) );
        if( fracPart == 0 ){
            buf.addChar( ".".code );
            for( i in 0...prec ) buf.addChar( "0".code );
        } else {
            buf.addChar( ".".code );
            p = p/10;
            var nZeros:Int = 0;
            while( fracPart < p ){
                p = p/10;
                buf.addChar( "0".code );
            }
            buf.add(fracPart);
        }
        return buf.toString();
    }
}