package geom.move;
import geom.move.Trinary;
import geom.move.Parameter;
import geom.matrix.Matrix3x3;
import geom.matrix.DualQuaternion;
import geom.matrix.Matrix1x4;
// untested
class Axis2 {
    var rxy = new Parameter();
    var sx = new Parameter();
    var sy = new Parameter();
    var shearx: new Parameter();
    var sheary: new Parameter();
    var tx = new Parameter();
    var ty = new Parameter();
    public inline
    function reset(){
        rx.value = 0.;
        ry.value = 0.;
        sx.value = 1.;
        sy.value = 1.;
        shearx.value = 0.;
        sheary.value = 0.;
        tx.value = 0.;
        ty.value = 0.;
    }
    public inline
    function spin( v: Trit ){
        rxy.update( v );
    }
    public inline
    function alongX( v: Trit ){
        tx.update( v );
    }
    public inline
    function alongY( v: Trit ){
        ty.update( v );
    }
    public inline
    function resizeX( v: Trit ){
        sx.update( v ); 
    }
    public inline
    function resizeY( v: Trit ){
        sy.update( v );
    }
    public inline
    function shearX( v: Trit ){
        shearx.update( v );
    }
    public inline
    function shearY( v: Trit ){
        sheary.update( v );
    }
    public function new(){}
    public 
    function updateCalculateMatrix3x3( m: Matrix3x3 ) {
        var rotations    = rotationChanged();
        var translations = translationChanged();
        var shear        = shearChanged();
        var scale        = scaleChanged();
        if( translations || rotations || shearChanged || resizeChanged ){
            // TODO: apply more consideration!
            // apply resize first?
            if( scale )                    m.scaleXYZ( 1 + sx, 1 + sy, 1 ); // not sure on this.
            // apply shear second?
            if( shearx.changed )           m.shearX( shearx );
            if( sheary.changed )           m.shearY( sheary );
            if( rxy.changed )              m.rotate( rxy );
            if( tx.changed || ty.changed ) m.translateXY( tx, ty );
            return m;
        } else {
            return m;
        }
    }
    // does not apply shear yet.
    public 
    function updateCalculateQuaternion( q: DualQuaternion ) {
        var rotations    = rotationChanged();
        var translations = translationChanged(); 
        if( translations || rotations ){
            var qReal = if( rotations ){ Quaternion.fromYawPitchRoll( 0., 0., rxy.value );
                    } else { Quaternion.zeroNormal(); 
                    }
            var qDual = if( translations ){ new Matrix1x4( { x: tx.value, y: ty.value, z: 0, w: 1. } );
                    } else { Matrix1x4.zero ();
                    }
            var dualQuaternion = DualQuaternion.create( qReal, qDual );
            return ( dualQuaternion * q );//.normalize();
        } else {
            return q;
        }
    }
    public inline
    function rotationChanged(): Bool {
        return rxy;
    }
    public inline
    function translationChanged(): Bool {
        return tx.trinary.changed || ty.trinary.changed ;
    }
    public inline
    function shearChanged(): Bool {
        return shearx.changed || sheary.changed ;
    }
    public inline
    function resizeChanged(): Bool {
        return sx.changed || sy.changed ;
    }
}
