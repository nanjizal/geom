package geom.flat;
@:forward
abstract FloatFlat4( FloatFlat ) {
    @:op([]) public inline 
    function readItem( k: Int ): Float {
      return  this.readItem( index*4 + k );
    }
    @:op([]) public inline 
    function writeItem( k: Int, v: Float ): Float {
        this.writeItem( index*4 + k, v );
        return v;
    }
    public inline 
    function new( len: Int ){
        this = new Array<Float>();
    }
    public var index( get, set ): Int;
    inline
    function get_index(): Int {
        return this.index;
    }
    inline
    function set_index( id: Int ): Int {
        this.index = id;
        return id;
    }
    public inline
    function getArray(): Array<Float> {
        return this.slice( 2, this.length*4 + 2 );
    }
}
