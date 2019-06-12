package geom;
typedef Vec2 = Matrix1x2;
/** 
   { x, y }
**/
@:forward
abstract Matrix1x2( geom.structure.Mat1x2 ) from geom.structure.Mat1x2 to geom.structure.Mat1x2 {
    public inline
    function new( m: geom.structure.Mat1x2 ){ this = m; }
    /**
     * <pre><code>
     * >>> Matrix1x2.zero() == new Matrix1x2({ x: 0., y: 0. })
     * </code></pre>
     */
    public static inline
    function zero(){
        return new Matrix1x2({ x: 0., y: 0. });
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.unit() == new Matrix1x2({ x: 1., y: 1. })
     * </code></pre>
     */
    public static inline
    function unit(){
        return new Matrix1x2({ x: 1., y: 1. });
    }
    public var magnitude( get, set ): Float;
    /**
     * <pre><code>
     * >>> ( new Matrix1x2( { x: 4., y: 3. } ) ).magnitude == 5
     * </code></pre>
     */
    private inline
    function get_magnitude(): Float {
        return Math.sqrt( this.x * this.x + this.y * this.y);
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var m = new Matrix1x2( { x: 9., y: 12. } );
     * ... m.magnitude = 5;
     * ... ( m.x == 3. && m.y == 4. ) == true; 
     * ... }) == true
     * </code></pre>
     */
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
    /**
     * <pre><code>
     * >>> Matrix1x2.topLeft() == new Matrix1x2({ x: -1., y: 1. })
     * </code></pre>
     */
    public static inline
    function topLeft(){
        return new Matrix1x2( { x: -1., y: 1. } );
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.topRight() == new Matrix1x2({ x: 1., y: 1. })
     * </code></pre>
     */
    public static inline
    function topRight(){
        return new Matrix1x2( { x: 1., y: 1. } );
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.bottomLeft() == new Matrix1x2({ x: -1., y: -1. })
     * </code></pre>
     */
    public static inline 
    function bottomLeft(){
         return new Matrix1x2( { x: -1., y: -1. } );
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.bottomRight() == new Matrix1x2({ x: 1., y: -1. })
     * </code></pre>
     */
    public static inline
    function bottomRight(){
        return new Matrix1x2( { x: 1., y: -1. } );
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.north() == new Matrix1x2({ x: 0., y: 1. })
     * </code></pre>
     */
    public static inline
    function north(){
        return new Matrix1x2( { x: 0., y: 1. } );
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.south() == new Matrix1x2({ x: 0., y: -1. })
     * </code></pre>
     */
    public static inline
    function south(){
        return new Matrix1x2( { x: 0., y: -1. } );
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.west() == new Matrix1x2({ x: -1., y: 0. })
     * </code></pre>
     */
    public static inline
    function west(){
        return new Matrix1x2( { x: -1., y: 0. } );
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.east() == new Matrix1x2({ x: 1., y: 0. })
     * </code></pre>
     */
    public static inline
    function east(){
        return new Matrix1x2( { x: 1., y: 0. } );
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.unit() + Matrix1x2.unit() == new Matrix1x2( { x: 2., y: 2. } )
     * </code></pre>
     */
    @:op(A + B) public static inline
    function add( a:Matrix1x2, b:Matrix1x2 ): Matrix1x2 {
      	return new Matrix1x2({ x: a.x + b.x, y:  a.y + b.y });
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.unit() - Matrix1x2.unit() == new Matrix1x2( { x: 0., y: 0. } )
     * </code></pre>
     */
    @:op(A - B) public static inline
    function subtract( a: Matrix1x2, b:Matrix1x2 ): Matrix1x2 {
        return new Matrix1x2({ x: a.x - b.x, y:  a.y - b.y });
    }
    // To consider...
    @:op(A * B) public static inline
    function dot( a: Matrix1x2, b:Matrix1x2 ): Matrix1x2 {
        return new Matrix1x2({ x: a.x * b.x, y: a.y * b.y });
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.unit() * 2 == new Matrix1x2( { x: 2., y: 2. } )
     * >>> 2 * Matrix1x2.unit() == new Matrix1x2( { x: 2., y: 2. } )
     * </code></pre>
     */
    @:op(A * B) @:commutative public static inline
    function scaleMultiply( a: Matrix1x2, v: Float ): Matrix1x2 {
        return new Matrix1x2( { x: a.x * v, y: a.y * v } );
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.unit() / 2 == new Matrix1x2( { x: 0.5, y: 0.5 } )
     * </code></pre>
     */
    @:op(A / B) public static inline
    function divide( a: Matrix1x2, v: Float ): Matrix1x2 {
        return a * ( 1 / v );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix1x2( { x: 7., y: 6. } ); 
     * ... var b = new Matrix1x2( { x: 7., y: 6. } ); 
     * ... a == b; 
     * ... }) == true
     * </code></pre>
     */
    @:op(A == B) public static inline
    function equal( a: Matrix1x2, b:Matrix1x2 ): Bool {
        return a.x == b.x && a.y == b.y;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix1x2( { x: 7., y: 5. } ); 
     * ... var b = new Matrix1x2( { x: 7., y: 6. } ); 
     * ... a != b; 
     * ... }) == true
     * </code></pre>
     */
    @:op(A != B) public static inline
    function notEqual( a: Matrix1x2, b:Matrix1x2 ): Bool {
        return !equal( a, b );
    }
    /**
     * <pre><code>
     * >>> ({ trace('"perp" untested still to consider'); true; }) == true
     * </code></pre>
     */
    //  To consider...
    public inline
    function perp( b: Matrix1x2 ): Float {
        return this.x * b.y - this.y * b.x;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix1x2( { x: 3.,  y: 1. } ); 
     * ... var b = new Matrix1x2( { x: 4.,  y: 2. } ); 
     * ... var c = new Matrix1x2( { x: 3.5, y: 1.5 } );
     * ... var mid = Matrix1x2.mid( a, b ); 
     * ... mid == c;
     * ... }) == true
     * </code></pre>
     */
    public static inline
    function mid( a: Matrix1x2, b:Matrix1x2 ): Matrix1x2 {
        return new Matrix1x2( { x: ( a.x + b.x )/2, y:( a.y + b.y )/2 } );
    }
    /**
     * test with 3,4,5 triangle
     *
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix1x2( { x: 1., y: 1. } ); 
     * ... var b = new Matrix1x2( { x: 1. + 3., y: 1. + 4. } ); 
     * ... a.distanceBetweenSquare( b ); }) == 25
     * </code></pre>
     */
    public inline
    function distanceBetweenSquare( b: Matrix1x2 ): Float {
        var dx = this.x - b.x;
        var dy = this.y - b.y;
        return dx * dx + dy * dy;
    }
    /**
     * test with 3,4,5 triangle
     *
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix1x2( { x: 1., y: 1. } ); 
     * ... var b = new Matrix1x2( { x: 1. + 3., y: 1. + 4. } ); 
     * ... a.distanceBetween( b ); }) == 5
     * </code></pre>
     */
    public inline
    function distanceBetween( b: Matrix1x2 ): Float {
        return Math.pow( distanceBetweenSquare( b ), 0.5 );
    }
    /**
     * <pre><code>
     * >>> ({ trace('"span" untested still to consider'); true; }) == true
     * </code></pre>
     */
    public inline
    function span( b: Matrix1x2 ): Matrix1x2 {
        return new Matrix1x2({ x: this.x - b.x, y: this.y - b.y });
    }
    /**
     * <pre><code>
     * >>> ({ trace('"normalize" untested'); true; }) == true
     * </code></pre>
     */
    public inline
    function normalize(): Float {
        magnitude = 1.;
        return magnitude;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix1x2( { x: 3., y: 3. } ); 
     * ... a.lenSquare(); }) == 18
     * </code></pre>
     */
    public inline
    function lenSquare(): Float {
        return this.x * this.x + this.y * this.y;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix1x2( { x: 3., y: 4. } ); 
     * ... a.distance(); }) == 5
     * </code></pre>
     */
    public inline
    function distance(): Float {
        return Math.pow( lenSquare(), 0.5 );
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

    /**
     * <pre><code>
     * >>> ({ trace('"isLeft" untested'); true; }) == true
     * </code></pre>
     */
    public inline
    function isLeft( a: Matrix1x2, b:Matrix1x2 ): Float {
        return (( b.x - a.x )*( this.y - a.y ) - ( this.x - a.x )*( b.y - a.y ));
    }
    /**
     * <pre><code>
     * >>> ({ trace('"triangleArea" untested'); true; }) == true
     * </code></pre>
     */
    public static inline
    function triangleArea( a: Matrix1x2, b:Matrix1x2, c:Matrix1x2 ): Float {
        return Math.abs( a.isLeft( b , c ) / 2. );
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.sign( -7. ) == -1
     * >>> Matrix1x2.sign( 7. ) == 1
     * </code></pre>
     */
    public static inline
    function sign( n: Float ): Int {
        return Std.int( Math.abs( n )/n );
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.thetaDifference( Matrix1x2.east(),        Matrix1x2.zero() ) == 0
     * >>> Matrix1x2.thetaDifference( Matrix1x2.bottomRight(), Matrix1x2.zero() ) == -Math.PI/4
     * >>> Matrix1x2.thetaDifference( Matrix1x2.south(),       Matrix1x2.zero() ) == -Math.PI/2
     * >>> Matrix1x2.thetaDifference( Matrix1x2.bottomLeft(),  Matrix1x2.zero() ) == -3*Math.PI/4
     * >>> Matrix1x2.thetaDifference( Matrix1x2.west(),        Matrix1x2.zero() ) == Math.PI
     * >>> Matrix1x2.thetaDifference( Matrix1x2.topLeft(),     Matrix1x2.zero() ) == 3*Math.PI/4
     * >>> Matrix1x2.thetaDifference( Matrix1x2.north(),       Matrix1x2.zero() ) == Math.PI/2
     * >>> Matrix1x2.thetaDifference( Matrix1x2.topRight(),    Matrix1x2.zero() ) == Math.PI/4
     * </code></pre>
     */
    public inline static
    function thetaDifference( a: Matrix1x2, b:Matrix1x2 ): Float {
        var dx: Float = a.x - b.x;
        var dy: Float = a.y - b.y;
        return Math.atan2( dy, dx );
    }
    /**
     * <pre><code>
     * >>> ({ trace('"inTri" untested'); true; }) == true
     * </code></pre>
     */
    // need to assess / compare the quality of inTri approaches.
    public inline
    function inTri( a: Matrix1x2, b:Matrix1x2, c:Matrix1x2 ): Bool {
        var planeAB = ( a.x - this.x )*( b.y - this.y ) - ( b.x - this.x )*( a.y - this.y );
        var planeBC = ( b.x - this.x )*( c.y - this.y ) - ( c.x - this.x )*( b.y - this.y );
        var planeCA = ( c.x - this.x )*( a.y - this.y ) - ( a.x - this.x )*( c.y - this.y );
        return sign( planeAB ) == sign( planeBC ) && sign( planeBC ) == sign( planeCA );
    }
    /**
     * <pre><code>
     * >>> ({ trace('"inTri2" untested'); true; }) == true
     * </code></pre>
     */
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
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix1x2.topRight()/2; 
     * ... var b = Matrix1x2.zero(); 
     * ... var c = Matrix1x2.topRight(); 
     * ... a.inRect( b, c ); }) == true
     * >>> ({ 
     * ... var a = Matrix1x2.bottomLeft()/2; 
     * ... var b = Matrix1x2.zero(); 
     * ... var c = Matrix1x2.topRight(); 
     * ... a.inRect( b, c ); }) == false
     * >>> ({ 
     * ... var a = Matrix1x2.bottomLeft()/2; 
     * ... var b = Matrix1x2.bottomRight(); 
     * ... var c = Matrix1x2.zero(); 
     * ... a.inRect( b, c ); }) == false
     * >>> ({ 
     * ... var a = Matrix1x2.bottomRight()/2; 
     * ... var b = Matrix1x2.bottomRight(); 
     * ... var c = Matrix1x2.zero(); 
     * ... a.inRect( b, c ); }) == true
     * </code></pre>
     */
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
    /**
     * <pre><code>
     * >>> ({ 
     * ... var l = new Matrix1x2( { x: 1., y: 0. });
     * ... var t = new Matrix1x2( { x: 2., y: 1. });
     * ... var r = new Matrix1x2( { x: 4., y: 0. });
     * ... var b = new Matrix1x2( { x: 3., y: -1. });
     * ... (!Matrix1x2.convex( l, t, r ) && Matrix1x2.convex( l, b, r )) == true;
     * ... }) == true
     * </code></pre>
     */
    public static inline
    function convex( a: Matrix1x2, b: Matrix1x2, c: Matrix1x2) : Bool { 
        return ( a.y - b.y )*( c.x - b.x ) + ( b.x - a.x )*( c.y - b.y ) >= 0;
    }
    /**
     * <pre><code>
     * >>> ({ trace('"cross" untested'); true; }) == true
     * </code></pre>
     */
    public static inline
    function cross( a: Matrix1x2, b:Matrix1x2 ) : Float {
        return a.x*b.y - a.y*b.x;
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.east().theta()        == 0.
     * >>> Matrix1x2.bottomRight().theta() == -Math.PI/4
     * >>> Matrix1x2.south().theta()       == -Math.PI/2
     * >>> Matrix1x2.bottomLeft().theta()  == -3*Math.PI/4
     * >>> Matrix1x2.west().theta()        == Math.PI
     * >>> Matrix1x2.topLeft().theta()     == 3*Math.PI/4
     * >>> Matrix1x2.north().theta()       == Math.PI/2
     * >>> Matrix1x2.topRight().theta()    == Math.PI/4
     * </code></pre>
     */
    public inline
    function theta(): Float {
        return Math.atan2( this.y, this.x );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix1x2( { x: 0.5, y: 0.5 } ); 
     * ... var b = new Matrix1x2( { x: 0.5000001, y: 0.5000001 } ); 
     * ... a.close( b ); }) == true
     * </code></pre>
     */
    public inline
    function close( b: Matrix1x2, delta = 0.00001 ): Bool {
        return xClose( b ) && yClose( b );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... var a = new Matrix1x2( { x: 0.5, y: 1. } ); 
     * ... var b = new Matrix1x2( { x: 0.5000001, y: 0.5000001 } ); 
     * ... a.close( b ); }) == true
     * </code></pre>
     */
    public inline
    function xClose( b: Matrix1x2, delta = 0.00001 ): Bool {
        var dx = this.x - b.x;
        return ( dx < delta || dx > -delta );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix1x2( { x: 1., y: 0.5 } ); 
     * ... var b = new Matrix1x2( { x: 0.5000001, y: 0.5000001 } ); 
     * ... a.close( b ); }) == true
     * </code></pre>
     */
    public inline
    function yClose( b: Matrix1x2, delta = 0.00001 ): Bool {
        var dy = this.y - b.y;
        return ( dy < delta || dy > -delta );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix1x2.topRight(); 
     * ... var b = a.pivotAround( Math.PI/2, Matrix1x2.topRight()/2 ); 
     * ... b.close( Matrix1x2.north() ); }) == true
     * </code></pre>
     */
    public inline
    function pivotAround( omega: Float, pivot: Matrix1x2 ){
        var px = this.x - pivot.x;
        var py = this.y - pivot.y;
        var px2 = px * Math.cos( omega ) - py * Math.sin( omega );
        py = py * Math.cos( omega ) + px * Math.sin( omega );
        return new Matrix1x2( { x: px2 + pivot.x, y: py + pivot.y } );
    }
    /**
     * <pre><code>
     * >>> ({ trace('"toTPoint" untested'); true; }) == true
     * </code></pre>
     */
    @:to
    public inline
    function toTpoint():geom.tydef.Tpoint {
        return { x: this.x, y: this.y };
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix1x2.unit();
     * ... var b: haxe.ds.Vector<Float> = a;
     * ... var c = haxe.ds.Vector.fromArrayCopy([ 1., 1., 1. ]);
     * ... Equal.equals( b, c ); }) == true
     * </code></pre>
     */
    @:to
    public inline
    function toVec3(): haxe.ds.Vector<Float>  {
        var vec = new haxe.ds.Vector<Float>(3);
        vec.set( 0, this.x );
        vec.set( 1, this.y );
        vec.set( 2, 1. );
        return vec;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix1x2.unit();
     * ... var b = haxe.ds.Vector.fromArrayCopy([ 1., 1., 1. ]);
     * ... var c: Matrix1x2 = b;
     * ... a == c; 
     * ... }) == true
     * </code></pre>
     */
    @:from public inline static 
    function fromVec3( v3: haxe.ds.Vector<Float>  ): Matrix1x2 {
        return new Matrix1x2( { x: v3.get(0), y: v3.get(1)} );
    }
    /**
     * <pre><code>
     * >>> Matrix1x2.fromArrayPos( [ 0., 1., 2. ], 1) ==  new Matrix1x2({x:1.,y:2.})
     * </code></pre>
     */
    public static // inline
    function fromArrayPos( arr: Array<Float>, pos: Int ): Matrix1x2 {
        return new Matrix1x2( { x: arr[ pos ], y: arr[ pos + 1 ] } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix1x2( { x: 5., y: 6. } ); 
     * ... var arr = [ 0., 1., 2. ]; 
     * ... a.toArrayPos( arr, 1 ); }) == [ 0., 5., 6. ]
     * </code></pre>
     */
    public inline
    function toArrayPos( arr: Array<Float>, pos: Int ): Array<Float> {
        arr[ pos ]     = this.x;
        arr[ pos + 1 ] = this.y;
        return arr;
    }
}
