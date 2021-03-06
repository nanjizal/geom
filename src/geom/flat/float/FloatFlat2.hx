package geom.flat.float;
@:forward
abstract FloatFlat2( FloatFlat ) {
    @:op([]) public inline 
    function readItem( k: Int ): Float {
      return  this.readItem( index*2 + k );
    }
    @:op([]) public inline 
    function writeItem( k: Int, v: Float ): Float {
        this.writeItem( index*2 + k, v );
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
        return this.slice( 2, this.size*2 + 2 );
    }
}
