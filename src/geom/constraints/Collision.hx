package geom.constraints;
import geom.matrix.Matrix1x4;
// reference
// Johnathon Selstad
// @JohnSelstad
// https://git.io/fjf1x
class Collision{
    var joints      = new Array<Matrix1x4>();
    var points:     Int;
    var distance:   Float;
    var circleSize: Float;
    var x:          Float;
    var y:          Float;
    public function new( x_: Float, y_: Float
                        , points_: Int
                        , circleSize_: Float, collisionArea: Float
                        , distance_: Float ){
        x = x_;
        y = y_;
        distance    = distance_;
        points      = points_;
        circleSize  = circleSize_;
        for( i in 0...points ) {
            var x0 = x/2 + collisionArea*Math.random();
            var y0 = y/2 + collisionArea*Math.random();
            joints[ i ] = new Matrix1x4( { x: x0, y: y0, z: 0., w: 1. } );
        }
    }
    inline
    public function update( anchor: Matrix1x4, render: ( i: Int, joint: Matrix1x4 ) -> Void  ){
        // separate from mouse
        var joint: Matrix1x4;
        var mouseEdge = 2;
        var radius = distance + mouseEdge + circleSize/2;
        for( i in 0...points ) {
            joint = joints[ i ];
            var toNext = anchor - joint;
            if( toNext.magnitude < radius ){
                toNext.magnitude = radius;
                var offset = ( anchor - joint ) - toNext ;
                joints[ i ] = joint + offset;
            }
        }
        // separate balls
        var other: Matrix1x4;
        for( i in 0...points ) for( j in i...points ) {
            joint = joints[ i ];
            other = joints[ j ];
            var toNext = other - joint;
            if( toNext.magnitude < circleSize*2 ){
                toNext.magnitude = circleSize*2;
                var offset = ( other - joint ) -  0.5 * toNext ;
                joints[ i ] = joint + offset ;
                joints[ j ] = other - offset;
            }
        }
        for( i in 0...points ) render( i, joints[ i ] );
    }
}
