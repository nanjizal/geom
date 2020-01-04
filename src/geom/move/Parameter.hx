package geom.move;
import geom.move.Trinary;

class Parameter {
    public var step = 0.005;
    public var value = 0.;
    public var trinary = new Trinary( 0. );
    public function new(){
    }
    public inline
    function update( v: Trit ){
        trinary.trit = v;
        if( trinary.changed ){
            if( v == zero ){
                value = 0.;
            } else {
                var f: Float = v;
                value = -f*step;
            }
        }
    }
}
