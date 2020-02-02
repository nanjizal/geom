package geom.flat.ui16;
import haxe.io.UInt16Array; // js.lib.Int16Array
// arr[0] defines pos the position, pos is used to get items
// arr[1]
// arr[2] defines length used. 0xFFFF0000
// arr[3] defines length used. 0x000FFFFF;
@:forward
abstract UInt16Flat( UInt16Array ) {
    @:op([]) //@:arrayAccess
    public inline
    function readItem( k: Int ): UInt {
      return this[ k + 4 ];
    }
    @:op([]) //@:arrayAccess
    public inline
    function writeItem( k: Int, v: UInt ): UInt {
        this[ k + 4 ] = v;
        return v;
    }
    public inline
    function new( len: Int ){
        this = new UInt16Array( len + 4 );
        this[0] = 0; // init iteratior no.
        this[1] = 0; 
        this[2] = 0; // init useful length
        this[3] = 0;
    }
    public var length( get, never ): Int;
    inline function get_length(): Int {
        return getDual16( 2 );
    }
    public var pos( get, set ): Int;
    inline
    function get_pos(): Int {
        return getDual16( 0 );
    }
    inline
    function set_pos( pos_: Int ): Int {
        setPos( pos_ );
        updateLen( pos_ );
        return pos_;
    }
    inline
    function setLength( v: Int ){
        setDual16( 2, v );
    }
    inline
    function setPos( v: Int ){
        setDual16( 0, v );
    }
    inline
    function getDual16( i: Int ){
        return ( this[ i ] << 16 ) + this[ i + 1 ];
    }
    inline
    function setDual16( i: Int, v: Int ){
        this[ i ]     = upper16( v );
        this[ i + 1 ] = lower16( v );
    }
    inline 
    function upper16( v: Int ){
        return v >>> 16;
    }
    inline
    function lower16( v: Int ){
        return v & 0xffff;
    }
    inline function updateLen( pos_: Int ) {
        if( pos_ > get_length() ) setLength( pos_ + 1 );
    }
    public inline
    function hasNext() return pos < get_length();
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
    function toArray(): UInt16Array {
        return this.subarray( 4, this.length + 4 );
    }
    @:from
    public static inline
    function fromArray( arr: UInt16Array ): UInt16Flat  {
        var flat = new UInt16Flat( arr.length );
        flat.fill( arr );
        return flat;
    }
    public inline
    function clone(): UInt16Array  {
        var flat = new UInt16Flat( this.length - 4 );
        flat.fill( toArray() );
        return flat;
    }
    public inline
    function fill( arr: UInt16Array ){
        var l = arr.length;
        for( i in 0...l ){
            this[ i + 4 ] = arr[ i ];
        }
        this[ 0 ] = 0;
        this[ 1 ] = 0;
        setLength( l );
    }
}
