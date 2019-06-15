package geom;
@:enum
abstract Trit( Float ) from Float to Float {
    var negative3 = -1.;
    var zero3     = 0.;
    var positive3 = 1.;
}
class Trinary{
    public var changed: Bool = false;
    public function new( v: Trit ){
        trit = v;
    }
    @:isVar public var trit( get, set ): Trit;
    function set_trit( v: Trit ): Trit {
        if( trit == v ){
            changed = false;
        } else {
            this.trit = v;
            changed = true;
        }
        return v;
    }
    function get_trit(): Trit {
        return trit;
    }
}