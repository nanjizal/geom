package geom.flat.i32;
import haxe.io.Int32Array; // js.lib.Int32Array
// arr[0] defines pos the position, pos is used to get items
// arr[1] defines size used.
@:forward
abstract Int32Flat( Int32Array ) {
    @:op([]) //@:arrayAccess
    public inline
    function readItem( k: Int ): Int {
      return this[ k + 2 ];
    }
    @:op([]) //@:arrayAccess
    public inline
    function writeItem( k: Int, v: Int ): Int {
        this[ k + 2 ] = v;
        return v;
    }
    public inline
    function new( len: Int ){
        this = new Int32Array( len + 2 );
        this[0] = 0; // init iteratior no.
        this[1] = 0; // init useful size
    }
    public var size( get, set ): Int;
    inline function get_size(): Int {
        return this[ 1 ];
    }
    // set to make sure compiler does no just use the set value.
    inline
    function set_size( id: Int ): Int {
        pos = cast id;
        return id;
    }
    public var pos( get, set ): Int;
    inline
    function get_pos(): Int {
        return this[ 0 ];
    }
    inline
    function set_pos( pos_: Int ): Int {
        this[ 0 ] = pos_;
        updateLen();
        return pos_;
    }
    inline function updateLen() {
        if( this[ 0 ] > this[ 1 ] ) this[ 1 ] = this[ 0 ];
    }
    public inline
    function hasNext() return pos < get_size();
    public inline
    function next(): Int {
        pos = pos + 1;
        return pos;
    }
    @:op(A++) public inline
    function increment() {
        return next();
    }
    @:to
    public inline
    function toArray(): Int32Array {
        return this.subarray( 2, get_size() + 2 );
    }
    @:from
    public static inline
    function fromArray( arr: Int32Array ): Int32Flat {
        var flat = new Int32Flat( arr.length );
        flat.fill( arr );
        return flat;
    }
    public inline
    function clone(): Int32Flat {
        var flat = new Int32Flat( this.length - 2 );
        flat.fill( toArray() );
        return flat;
    }
    public inline
    function fill( arr: Int32Array ){
        var l = arr.length;
        for( i in 0...l ){
            this[ i + 2 ] = arr[ i ];
        }
        this[ 0 ] = 0;
        this[ 1 ] = l;
    }
}
