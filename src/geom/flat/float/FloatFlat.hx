package geom.flat.float;
// arr[0] defines pos the position, pos is used to get items
// arr[1] defines size used.
// DON'T use this one directly!!
@:forward
abstract FloatFlat( Array<Float> ){
    
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
        this[1] = 0.; // init useful size
    }
    public var size( get, set ): Int;
    inline
    function get_size(): Int {
        return Std.int( this[ 1 ] );
    }
    // set to make sure compiler does no just use the set value.
    inline
    function set_size( id: Int ): Int {
        pos = cast id;
        return id;
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
        if( this[ 0 ] > ( this[ 1 ] - 1 ) ) {
            this[ 1 ] = this[ 0 ];
        }
    }
    public inline
    function hasNext() return pos < get_size();
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
        return this.slice( 2, get_size() + 2 );
    }
    @:to
    public inline
    function toArray(): Array<Float> {
        return this.slice( 2, get_size() + 2 );
    }
    @:from
    public static inline
    function fromArray( arr: Array<Float> ): FloatFlat {
        var flat = new FloatFlat( arr.length );
        flat.fill( arr );
        return flat;
    }
    public inline
    function clone(): FloatFlat {
        var flat = new FloatFlat( this.length - 2 );
        flat.fill( toArray() );
        return flat;
    }
    public inline
    function fill( arr: Array<Float> ){
        var l = arr.length;
        for( i in 0...l ){
            this[ i + 2 ] = arr[ i ];
        }
        this[ 0 ] = 0;
        this[ 1 ] = l;
    }
}
