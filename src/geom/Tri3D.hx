package geom;
#if avoid_typedef
class TriVec(){
    public var a: Matrix1x4;
    public var b: Matrix1x4;
    public var c: Matrix1x4;
    public function new( a: Matrix1x4, b: Matrix1x4, c: Matrix1x4 ){
        this.a = a;
        this.b = b;
        this.c = c;
    }
}
#else
typedef TriVec = {
   var a: Matrix1x4;
   var b: Matrix1x4;
   var c: Matrix1x4;
}
#end
@:forward
abstract Tri3D( TriVec ) to TriVec from TriVec {
    public function new( tv: TriVec ){
        this = tv;
    }
    @:op(A + B)
    @:communative
    public static inline
    function add( tv: TriVec, p: Matrix1x4 ){
        return new Tri3D(tv.a + p, tv.b + p, tv.c + p );
    }
    @:op(A - B)
    public static inline
    function sub( tv: TriVec, p: Matrix1x4 ){
        return new Tri3D(tv.a - p, tv.b - p, tv.c - p );
    }
    @:op(A * B)
    public static inline
    function scaleMultiply( tv: TriVec, p: Matrix1x4 ){
        return new Tri3D(tv.a * p, tv.b * p, tv.c * p );    
    }
    public inline 
    function centre(): Matrix1x4 {
        return ( this.a + this.b + this.c )/3;
    }
    // Quaterion rotation
    // maybe better approach
    public inline
    function multiplyQ( q: Matrix1x4 ):Matrix1x4 {
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
