package geom.flat; 
@:forward
abstract IntFlat7( IntFlat ) {
    @:op([]) public inline 
    function readItem( k: Int ): Int {
      return this.readItem( pos*7 + k );
    }
    @:op([]) public inline 
    function writeItem( k: Int, v: Int ): Int {
        this.writeItem( pos*7 + k, v );
        return v;
    }
    public inline 
    function new( len: Int ){
        this = new IntFlat( len );
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
    function getArray(): Array<Int> {
        return this.slice( 2, this.length*7 + 2 );
    }
}
