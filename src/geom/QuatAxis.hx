package geom;
import geom.Trinary;
class QuatAxis {
    public static var stepSize = 0.01;
    var m4x3: Matrix4x3;
    var xAxis = 0.;
    var yAxis = 0.;
    var zAxis = 0.;
    var xTrinary = new Trinary( 0. );
    var yTrinary = new Trinary( 0. );
    var zTrinary = new Trinary( 0. );
    public inline
    function pitch( v: Trit ){
        rotateAroundX( v );
    }
    public inline
    function rotateAroundX( v: Trit ){
        xTrinary.trit = v;
        if( xTrinary.changed ){
            if( v == zero ){
                xAxis = 0.;
            } else {
                var f: Float = v;
                // swap as y is mostly rendered down.
                xAxis = -f*stepSize;
            }
        }
    }
    public inline
    function yaw( v: Trit ){
        rotateAroundY( v );
    }
    public inline
    function rotateAroundY( v: Trit ){
        yTrinary.trit = v;
        if( yTrinary.changed ){
            if( v == zero ){
                yAxis = 0.;
            } else {
                var f: Float = v;
                yAxis = f*stepSize;
            }
        }
    }
    public inline
    function roll( v: Trit ){
        rotateAroundZ( v );
    }
    public inline
    function rotateAroundZ( v: Trit ){
        zTrinary.trit = v;
        if( zTrinary.changed ){
            if( v == zero ){
                zAxis = 0.;
            } else {
                var f: Float = v;
                zAxis = f*stepSize;
            }
        }
    }
    public function new(){}
    public inline
    function updateCalculate( m: Matrix4x3 ) {
        if( xTrinary.changed || yTrinary.changed || zTrinary.changed ){
            // create Quaternion
            var quat = Quaternion.fromYawPitchRoll( yAxis, xAxis, zAxis );
            // convert to matrix
            m4x3 = quat;
            // apply to current matrix
            m = m4x3 * m;
        }
        return m;
    }
}