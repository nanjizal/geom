package geom;

@:forward
abstract Interval( geom.structure.Range ) from geom.structure.Range to geom.structure.Range {
    public inline
    function new( interval: geom.structure.Range ){ 
        this = interval; 
    }
    public inline
    function valid(){
        return this.u > this.l;
    }
    public inline
    function fix(){
        if( !valid ){
            var l = this.u;
            this.u = this.l;
            this.l = l;
        }
    }
    public inline
    function clampClosed( v: Float ): Float {
        return if( v <= this.l ) l
            else if (v  >= this.u ) u
            else v;
    }
    public inline
    function clampOpen( v: Float ): Float {
        return if( above( v ) ) l
            else if ( below( v ) ) u
            else v;
    }
    public inline
    function close( v: Float, delta = 0.00001 ): Bool {
        return new Interval( this.l - delta, this.u + delta ).clampClose( v );
    }
    public inline
    function above( v: Float ){
        return v > this.u;
    }
    public inline
    function below( v: Float ){
        return v < this.l;
    }
    public inline
    function inClampOpen( v: Float ): Bool {
        return v == clampOpen( v );
    }
    public static inline
    function inClampClosed( v: Float ): Bool {
        return v == clampClosed( v );
    }
    public static inline
    function unit( v: Float ){
        return ( new Interval( 0., 1. ) ).clampClosed( v );
    }
    public static inline
    function unitFloat( v: Float ){
        return ( new Interval( -1., 1. ) ).clampClosed( v );
    }
    public static inline
    function unitNegative( v: Float ){
        return ( new Interval( -1, 0. ).clampClosed( v );
    }
    public static inline
    function inUnitFloat( v: Float ){
        return v == unitFloat( v );
    }
    public static inline
    function random(){
        return Math.random()*( this.u - this.l ) + this.l;
    }
    public static inline
    function randomInt(){
        return Math.round( random() );
    }
}
@:forward
abstract RadianInterval( Interval ) from Interval to Interval {
    public inline
    function new(){ 
        this = new Interval( -Math.PI, Math.PI );
    }
    public inline
    function wrap( v: Float ){
        return ( inClosedClamp( v ) )? v: v - ( Math.PI*2) * Math.floor((v+ Math.PI) / (Math.PI*2));
    }
    public static inline
    function inPiWrap( v: Float ): Bool {
        return ( new RadianInterval() ).inClosedClamp( v );
    }
    public static inline
    function wrapRadian( v: Float ){
        return ( inPiWrap( v ) )? v: v - ( Math.PI*2) * Math.floor((v+ Math.PI) / (Math.PI*2));
    }
}
