package geom.matrix;
import geom.matrix.Matrix1x4;
import geom.matrix.Matrix4x4;
import geom.matrix.Matrix3x3;
import geom.matrix.Matrix4x3;
// Needs revisiting especially in relation to *, but also in relation to being similar but different to Matrix1x4
// Untested
/**
   { x, y, z, w }
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
     * >>> Quaternion.zeroNormal() == new Quaternion({ x: 0., y: 0., z: 0., w: 1. })
     * </code></pre>
     */
    public static inline
    function zeroNormal(): Quaternion {
        return new Quaternion( { x: 0., y: 0., z: 0., w: 1. } );
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
     * >>> ({ 
     * ... var q = new Quaternion( { x: 1., y: 1., z: 1., w: 1. } );
     * ... Quaternion.unit().normalize() == q.normalize();
     * ... }) == true
     * </code></pre>
     */
    public static inline
    function unitNormal(): Quaternion {
        trace('unitNormal' + unit().normalize() );
        return unit().normalize();
    }
    public inline
    function clone():Quaternion {
        return new Quaternion( { x: this.x, y: this.y, z: this.z, w: this.w } );
    }
    
    public static inline
    function xRotate( angle: Float ){
        return new Quaternion({ x: Math.sin (0.5 * angle), y: 0.,  z: 0, w: Math.cos( 0.5 * angle ) });
    }
    
    public static inline
    function yRotate( angle: Float ){
        return new Quaternion({ x: 0., y: Math.sin( 0.5 * angle ), z: 0., w: Math.cos( 0.5 * angle ) });
    }
    
    public static inline
    function zRotate( angle: Float ){
        return new Quaternion({ x: 0., y:0., z: Math.sin( 0.5 * angle ), w: Math.cos( 0.5 * angle ) });
    }
    
    public static inline
    function xPIhalf(): Quaternion {
        var halfSqrt = Math.sqrt( 0.5 );
        return new Quaternion( { x: halfSqrt, y: 0., z: 0, w: halfSqrt } );
    }
    public static inline
    function yPIhalf(): Quaternion {
        var halfSqrt = Math.sqrt( 0.5 );
        return new Quaternion({ x: 0., y: halfSqrt, z: 0., w: halfSqrt });
    }
    public static inline 
    function zPIhalf(): Quaternion {
        var halfSqrt = Math.sqrt( 0.5 );
        return new Quaternion({ x: 0., y: 0., z: halfSqrt, w: halfSqrt });
    }
    
    
    public static inline 
    function createFromAxisAngle( x: Float, y: Float, z: Float, theta: Float ){
        // Here we calculate the sin( theta / 2) once for optimization
        var factor = Math.sin( theta / 2.0 );
        // Calculate the x, y and z of the quaternion
        x = x * factor;
        y = y * factor;
        z = z * factor;

        // Calcualte the w value by cos( theta / 2 )
        var w = Math.cos( theta / 2.0 );

        return new Quaternion({ x: x, y: y, z: z, w: w } ).normalize();
    }
    
    public inline 
    function dot(){
       return (((this.x * this.x) + (this.y * this.y)) + (this.z * this.z)) + (this.w * this.w);
    }
    /*
    public inline
    function normalize(){
       var num = dot();
       var inv = 1.0 / Math.sqrt(num);
       this.x *= inv;
       this.y *= inv;
       this.z *= inv;
       this.w *= inv;
       return this;
    }
    */
    
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
    public static inline
    function dotProduct( a: Quaternion, b: Quaternion ):Float {
        return a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w;
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
    @:op(A * B) public static inline
    function multiplyQ( q1: Quaternion, q2: Quaternion ):Quaternion {
        return new Quaternion({ x:  q1.x * q2.w + q1.y * q2.z - q1.z * q2.y + q1.w * q2.x
                              , y: -q1.x * q2.z + q1.y * q2.w + q1.z * q2.x + q1.w * q2.y
                              , z:  q1.x * q2.y - q1.y * q2.x + q1.z * q2.w + q1.w * q2.z
                              , w: -q1.x * q2.x - q1.y * q2.y - q1.z * q2.z + q1.w * q2.w });
    }
    public inline 
    function cross(v: Quaternion ): Quaternion {
        return new Quaternion( { x: this.y * v.z - this.z * v.y
                               , y: this.z * v.x - this.x * v.z
                               , z: this.x * v.y - this.y * v.x
                               , w: this.w * v.w } );
    }
    /**
     * used to set yaw pitch and roll ( very similar to set euler ) but static.
     *     x:  Pitch
     *     y:  Yaw
     *     z:  Roll
     **/
    public static inline
    function fromYawPitchRoll( yaw: Float, pitch: Float, roll: Float ){
        var n9 = roll * 0.5;
        var n6 = Math.sin( n9 );
        var n5 = Math.cos( n9 );
        var n8 = pitch * 0.5;
        var n4 = Math.sin( n8 );
        var n3 = Math.cos( n8 );
        var n7 = yaw * 0.5;
        var n2 = Math.sin( n7 );
        var n1 = Math.cos( n7 );
        return new Quaternion( { x: ((n1 * n4) * n5) + ((n2 * n3) * n6)
                               , y: ((n2 * n3) * n5) - ((n1 * n4) * n6)
                               , z: ((n1 * n3) * n6) - ((n2 * n4) * n5)
                               , w: ((n1 * n3) * n5) + ((n2 * n4) * n6) 
                               } );
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
        a.normalize();
        b.normalize();
        return ( 1.0 - t )*a + t*b;
    }
    /**
     * input/output euler as rotation angles around x, y, z axis ( as faux Quaternion ), 
     * but set /gets internally as the Quaternion value
     **/
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
    
    // https://en.wikipedia.org/wiki/Slerp
    // https://www.euclideanspace.com/maths/algebra/realNormedAlgebra/quaternions/slerp/index.htm
    public function slerp( v1: Quaternion, t: Float ) {
        // Only unit quaternions are valid rotations.
        // Normalize to avoid undefined behavior.
        var v0 = clone();
        v0.normalize();
        //v1.normalize();

        // Compute the cosine of the angle between the two vectors.
        var dot = dotProduct( v0, v1 );

        // If the dot product is negative, slerp won't take
        // the shorter path. Note that v1 and -v1 are equivalent when
        // the negation is applied to all four components. Fix by 
        // reversing one quaternion.
        if( dot < 0.0 ){
            v1 = -v1;
            dot = -dot;
        }
        
        if( dot > 0.9995 ) {
            // If the inputs are too close for comfort, linearly interpolate
            // and normalize the result.
            var result: Quaternion = v0 + t*(v1 - v0);
            result.normalize();
            return result;
        }

        // Since dot is in range [0, 0.9995], acos is safe
        var theta0    = Math.acos( dot );        // theta0 = angle between input vectors
        var theta     = theta0*t;          // theta = angle between v0 and result
        var sinTheta  = Math.sin( theta );     // compute this value only once
        var sinTheta0 = Math.sin( theta0 ); // compute this value only once

        var ratioA = Math.cos( theta ) - dot * sinTheta / sinTheta0;  // == sin(theta_0 - theta) / sin(theta_0)
        var ratioB = sinTheta / sinTheta0;
        var q = new Quaternion({ x: v0.x * ratioA + v1.x * ratioB
                              , y: v0.y * ratioA + v1.y * ratioB
                              , z: v0.z * ratioA + v1.z * ratioB
                              , w: v0.x * ratioA + v1.x * ratioB
                              });
        return q.normalize();
    }
    
    public static inline
    function scalarReal( s: Float ): Quaternion {
        return new Quaternion({x: 0, y: 0, z: 0, w: Math.sqrt( s ) });
    }
    // not sure see above
    public inline
    function scaled( s: Float ): Quaternion {
        return new Quaternion({x: this.x * s, y: this.y * s, z: this.z * s, w: this.w * s});
    }
    
    public inline
    function normalize(): Quaternion {
        magnitude = 1.; 
        //this = scaled(1.0 / magnitude);
        return this;
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
    
    // https://www.euclideanspace.com/maths/geometry/rotations/conversions/quaternionToMatrix/index.htm
    @:to public inline
    function toMatrix4x3(): Matrix4x3 {
        // TODO: test overhead of this shorter technique? over full version.
        var m: Matrix3x3 = new Quaternion( this );
        return m.to4x3();
        /*
        var xx      = this.x * this.x;
        var xy      = this.x * this.y;
        var xz      = this.x * this.z;
        var xw      = this.x * this.w;
        var yy      = this.y * this.y;
        var yz      = this.y * this.z;
        var yw      = this.y * this.w;
        var zz      = this.z * this.z;
        var zw      = this.z * this.w;
        return new Matrix4x3({ a: 1 - 2 * ( yy + zz ), b: 2 * ( xy - zw ),     c: 2 * ( xz + yw ),     d: 0
                             , e: 2 * ( xy + zw ),     f: 1 - 2 * ( xx + zz ), g: 2 * ( yz - xw ),     h: 0
                             , i: 2 * ( xz - yw ),     j: 2 * ( yz + xw ),     k: 1 - 2 * ( xx + yy ), l: 0 });
        */
    }
    @:to public inline
    function toMatrix3x3(): Matrix3x3 {
        var xx      = this.x * this.x;
        var xy      = this.x * this.y;
        var xz      = this.x * this.z;
        var xw      = this.x * this.w;
        var yy      = this.y * this.y;
        var yz      = this.y * this.z;
        var yw      = this.y * this.w;
        var zz      = this.z * this.z;
        var zw      = this.z * this.w;
        return new Matrix3x3({ a: 1 - 2 * ( yy + zz ), b: 2 * ( xy - zw ),     c: 2 * ( xz + yw )
                             , d: 2 * ( xy + zw ),     e: 1 - 2 * ( xx + zz ), f: 2 * ( yz - xw )
                             , g: 2 * ( xz - yw ),     h: 2 * ( yz + xw ),     i: 1 - 2 * ( xx + yy ) });
    }
    /**
     * 
     */
    // https://www.euclideanspace.com/maths/geometry/rotations/conversions/matrixToQuaternion/
    @:from public inline static
    function fromMatrix4x3( m4x3: Matrix4x3 ): Quaternion {
        var m3x3: Matrix3x3 = m4x3;
        return Quaternion.fromMatrix3x3( m3x3 );
    }
    /**
     * 
     */
    // https://www.euclideanspace.com/maths/geometry/rotations/conversions/matrixToQuaternion/
    @:from public inline static
    function fromMatrix3x3( m: Matrix3x3 ): Quaternion {
        new Matrix3x3( { a: 0., b: 0., c: 0.
                       , d: 0., e: 0., f: 0.
                       , g: 0., h: 0., i: 0. }); 
        var tr = m.a + m.e + m.i;
        var s: Float;
        return if( tr > 0 ){ 
            s = Math.sqrt( tr + 1.0 ) * 2; // S=4*qw 
            new Quaternion( { x: ( m.h - m.f ) / s
                            , y: ( m.c - m.g ) / s
                            , z: ( m.d - m.b ) / s
                            , w: 0.25 * s } );
        } else if ( ( m.a > m.e ) && ( m.a > m.i ) ) { 
          s = Math.sqrt( 1.0 + m.a - m.e - m.i ) * 2; // S=4*qx 
          new Quaternion( { x: 0.25 * s
                          , y: ( m.b + m.d ) / s
                          , z: ( m.c + m.g ) / s
                          , w: ( m.h - m.f ) / s } );
        } else if ( m.e > m.i ) { 
            s = Math.sqrt( 1.0 + m.e - m.a - m.i ) * 2; // S=4*qy
            new Quaternion( { x: ( m.b + m.d ) / s
                            , y: 0.25 * s 
                            , z: ( m.f + m.h ) / s
                            , w: ( m.c - m.g ) / s } );
        } else { 
            s = Math.sqrt( 1.0 + m.i - m.i - m.e ) * 2; // S=4*qz
            new Quaternion( { x: ( m.d - m.b ) / s
                            , y: ( m.c + m.g ) / s
                            , z: ( m.f + m.h ) / s
                            , w: 0.25 * s } );
        }
    }
}
