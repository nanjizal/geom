package geom;
typedef Tmatrix1x4 = {
    > Tpoint,
    public var z: Float;
    @:optional public var w: Float;
}
typedef Vec4 = Matrix1x4;
@:forward
abstract Matrix1x4( Tmatrix1x4 ) to Tmatrix1x4 from Tmatrix1x4 {
    public inline
    function new(  p: Tmatrix1x4 ){
        this = p;
    }
    public static inline
   function unit(): Matrix1x4 {
        return new Matrix1x4( { x: 0., y: 0., z: 0., w: 1. } );
    }
    public static inline
    function identity( out: Matrix1x4 ):Matrix1x4 {
            out.x = 0.;
            out.y = 0.;
            out.z = 0.;
            out.w = 1.;
            return out;
    }
    public inline static
    function copy( pin: Matrix1x4, pout: Matrix1x4 ): Matrix1x4 {
        pin.x = pout.x;
        pin.y = pout.y;
        pin.z = pout.z;
        pin.w = pout.w;
        return pout;
    }
    public inline
    function getTPoint(): Matrix1x4 {
        return new Matrix1x4( { x: this.x, y: this.y, z: this.z, w: this.w } );
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
    @:op( A == B )
    public static inline
    function equals( a: Matrix1x4, b: Matrix1x4 ): Bool {
        var delta = 0.0000001;
        return !(
               Math.abs(a.x - b.x) >= delta
            || Math.abs(a.y - b.y) >= delta
            || Math.abs(a.z - b.z) >= delta
            || Math.abs(a.w - b.w) >= delta
        );
    }
    public inline 
    function magnitudeSquared(): Float {
        return this.x * this.x + this.y * this.y + this.z * this.z + this.w * this.w;
    }
    @:op(A + B)
    public static inline
    function add( a: Matrix1x4, b: Matrix1x4 ): Matrix1x4 {
      	return new Matrix1x4({ x: a.x + b.x, y: a.y + b.y, z: a.z + b.z, w: a.w + b.w });
    }
    @:op(A - B)
    public static inline
    function subtract( a: Matrix1x4, b: Matrix1x4 ): Matrix1x4 {
        return new Matrix1x4({ x: a.x - b.x, y: a.y - b.y, z: a.z - b.z, w: a.w - b.w });
    }
    @:op(A * B)
    public static inline 
    function dot( a: Matrix1x4, b: Matrix1x4 ): Matrix1x4 {
        return new Matrix1x4({ x: a.x * b.x, y: a.y * b.y, z: a.z * b.z, w: a.w * b.w });
    }
    public static inline
    function dotProduct( a: Matrix1x4, b: Matrix1x4 ):Float {
        return a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w;
    }
    @:op(A * B)
    @:commutative
    public static inline 
    function scaleMultiply( a: Matrix1x4, v: Float ): Matrix1x4 {
        return new Matrix1x4({ x: a.x * v, y: a.y * v, z: a.z * v, w: a.w * v });
    }
    @:op(A / B)
    public static inline
    function divide( a: Matrix1x4, v: Float ): Matrix1x4 {
        return a * ( 1 / v );
    }
    @:op( A / B )
    public static inline
    function divide2( v: Float, a: Matrix1x4 ): Matrix1x4 {
        return new Matrix1x4( { x: v/a.x, y: v/a.y, z: v/a.z, w: v/a.w } );
    }
    @:op(~A)
    public static inline
    function conjugate( a: Matrix1x4 ): Matrix1x4 {
        return new Matrix1x4( { x: -a.x
                            , y: -a.y
                            , z: -a.z
                            , w: a.w 
                            } );
    }
    @:op(-A)
    public static inline
    function negate( a: Matrix1x4 ):Matrix1x4 {
        return new Matrix1x4( { x: -a.x
                            , y: -a.y
                            , z: -a.z
                            , w: -a.w 
                            } );
    }
    public static inline
    function multiplyV( a: Matrix1x4, b: Matrix1x4, out: Matrix1x4 ):Matrix1x4 {
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
    function multiplyQ( q: Matrix1x4, v: Matrix1x4, out: Matrix1x4 ):Matrix1x4 {
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
    function cross(v: Matrix1x4 ): Matrix1x4 {
		return new Vector3( { x: this.y * v.z - this.z * v.y
		                    , y: this.z * v.x - this.x * v.z;
		                    , z: this.x * v.y - this.y * v.x;
                            , w: this.w * v.w } );
    }
    public static inline
    function fromAxisAngle( theta: Float, axis: Matrix1x4 ):Matrix1x4 {
        var half = theta / 2.;
        var c = Math.cos( half );
        var s = Math.sin( half );
        return new Matrix1x4( { x: s * axis.x, y: s * axis.y, z: s * axis.z, w: c } );
    } 
    public static inline
    function lerp( a: Matrix1x4, b:Matrix1x4, t: Float ): Matrix1x4 {
        return ( 1.0 - t )*a + t*b;
    }
    public var euler( get, set ): Matrix1x4;
    private inline
    function set_euler( a: Matrix1x4 ):Matrix1x4 {
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
    function get_euler(): Matrix1x4 {
        return new Matrix1x4( { x: Math.atan2( 2*(this.w*this.x + this.y*this.z), 1 - 2*(this.x*this.x + this.y*this.y))
                         , y: Math.asin(2*(this.w*this.y - this.z*this.x))
                         , z: Math.atan2(2*(this.w*this.z + this.x*this.y), 1 - 2*(this.y*this.y + this.z*this.z))
                         , w: 1. } );
    }
    public function slerp( a: Matrix1x4, b: Matrix1x4, t: Float ): Matrix1x4 {
        var w1 = a.w;
        var x1 = a.x;
        var y1 = a.y;
        var z1 = a.z;
        var w2 = b.w;
        var x2 = b.x;
        var y2 = b.y;
        var z2 = b.z;
        var dot = dotProduct( a, b );
        var p = Matrix1x4.unit();
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
    function normalize(): Matrix1x4 {
        magnitude = 1.; 
        return this;
    }
    public inline
    function constrainDistance( anchor: Matrix1x4, distance: Float ): Matrix1x4 {
        return ( ( this - anchor ).normalize() * distance ) + anchor;
    }
    @:from
    public static inline
    function fromVec( vec: haxe.ds.Vector<Float> ): Matrix1x4 {
        return new Matrix1x4( { x: vec.get(0), y: vec.get(1), z: vec.get(2), w: vec.get(3) } );
    }
    @:to
    public inline
    function toVector(): haxe.ds.Vector<Float> {
        var vec = new haxe.ds.Vector<Float>(4);
        vec.set( 0, this.x );
        vec.set( 1, this.y );
        vec.set( 2, this.z );
        vec.set( 3, this.w );
        return vec;
    }
    @:from
    public inline static function fromArray( arr: Array<Float> ): Matrix1x4 {
        return new Matrix1x4( { x: arr[ 0 ], y: arr[ 1 ], z: arr[ 2 ], w: arr[ 3 ] } );
    }
    @:to
    public inline function toArray():Array<Float> {
        return [ this.x, this.y, this.z, this.w ];
    }
}
