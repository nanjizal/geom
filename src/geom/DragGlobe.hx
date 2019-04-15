package geom;
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
        omega = new Matrix1x4( {x:2.6, y:2.6, z:0., w: 1. );
        proj    = Matrix4x3.projectionWindow( width, height, hFov );
        object  = Matrix4x3.orientation( Matrix1x4.zero();
                                      ,  Matrix1x4({ x: 1., y: 0., z: 0., w: 1. } )
                                      ,  Matrix1x4({ x:0.,  y: 1., z: 0., w: 1. } ) );
        camera  = Matrix4x3.orientation( Matrix1x4({ x: 0., y: 0., z: 0.2 + distance, w: 1. } )
                                      ,  Matrix1x4({ x: 0., y: 0., z:-1., w: 1. } )
                                      ,  Matrix1x4({ x: 0., y: 1., z: 0., w: 1. } ) );
    }
    public inline // used on all Vertex
    function transformVertex( v: Vertex ){
        var p = new Matrix1x4( { x: v.x, y: v.y, z: v.z, w: 1. } );
        p = temp_mat1 * p;  // transformPoint
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
        tem._mat0 = proj * view_mat;
        temp_mat1 = temp_mat0 * object;
    }
    inline
    function rotateObject( scaled: Matrix1x4 ) {
        var angle = Math.asin( Math.sqrt( scaled.dotProduct( scaled )));
        if (angle > Math.PI / 8) angle = Math.PI / 8;
        var axis    = scaled.vectorNormalize();
        var mat     = axis.makeRotateAxisAngle( angle );
        object  = mat * object;
        object.orthonormalizeRotation();
    }
    inline
    function nullGrab(){
        mouseGrab = null;
        omega = omega.vectorScale( 0.95 );
        var dotOmegaProduct = omega.dotProduct( omega );
        if( dotOmegaProduct < 0.000000001 && bigger == false && smaller == false) {
            omega = new Point3D( 0, 0, 0 );
            // renderOn = false
        } else {
            rotateObject( omega.vectorScale( dt / 1000 ) );
        }
    }
    inline
    function setToGrab( newGrab: Matrix1x4 ){
        mouseGrab = object.applyInverseRotation( newGrab );
    }
    inline
    function rotateToGrab( newGrab: Point3D ){
        var origGrab = object.applyRotation( mouseGrab );
        // Rotate the object, to map old grab point onto new grab point.
        var axis = origGrab.crossProduct( newGrab );
        axis = axis * 0.95;
        rotateObject( axis );
        omega = axis.vectorScale( 1000 / dt );
    }
    inline
    function updateZoom(){
        if( bigger )     distance -= 2.0 * dt / 1000;
        if( smaller )    distance += 2.0 * dt / 1000;
        if( distance < 0 ) distance = 0.;
        camera.e14 = 0.2 + distance;
    }
    inline
    function updateTime(){
        var now = Std.int( Date.now().getTime() );
        dt = now - lastTime;
        lastTime = now;
        if( dt > 100 ) dt = 100;
        if( dt < 1 )   dt = 1;
    }
    inline
    function screenToSpherePt( x: Float, y: Float ): Point3D {
        var p         = new Matrix1x4( { x: camera.e12, y: camera.e13, z: camera.e14 + 1., w: 1. } );
        var r         = new Matrix1x4( { x: camera.e0,  y: camera.e1,  z: camera.e2, w: 1. } );// camera dir
        var up        = new Matrix1x4( { x: camera.e4,  y: camera.e5,  z: camera.e6, w: 1. } );
        var right     = new Matrix1x4( { x: camera.e8,  y: camera.e9,  z: camera.e10, w: 1. } );
        var tan_half  = Math.tan( hFov / 2 );
        r = r + ( right * ( x * tan_half );
        r = r + ( up * ( y * tan_half ) );
        r = r.normalize();
        return rayVsUnitSphereClosestPoint( p, r );
    }
    // Return the first exterior hit or closest point between the unit
    // sphere and the ray starting at p and going in the r direction.
    inline static
    function rayVsUnitSphereClosestPoint( p: Point3D, r: Point3D ): Point3D {
        if( p.dotProduct( p ) < 1 ) return null;// Ray is inside sphere, no exterior hit.
        var ray = - p.dotProduct( r ); // along ray
        if( ray < 0 ) return null;// Behind ray start-point.
        var perp = p + ( r * ray );
        if( perp.dotProduct( perp ) >= 0.999999 ) return perp.normalize();// Return the closest point.
        // Compute intersection.
        var e = Math.sqrt( 1 - perp.dotProduct( perp ) );
        var hit = p + r * ( ray - e ) );
        return hit.normalize();
    }
}