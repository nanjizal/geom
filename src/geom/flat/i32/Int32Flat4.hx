package geom.flat.i32;
import haxe.io.Int32Array; 
@:forward
abstract Int32Flat4( Int32Flat ) {
    @:op([]) public inline 
    function readItem( k: Int ): Int {
      return this.readItem( pos*4 + k );
    }
    @:op([]) public inline 
    function writeItem( k: Int, v: Int ): Int {
        this.writeItem( pos*4 + k, v );
        return v;
    }
    public inline 
    function new( len: Int ){
        this = new Int32Flat( len );
    }
    public var pos( get, set ): Int;
    inline
    function get_pos(): Int {
        return this.pos;
    }
    inline
    function set_pos( id: Int ): Int {
        this.pos = id;
        return id;
    }
    public inline
    function getArray(): Int32Array {
        return this.subarray( 2, this.size*4 + 2 );
    }
}
