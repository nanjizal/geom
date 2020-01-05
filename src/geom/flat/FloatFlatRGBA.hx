package geom.flat;
import flat.FloatFlat4;
@:forward
abstract FloatFlatRGBA( Float32Flat4 ){
    public inline
    function new( len: Int ){
        this = new FloatFlat4( len );
    }
    public var red( get, set ): Float;
    function get_red(): Float {
        return this[ 0 ];
    }
    function set_red( v: Float ): Float {
        this[ 0 ] = v;
        return v;
    }
    
    public var green( get, set ): Float;
    inline
    function get_green(): Float {
        return this[ 1 ];
    }
    inline
    function set_green( v: Float ): Float {
        this[ 1 ] = v;
        return v;
    }
    public var blue( get, set ): Float;
    inline
    function get_blue(): Float {
        return this[ 2 ];
    }
    inline
    function set_blue( v: Float ): Float {
        this[ 2 ] = v;
        return v;
    }
    public var alpha( get, set ): Float;
    inline
    function get_alpha(): Float {
        return this[ 3 ];
    }
    inline
    function set_alpha( v: Float ): Float {
        this[ 3 ] = v;
        return v;
    }
    public var rgb( get, set ): Int;
    inline
    function set_rgb( col: Int ): Int {
        red   = redChannel( col );
        blue  = blueChannel( col );
        green = greenChannel( col );
        alpha = 1.;
        return col;
    }
    inline
    function get_rgb():Int {
        return     Math.round( blue  * 255 )
               | ( Math.round( green * 255 ) << 8 ) 
               | ( Math.round( red   * 255 ) << 16 );
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
        return    ( Math.round( alpha * 255 ) << 24 ) 
                | ( Math.round( red   * 255 ) << 16) 
                | ( Math.round( green * 255 ) << 8) 
                |   Math.round( blue  * 255 );
    }
    @:op([])
    public inline
    function readItem( k: Int ): Float {
      return this.readItem( k );
    }
    @:op([])
    public inline
    function writeItem( k: Int, v: Float ): Float {
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
        var str = 'FloatFlatRGBA: \n';
        for( i in 0...this.length ) {
            str += hex() + '\n' ;
            this.next();
        }
        this.pos = 0;
        return str;
    }
    public static inline
    function alphaChannel( int: Int ) : Float
        return ((int >> 24) & 255) / 255;
    public static inline
    function redChannel( int: Int ) : Float
        return ((int >> 16) & 255) / 255;
    public static inline
    function greenChannel( int: Int ) : Float
        return ((int >> 8) & 255) / 255;
    public static inline
    function blueChannel( int: Int ) : Float
        return (int & 255) / 255;
}
