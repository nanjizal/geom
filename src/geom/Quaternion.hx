package geom;
import geom.Matrix1x4;
// Needs revisiting especially in relation to *, but also in relation to being similar but different to Matrix1x4
// Untested
/**
   { a, b, c, d }
**/
@:forward
abstract Quaternion( geom.structure.Mat1x4 ) from geom.structure.Mat1x4 to geom.structure.Mat1x4 {
    public inline
    function new( m: geom.structure.Mat1x4 ){ this = m; }
    /**
     * <pre><code>
     * >>> Quaternion.zero() == new Quaternion({ x: 0., y: 0., z: 0., w: 0. })
     * </code></pre>
     */
    public static inline
    function zero(): Quaternion {
        return new Quaternion( { x: 0., y: 0., z: 0., w: 0. } );
    }
    /**
     * <pre><code>
     * >>> Quaternion.unit() == new Quaternion({ x: 1., y: 1., z: 1., w: 1. })
     * </code></pre>
     */
    public static inline
    function unit(): Quaternion {
        return new Quaternion( { x: 1., y: 1., z: 1., w: 1. } );
    }
    /**
     * <pre><code>
     * >>> Quaternion.identity( Quaternion.zero() ) == new Quaternion({ x: 1., y: 1., z: 1., w: 1. })
     * </code></pre>
     */
    
    public static inline
    function identity( out: Quaternion ):Quaternion {
            out.x = 1.;
            out.y = 1.;
            out.z = 1.;
            out.w = 1.;
            return out;
    }
    @:to public inline // add Quaternion to Matrix4x1 
    function toMatrix4x1(): Matrix1x4 {
        return new Matrix1x4({ x: this.x, y: this.y, z: this.z, w: this.w });
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Quaternion({ x: 1., y: 2., z: 3., w: 1. });
     * ... var b = Quaternion.zero();
     * ... var c = Quaternion.copy( a, b ); 
     * ... a == c; }) == true
     * </code></pre>
     */
    public inline static
    function copy( pin: Quaternion, pout: Quaternion ): Quaternion {
        pout.x = pin.x;
        pout.y = pin.y;
        pout.z = pin.z;
        pout.w = pin.w;
        return pout;
    }
    public inline
    function getTPoint(): Quaternion {
        return new Quaternion( { x: this.x, y: this.y, z: this.z, w: this.w } );
    }
    public var magnitude( get, set ): Float;
    private inline
    function get_magnitude(): Float {
        return Math.sqrt( magnitudeSquared() );
    }
    private inline
    function set_magnitude( length: Float ): Float {
        var currentLength = get_magnitude();
        return if( currentLength == 0. ){ 
            0.;
        } else {
            var mul = length / currentLength;
            this.x *= mul;
            this.y *= mul;
            this.z *= mul;
            this.w *= mul;
            magnitude;
        }
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Quaternion({ x: 1., y: 2., z: 3., w: 1. });
     * ... var b = new Quaternion({ x: 1., y: 2., z: 3., w: 1. });
     * ... a == b; }) == true
     * </code></pre>
     */
    @:op( A == B ) public static inline
    function equal( a: Quaternion, b: Quaternion ): Bool {
        var delta = 0.0000001;
        return !(
               Math.abs(a.x - b.x) >= delta
            || Math.abs(a.y - b.y) >= delta
            || Math.abs(a.z - b.z) >= delta
            || Math.abs(a.w - b.w) >= delta
        );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Quaternion({ x: 1., y: 2., z: 3., w: 1. });
     * ... var b = new Quaternion({ x: 1., y: 2., z: 4., w: 1. });
     * ... a != b; }) == true
     * </code></pre>
     */
    @:op(A != B) public static inline
    function notEqual( a: Quaternion, b:Quaternion ): Bool {
        return !equal( a, b );
    }
    public inline 
    function magnitudeSquared(): Float {
        return this.x * this.x + this.y * this.y + this.z * this.z + this.w * this.w;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Quaternion.unit();
     * ... a + a == new Quaternion({ x: 2., y: 2., z: 2., w: 2. }); 
     * ... }) == true
     * </code></pre>
     */
    @:op(A + B) public static inline
    function add( a: Quaternion, b: Quaternion ): Quaternion {
      	return new Quaternion({ x: a.x + b.x, y: a.y + b.y, z: a.z + b.z, w: a.w + b.w });
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Quaternion.unit();
     * ... a - a == Quaternion.zero(); 
     * ... }) == true
     * </code></pre>
     */
    @:op(A - B) public static inline
    function subtract( a: Quaternion, b: Quaternion ): Quaternion {
        return new Quaternion({ x: a.x - b.x, y: a.y - b.y, z: a.z - b.z, w: a.w - b.w });
    }
    @:op(A * B) public static inline 
    function dot( a: Quaternion, b: Quaternion ): Quaternion {
        return new Quaternion({ x: a.x * b.x, y: a.y * b.y, z: a.z * b.z, w: a.w * b.w });
    }
    public static inline
    function dotProduct( a: Quaternion, b: Quaternion ):Float {
        return a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w;
    }
    @:op(A * B) @:commutative public static inline 
    function scaleMultiply( a: Quaternion, v: Float ): Quaternion {
        return new Quaternion({ x: a.x * v, y: a.y * v, z: a.z * v, w: a.w * v });
    }
    @:op(A / B) public static inline
    function divide( a: Quaternion, v: Float ): Quaternion {
        return a * ( 1 / v );
    }
    @:op( A / B ) public static inline
    function divide2( v: Float, a: Quaternion ): Quaternion {
        return new Quaternion( { x: v/a.x, y: v/a.y, z: v/a.z, w: v/a.w } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Quaternion({ x: 1., y: 2., z: 3., w: 1. });
     * ... var b = ~a;
     * ... b == new Quaternion({ x: -1., y: -2., z: -3., w: 1. }); }) == true
     * </code></pre>
     */
    @:op(~A) public static inline
    function conjugate( a: Quaternion ): Quaternion {
        return new Quaternion( { x: -a.x
                            , y: -a.y
                            , z: -a.z
                            , w: a.w 
                            } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Quaternion({ x: 1., y: 2., z: 3., w: 1. });
     * ... var b = -a;
     * ... b == new Quaternion({ x: -1., y: -2., z: -3., w: -1. }); }) == true
     * </code></pre>
     */
    @:op(-A) public static inline
    function negate( a: Quaternion ):Quaternion {
        return new Quaternion( { x: -a.x
                            , y: -a.y
                            , z: -a.z
                            , w: -a.w 
                            } );
    }
    public static inline
    function multiplyV( a: Quaternion, b: Quaternion, out: Quaternion ):Quaternion {
        var ax = a.x;
        var ay = a.y;
        var az = a.z;
        var aw = a.w;
        var bx = b.x;
        var by = b.y; 
        var bz = b.z;
        var bw = b.w;
        out.x = ax * bw + aw * bx + ay * bz - az * by;
        out.y = ay * bw + aw * by + az * bx - ax * bz;
        out.z = az * bw + aw * bz + ax * by - ay * bx;
        out.w = aw * bw - ax * bx - ay * by - az * bz;
        return out;
    }
    public static inline
    function multiplyQ( q: Quaternion, v: Quaternion, out: Quaternion ):Quaternion {
        var vx = v.x;
        var vy = v.y;
        var vz = v.z;
        var qx = q.x;
        var qy = q.y;
        var qz = q.z;
        var qw = q.w;
        out.w = -qx*vx - qy*vy - qz*vz;
        out.x = qw*vx + qy*vz - qz*vy;
        out.y = qw*vy - qx*vz + qz*vx;
        out.z = qw*vz + qx*vy - qy*vx;
        return out;
    }
    public inline 
    function cross(v: Quaternion ): Quaternion {
		return new Quaternion( { x: this.y * v.z - this.z * v.y
		                      , y: this.z * v.x - this.x * v.z
		                      , z: this.x * v.y - this.y * v.x
                                      , w: this.w * v.w } );
    }
    public static inline
    function fromAxisAngle( theta: Float, axis: Quaternion ):Quaternion {
        var half = theta / 2.;
        var c = Math.cos( half );
        var s = Math.sin( half );
        return new Quaternion( { x: s * axis.x, y: s * axis.y, z: s * axis.z, w: c } );
    } 
    public static inline
    function lerp( a: Quaternion, b:Quaternion, t: Float ): Quaternion {
        return ( 1.0 - t )*a + t*b;
    }
    public var euler( get, set ): Quaternion;
    private inline
    function set_euler( a: Quaternion ):Quaternion {
        var x5 = a.x*.5;
        var y5 = a.y*.5;
        var z5 = a.z*.5;
        var cx = Math.cos( x5 );
        var sx = Math.sin( x5 );
        var cy = Math.cos( y5 );
        var sy = Math.sin( y5 );
        var cz = Math.cos( z5 );
        var sz = Math.sin( z5 );
        this.w = cx*cy*cz + sx*sy*sz;
        this.x = sx*cy*cz - cx*sy*sz;
        this.y = cx*sy*cz + sx*cy*sz;
        this.z = cx*cy*sz - sx*sy*cz;
        return this;
    }
    private inline
    function get_euler(): Quaternion {
        return new Quaternion( { x: Math.atan2( 2*(this.w*this.x + this.y*this.z), 1 - 2*(this.x*this.x + this.y*this.y))
                         , y: Math.asin(2*(this.w*this.y - this.z*this.x))
                         , z: Math.atan2(2*(this.w*this.z + this.x*this.y), 1 - 2*(this.y*this.y + this.z*this.z))
                         , w: 1. } );
    }
    public function slerp( a: Quaternion, b: Quaternion, t: Float ): Quaternion {
        var w1 = a.w;
        var x1 = a.x;
        var y1 = a.y;
        var z1 = a.z;
        var w2 = b.w;
        var x2 = b.x;
        var y2 = b.y;
        var z2 = b.z;
        var dot = dotProduct( a, b );
        var p = Quaternion.unit();
        if( dot < 0 ) { // shortest direction
            dot = -dot;
            w2 = -w2;
            x2 = -x2;
            y2 = -y2;
            z2 = -z2;
        }
        if( dot < 0.95 ) {
            var angle = Math.acos( dot );// interpolate angle linearly
            var s     = 1. / Math.sin( angle );
            var s1    = Math.sin( angle * ( 1 - t ) ) * s;
            var s2    = Math.sin( angle * t ) * s;
            p.w = w1 * s1 + w2 * s2;
            p.x = x1 * s1 + x2 * s2;
            p.y = y1 * s1 + y2 * s2;
            p.z = z1 * s1 + z2 * s2;
        } else {
            p.w = w1 + t * ( w2 - w1 );// nearly identical angle, interpolate linearly
            p.x = x1 + t * ( x2 - x1 );
            p.y = y1 + t * ( y2 - y1 );
            p.z = z1 + t * ( z2 - z1 );
            var len: Float = 1.0 / p.magnitude;
            p = p*len;
        }
        return p;
    }
    public inline
    function normalize(): Quaternion {
        magnitude = 1.; 
        return this;
    }
    public inline
    function constrainDistance( anchor: Quaternion, distance: Float ): Quaternion {
        return ( ( this - anchor ).normalize() * distance ) + anchor;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Quaternion.unit();
     * ... var b = haxe.ds.Vector.fromArrayCopy([ 1., 1., 1., 1. ]);
     * ... var c: Quaternion = b;
     * ... a == b; }) == true
     * </code></pre>
     */
    @:from public static inline
    function fromVec( vec: haxe.ds.Vector<Float> ): Quaternion {
        return new Quaternion( { x: vec.get(0), y: vec.get(1), z: vec.get(2), w: vec.get(3) } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Quaternion.unit();
     * ... var b: haxe.ds.Vector<Float> = a;
     * ... var c = haxe.ds.Vector.fromArrayCopy([ 1., 1., 1., 1. ]);
     * ... Equal.equals( b, c ); }) == true
     * </code></pre>
     */
    
    @:to public inline
    function toVector(): haxe.ds.Vector<Float> {
        var vec = new haxe.ds.Vector<Float>(4);
        vec.set( 0, this.x );
        vec.set( 1, this.y );
        vec.set( 2, this.z );
        vec.set( 3, this.w );
        return vec;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Quaternion.unit();
     * ... var b: Quaternion = [ 1., 1., 1., 1. ];
     * ... Equal.equals( a, b ); }) == true
     * </code></pre>
     */
    @:from public inline static 
    function fromArray( arr: Array<Float> ): Quaternion {
        return new Quaternion( { x: arr[ 0 ], y: arr[ 1 ], z: arr[ 2 ], w: arr[ 3 ] } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Quaternion.unit();
     * ... var b: Array<Float> = a;
     * ... Equal.equals( b, [ 1., 1., 1., 1. ] ); }) == true
     * </code></pre>
     */
    @:to public inline
    function toArray():Array<Float> {
        return [ this.x, this.y, this.z, this.w ];
    }
}
