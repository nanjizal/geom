package geom.systemL;
import geom.matrix.Matrix1x4;
import geom.matrix.Quaternion;
import geom.matrix.DualQuaternion;
/**
    3D LSystem node
**/
@:structInit
class LNode3D{
    
    // needs testing and thought, unsure if this is correct.
    public var dualQ : DualQuaternion;
    public function new( pos: Matrix1x4, angle: Quaternion ){
        dualQ = DualQuaternion.create( angle, pos );
    }
    
    // really unsure if DualQuaternion.scaler is setup right.
    public inline
    function transform( distance: Float ): LNode3D {
        var cloned = clone();
        cloned.dualQ.applyScale( distance );
        return cloned;
    }
    
    public inline 
    function clone(): LNode3D {
        var cloned = Type.createEmptyInstance( LNode3D );
        cloned.dualQ = dualQ.clone();
        return cloned;
    }
    
    inline public
    function addAngle( q: Quaternion ): Void {
        dualQ.dual = dualQ.dual * q;
    }
}
