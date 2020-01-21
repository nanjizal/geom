package geom.flat.float;
// arr[0] defines pos the position, pos is used to get items
// arr[1] defines length used.
// DON'T use this one directly!!
@:forward
abstract FloatFlat( Array<Float> ) to Array<Float> from Array<Float> {
    
    @:op([]) //@:arrayAccess
    public inline
    function readItem( k: Int ): Float {
      return this[ k + 2 ];
    }
    @:op([]) //@:arrayAccess
    public inline
    function writeItem( k: Int, v: Float ): Float {
        this[ k + 2 ] = v;
        return v;
    }
    
    public inline
    function new( len: Int ){
        this = new Array<Float>();
        this[0] = 0.; // init iteratior no.
        this[1] = 0.; // init useful length
    }
  	//var self(get,never):ArrayColor;
    //function get_self() return (cast this : ArrayColor);
    /* old length 
    public var length( get, never ): Int;
    inline function get_length(): Int {
        var l = this.length - 1;
        return ( l < 0 )? 0: Math.ceil( l / 4 );
    }*/
    public var length( get, never ): Int;
    inline
    function get_length(): Int {
        return Std.int( this[ 1 ] );
    }
    public var index( get, set ): Int;
    inline
    function get_index(): Int {
        return Std.int( pos );
    }
    inline
    function set_index( id: Int ): Int {
        pos = id;
        return id;
    }
    public var pos( get, set ): Float;
    inline
    function get_pos(): Float {
        return this[ 0 ];
    }
    inline
    function set_pos( pos_: Float ): Float {
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
        pos = pos + 1.;
        return pos;
    }
    @:op(A++) public inline
    function increment() {
        return next();
    }
    public inline
    function getArray(): Array<Float> {
        return this.slice( 2, get_length() + 2 );
    }
}
