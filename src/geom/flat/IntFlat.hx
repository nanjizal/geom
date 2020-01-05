package geom.flat;
// arr[0] defines pos the position, pos is used to get items
// arr[1] defines length populated
@:forward
abstract IntFlat( Array<Int> ) to Array<Int> from Array<Int> {
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
        this = new Array<Int>();
        this[0] = 0; // init iteratior no.
        this[1] = 0; // init useful length
    }
    public var length( get, never ): Int;
    inline function get_length(): Int {
        return this[ 1 ];
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
    function hasNext() return pos < get_length();
    public inline
    function next(): Float {
        pos = pos + 1;
        return pos;
    }
    @:op(A++) public inline
    function increment() {
        return next();
    }
    public inline
    function getArray(): Array<Int> {
        return this.slice( 2, this.length - 1 );
    }
}
