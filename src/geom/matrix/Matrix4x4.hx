package geom.matrix;
#if js
#if (haxe_ver < 4.0 )
import js.html.Float32Array;
#else
import js.lib.Float32Array;
#end
#end
import geom.tydef.*;
/** 
   ![4x4](../../bootstrap/img/matrix4x4.png)
**/
@:forward // treat like 4x4 matrix but don't store last row!
abstract Matrix4x4( geom.structure.Mat4x4 ) from geom.structure.Mat4x4 to geom.structure.Mat4x4 {
    public inline
    function new( m: geom.structure.Mat4x4 ){ this = m; }
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
    static inline
    function get__1_16(): Matrix4x4 {
        return new Matrix4x4( { a: 1.,  b: 2.,  c: 3.,  d: 4.
                              , e: 5.,  f: 6.,  g: 7.,  h: 8.
                              , i: 9.,  j: 10., k: 11., l: 12.
                              , m: 13., n: 14., o: 15., p: 16. } );
    }
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
    public inline
    function delta( x: Float, y: Float ): Matrix4x4 {
        var m = this;
        return new Matrix4x4( { 
                           a: m.a, b: m.b, c: m.c, d: m.d
                         , e: m.e, f: m.f, g: m.g, h: m.h
                         , i: m.i, j: m.j, k: m.k, l: m.l
                         , m: m.m + x, n: m.n + y, o: m.o, p: m.p } );
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
    
    #if js
    @:to
    public inline
    function toWebGL(): Float32Array {
        return new Float32Array( [ this.a, this.e, this.i, this.m
                , this.b, this.f, this.j, this.n
                , this.c, this.g, this.k, this.o
                , this.d, this.h, this.l, this.p ]);
    }
    @:from
    public static inline
    function fromWebGL( arr: Float32Array ): Matrix4x4 {
        return new Matrix4x4( { a: arr[0],  b: arr[4],  c: arr[8],  d: arr[12]
                              , e: arr[1],  f: arr[5],  g: arr[9],  h: arr[13]
                              , i: arr[2],  j: arr[6],  k: arr[10], l: arr[14]
                              , m: arr[3],  n: arr[4],  o: arr[11], p: arr[15] } );
    }
    public inline
    function updateWebGL( arr: Float32Array ): Float32Array {
        arr.set([ this.a, this.e, this.i, this.m
                , this.b, this.f, this.j, this.n
                , this.c, this.g, this.k, this.o
                , this.d, this.h, this.l, this.p ]);
        return arr;
    }
    #end
    // used to print out a pretty representation of the matrix for debugging,
    // likely quite slow and not optimum.
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
        var r0: Int = Math.round( Math.max( Math.max( la, le ), li ) );
        var r1: Int = Math.round( Math.max( Math.max( lb, lf ), lj ) );
        var r2: Int = Math.round( Math.max( Math.max( lc, lg ), lk ) );
        var r3: Int = Math.round( Math.max( Math.max( ld, lh ), ll ) );
        var spaces = '';
        for( n in 0...r0 ) spaces = spaces + ' ';
        sa = spaces.substr( 0, r0 - la ) + sa;
        se = spaces.substr( 0, r0 - le ) + se;
        si = spaces.substr( 0, r0 - li ) + si;
        var spaces = '';
        for( n in 0...r1 ) spaces = spaces + ' ';
        sb = spaces.substr( 0, r1 - lb ) + sb;
        sf = spaces.substr( 0, r1 - lf ) + sf;
        sj = spaces.substr( 0, r1 - lj ) + sj;
        var space = '';
        for( n in 0...r2 ) spaces = spaces + ' ';
        sc = spaces.substr( 0, r2 - lc ) + sc;
        sg = spaces.substr( 0, r2 - lg ) + sg;
        sk = spaces.substr( 0, r2 - lk ) + sk;
        var space = '';
        for( n in 0...r3 ) spaces = spaces + ' ';
        sd = spaces.substr( 0, r3 - ld ) + sd;
        sh = spaces.substr( 0, r3 - lh ) + sh;
        sl = spaces.substr( 0, r3 - ll ) + sl;
        return '\n'
             + '/ ' + sa + ', ' + sb + ', ' + sc + ', ' + sd + ' \\\n'
             + '| ' + se + ', ' + sf + ', ' + sg + ', ' + sh + ' |\n'
             + '\\ ' + si + ', ' + sj + ', ' + sk + ', ' + sl + ' /\n';
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
