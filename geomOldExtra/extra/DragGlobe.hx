package geom.extra;
import geom.Matrix4x3;
import geom.Matrix1x4;
 
// Partial implementation moved from canvasImageTriangle.World
// changed most of he code to relate to geom, but still some changes required and a lot of fixes.
 
//using canvasImageTriangle.AffineMatrix;
//using canvasImageTriangle.Point3D;
class DragGlobe {
    var mouseGrab    = null;
    var dl                  = null;
    var temp_mat0           = Matrix4x3.unit();
    var temp_mat1           = Matrix4x3.unit();
    var temp_mat2           = Matrix4x3.unit();
    var object              : Matrix4x3;
    var camera              : Matrix4x3;
    var proj                : Matrix4x3;
    var hFov                = ( Math.PI / 2 );
    var lastTime            = 0;
    var omega:              Matrix1x4;
    var distance            = 2.;
    var dt                  = 0;
    public var bigger     = false;
    public var smaller    = false;
    public
    function new( width: Float, height: Float ){
        omega = new Matrix1x4( {x:2.6, y:2.6, z:0., w: 1. } );
        proj    = Matrix4x3.projectionWindow( width, height, hFov );
        object  = Matrix4x3.orientation( Matrix1x4.zero()
                                      ,  new Matrix1x4( { x: 1., y: 0., z: 0., w: 1. } )
                                      ,  new Matrix1x4({ x:0.,  y: 1., z: 0., w: 1. } ) );
        camera  = Matrix4x3.orientation( new Matrix1x4({ x: 0., y: 0., z: 0.2 + distance, w: 1. } )
                                      ,  new Matrix1x4({ x: 0., y: 0., z:-1., w: 1. } )
                                      ,  new Matrix1x4({ x: 0., y: 1., z: 0., w: 1. } ) );
    }
    public inline // used on all Vertex
    function transformVertex( v: Vertex ): Vertex {
        var p = new Matrix1x4( { x: v.x, y: v.y, z: v.z, w: 1. } );
        p = p.transformPoint( temp_mat1 );  // transformPoint
        return { x: p.x, y: p.y, z: p.z, u: v.u, v: v.v } 
    }
    public inline
    function spin( x: Float, y: Float, mouseDown: Bool ){
        updateTime();
        updateZoom();
        if( mouseDown ){
            var grabPoint = screenToSpherePt( x, y );
            if( mouseGrab == null && grabPoint != null ) setToGrab( grabPoint );
            if( mouseGrab != null && grabPoint != null ) rotateToGrab( grabPoint );
        } else {
            nullGrab();
        }
    }
    public inline // update of matrices before drawing
    function updateMatrix(){
        var view_mat = camera.makeViewFromOrientation();
        // Update transform.
        temp_mat0 = proj * view_mat;
        temp_mat1 = temp_mat0 * object;
    }
    inline
    function rotateObject( scaled: Matrix1x4 ) {
        var angle = Math.asin( Math.sqrt( scaled.dotProd( scaled )));
        if (angle > Math.PI / 8) angle = Math.PI / 8;
        var axis    = scaled.normalize();
        var mat     = Matrix1x4.fromAxisAngle( angle, axis );
        object  = mat * object;
        object.orthonormalizeRotation();
    }
    inline
    function nullGrab(){
        mouseGrab = null;
        omega = omega * ( 0.95 );
        var dotOmegaProduct = omega.dotProd( omega );
        if( dotOmegaProduct < 0.000000001 && bigger == false && smaller == false) {
            omega = Matrix1x4.zero();
            // renderOn = false
        } else {
            rotateObject( omega * ( dt / 1000 ) );
        }
    }
    inline
    function setToGrab( newGrab: Matrix1x4 ){
        mouseGrab = object.applyInverseRotation( newGrab );
    }
    inline
    function rotateToGrab( newGrab: Matrix1x4 ){
        var origGrab = object.applyRotation( mouseGrab );
        // Rotate the object, to map old grab point onto new grab point.
        var axis = origGrab.cross( newGrab );
        axis = axis * 0.95;
        rotateObject( axis );
        omega = axis * ( 1000 / dt );
    }
    inline
    function updateZoom(){
        if( bigger )     distance -= 2.0 * dt / 1000;
        if( smaller )    distance += 2.0 * dt / 1000;
        if( distance < 0 ) distance = 0.;
        camera.l = 0.2 + distance;
    }
    inline
    function updateTime(){
        var now = Std.int( Date.now().getTime() );
        dt = now - lastTime;
        lastTime = now;
        if( dt > 100 ) dt = 100;
        if( dt < 1 )   dt = 1;
    }
    /*
    var e0: Float; var e4: Float; var e8:  Float; var e12: Float;
    var e1: Float; var e5: Float; var e9:  Float; var e13: Float;
    var e2: Float; var e6: Float; var e10: Float; var e14: Float;
    this.a = a; this.b = b; this.c = c; this.d = d;
    this.e = e; this.f = f; this.g = g; this.h = h;
    this.i = i; this.j = j; this.k = k; this.l = l;
    */
    inline
    function screenToSpherePt( x: Float, y: Float ): Matrix1x4 {
        var p         = new Matrix1x4( { x: camera.d, y: camera.h, z: camera.l + 1., w: 1. } );
        var r         = new Matrix1x4( { x: camera.a,  y: camera.e,  z: camera.i, w: 1. } );// camera dir
        var up        = new Matrix1x4( { x: camera.b,  y: camera.f,  z: camera.j, w: 1. } );
        var right     = new Matrix1x4( { x: camera.c,  y: camera.g,  z: camera.k, w: 1. } );
        var tan_half  = Math.tan( hFov / 2 );
        r = r + ( right * ( x * tan_half ));
        r = r + ( up * ( y * tan_half ) );
        r = r.normalize();
        return rayVsUnitSphereClosestPoint( p, r );
    }
    // Return the first exterior hit or closest point between the unit
    // sphere and the ray starting at p and going in the r direction.
    inline static
    function rayVsUnitSphereClosestPoint( p: Matrix1x4, r: Matrix1x4 ): Matrix1x4 {
        if( p.dotProd( p ) < 1 ) return null;// Ray is inside sphere, no exterior hit.
        var ray = - p.dotProd( r ); // along ray
        if( ray < 0 ) return null;// Behind ray start-point.
        var perp = p + ( r * ray );
        if( perp.dotProd( perp ) >= 0.999999 ) return perp.normalize();// Return the closest point.
        // Compute intersection.
        var e = Math.sqrt( 1 - perp.dotProd( perp ) );
        var hit = p + ( r * ( ray - e ) );
        return hit.normalize();
    }
}