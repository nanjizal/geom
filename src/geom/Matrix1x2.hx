package geom;
typedef Vec2 = Matrix1x2;
@:forward
abstract Matrix1x2( geom.structure.Mat1x2 ) from geom.structure.Mat1x2 to geom.structure.Mat1x2 {
    public inline
    function new( m: geom.structure.Mat1x2 ){ this = m; }
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
        return new Matrix1x2( { x: -1., y: -1. } );
    }
    public inline
    function topRight(){
        return new Matrix1x2( { x: 1., y: -1. } );
    }
    public inline 
    function bottomLeft(){
         return new Matrix1x2( { x: -1., y: 1. } );
    }
    public inline
    function bottomRight(){
        return new Matrix1x2( { x: 1., y: 1. } );
    }
    public inline
    function north(){
        return new Matrix1x2( { x: 0., y: -1. } );
    }
    public inline
    function south(){
        return new Matrix1x2( { x: 0., y: 1. } );
    }
    public inline
    function west(){
        return new Matrix1x2( { x: -1., y: 0. } );
    }
    public inline
    function east(){
        return new Matrix1x2( { x: 1., y: 0. } );
    }
    @:op(A + B) public static inline
    function add( a:Matrix1x2, b:Matrix1x2 ): Matrix1x2 {
      	return new Matrix1x2({ x: a.x + b.x, y:  a.y + b.y });
    }
    @:op(A - B) public static inline
    function subtract( a: Matrix1x2, b:Matrix1x2 ): Matrix1x2 {
        return new Matrix1x2({ x: a.x - b.x, y:  a.y - b.y });
    }
    @:op(A * B) public static inline
    function dot( a: Matrix1x2, b:Matrix1x2 ): Matrix1x2 {
        return new Matrix1x2({ x: a.x * b.x, y: a.y * b.y });
    }
    @:op(A * B) @:commutative public static inline
    function scaleMultiply( a: Matrix1x2, v: Float ): Matrix1x2 {
        return new Matrix1x2( { x: a.x * v, y: a.y * v } );
    }
    @:op(A / B) public static inline
    function divide( a: Matrix1x2, v: Float ): Matrix1x2 {
        return a * ( 1 / v );
    }
    public inline
    function perp( b:Matrix1x2 ): Float {
        return this.x * b.y - this.y * b.x;
    }
    public inline
    function mid( a: Matrix1x2, b:Matrix1x2 ): Matrix1x2 {
        return new Matrix1x2( { x: ( a.x + b.x )/2, y:( a.y + b.y )/2 } );
    }
    public inline
    function distance( b: Matrix1x2 ): Float {
        var dx = this.x - b.x;
        var dy = this.y - b.y;
        return dx * dx + dy * dy;
    }
    public inline
    function span( b: Matrix1x2 ): Matrix1x2 {
        return new Matrix1x2({ x: this.x - b.x, y: this.y - b.y });
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
    function isLeft( a: Matrix1x2, b:Matrix1x2 ): Float {
        return (( b.x - a.x )*( this.y - a.y ) - ( this.x - a.x )*( b.y - a.y ));
    }
    public static inline
    function triangleArea( a: Matrix1x2, b:Matrix1x2, c:Matrix1x2 ): Float {
        return Math.abs( a.isLeft( b , c ) / 2. );
    }
    public static inline
    function sign( n: Float ): Int {
        return Std.int( Math.abs( n )/n );
    }
    public inline static
    function thetaDifference( a: Matrix1x2, b:Matrix1x2 ): Float {
        var dx: Float = a.x - b.x;
        var dy: Float = a.y - b.y;
        return Math.atan2( dy, dx );
    }
    // need to assess / compare the quality of inTri approaches.
    public inline
    function inTri( a: Matrix1x2, b:Matrix1x2, c:Matrix1x2 ): Bool {
        var planeAB = ( a.x - this.x )*( b.y - this.y ) - ( b.x - this.x )*( a.y - this.y );
        var planeBC = ( b.x - this.x )*( c.y - this.y ) - ( c.x - this.x )*( b.y - this.y );
        var planeCA = ( c.x - this.x )*( a.y - this.y ) - ( a.x - this.x )*( c.y - this.y );
        return sign( planeAB ) == sign( planeBC ) && sign( planeBC ) == sign( planeCA );
    }
    public inline
    function inTri2( a: Matrix1x2, b:Matrix1x2, c:Matrix1x2 ): Bool {
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
    function inRect( b: Matrix1x2, c:Matrix1x2 ): Bool {// in rect (b,c)
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
    function convex( a: Matrix1x2, b: Matrix1x2, c: Matrix1x2) : Bool { 
        return ( a.y - b.y )*( c.x - b.x ) + ( b.x - a.x )*( c.y - b.y ) >= 0;
    }
    public static inline
    function cross( a: Matrix1x2, b:Matrix1x2 ) : Float {
        return a.x*b.y - a.y*b.x;
    }
    public inline
    function theta(): Float {
        return Math.atan2( this.y, this.x );
    }
    public inline
    function pivotAround( omega: Float, pivot: Matrix1x2 ){
        var px = this.x - pivot.x;
        var py = this.y - pivot.y;
        var px2 = px * Math.cos( omega ) - py * Math.sin( omega );
        py = py * Math.cos( omega ) + px * Math.sin( omega );
        return new Matrix1x2( { x: px2 + pivot.x, y: py + pivot.y } );
    }
    @:to
    public inline
    function toVec3(): geom.tydef.Tmatrix1x3 {
        return { x: this.x, y: this.y, z: 1. };
    }
    @:from public inline static 
    function fromVec3( v3: geom.tydef.Tmatrix1x3 ): Matrix1x2 {
        return new Matrix1x2( { x: v3.x, y: v3.y } );
    }
    public static inline
    function fromArrayPos( arr: Array<Float>, pos: Int ){
        return new Matrix1x2( { x: arr[ pos ], y: arr[ pos + 1 ] } );
    }
    public inline
    function toArrayPos( arr: Array<Float>, pos: Int ){
        arr[ pos ]     = this.x;
        arr[ pos + 1 ] = this.y;
    }
}
