package geom.ga;
/**
   { s, x, y, z, xy, zx, yz, xyz }
**/
@:forward
abstract MultiVector3( geom.structure.MVec3) from geom.structure.MVec3 to geom.structure.MVec3 {
    public inline
    function new( m: geom.structure.MVec3 ){ this = m; }
    /**
     * <pre><code>
     * >>> MultiVector3.zero == new MultiVector3({ s:0., x:0., y:0., z:0., xy:0., zx:0., yz:0., xyz:0. })
     * </code></pre>
     */
    public static var zero( get, never ): MultiVector3;
    static inline
    function get_zero(): MultiVector3 {
        return new MultiVector3({ s:0., x:0., y:0., z:0., xy:0., zx:0., yz:0., xyz:0. });
    }
    var nought( get, never ): MultiVector3;
    inline
    function get_nought(): MultiVector3{
        return zero;
    }
    @:op(A - B) public static inline
    function subtracting( a: MultiVector3, b: MultiVector3 ): MultiVector3 {
        return a.subtract( b );
    }
    public inline
    function subtract( b: MultiVector3 ): MultiVector3 {
        return new MultiVector3({ s: this.s - b.s
                                , x: this.x - b.x
                                , y: this.y - b.y
                                , z: this.z - b.z
                                , xy: this.xy - b.xy
                                , zx: this.zx - b.zx 
                                , yz: this.yz - b.yz 
                                , xyz: this.xyz - b.xyz });
    }
    @:op(A + B) public static inline
    function adding( a: MultiVector3, b: MultiVector3 ): MultiVector3 {
      	return a.add( b );
    }
    public inline
    function add( b: MultiVector3 ): MultiVector3 {
        return new MultiVector3({ s: this.s + b.s
                                , x: this.x + b.x
                                , y: this.y + b.y
                                , z: this.z + b.z
                                , xy: this.xy + b.xy
                                , zx: this.zx + b.zx 
                                , yz: this.yz + b.yz 
                                , xyz: this.xyz + b.xyz });
    }
    @:op(A * B) public static inline
    function multiplying( a: MultiVector3, b: MultiVector3 ): MultiVector3 {
        return a.multiply( b );
    }
    public inline
    function multiply( b: MultiVector3 ): MultiVector3 {
        return new MultiVector3({ s: this.s * b.s + this.x * b.x + this.y * b.y + this.z * b.z 
                                    - this.xy * b.xy - this.zx * this.zx - this.yz * b.yz 
                                    - this.xyz * b.xyz
                                 , x: this.x * b.s + this.s * b.x 
                                    - this.xy * b.y + this.zx * b.z + this.y * b.xy 
                                    - this.z * b.zx - this.xyz * b.yz - this.yz * b.xyz
                                 , y: this.y * b.s + this.xy * b.x 
                                    + this.s * b.y - this.yz * b.z 
                                    - this.x * b.xy - this.xyz * b.zx 
                                    + this.z * b.yz - this.zx * b.xyz
                                 , z: this.z * b.s - this.zx * b.x 
                                    + this.yz * b.y + this.s * b.z
                                    - this.xyz * b.xy + this.x * b.zx
                                    - this.y * b.yz - this.xy * b.xyz
                                 , xy: this.xy * b.s + this.y * b.x 
                                    - this.x * b.y + this.xyz * b.z + this.s * b.xy
                                    + this.yz * b.zx - this.zx * b.yz + this.z * b.xyz
                                 , zx: this.zx * b.s - this.z * b.x
                                    + this.xyz * b.y + this.x * b.z
                                    - this.yz * b.xy + this.s * b.zx
                                    + this.xy * b.yz + this.y * b.xyz 
                                 , yz: this.yz * b.s + this.xyz * b.x
                                    + this.z * b.y - this.y * b.z
                                    + this.zx * b.xy - this.xy * b.zx
                                    + this.s * b.yz + this.x * b.xyz
                                 , xyz: this.xyz * b.s + this.yz * b.x
                                    + this.zx * b.y + this.xy * b.z
                                    + this.z * b.xy + this.y * b.zx
                                    + this.x * b.yz + this.s * b.xyz });
    }
}