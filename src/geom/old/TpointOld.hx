package geom;
typedef Tpoint = {
    public var x: Float;
    public var y: Float;
}
typedef Tpoint4 = {
    > Tpoint,
    public var z: Float;
    @:optional public var w: Float;
}
typedef Rectangle = {
    var x:Float;
    var y:Float; 
    var width:Float; 
    var height:Float;
}
typedef Ray = {
    var dist: Float;
    var edge: Float;
    var norm: Tpoint;
    var refl: Tpoint;
}
typedef Edge = {
    var dist: Float;
    var edge: Float;
    var point: Tpoint;
    var norm: Tpoint;
}
class Cpoint {
    public var x: Float;
    public var y: Float;
    public function new( x_: Float = 0, y_: Float = 0 ){
        x = x_;
        y = y_;
    }
}
class Cpoint4 {
    public var x: Float;
    public var y: Float;
    public var z: Float;
    public var w: Float;
    public function new( x_: Float = 0, y_: Float = 0, z_: Float = 0, w_: Float = 1. ){
        x = x_;
        y = y_;
        z = z_;
        w = w_;
    }
}
@:forward
abstract Apoint( Tpoint ) to Tpoint from Tpoint {
    public inline
    function new(  p: Tpoint ){
        this = p;
    }
    public var magnitude( get, set ): Float;
    private inline
    function get_magnitude(): Float {
        return Math.sqrt( this.x * this.x + this.y * this.y);
    }
    private inline
    function set_magnitude( length: Float ): Float {
        var currentLength = get_magnitude();
        return if(currentLength == 0){
             0;
        } else {
            var mul = length / currentLength;
            this.x *= mul;
            this.y *= mul;
            magnitude;
        }
    }
    public inline
    function topLeft(){
        return new Apoint( { x: -1., y: -1. } );
    }
    public inline
    function topRight(){
        return new Apoint( { x: 1., y: -1. } );
    }
    public inline 
    function bottomLeft(){
         return new Apoint( { x: -1., y: 1. } );
    }
    public inline
    function bottomRight(){
        return new Apoint( { x: 1., y: 1. } );
    }
    public inline
    function north(){
        return new Apoint( { x: 0., y: -1. } );
    }
    public inline
    function south(){
        return new Apoint( { x: 0., y: 1. } );
    }
    public inline
    function west(){
        return new Apoint( { x: -1., y: 0. } );
    }
    public inline
    function east(){
        return new Apoint( { x: 1., y: 0. } );
    }
    @:op(A + B)
    public static inline
    function add( a:Apoint, b:Apoint ): Apoint {
      	return new Apoint({ x: a.x + b.x, y:  a.y + b.y });
    }
    @:op(A - B)
    public static inline
    function subtract( a: Apoint, b:Apoint ): Apoint {
        return new Apoint({ x: a.x - b.x, y:  a.y - b.y });
    }
    @:op(A * B)
    public static inline
    function dot( a: Apoint, b:Apoint ): Apoint {
        return new Apoint({ x: a.x * b.x, y: a.y * b.y });
    }
    @:op(A * B)
    @:commutative
    public static inline
    function scaleMultiply( a: Apoint, v: Float ): Apoint {
        return new Apoint( { x: a.x * v, y: a.y * v } );
    }
    @:op(A / B)
    public static inline
    function divide( a: Apoint, v: Float ): Apoint {
        return a * ( 1 / v );
    }
    public inline
    function perp( b:Apoint ): Float {
        return this.x * b.y - this.y * b.x;
    }
    public inline
    function mid( a: Apoint, b:Apoint ): Apoint {
        return new Apoint( { x: ( a.x + b.x )/2, y:( a.y + b.y )/2 } );
    }
    public inline
    function distance( b: Apoint ): Float {
        var dx = this.x - b.x;
        var dy = this.y - b.y;
        return dx * dx + dy * dy;
    }
    public inline
    function span( b: Apoint ): Apoint {
        return new Apoint({ x: this.x - b.x, y: this.y - b.y });
    }
    public inline
    function normalize(): Float {
        magnitude = 1.;
        return magnitude;
    }
    public inline
    function lenSq (): Float {
        return this.x * this.x + this.y * this.y;
    }
	// Copyright 2000 softSurfer, 2012 Dan Sunday
	// This code may be freely used and modified for any purpose
	// providing that this copyright notice is included with it.
	// iSurfer.org makes no warranty for this code, and cannot be held
	// liable for any real or imagined damage resulting from its use.
	// Users of this code must verify correctness for their application.
// ported to haxe from c
// snipts below from Dan Sunday's http://geomalgorithms.com/a01-_area.html	

	// > 0, p is left of line, counterclockwise
	// = 0, p is on the line, none (degenerate)
// < 0, p is righ of line, clockwise
    public inline
    function isLeft( a: Apoint, b:Apoint ): Float {
        return (( b.x - a.x )*( this.y - a.y ) - ( this.x - a.x )*( b.y - a.y ));
    }
    public static inline
    function triangleArea( a: Apoint, b:Apoint, c:Apoint ): Float {
        return Math.abs( a.isLeft( b , c ) / 2. );
    }
    public static inline
    function sign( n: Float ): Int {
        return Std.int( Math.abs( n )/n );
    }
    public inline static
    function thetaDifference( a: Apoint, b:Apoint ): Float {
        var dx: Float = a.x - b.x;
        var dy: Float = a.y - b.y;
        return Math.atan2( dy, dx );
    }
    // need to assess / compare the quality of inTri approaches.
    public inline
    function inTri( a: Apoint, b:Apoint, c:Apoint ): Bool {
        var planeAB = ( a.x - this.x )*( b.y - this.y ) - ( b.x - this.x )*( a.y - this.y );
        var planeBC = ( b.x - this.x )*( c.y - this.y ) - ( c.x - this.x )*( b.y - this.y );
        var planeCA = ( c.x - this.x )*( a.y - this.y ) - ( a.x - this.x )*( c.y - this.y );
        return sign( planeAB ) == sign( planeBC ) && sign( planeBC ) == sign( planeCA );
    }
    public inline
    function inTri2( a: Apoint, b:Apoint, c:Apoint ): Bool {
        var v0x = c.x - a.x;
        var v0y = c.y - a.y;
        var v1x = b.x - a.x;
        var v1y = b.y - a.y;
        var v2x = this.x - a.x;
        var v2y = this.y - a.y;
        var dot00 = v0x*v0x + v0y*v0y;
        var dot01 = v0x*v1x + v0y*v1y;
        var dot02 = v0x*v2x + v0y*v2y;
        var dot11 = v1x*v1x + v1y*v1y;
        var dot12 = v1x*v2x + v1y*v2y;
        var invDenom = 1 / ( dot00 * dot11 - dot01 * dot01 );
        var u = ( dot11 * dot02 - dot01 * dot12 ) * invDenom;
        var v = ( dot00 * dot12 - dot01 * dot02 ) * invDenom;
        // Check if point is in triangle
        return ( u >= 0 ) && ( v >= 0 ) && ( u + v < 1 );
    }
    public inline
    function inRect( b: Apoint, c:Apoint ): Bool {// in rect (b,c)
        var small: Float = 0.0000000001;
        var minx = Math.min( b.x, c.x );
        var maxx = Math.max( b.x, c.x );
        var miny = Math.min( b.y, c.y );
        var maxy = Math.max( b.y, c.y );
        return if( minx == maxx ) {
            ( miny <= this.y && this.y <= maxy );
        } else if( miny == maxy ) {
            ( minx <= this.x && this.x <= maxx);
        } else {
        //return (minx <= a.x && a.x <= maxx && miny <= a.y && a.y <= maxy)
            ( minx <= this.x + small && this.x - small <= maxx && miny <= this.y + small && this.y - small <= maxy );
        }
    }
    public static inline
    function convex( a: Apoint, b: Apoint, c: Apoint) : Bool { 
        return ( a.y - b.y )*( c.x - b.x ) + ( b.x - a.x )*( c.y - b.y ) >= 0;
    }
    public static inline
    function cross( a: Apoint, b:Apoint ) : Float {
        return a.x*b.y - a.y*b.x;
    }
    public inline
    function theta(): Float {
        return Math.atan2( this.y, this.x );
    }
    public inline
    function pivotAround( omega: Float, pivot: Apoint ){
        var px = this.x - pivot.x;
        var py = this.y - pivot.y;
        var px2 = px * Math.cos( omega ) - py * Math.sin( omega );
        py = py * Math.cos( omega ) + px * Math.sin( omega );
        return new Apoint( { x: px2 + pivot.x, y: py + pivot.y } );
    }
}
@:forward
abstract Apoint4( Tpoint4 ) to Tpoint4 from Tpoint4 {
    public inline
    function new(  p: Tpoint4 ){
        this = p;
    }
    public static inline
   function unit(): Apoint4 {
        return new Apoint4( { x: 0., y: 0., z: 0., w: 1. } );
    }
    public static inline
    function identity( out:Apoint4 ):Apoint4 {
            out.x = 0.;
            out.y = 0.;
            out.z = 0.;
            out.w = 1.;
            return out;
    }
    public inline static
    function copy( pin: Apoint4, pout:Apoint4 ): Apoint4 {
        pin.x = pout.x;
        pin.y = pout.y;
        pin.z = pout.z;
        pin.w = pout.w;
        return pout;
    }
    public inline
    function getTPoint(): Apoint4 {
        return new Apoint4( { x: this.x, y: this.y, z: this.z, w: this.w } );
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
    function equals( a:Apoint4, b:Apoint4 ): Bool {
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
    function add( a:Apoint4, b:Apoint4 ): Apoint4 {
      	return new Apoint4({ x: a.x + b.x, y: a.y + b.y, z: a.z + b.z, w: a.w + b.w });
    }
    @:op(A - B)
    public static inline
    function subtract( a: Apoint4, b:Apoint4 ): Apoint4 {
        return new Apoint4({ x: a.x - b.x, y: a.y - b.y, z: a.z - b.z, w: a.w - b.w });
    }
    @:op(A * B)
    public static inline 
    function dot( a: Apoint4, b:Apoint4 ): Apoint4 {
        return new Apoint4({ x: a.x * b.x, y: a.y * b.y, z: a.z * b.z, w: a.w * b.w });
    }
    public static inline
    function dotProduct( a: Apoint4, b:Apoint4 ):Float {
        return a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w;
    }
    @:op(A * B)
    @:commutative
    public static inline 
    function scaleMultiply( a: Apoint4, v: Float ): Apoint4 {
        return new Apoint4({ x: a.x * v, y: a.y * v, z: a.z * v, w: a.w * v });
    }
    @:op(A / B)
    public static inline
    function divide( a: Apoint4, v: Float ): Apoint4 {
        return a * ( 1 / v );
    }
    @:op(~A)
    public static inline
    function conjugate( a: Apoint4 ):Apoint4 {
        return new Apoint4( { x: -a.x
                            , y: -a.y
                            , z: -a.z
                            , w: a.w 
                            } );
    }
    @:op(-A)
    public static inline
    function negate( a: Apoint4 ):Apoint4 {
        return new Apoint4( { x: -a.x
                            , y: -a.y
                            , z: -a.z
                            , w: -a.w 
                            } );
    }
    public static inline
    function multiplyQ( a: Apoint4, b:Apoint4, out:Apoint4 ):Apoint4 {
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
    function multiplyV( q: Apoint4, v:Apoint4, out:Apoint4 ):Apoint4 {
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
    public static inline
    function fromAxisAngle( theta: Float, axis: Apoint4 ):Apoint4 {
        var half = theta / 2.;
        var c = Math.cos( half );
        var s = Math.sin( half );
        return new Apoint4( { x: s * axis.x, y: s * axis.y, z: s * axis.z, w: c } );
    } 
    public static inline
    function lerp( a: Apoint4, b:Apoint4, t: Float ): Apoint4 {
        return ( 1.0 - t )*a + t*b;
    }
    public var euler( get, set ): Apoint4;
    private inline
    function set_euler( a: Apoint4 ):Apoint4 {
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
    function get_euler(): Apoint4 {
        return new Apoint4( { x: Math.atan2( 2*(this.w*this.x + this.y*this.z), 1 - 2*(this.x*this.x + this.y*this.y))
                         , y: Math.asin(2*(this.w*this.y - this.z*this.x))
                         , z: Math.atan2(2*(this.w*this.z + this.x*this.y), 1 - 2*(this.y*this.y + this.z*this.z))
                         , w: 1. } );
    }
    public function slerp( a: Apoint4, b:Apoint4, t: Float ): Apoint4 {
        var w1 = a.w;
        var x1 = a.x;
        var y1 = a.y;
        var z1 = a.z;
        var w2 = b.w;
        var x2 = b.x;
        var y2 = b.y;
        var z2 = b.z;
        var dot = dotProduct( a, b );
        var p = Apoint4.unit();
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
    function normalize(): Apoint4 {
        magnitude = 1.; 
        return this;
    }
    public inline
    function constrainDistance( anchor: Apoint4, distance: Float ): Apoint4 {
        return ( ( this - anchor ).normalize() * distance ) + anchor;
    }
    @:from
    public static inline
    function fromVec( vec: haxe.ds.Vector<Float> ): Apoint4 {
        return new Apoint4( { x: vec.get(0), y: vec.get(1), z: vec.get(2), w: vec.get(3) } );
    }
    @:to
    public inline
    function toVector(): haxe.ds.Vector<Float> {
        var vec = new haxe.ds.Vector<Float>(4);
        vec.set(0, this.x);
        vec.set(1, this.y);
        vec.set(2, this.z);
        vec.set(3, this.w);
        return vec;
    }
    @:from
    public inline static function fromArray( arr: Array<Float> ): Apoint4 {
        return new Apoint4( { x: arr[ 0 ], y: arr[ 1 ], z: arr[ 2 ], w: arr[ 3 ] } );
    }
    @:to
    public inline function toArray():Array<Float> {
        return [ this.x, this.y, this.z, this.w ];
    }
}
