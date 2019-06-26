package geom;
import geom.Trinary;

class QuatAxis {
    public static var stepSize = 0.01;
    var dualQuaternion: DualQuaternion;
    var m4x3: Matrix4x3;
    var xAxis = 0.;
    var yAxis = 0.;
    var zAxis = 0.;
    var tx    = 0.;
    var ty    = 0.;
    var tz    = 0.;
    var rxTrinary = new Trinary( 0. );
    var ryTrinary = new Trinary( 0. );
    var rzTrinary = new Trinary( 0. );
    var txTrinary = new Trinary( 0. );
    var tyTrinary = new Trinary( 0. );
    var tzTrinary = new Trinary( 0. );
    public inline
    function pitch( v: Trit ){
        rotateAroundX( v );
    }
    public inline
    function rotateAroundX( v: Trit ){
        rxTrinary.trit = v;
        if( rxTrinary.changed ){
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
        ryTrinary.trit = v;
        if( ryTrinary.changed ){
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
        rzTrinary.trit = v;
        if( rzTrinary.changed ){
            if( v == zero ){
                zAxis = 0.;
            } else {
                var f: Float = v;
                zAxis = f*stepSize;
            }
        }
    }
    public inline
    function alongX( v: Trit ){
        txTrinary.trit = v;
        if( txTrinary.changed ){
            if( v == zero ){
                tx = 0.;
            } else {
                var f: Float = v;
                tx = f*stepSize;
            }
        }
    }
    public inline
    function alongY( v: Trit ){
        tyTrinary.trit = v;
        if( tyTrinary.changed ){
            if( v == zero ){
                ty = 0.;
            } else {
                var f: Float = v;
                ty = f*stepSize;
            }
        }
    }
    public inline
    function alongZ( v: Trit ){
        tzTrinary.trit = v;
        if( tzTrinary.changed ){
            if( v == zero ){
                tz = 0.;
            } else {
                var f: Float = v;
                tz = f*stepSize;
            }
        }
    }
    
    public function new(){}
    public inline
    function updateCalculate( m: Matrix4x3 ) {
        if( rxTrinary.changed || ryTrinary.changed || rzTrinary.changed ){
            // create Quaternion
            var quat = Quaternion.fromYawPitchRoll( yAxis, xAxis, zAxis );
            // convert to matrix
            m4x3 = quat;
            // apply to current matrix
            m = m4x3 * m;
        }
        return m;
    }
    // translate test - work in progress.
    /*
    public function new(){}
    public 
    function updateCalculate( m: Matrix4x3 ) {
        if( tzTrinary.changed ){
            var qReal = Quaternion.zeroNormal();
            var mDual = new Matrix1x4( { x: 0., y: tz, z: 0., w: 1. } );
            dualQuaternion = DualQuaternion.create( qReal, mDual );
            m4x3 = dualQuaternion;
            return m4x3 * m;
        } else {
            return m;
        }
    }
    */
}