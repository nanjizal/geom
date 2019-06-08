package geom;
@:forward
abstract Tri3D( geom.structure.TriVec ) to geom.structure.TriVec from geom.structure.TriVec {
    public function new( tv: geom.structure.TriVec ){ this = tv; }
    @:op(A + B) public static inline
    function add0( tv: Tri3D, p: Matrix1x4 ): Tri3D {
        return new Tri3D( { a: tv.a + p, b: tv.b + p, c: tv.c + p } );
    }
    @:op(A + B) public static inline
    function add1( p: Matrix1x4, tv: Tri3D ): Tri3D {
        return new Tri3D( { a: tv.a + p, b: tv.b + p, c: tv.c + p } );
    }
    @:op(A - B) public static inline
    function sub( tv: Tri3D, p: Matrix1x4 ): Tri3D {
        return new Tri3D( { a: tv.a - p, b: tv.b - p, c: tv.c - p } );
    }
    @:op(A * B) public static inline
    function scaleMultiply( tv: Tri3D, p: Matrix1x4 ): Tri3D {
        return new Tri3D( { a: tv.a * p.x, b: tv.b * p.y, c: tv.c * p.z } );    
    }
    public inline 
    function centre(): Matrix1x4 {
        return ( this.a + this.b + this.c )/3;
    }
    // Quaterion rotation
    // maybe better approach
    public inline
    function multiplyQ( q: Matrix1x4 ): Tri3D {
        var cp = centre();
        var a2 = this.a - cp;
        var b2 = this.b - cp;
        var c2 = this.c - cp;
        var aout = Matrix1x4.unit();
        var bout = Matrix1x4.unit();
        var cout = Matrix1x4.unit();
        Matrix1x4.multiplyQ( q, a2, aout ); 
        Matrix1x4.multiplyQ( q, b2, bout );
        Matrix1x4.multiplyQ( q, c2, cout );
        a2 = aout + cp;
        b2 = bout + cp;
        c2 = bout + cp;
        this = new Tri3D( { a: a2, b: b2, c: c2 } );
        return this;
    }
}
