package geom.matrix;
import geom.structure.DualQ;
import geom.matrix.DualQuaternion;
import geom.matrix.Matrix1x4;
// referance Luxe source code and this link
// http://wscg.zcu.cz/wscg2012/short/A29-full.pdf

@:forward
abstract DualQuaternion( DualQ ) from geom.structure.DualQ to geom.structure.DualQ {
    public inline
    function new( dq: geom.structure.DualQ ){ this = dq; }
    /**
     * <pre><code>
     * >>> DualQuaternion.zero() == new DualQuaternion({real:{ x: 0., y: 0., z: 0., w: 1. },dual:{x:0.,y:0.,z:0.,w:0.}})
     * </code></pre>
     */
    public static inline
    function zero(): DualQuaternion {
        return new DualQuaternion( { real: Quaternion.zeroNormal()
                                   , dual: Quaternion.zero() } );
    }
    public inline
    function clone(): DualQuaternion {
        return new DualQuaternion( { real: this.real.clone(), dual: this.dual.clone() } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Quaternion( { x: 1., y: 2., z: 3., w: 1. } );
     * ... var b = new Quaternion( { x: 1., y: 2., z: 3., w: 1. } );
     * ... var c = new Quaternion( { x: 1., y: 2., z: 3., w: 1. } );
     * ... var d = new Quaternion( { x: 1., y: 2., z: 3., w: 1. } );
     * ... var e = new DualQuaternion( { real: a, dual: b } );
     * ... var f = new DualQuaternion( { real: c, dual: d } );
     * ... e == f; }) == true
     * </code></pre>
     */
    @:op( A == B ) public static inline
    function equal( a: DualQuaternion, b: DualQuaternion ): Bool {
        return a.real == b.real && a.dual == b.dual;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Quaternion( { x: 1., y: 2., z: 3., w: 1. } );
     * ... var b = new Quaternion( { x: 1., y: 2., z: 3., w: 1. } );
     * ... var c = new Quaternion( { x: 1., y: 2., z: 4., w: 1. } );
     * ... var d = new Quaternion( { x: 1., y: 2., z: 4., w: 1. } );
     * ... var e = new DualQuaternion( { real: a, dual: b } );
     * ... var f = new DualQuaternion( { real: c, dual: d } );
     * ... e != f; }) == true
     * </code></pre>
     */
    @:op(A != B) public static inline
    function notEqual( a: DualQuaternion, b:DualQuaternion ): Bool {
        return !equal( a, b );
    }
    @:op(A * B) @:commutative public static inline 
    function scaleMultiply( a: DualQuaternion, v: Float ): DualQuaternion {
        return new DualQuaternion( { real: a.real * v, dual: a.dual * v } );
    }
    @:op(A / B) public static inline
    function divide( a: DualQuaternion, v: Float ): DualQuaternion {
        return a * ( 1 / v );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Quaternion.unit();
     * ... var b = Quaternion.unit();
     * ... var c = new DualQuaternion( { real: a, dual: b } );
     * ... c + c == new DualQuaternion( { real:{ x: 2., y: 2., z: 2., w: 2. }, dual: { x: 2., y: 2., z: 2., w: 2. } } ); 
     * ... }) == true
     * </code></pre>
     */
    @:op(A + B) public static inline
    function add( a: DualQuaternion, b: DualQuaternion ): DualQuaternion {
      	return new DualQuaternion({ real: a.real + b.real, dual: a.dual + b.dual });
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Quaternion.unit();
     * ... var b = Quaternion.unit();
     * ... var c = new DualQuaternion( { real: a, dual: b } );
     * ... c - c == new DualQuaternion( { real: Quaternion.zero(), dual: Quaternion.zero() } );
     * ... }) == true
     * </code></pre>
     */
    @:op(A - B) public static inline
    function subtract( a: DualQuaternion, b: DualQuaternion ): DualQuaternion {
        return new DualQuaternion( { real: a.real - b.real, dual: a.dual - b.dual } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Quaternion({ x: 1., y: 2., z: 3., w: 1. });
     * ... var c = new DualQuaternion({ real: a, dual: a } );
     * ... var b = -c;
     * ... var e = new Quaternion({ x: -1., y: -2., z: -3., w: -1. });
     * ... var f = new DualQuaternion({ real: e, dual: e });
     * ... b == f; }) == true
     * </code></pre>
     */
    @:op(-A) public static inline
    function negate( a: DualQuaternion ):DualQuaternion {
        return new DualQuaternion( { real: -a.real, dual: -a.dual } );
    }
    public static inline
    function create( r: Quaternion, t: Matrix1x4 ):DualQuaternion{
        var real = r.normalize();
        var q = new Quaternion( { x: t.x, y: t.y, z: t.z, w: 0. } );
        q = q*0.5;
        var dual = q * real;
        return new DualQuaternion({ real: real
                                  , dual: dual });
    }
    /**
     * applyScale
     */
    public inline function applyScale( s: Float ): DualQuaternion {
        var cloned = clone();
        cloned = cloned*DualQuaternion.scalar( s );
        return cloned;
    }
    
    /**
     * allow scaling a DualQuaternion untested
     * usage:
     * var scaledDualQuaternion = DualQuaternion.scalar( 3 ) * dualQ;
     * source:  *http://roartindon.blogspot.com/2015/04/encoding-uniform-scale-in-quaternions.html
     */
    public static inline
    function scalar( s: Float ): DualQuaternion{
        return new DualQuaternion( { real: Quaternion.scalarReal( s ), dual: Quaternion.zero() } );
    }
    
    public static inline 
    function dotProduct( a: DualQuaternion, b: DualQuaternion ): Float {
        return Quaternion.dotProduct( a.real, b.real );
    }
    public inline 
    function normalize(): DualQuaternion {
        var mag = dotProduct( this, this );
        if( mag < 0 ) return null;
        var oneOver = 1/mag;
        return new DualQuaternion({ real: this.real*oneOver, dual: this.dual*oneOver } );
    }
    @:op(~A) public static inline
    function conjugate( a: DualQuaternion ): DualQuaternion {
        return new DualQuaternion( { real: ~a.real, dual: ~a.dual });
    }
    public inline
    function getTranslation(): Matrix1x4 {
        var q = ( this.dual * 2. );
        q = q * ~this.real;
        return new Matrix1x4({ x: q.x, y: q.y, z: q.z, w: 1. });
    }
    @:op(A * B) public static inline
    function multiplyQ( q1: DualQuaternion, q2: DualQuaternion ):DualQuaternion {
        return new DualQuaternion({ real: q2.real * q1.real
                                  , dual: q2.dual * q1.real + q1.dual * q2.real });
    }
    @:to public inline
    function toMatrix4x3(): Matrix4x3 {
        var q = normalize();
        var m = Matrix4x3.unit();
        var w = q.real.w;
        var x = q.real.x;
        var y = q.real.y;
        var z = q.real.z;
        // a b c d
        // e f g h
        // i j k l
        // Extract rotational information
        m.a = w*w + x*x - y*y - z*z;
        m.e = 2*x*y + 2*w*z;
        m.i = 2*x*z - 2*w*y;
        m.b = 2*x*y - 2*w*z;
        m.f = w*w + y*y - x*x - z*z;
        m.j = 2*y*z + 2*w*x;
        m.c = 2*x*z + 2*w*y;
        m.g = 2*y*z - 2*w*x;
        m.k = w*w + z*z - x*x - y*y;
       // Extract translation information
       var t = q.getTranslation();
       m.d = t.x;
       m.h = t.y;
       m.l = t.z;
       return m;
   }
}
