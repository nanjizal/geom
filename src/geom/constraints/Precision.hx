package geom.constraints;
/*
    credit: sea_jackel https://stackoverflow.com/questions/23689001/how-to-reliably-format-a-floating-point-number-to-a-specified-number-of-decimal
*/
class Precision {
    public static function floatToStringPrecision( n: Float, prec: Int ){
        if( n==0 ) return "0." + ([for(i in 0...prec) "0"].join("")); //quick return
        var minusSign:Bool = ( n < 0.0 );
        n = Math.abs( n );
        var intPart:Int = Math.floor( n );
        var p = Math.pow( 10, prec );
        var fracPart = Math.round( p*(n - intPart) );
        var buf: StringBuf = new StringBuf();
        if( minusSign ) buf.addChar( "-".code );
        buf.add( Std.string( intPart ) );
        if( fracPart == 0 ){
            buf.addChar( ".".code );
            for( i in 0...prec ) buf.addChar( "0".code );
        } else {
            buf.addChar( ".".code );
            p = p/10;
            var nZeros:Int = 0;
            while( fracPart < p ){
                p = p/10;
                buf.addChar( "0".code );
            }
            buf.add(fracPart);
        }
        return buf.toString();
    }
    public static inline
    function max4( f0: Float, f1: Float, f2: Float, f3: Float ): Int {
        return Math.round( Math.max( Math.max( Math.max( f0, f1 ), f2 ), f3 ) );
    }
    public static inline
    function max3( f0: Float, f1: Float, f2: Float ): Int {
        return Math.round( Math.max( Math.max( f0, f1 ), f2 ) );
    }
}