package geom.flat.ui16;
import haxe.io.UInt16Array; 
@:forward
abstract UInt16Flat4( UInt16Flat ) {
    @:op([]) public inline 
    function readItem( k: Int ): UInt {
      return this.readItem( pos*4 + k );
    }
    @:op([]) public inline 
    function writeItem( k: Int, v: UInt ): UInt {
        this.writeItem( pos*4 + k, v );
        return v;
    }
    public inline 
    function new( len: Int ){
        this = new UInt16Flat( len );
    }
    public var pos( get, set ): UInt;
    inline
    function get_pos(): UInt {
        return this.pos;
    }
    inline
    function set_pos( id: UInt ): UInt {
        this.pos = id;
        return id;
    }
    public inline
    function getArray(): UInt16Array {
        return this.subarray( 4, this.size*4 + 4 );
    }
}
