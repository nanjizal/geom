package flat;
import flat.FloatFlat9;
// effectively 2D with z coordinates for depth etc... at the moment.
@:forward
abstract Int32FlatTriangle( Int32Flat9 ){
    public inline function new( len: Int ){
        this = new Int32Flat9( len );
    }
    public var ax( get, set ): Int;
    function get_ax(): Int {
        return this[ 0 ];
    }
    function set_ax( v: Int ): Int {
        this[ 0 ] = v;
        return v;
    }
    public var ay( get, set ): Int;
    function get_ay(): Int {
        return this[ 1 ];
    }
    function set_ay( v: Int ): Int {
        this[ 1 ] = v;
        return v;
    }
    public var az( get, set ): Int;
    function get_az(): Int {
        return this[ 2 ];
    }
    function set_az( v: Float ): Int {
        this[ 2 ] = v;
        return v;
    }
    public var bx( get, set ): Int;
    function get_bx(): Int {
        return this[ 3 ];
    }
    function set_bx( v: Int ): Int {
        this[ 3 ] = v;
        return v;
    }
    public var by( get, set ): Int;
    function get_by(): Int {
        return this[ 4 ];
    }
    function set_by( v: Int ): Int {
        this[ 4 ] = v;
        return v;
    }
    public var bz( get, set ): Int;
    function get_bz(): Int {
        return this[ 5 ];
    }
    function set_bz( v: Int ): Int {
        this[ 5 ] = v;
        return v;
    }
    public var cx( get, set ): Int;
    function get_cx(): Int {
        return this[ 6 ];
    }
    function set_cx( v: Int ): Int {
        this[ 6 ] = v;
        return v;
    }
    public var cy( get, set ): Int;
    function get_cy(): Int {
        return this[ 7 ];
    }
    function set_cy( v: Int ): Int {
        this[ 7 ] = v;
        return v;
    }
    public var cz( get, set ): Int;
    function get_cz(): Int {
        return this[ 8 ];
    }
    function set_cz( v: Int ): Int {
        this[ 8 ] = v;
        return v;
    }
    @:keep
    public function triangle( ax_: Int, ay_: Int, az_: Int
                            , bx_: Int, by_: Int, bz_: Int
                            , cx_: Int, cy_: Int, cz_: Int ){
        ax = ax_;
        ay = ay_;
        az = az_;
        bx = bx_;
        by = by_;
        bz = bz_;
        cx = cx_;
        cy = cy_;
        cz = cz_;
        // assume shape is 2D with depth at moment.
        var windingAdjusted = adjustWinding();
        if( windingAdjusted ){
            ax = ax_;
            ay = ay_;
            bx = cx_;
            by = cy_;
            cx = bx_;
            cy = by_;
        }
        return windingAdjusted;
    }
    public function adjustWinding():Bool { // check sign
        return ( (ax * by - bx * ay) + (bx * cy - cx * by) + (cx * ay - ax * cy) )>0;
    }
    public var x( get, set ): Float;
    inline
    function get_x() {
        return Math.min( Math.min( ax, bx ), cx );
    }
    inline
    function set_x( x: Int ): Int {
        var dx = x - get_x();
        ax = ax + dx;
        bx = bx + dx;
        cx = cx + dx;
        return x;
    }
    public var y( get, set ): Int;   
    inline
    function get_y(): Int {
        return Math.min( Math.min( ay, by ), cy );
    }
    inline
    function set_y( y: Int ): Int {
        var dy = y - get_y();
        ay = ay + dy;
        by = by + dy;
        cy = cy + dy;
        return y;
    }
    public var z( get, set ): Int;   
    inline
    function get_z(): Int {
        return Math.min( Math.min( az, bz ), cz );
    }
    inline
    function set_z( z: Int ): Int {
        var dz = z - get_z();
        az = az + dz;
        bz = bz + dz;
        cz = cz + dz;
        return z;
    }
    public var right( get, never ): Int;
    inline
    function get_right(): Int {
        return Math.max( Math.max( ax, bx ), cx );
    }
    public var bottom( get, never ): Int;
    inline
    function get_bottom(): Int {
        return Math.max( Math.max( ay, by ), cy );
    }
    public var back( get, never ): Int;
    inline
    function get_back(): Float {
        return Math.max( Math.max( az, bz ), cz );
    }
    public
    function transform( m: Matrix4x3 ){
        var pa = new Matrix1x4( { x: ax, y: ay, z: az, w: 1. } );
        var pb = new Matrix1x4( { x: bx, y: by, z: bz, w: 1. } );
        var pc = new Matrix1x4( { x: cx, y: cy, z: cz, w: 1. } );
        pa = pa.transformPoint( m );
        pb = pb.transformPoint( m );
        pc = pc.transformPoint( m );
        ax = Math.round( pa.x );
        ay = Math.round( pa.y );
        az = Math.round( pa.z );
        bx = Math.round( pb.x );
        by = Math.round( pb.y );
        bz = Math.round( pb.z );
        cx = Math.round( pc.x );
        cy = Math.round( pc.y );
        cz = Math.round( pc.z ); 
    }
    public
    function transformAll( m: Matrix4x3 ) {
        this.pos = 0;
        for( i in 0...this.length ){
            transform( m );
            this.next();
        }
    }    
    inline
    function moveDelta( dx: Int, dy: Int ){
        ax += dx;
        ay += dy;
        bx += dx;
        by += dy;
        cx += dx;
        cy += dy;
    }
    public static inline
    function sign( n: Float ): Float {
        return Std.int( Math.abs( n )/n );
    }
    // no bounds checking
    public inline
    function liteHit( px: Float, py: Float ): Bool {
        var planeAB = ( ax - px )*( by - py ) - ( bx - px )*( ay - py );
        var planeBC = ( bx - px )*( cy - py ) - ( cx - px )*( by - py );
        var planeCA = ( cx - px )*( ay - py ) - ( ax - px )*( cy - py );
        return sign( planeAB ) == sign( planeBC ) && sign( planeBC ) == sign( planeCA );
    }
    //http://www.emanueleferonato.com/2012/06/18/algorithm-to-determine-if-a-point-is-inside-a-triangle-with-mathematics-no-hit-test-involved/
    public
    function fullHit( px: Float, py: Float ): Bool {
        if( px > x && px < right && py > y && py < bottom ) return true;
        return liteHit( px, py );
    }
    public inline 
    function rotate( x: Float, y: Float, theta: Float ){
        var cos = Math.cos( theta );
        var sin = Math.sin( theta );
        rotateTrig( x, y, cos, sin );
    }
    public inline 
    function rotateTrig( x: Float, y: Float, cos: Float, sin: Float ){
        var ax_: Float = ax - x;
        var ay_: Float = ay - y;
        var bx_: Float = bx - x;
        var cx_: Float = cx - x;
        var cy_: Float = cy - y;
        var dx: Float;
        var dy: Float;
        dx  = ax_;
        dy  = ay_;
        ax_  = dx * cos - dy * sin;
        ay_  = dx * sin + dy * cos; 
        dx  = bx_;
        dy  = by_;
        bx_  = dx * cos - dy * sin;
        by_  = dx * sin + dy * cos; 
        dx  = cx_;
        dy  = cy_;
        cx_  = dx * cos - dy * sin;
        cy_  = dx * sin + dy * cos;
        ax_ += x;
        ay_ += y;
        bx_ += x;
        by_ += y;
        cx_ += x;
        cy_ += y;
        ax = Math.round( ax_ );
        ay = Math.round( ay_ );
        bx = Math.round( bx_ );
        by = Math.round( by_ );
        cx = Math.round( cx_ );
        cy = Math.round( cy_ );
    }
    public inline
    function prettyString(){
        return  '{ ax: ' + ax + ', ay: ' + ay + ', az: ' + az + ' }' + '\n' +
                '{ bx: ' + bx + ', by: ' + by + ', bz: ' + bz + ' }' + '\n' +
                '{ cx: ' + cx + ', cy: ' + cy + ', az: ' + cz + ' }' + '\n';
    }
    public inline
    function prettyAll(){
        this.pos = 0;
        var str = 'Int32FlatTriangle: \n';
        for( i in 0...this.length ) {
            str += prettyString();
            this.next();
        }
        this.pos = 0;
        return str;
    }
}
