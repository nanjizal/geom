package geom.constraints;
import geom.matrix.Matrix1x4;
// reference
// Johnathon Selstad
// @JohnSelstad
// https://git.io/fjfK1
class Inner{
    public var point:    Matrix1x4;
    var distance: Float;
    public function new( x: Float, y: Float, distance_: Float ){
        point = new Matrix1x4( {x:x, y:y, z:0., w:1.} );
        distance = distance_;
    }
    inline
    public function update( anchor: Matrix1x4 ){
        var toNext = anchor - point;
        if( toNext.magnitude > distance ) {
            point = point.constrainDistance( anchor, distance );
        }
    }
}
