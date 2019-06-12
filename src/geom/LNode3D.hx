package geom;
/**
    3D LSystem node
**/
@:structInit
class LNode3D{
    public var pos : Matrix1x4;
    public var angle : Quaternion;
    public function new( pos_: Matrix1x4, angle_: Quaternion ){
        pos = pos_;
        angle = angle_;
    }
    // Needs some checking and thought
    /*
    public inline
    function transform( distance: Float ): LNode3D {
        var p: Matrix1x4 = ( pos * angle );// * distance;
        return new LNode3D( p, angle );
    }
    */
    public inline 
    function clone(): LNode3D {
        return new LNode3D( pos.clone(), angle.clone() );
    }
    // is this times?
    inline public
    function addAngle( q: Quaternion ): Void {
        angle = angle + q;
    }
}