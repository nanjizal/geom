package geom.ga;
// https://www.euclideanspace.com/maths/algebra/clifford/d2/arithmetic/index.htm
/**
   { s, x, y, z, xy, zx, yz, xyz }
**/
@:forward
abstract MultiVector2( geom.structure.MVec2) from geom.structure.MVec2 to geom.structure.MVec2 {
    public inline
    function new( m: geom.structure.MVec2 ){ this = m; }
    /**
     * <pre><code>
     * >>> MultiVector2.zero == new MultiVector2({ s:0., x:0., y:0., xy:0. })
     * </code></pre>
     */
    public static var zero( get, never ): MultiVector2;
    static inline
    function get_zero(): MultiVector2 {
        return new MultiVector2({ s:0., x:0., y:0., xy:0. });
    }
    var nought( get, never ): MultiVector2;
    inline
    function get_nought(): MultiVector2{
        return zero;
    }
    @:op(A - B) public static inline
    function subtracting( a: MultiVector2, b: MultiVector2 ): MultiVector2 {
        return a.subtract( b );
    }
    public inline
    function subtract( b: MultiVector2 ): MultiVector2 {
        return new MultiVector2({ s: this.s - b.s
                                , x: this.x - b.x
                                , y: this.y - b.y
                                , xy: this.xy - b.xy });
    }
    @:op(A + B) public static inline
    function adding( a: MultiVector2, b: MultiVector2 ): MultiVector2 {
      	return a.add( b );
    }
    public inline
    function add( b: MultiVector2 ): MultiVector2 {
        return new MultiVector2({ s: this.s + b.s
                                , x: this.x + b.x
                                , y: this.y + b.y
                                , xy: this.xy + b.xy });
    }
    @:op(A * B) public static inline
    function multiplying( a: MultiVector2, b: MultiVector2 ): MultiVector2 {
        return a.multiply( b );
    }
    public inline
    function multiply( b: MultiVector2 ): MultiVector2 {
        return new MultiVector2({ s:   this.s * b.s  + this.x * b.x  + this.y * b.y  - this.xy * b.xy
                                 , x:  this.x * b.s  + this.s * b.x  - this.xy * b.y + this.y * b.xy
                                 , y:  this.y * b.s  + this.xy * b.x + this.s * b.y  - this.x * b.xy
                                 , xy: this.xy * b.s + this.y * b.x  - this.x * b.y  + this.s * b.xy });
    }
}