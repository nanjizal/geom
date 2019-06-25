package geom;
@:enum
abstract Trit( Float ) from Float to Float {
    var negative = -1.;
    var zero     = 0.;
    var positive = 1.;
}
/**
 * Like boolean but 3 state with a changed variable so updates are only done when required.
 **/
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