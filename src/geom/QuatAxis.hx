package geom;
import geom.Trinary;
/**
Under development
**/
class QuatAxis {
    public static var stepSize = 0.001;
    var xAxis = Quaternion.unit();
    var yAxis = Quaternion.unit();
    var zAxis = Quaternion.unit();
    var xTrinary = new Trinary( 0. );
    var yTrinary = new Trinary( 0. );
    var zTrinary = new Trinary( 0. );
    public inline
    function rotateDx( v: Trit ){
        xTrinary.trit = v;
        if( xTrinary.changed ){
            if( v == zero3 ){
                xAxis = Quaternion.unit();
            } else {
                var f: Float = v;
            //xAxis = Quaternion.createFromAxisAngle( 1., 0., 0., f*Math.PI/200 );
                //xAxis = Quaternion.unit().slerp( Quaternion.xPIhalf(), stepSize * f  );
            
                xAxis = Quaternion.unit().slerp( Quaternion.yRotate( Math.PI ), stepSize * f );
            
            //Quaternion.lerp( Quaternion.unit(), Quaternion.xPIhalf(), stepSize * f  );
            //
            }
        }
    }
    public inline
    function rotateDy( v: Trit ){
        yTrinary.trit = v;
        if( yTrinary.changed ){

            var f: Float = v;
            //yAxis = Quaternion.createFromAxisAngle( 0., 1., 0., f*Math.PI/200 );
            yAxis = Quaternion.unit().slerp( Quaternion.yPIhalf(), stepSize * f  );
            //Quaternion.lerp( Quaternion.unit(), Quaternion.yPIhalf(), stepSize * f  );
            //
            
        }
    }
    public inline
    function rotateDz( v: Trit ){
        zTrinary.trit = v;
        if( zTrinary.changed ){

            var f: Float = v;
            //zAxis = Quaternion.createFromAxisAngle( 0., 0., 1., f*Math.PI/200 );
            zAxis = Quaternion.unit().slerp( Quaternion.zPIhalf(), stepSize * f  );
            //Quaternion.lerp( Quaternion.unit(), Quaternion.zPIhalf(), stepSize * f  );
            //
            
        }
    }
    var m4x3: Matrix4x3;
    public function new(){
        m4x3 = Matrix4x3.unit();
    }
    public inline
    function updateCalculate( m: Matrix4x3 ) {
        //if( xTrinary.changed || yTrinary.changed || zTrinary.changed ){
            // This is not the right way :(
            var quat = zAxis*yAxis*xAxis;
            quat.normalize();
            m4x3 = quat;
            //}
        return m4x3 * m;
    }
}