package geom.matrix;
import haxe.io.Float32Array;
import geom.constraints.Precision;
import geom.tydef.*;
/** 
   ![4x4](../../bootstrap/img/matrix4x4.png)
**/
@:forward 
abstract Matrix4x4( geom.structure.Mat4x4 ) from geom.structure.Mat4x4 to geom.structure.Mat4x4 {
    public static inline 
    final rows = 4;
    public static inline
    final columns = 4;
    public inline
    function new( m: geom.structure.Mat4x4 ){ this = m; }
    //-------------------
    // Common Functionality  
    //-------------------
    /**
     * <pre><code>
     * >>> Matrix4x4.counting == Matrix4x4.counting.clone() 
     * </code></pre>
     */
    public inline 
    function clone(): Matrix4x4 {
        return new Matrix4x4( { a: this.a, b: this.b, c: this.c, d: this.d
                              , e: this.e, f: this.f, g: this.g, h: this.h
                              , i: this.i, j: this.j, k: this.k, l: this.l
                              , m: this.m, n: this.n, o: this.o, p: this.p } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var m = Matrix4x4.counting;
     * ... var arr = new Array<Float>();
     * ... for( i in m ){
     * ...   arr.push(i); 
     * ... }
     * ... [1.,2.,3.,4.,5.,6.,7.,8.,9.,10.,11.,12.,13.,14.,15.,16.].toString() == arr.toString(); }) == true
     * </code></pre>
     */
    public inline
    function iterator() {
        return [ this.a, this.b, this.c, this.d
               , this.e, this.f, this.g, this.h
               , this.i, this.j, this.k, this.l
               , this.m, this.n, this.o, this.p ].iterator();
    }
    public var self(get,never):Matrix4x4;
    inline function get_self() return (cast this : Matrix4x4);
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x4.zero == new Matrix4x4({ a: 0., b: 0., c: 0., d: 0.
     * ...                                   , e: 0., f: 0., g: 0., h: 0.
     * ...                                   , i: 0., j: 0., k: 0., l: 0.
     * ...                                   , m: 0., n: 0., o: 0., p: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var zero( get, never ): Matrix4x4;
    static inline
    function get_zero(): Matrix4x4 {
        return new Matrix4x4({ a: 0., b: 0., c: 0., d: 0.
                             , e: 0., f: 0., g: 0., h: 0.
                             , i: 0., j: 0., k: 0., l: 0.
                             , m: 0., n: 0., o: 0., p: 0. } );
    }
    var nought( get, never ): Matrix4x4;
    inline
    function get_nought(): Matrix4x4 {
        return zero;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... Matrix4x4.unit == new Matrix4x4({ a: 1., b: 0., c: 0., d: 0.
     * ...                                   , e: 0., f: 1., g: 0., h: 0.
     * ...                                   , i: 0., j: 0., k: 1., l: 0.
     * ...                                   , m: 0., n: 0., o: 0., p: 1. } );
     * ... }) == true
     * </code></pre>
     */
    public static var unit( get, never ): Matrix4x4;
    static inline
    function get_unit(): Matrix4x4 {
        return new Matrix4x4({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: 1., g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: 0. 
                             , m: 0., n: 0., o: 0., p: 1. } );
    }
    var one( get, never): Matrix4x4;
    inline
    function get_one(): Matrix4x4 {
        return unit;
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x4.minus1 == new Matrix4x4({ a: -1., b: 0., c: 0., d: 0.
     * ...                                   , e: 0., f: -1., g: 0., h: 0.
     * ...                                   , i: 0., j: 0., k: -1., l: 0. 
     * ...                                   , m: 0., n: 0., o: 0., p: -1. } );
     * ... }) == true
     * </code></pre>
     */
    public static var minus1( get, never ): Matrix4x4;
    static inline
    function get_minus1(): Matrix4x4 {
        return -Matrix4x4.unit;
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x4.counting == new Matrix4x4({ a: 1., b: 2., c: 3., d: 4.
     * ...                                     , e: 5., f: 6., g: 7., h: 8.
     * ...                                     , i: 9., j: 10., k: 11., l: 12.
     * ...                                     , m: 13., n: 14., o: 15., p: 16. } );
     * ... }) == true
     * </code></pre>
     */
    public static var counting( get, never ): Matrix4x4;
    static inline
    function get_counting(): Matrix4x4 {
        return new Matrix4x4({ a: 1., b: 2., c: 3., d: 4.
                             , e: 5., f: 6., g: 7., h: 8.
                             , i: 9., j: 10., k: 11., l: 12.
                             , m: 13., n: 14., o: 15., p: 16. } );
    }
    var testCount( get, never ): Matrix4x4;
    inline
    function get_testCount(): Matrix4x4 {
        return counting;
    }
    /**
     * Used for testing
     * <pre><code>
     * >>> ({ 
     * ... Matrix4x4._1_16 == new Matrix4x4({ a: 1., b: 2., c: 3., d: 4.
     * ...                                    , e: 5., f: 6., g: 7., h: 8.
     * ...                                    , i: 9., j: 10., k: 11., l: 12.
     * ...                                    , m: 13., n: 14., o: 15., p: 16. } );
     * ... }) == true
     * </code></pre>
     */
    public static var _1_16( get, never ): Matrix4x4;
    static inline // TODO: need to locate where this is used for testing and use counting instead... alternate library?
    function get__1_16(): Matrix4x4 return Matrix4x4.counting;
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix4x4({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9., j:10., k:11., l:12., m:13.,n:14.,o:15.,p:16. });
     * ... var b = new Matrix4x4({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9., j:10., k:11., l:12., m:13.,n:14.,o:15.,p:16. });
     * ... a == b; }) == true
     * </code></pre>
     */
    @:op( A == B )
    public static inline
    function equal( a: Matrix4x4, b: Matrix4x4 ): Bool {
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
        );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix4x4({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9., j:10., k:11., l:12. , m:13.,n:14.,o:15.,p:16.});
     * ... var b = new Matrix4x4({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9., j:10., k:11., l:12., m:13.,n:14.,o:15.,p:15. });
     * ... a != b; }) == true
     * </code></pre>
     */
    @:op(A != B) public static inline
    function notEqual( a: Matrix4x4, b:Matrix4x4 ): Bool {
        return !equal( a, b );
    }
    //-------------------
    // Common operators  
    //-------------------
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix4x4.counting;
     * ... var b = -a;
     * ... b == new Matrix4x4({ a: -1., b: -2., c: -3., d: -4.
     * ...                    , e: -5., f: -6., g: -7., h: -8
     * ...                    , i: -9., j: -10., k: -11., l: -12.
     * ...                    , m: -13., n: -14., o:-15., p: -16. });
     * ... }) == true
     * </code></pre>
     */
    @:op( -A ) public static inline
    function negating( a:Matrix4x4 ): Matrix4x4 {
      	return a.negate();
    }
    public inline
    function negate(): Matrix4x4 {
        return new Matrix4x4( { a: -this.a, b: -this.b, c: -this.c, d: -this.d
                              , e: -this.e, f: -this.f, g: -this.g, h: -this.h
                              , i: -this.i, j: -this.j, k: -this.k, l: -this.l
                              , m: -this.m, n: -this.n, o: -this.o, p: -this.p } );
    } 
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix4x4.unit;
     * ... a + a == new Matrix4x4( { a: 2., b: 0., c: 0., d: 0.
     * ...                         , e: 0., f: 2., g: 0., h: 0.
     * ...                         , i: 0., j: 0., k: 2., l: 0. 
     * ...                         , m: 0., n: 0., o: 0., p: 2. } ); }) == true
     * </code></pre>
     */
    @:op(A + B) public static inline
    function add( m0: Matrix4x4, m1: Matrix4x4 ): Matrix4x4 {
        return new Matrix4x4( { a: m0.a + m1.a, b: m0.b + m1.b, c: m0.c + m1.c, d: m0.d + m1.d
                              , e: m0.e + m1.e, f: m0.f + m1.f, g: m0.g + m1.g, h: m0.h + m1.h
                              , i: m0.i + m1.i, j: m0.j + m1.j, k: m0.k + m1.k, l: m0.l + m1.l
                              , m: m0.m + m1.m, n: m0.n + m1.n, o: m0.o + m1.o, p: m0.p + m1.p } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix4x4.unit;
     * ... a - a == Matrix4x4.zero; }) == true
     * </code></pre>
     */
    @:op(A - B) public static inline
    function sub( m0: Matrix4x4, m1: Matrix4x4 ): Matrix4x4 {
        return new Matrix4x4( { a: m0.a - m1.a, b: m0.b - m1.b, c: m0.c - m1.c, d: m0.d - m1.d
                              , e: m0.e - m1.e, f: m0.f - m1.f, g: m0.g - m1.g, h: m0.h - m1.h
                              , i: m0.i - m1.i, j: m0.j - m1.j, k: m0.k - m1.k, l: m0.l - m1.l
                              , m: m0.m - m1.m, n: m0.n - m1.n, o: m0.o - m1.o, p: m0.p - m1.p } );
    }
    @:op(A * B)
    public static inline
    function multiply( r: Matrix4x4, s: Matrix4x4 ): Matrix4x4 {
        /** a b c d   a b c d
           e f g h   e f g h
           i j k l   i j k l
           m n o p   m n o p    
        **/
        return new Matrix4x4(
        { a: r.a*s.a+r.b*s.e+r.c*s.i+r.d*s.m, b: r.a*s.b+r.b*s.f+r.c*s.j+r.d*s.n
                                , c: r.a*s.c+r.b*s.g+r.c*s.k+r.d*s.o, d: r.a*s.d+r.b*s.h+r.c*s.l+r.d*s.p
                                  
        , e: r.e*s.a+r.f*s.e+r.g*s.i+r.h*s.m, f: r.e*s.b+r.f*s.f+r.g*s.j+r.h*s.n
                                , g: r.e*s.c+r.f*s.g+r.g*s.k+r.h*s.o, h: r.e*s.d+r.f*s.h+r.g*s.l+r.h*s.p 
                                
        , i: r.i*s.a+r.j*s.e+r.k*s.i+r.l*s.m, j: r.i*s.b+r.j*s.f+r.k*s.j+r.l*s.n
                                , k: r.i*s.c+r.j*s.g+r.k*s.k+r.l*s.o, l: r.i*s.d+r.j*s.h+r.k*s.l+r.l*s.p
                                
        , m: r.m*s.a+r.n*s.e+r.o*s.i+r.p*s.m, n: r.m*s.b+r.n*s.f+r.o*s.j+r.p*s.n
                                , o: r.m+s.c+r.n*s.g+r.o*s.k+r.p*s.o, p: r.m*s.d+r.n*s.h+r.o*s.l+r.p*s.p } );
    }
    @:op(A / B) public static inline
    function scaleDivide( m: Matrix4x4, p: Matrix1x4 ): Matrix4x4 {
        var pd = 1 / p;  
        return new Matrix4x4( { a: m.a*pd.x, b: m.b,      c: m.c,      d: m.d
                              , e: m.e,      f: m.f*pd.y, g: m.g,      h: m.h
                              , i: m.i,      j: m.j,      k: m.k*pd.z, l: m.l 
                              , m: m.m,      n: m.n,      o: m.o,      p: m.p*pd.w } );
    }
    @:op(A * B) public static inline
    function scaleMultiply1( p: Matrix1x4, m: Matrix4x4 ): Matrix4x4 {
        return new Matrix4x4( { a: m.a*p.x, b: m.b,     c: m.c,     d: m.d
                              , e: m.e,     f: m.f*p.y, g: m.g,     h: m.h
                              , i: m.i,     j: m.j,     k: m.k*p.z, l: m.l 
                              , m: m.m,     n: m.n,     o: m.o,     p: m.p*p.w } );
    }
    @:op(A * B) public static inline
    function scaleMultiply2( m: Matrix4x4, p: Matrix1x4 ): Matrix4x4 {
        return new Matrix4x4( { a: m.a*p.x, b: m.b,     c: m.c,     d: m.d
                              , e: m.e,     f: m.f*p.y, g: m.g,     h: m.h
                              , i: m.i,     j: m.j,     k: m.k*p.z, l: m.l
                              , m: m.m,     n: m.n,     o: m.o,     p: m.p*p.w } );
    }
    public inline
    function delta( x: Float, y: Float ): Matrix4x4 {
        return new Matrix4x4( { 
                           a: this.a, b: this.b, c: this.c, d: this.d
                         , e: this.e, f: this.f, g: this.g, h: this.h
                         , i: this.i, j: this.j, k: this.k, l: this.l
                         , m: this.m + x, n: this.n + y, o: this.o, p: this.p } );
    }
    @:from
    public static inline 
    function matrix4x3( m: Matrix4x3 ): Matrix4x4 {
        return new Matrix4x4( { 
                           a: m.a, b: m.b, c: m.c, d: m.d
                         , e: m.e, f: m.f, g: m.g, h: m.h
                         , i: m.i, j: m.j, k: m.k, l: m.l
                         , m: 0., n: 0., o: 0., p: 1. } );
    } 
    public inline
    function transpose(): Matrix4x4 {
        return new Matrix4x4( { 
                           a: this.a, b: this.e, c: this.i, d: this.m
                         , e: this.b, f: this.f, g: this.j, h: this.n
                         , i: this.c, j: this.g, k: this.k, l: this.o
                         , m: this.d, n: this.h, o: this.l, p: this.p } );
    } 
    public inline
    function updateWebGL( arr: Float32Array ){
        var here: Matrix4x4 = this;
        Conversion._4x4toFloat32ArrayTransposeUpdate_( arr, here  );
        return arr;
    }
    // non transpose technically incorrect but works for texture sometimes.. ?
    public inline
    function updateWebGL_( arr: Float32Array ){
        var here: Matrix4x4 = this;
        Conversion._4x4toFloat32ArrayUpdate_( arr, here  );
        return arr;
    }
    public inline function setXY( x: Int, y: Int, v: Float  ): Float {
        return switch [ x, y ] {
    case [ 0,0 ]: this.a = v; case [ 0,1 ]: this.b = v; case [ 0,2 ]: this.c = v; case [ 0,3 ]: this.d = v;
    case [ 1,0 ]: this.e = v; case [ 1,1 ]: this.f = v; case [ 1,2 ]: this.g = v; case [ 1,3 ]: this.h = v;
    case [ 2,0 ]: this.i = v; case [ 2,1 ]: this.j = v; case [ 2,2 ]: this.k = v; case [ 2,3 ]: this.l = v;
    case [ 3,0 ]: this.m = v; case [ 3,1 ]: this.n = v; case [ 3,2 ]: this.o = v; case [ 3,3 ]: this.p = v;
    case _: throw ('bad set $x, $y on Matrix4x4' ); }
    }
    public inline function getXY( x: Int, y: Int  ): Float {
        return switch [ x, y ] {
            case [ 0, 0 ]: this.a; case [ 0, 1 ]: this.b; case [ 0, 2 ]: this.c; case [ 0, 3 ]: this.d;
            case [ 1, 0 ]: this.e; case [ 1, 1 ]: this.f; case [ 1, 2 ]: this.g; case [ 1, 3 ]: this.h;
            case [ 2, 0 ]: this.i; case [ 2, 1 ]: this.j; case [ 2, 2 ]: this.k; case [ 2, 3 ]: this.l;
            case [ 3, 0 ]: this.m; case [ 3, 1 ]: this.n; case [ 3, 2 ]: this.o; case [ 3, 3 ]: this.p;
            case _: throw ('bad get $x, $y on Matrix4x4' ); }
    } 
    // used to print out a pretty representation of the matrix for debugging,
    // likely quite slow and not optimum.
    public inline
    function pretty( prec: Int ):String {
        var dp = Precision.floatToStringPrecision;
        var max4 = Precision.max4;
        var sa = dp( this.a, prec );
        var sb = dp( this.b, prec );
        var sc = dp( this.c, prec );
        var sd = dp( this.d, prec );
        var se = dp( this.e, prec );
        var sf = dp( this.f, prec );
        var sg = dp( this.g, prec );
        var sh = dp( this.h, prec );
        var si = dp( this.i, prec );
        var sj = dp( this.j, prec );
        var sk = dp( this.k, prec );
        var sl = dp( this.l, prec );
        var sm = dp( this.m, prec );
        var sn = dp( this.n, prec );
        var so = dp( this.o, prec );
        var sp = dp( this.p, prec );
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
        var r0: Int = max4( la, le, li, lm );
        var r1: Int = max4( lb, lf, lj, ln );
        var r2: Int = max4( lc, lg, lk, lo );
        var r3: Int = max4( ld, lh, ll, lp );
        var spaces = '';
        for( n in 0...r0 ) spaces = spaces + ' ';
        sa = spaces.substr( 0, r0 - la ) + sa;
        se = spaces.substr( 0, r0 - le ) + se;
        si = spaces.substr( 0, r0 - li ) + si;
        sm = spaces.substr( 0, r0 - lm ) + sm;
        var spaces = '';
        for( n in 0...r1 ) spaces = spaces + ' ';
        sb = spaces.substr( 0, r1 - lb ) + sb;
        sf = spaces.substr( 0, r1 - lf ) + sf;
        sj = spaces.substr( 0, r1 - lj ) + sj;
        sn = spaces.substr( 0, r1 - ln ) + sn;
        var space = '';
        for( n in 0...r2 ) spaces = spaces + ' ';
        sc = spaces.substr( 0, r2 - lc ) + sc;
        sg = spaces.substr( 0, r2 - lg ) + sg;
        sk = spaces.substr( 0, r2 - lk ) + sk;
        so = spaces.substr( 0, r2 - lo ) + so;
        var space = '';
        for( n in 0...r3 ) spaces = spaces + ' ';
        sd = spaces.substr( 0, r3 - ld ) + sd;
        sh = spaces.substr( 0, r3 - lh ) + sh;
        sl = spaces.substr( 0, r3 - ll ) + sl;
        sp = spaces.substr( 0, r3 - lp ) + sp;
        return '\n'
             + '/ ' + sa + ', ' + sb + ', ' + sc + ', ' + sd + ' \\\n'
             + '| ' + se + ', ' + sf + ', ' + sg + ', ' + sh + ' |\n'
             + '| ' + si + ', ' + sj + ', ' + sk + ', ' + sl + ' |\n'
             + '\\ ' + sm + ', ' + sn + ', ' + so + ', ' + sp + ' /\n';
    }
}

