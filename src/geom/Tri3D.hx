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
}
