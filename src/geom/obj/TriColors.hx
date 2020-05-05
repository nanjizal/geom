package geom.obj;
import geom.structure.TriInt;
@:forward
abstract TriColors( geom.structure.TriInt ) to geom.structure.TriInt from geom.structure.TriInt {
    public function new( ti: geom.structure.TriInt){ this = ti; }
}