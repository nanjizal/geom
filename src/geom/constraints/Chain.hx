package constraints.demo;
import geom.Matrix1x4;
// reference
// Johnathon Selstad
// @JohnSelstad
// https://git.io/fjfKH
class Chain{
    public var joints    = new Array<Matrix1x4>();
    var points:   Int;
    var distance: Float;
    public function new( x: Float, y: Float, points_: Int, distance_: Float ){
        distance = distance_;
        points   = points_;
        for( i in 0...points ) joints[ i ] = new Matrix1x4( {x: x + i*distance, y: y, z: 0., w: 1. } );
    }
    inline
    public function update( anchor: Matrix1x4, render: ( i: Int, joint: Matrix1x4 ) -> Void  ){
        var joint = joints[ 0 ];
        joint.x = anchor.x;
        joint.y = anchor.y;
        render( 0, joint );
        for( i in 1...points ){
            joints[ i ] = joints[ i ].constrainDistance( joints[ i - 1 ], distance );
            joint = joints[ i ];
            render( i, joint );
        }
    }
}
