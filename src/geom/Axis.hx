package geom;
import geom.Trinary;
import geom.Parameter;
class Axis {
    var rx = new Parameter();
    var ry = new Parameter();
    var rz = new Parameter();
    var tx = new Parameter();
    var ty = new Parameter();
    var tz = new Parameter();
    public inline
    function pitch( v: Trit ){
        rx.update( v );
    }
    public inline
    function yaw( v: Trit ){
        ry.update( v );
    }
    public inline
    function roll( v: Trit ){
        rz.update( v );
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
    function alongZ( v: Trit ){
        tz.update( v );
    }
    public function new(){}
    public 
    function updateCalculate( q: DualQuaternion ) {
        var rotations    = rotationChanged();
        var translations = translationChanged(); 
        if( translations || rotations ){
            var qReal = if( rotations ){ Quaternion.fromYawPitchRoll( ry.value, rx.value, rz.value );
                    } else { Quaternion.zeroNormal(); 
                    }
            var qDual = if( translations ){ new Matrix1x4( { x: tx.value, y: ty.value, z: tz.value, w: 1. } );
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
        return rx.trinary.changed || ry.trinary.changed || rz.trinary.changed;
    }
    public inline
    function translationChanged(): Bool {
        return tx.trinary.changed || ty.trinary.changed || tz.trinary.changed;
    }
}