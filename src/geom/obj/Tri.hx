package geom.obj;
/**
   based on trilateral.tri.Trilateral.

   ![tri](../bootstrap/img/triangle.png)
**/
class Tri {
    public var windingAdjusted: Bool;
    public var ax: Float;
    public var bx: Float;
    public var cx: Float;
    public var ay: Float;
    public var by: Float;
    public var cy: Float;
    public var x( get, set ): Float;
    function get_x() {
        return Math.min( Math.min( ax, bx ), cx );
    }
    function set_x( x: Float ): Float {
        var dx = x - get_x();
        ax = ax + dx;
        bx = bx + dx;
        cx = cx + dx;
        return x;
    }
    public var y( get, set ): Float;   
    function get_y(): Float {
        return Math.min( Math.min( ay, by ), cy );
    }
    function set_y( y: Float ): Float {
        var dy = y - get_y();
        ay = ay + dy;
        by = by + dy;
        cy = cy + dy;
        return y;
    }
    public var right( get, never ): Float;
    public function get_right(): Float {
        return Math.max( Math.max( ax, bx ), cx );
    }
    public var bottom( get, never ): Float;
    public function get_bottom(): Float {
        return Math.max( Math.max( ay, by ), cy );
    }
    function moveDelta( dx: Float, dy: Float ){
        ax += dx;
        ay += dy;
        bx += dx;
        by += dy;
        cx += dx;
        cy += dy;
    }
    public function new( ax_: Float, ay_: Float, bx_: Float, by_: Float, cx_: Float, cy_: Float ){
        ax = ax_;
        ay = ay_;
        bx = bx_;
        by = by_;
        cx = cx_;
        cy = cy_;
        windingAdjusted = adjustWinding();
        if( windingAdjusted ){
            ax = ax_;
            ay = ay_;
            bx = cx_;
            by = cy_;
            cx = bx_;
            cy = by_;
        }
    }
    // no bounds checking
    public inline function liteHit( px: Float, py: Float ): Bool {
        var planeAB = ( ax - px )*( by - py ) - ( bx - px )*( ay - py );
        var planeBC = ( bx - px )*( cy - py ) - ( cx - px )*( by - py );
        var planeCA = ( cx - px )*( ay - py ) - ( ax - px )*( cy - py );
        return sign( planeAB ) == sign( planeBC ) && sign( planeBC ) == sign( planeCA );
    }
    public static inline
    function sign( n: Float ): Int {
        return Std.int( Math.abs( n )/n );
    }    
    //http://www.emanueleferonato.com/2012/06/18/algorithm-to-determine-if-a-point-is-inside-a-triangle-with-mathematics-no-hit-test-involved/
    public function fullHit( px: Float, py: Float ): Bool {
        if( px > x && px < right && py > y && py < bottom ) return true;
        return liteHit( px, py );
    }
    public function adjustWinding():Bool { // check sign
        return ( (ax * by - bx * ay) + (bx * cy - cx * by) + (cx * ay - ax * cy) )>0;
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
}
