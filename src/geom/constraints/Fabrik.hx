package geom.constraints;
import geom.matrix.Matrix1x4;
// reference
// Johnathon Selstad
// @JohnSelstad
// https://git.io/fjf1N
class Fabrik{
    public var joints    = new Array<Matrix1x4>();
    var points:   Int;
    var distance: Float;
    var x: Float;
    var y: Float;
    public function new( x_: Float, y_: Float, points_: Int, distance_: Float ){
        x = x_;
        y = y_;
        distance = distance_;
        points   = points_;
        for( i in 0...points ) joints[ i ] = new Matrix1x4( { x: x + i*distance, y: y, z: 0., w: 1. } );
    }
    inline
    public function update( anchor: Matrix1x4, render: ( i: Int, joint: Matrix1x4 ) -> Void  ){
        var joint = joints[0];
        joint.x = anchor.x;
        joint.y = anchor.y;
        render( 0, joint );
        for( i in 1...points ) {
            joints[ i ] = joints[ i ].constrainDistance( joints[ i - 1 ], distance );
        }
        var j: Int;
        var joint = joints[ points - 1 ];
        joint.x = x;
        joint.y = y;
        render( points - 1, joint );
        for( i in 1...points ){
            j = points - i;
            joints[ j - 1 ] = joints[ j - 1 ].constrainDistance( joints[ j ], distance );
            joint = joints[ j - 1 ];
            render( j, joint );
        }
    }
}
