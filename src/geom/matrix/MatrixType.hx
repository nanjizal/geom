package geom.matrix;
// Probably completely useless, idea was to allow abstraction above some of the Matrix abstracts
// but currently just helps document expected non static commonallity, @: VectorType 
typedef MatrixType<T> = {
    public var a: Float; public var b: Float; public var ?c: Float; public var ?d: Float;
    public var ?e: Float; public var ?f: Float; public var ?g: Float; public var ?h: Float;
    public var ?i: Float; public var ?j: Float; public var ?k: Float; public var ?l: Float;
    public var ?m: Float; public var ?n: Float; public var ?o: Float; public var ?p: Float;
    //-------------------
    // Common Functionality  
    //-------------------
    function clone(): T;
    //?function transpose(): T;
    function iterator(): Iterator<Float>;
    var self( get, never ): T;
    //-------------------
    // Common Constants  
    //-------------------
    var nought( get, never ): T;
    var one( get, never): T;
    var testCount( get, never ): T;
    //-------------------
    // Common operators  
    //-------------------
    function negate(): T;
    function add( b: T ): T;
    function subtract( b: T ): T;
    function multiplyScale( b: T ): T;
    function multiply( b: T ): T;
    function isEqual( b: T ):Bool;
    //-------------------
    // Common Access  
    //------------------- 
    function setXY( x: Int, y: Int, v: Float  ): Float;
    function getXY( x: Int, y: Int ): Float;
    //-------------------
    // Common Conversions  
    //-------------------
    function staticFromVec( vec: haxe.ds.Vector<Float> ): T;
    function toVector(): haxe.ds.Vector<Float>;
    function staticFromArray( arr: Array<Float> ): T;
    function toArray():Array<Float>;
}