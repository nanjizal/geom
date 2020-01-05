package geom.flat;
import flat.Int32Flat4;
// Not yet tested this version, colours may need some tweaking.
@:forward
abstract Int32FlatRGBA( Int32Flat4 ){
    public inline
    function new( len: Int ){
        this = new Int32Flat4( len );
    }
    public var red( get, set ): Int;
    function get_red(): Int {
        return this[ 0 ];
    }
    function set_red( v: Int ): Int {
        this[ 0 ] = v;
        return v;
    }
    public var green( get, set ): Int;
    inline
    function get_green(): Int {
        return this[ 1 ];
    }
    inline
    function set_green( v: Int ): Int {
        this[ 1 ] = v;
        return v;
    }
    public var blue( get, set ): Int;
    inline
    function get_blue(): Int {
        return this[ 2 ];
    }
    inline
    function set_blue( v: Int ): Int {
        this[ 2 ] = v;
        return v;
    }
    public var alpha( get, set ): Int;
    inline
    function get_alpha(): Int {
        return this[ 3 ];
    }
    inline
    function set_alpha( v: Int ): Int {
        this[ 3 ] = v;
        return v;
    }
    public var rgb( get, set ): Int;
    inline
    function set_rgb( col: Int ): Int {
        red   = redChannel( col );
        blue  = blueChannel( col );
        green = greenChannel( col );
        alpha = 0xFF;
        return col;
    }
    inline
    function get_rgb():Int {
        return    red << 16 
                | green << 8
                | blue;
    }
    public var argb( get, set ): Int;
    inline
    function set_argb( col: Int ): Int {
        red   = redChannel( col );
        blue  = blueChannel( col );
        green = greenChannel( col );
        alpha = alphaChannel( col );
        return col;
    }
    inline
    function get_argb():Int {
        return    alpha << 24 
                | red << 16 
                | green << 8 
                | blue;
    }
    @:op([])
    public inline
    function readItem( k: Int ): Int {
      return this.readItem( k );
    }
    @:op([])
    public inline
    function writeItem( k: Int, v: Int ): Int {
        return this.writeItem( k, v );
    }
    public inline
    function colorTriangles( color: Int, times: Int ){
        for( i in 0...times ) cornerColors( color, color, color );
    }
    public inline
    function cornerColors( colorA: Int, colorB: Int, colorC: Int ) {
        argb = colorA;
        this.next();
        argb = colorB;
        this.next();
        argb = colorC;
        this.next();
    }
    public inline
    function hex(): String {
        return '0x' + StringTools.hex( argb );
    }
    public inline
    function hexAll(){
        this.pos = 0;
        var str = 'Int32FlatRGBA: \n';
        for( i in 0...this.length ) {
            str += hex() + '\n' ;
            this.next();
        }
        this.pos = 0;
        return str;
    }
    public static inline
    function alphaChannel( int: Int ) : Float
        return int >> 24;
    public static inline
    function redChannel( int: Int ) : Float
        return int >> 16;
    public static inline
    function greenChannel( int: Int ) : Float
        return int >> 8;
    public static inline
    function blueChannel( int: Int ) : Float
        return int;
}
