package geom.flat.float;
import geom.flat.float.FloatFlat9;
import geom.matrix.Matrix4x3;
import geom.matrix.Matrix1x4;
// effectively 2D with z coordinates for depth etc... at the moment.
@:forward
abstract FloatFlatTriangle( FloatFlat9 ){
    public inline function new( len: Int ){
        this = new FloatFlat9( len );
    }
    public var ax( get, set ): Float;
    function get_ax(): Float {
        return this[ 0 ];
    }
    function set_ax( v: Float ): Float {
        this[ 0 ] = v;
        return v;
    }
    public var ay( get, set ): Float;
    function get_ay(): Float {
        return this[ 1 ];
    }
    function set_ay( v: Float ): Float {
        this[ 1 ] = v;
        return v;
    }
    public var az( get, set ): Float;
    function get_az(): Float {
        return this[ 2 ];
    }
    function set_az( v: Float ): Float {
        this[ 2 ] = v;
        return v;
    }
    public var bx( get, set ): Float;
    function get_bx(): Float {
        return this[ 3 ];
    }
    function set_bx( v: Float ): Float {
        this[ 3 ] = v;
        return v;
    }
    public var by( get, set ): Float;
    function get_by(): Float {
        return this[ 4 ];
    }
    function set_by( v: Float ): Float {
        this[ 4 ] = v;
        return v;
    }
    public var bz( get, set ): Float;
    function get_bz(): Float {
        return this[ 5 ];
    }
    function set_bz( v: Float ): Float {
        this[ 5 ] = v;
        return v;
    }
    public var cx( get, set ): Float;
    function get_cx(): Float {
        return this[ 6 ];
    }
    function set_cx( v: Float ): Float {
        this[ 6 ] = v;
        return v;
    }
    public var cy( get, set ): Float;
    function get_cy(): Float {
        return this[ 7 ];
    }
    function set_cy( v: Float ): Float {
        this[ 7 ] = v;
        return v;
    }
    public var cz( get, set ): Float;
    function get_cz(): Float {
        return this[ 8 ];
    }
    function set_cz( v: Float ): Float {
        this[ 8 ] = v;
        return v;
    }
    public
    function transform( m: Matrix4x3 ){
        var pa = new Matrix1x4( { x: ax, y: ay, z: az, w: 1. } );
        var pb = new Matrix1x4( { x: bx, y: by, z: bz, w: 1. } );
        var pc = new Matrix1x4( { x: cx, y: cy, z: cz, w: 1. } );
        pa = pa.transformPoint( m );
        pb = pb.transformPoint( m );
        pc = pc.transformPoint( m );
        ax = pa.x;
        ay = pa.y;
        az = pa.z;
        bx = pb.x;
        by = pb.y;
        bz = pb.z;
        cx = pc.x;
        cy = pc.y;
        cz = pc.z; 
    }
    public
    function transformAll( m: Matrix4x3 ) {
        this.pos = 0;
        for( i in 0...this.size ){
            transform( m );
            this.next();
        }
    }
    public
    function transformRange( m: Matrix4x3, start: Int, end: Int ){
        this.pos = start;
        if( end > this.size - 1 ) end == this.size - 1;
        for( i in start...( end + 1 ) ){
            transform( m );
            this.next();
        }
    }
    @:keep
    public function triangle( ax_: Float, ay_: Float, az_: Float
                            , bx_: Float, by_: Float, bz_: Float
                            , cx_: Float, cy_: Float, cz_: Float ){
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
    function set_x( x: Float ): Float {
        var dx = x - get_x();
        ax = ax + dx;
        bx = bx + dx;
        cx = cx + dx;
        return x;
    }
    public var y( get, set ): Float;   
    inline
    function get_y(): Float {
        return Math.min( Math.min( ay, by ), cy );
    }
    inline
    function set_y( y: Float ): Float {
        var dy = y - get_y();
        ay = ay + dy;
        by = by + dy;
        cy = cy + dy;
        return y;
    }
    public var z( get, set ): Float;   
    inline
    function get_z(): Float {
        return Math.min( Math.min( az, bz ), cz );
    }
    inline
    function set_z( z: Float ): Float {
        var dz = z - get_z();
        az = az + dz;
        bz = bz + dz;
        cz = cz + dz;
        return z;
    }
    public var right( get, never ): Float;
    inline
    function get_right(): Float {
        return Math.max( Math.max( ax, bx ), cx );
    }
    public var bottom( get, never ): Float;
    inline
    function get_bottom(): Float {
        return Math.max( Math.max( ay, by ), cy );
    }
    public var back( get, never ): Float;
    inline
    function get_back(): Float {
        return Math.max( Math.max( az, bz ), cz );
    }
    function moveDelta( dx: Float, dy: Float ){
        ax += dx;
        ay += dy;
        bx += dx;
        by += dy;
        cx += dx;
        cy += dy;
    }
    public static inline
    function sign( n: Float ): Int {
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
        ax -= x;
        ay -= y;
        bx -= x;
        by -= y;
        cx -= x;
        cy -= y;
        var dx: Float;
        var dy: Float;
        dx  = ax;
        dy  = ay;
        ax  = dx * cos - dy * sin;
        ay  = dx * sin + dy * cos; 
        dx  = bx;
        dy  = by;
        bx  = dx * cos - dy * sin;
        by  = dx * sin + dy * cos; 
        dx  = cx;
        dy  = cy;
        cx  = dx * cos - dy * sin;
        cy  = dx * sin + dy * cos;
        ax += x;
        ay += y;
        bx += x;
        by += y;
        cx += x;
        cy += y;
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
        var str = 'FloatFlatTriangle: \n';
        for( i in 0...this.size ) {
            str += prettyString();
            this.next();
        }
        this.pos = 0;
        return str;
    }
}
