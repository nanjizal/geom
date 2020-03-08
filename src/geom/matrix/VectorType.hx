package geom.matrix;
// Probably completely useless, idea was to allow abstraction above Matrix1x.. 
// but currently just helps document expected non static commonallity.
typedef VectorType<T> = {
    public var x: Float; 
    public var y: Float;
    public var ?z: Float; 
    public var ?w: Float;
    //-------------------
    // Common Functionality  
    //-------------------
    function clone(): T;
    function iterator(): Iterator<Float>;
    var self( get, never ): T;
    //-------------------
    // Common Magnitude  
    //-------------------
    var magnitude( get, set ): Float;
    function normalize(): T;
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
    function isEqual( b: T ): Bool;
    //function dotMultiply( b: T ): T;
    //function divideScalar( b: T ): T;
    //-------------------
    // Common Access  
    //------------------- 
    function readItem( k: Int ): Float;
    function writeItem( k: Int, v: Float ): Float;
    //-------------------
    // Common Conversions  
    //-------------------
    function staticFromVec( vec: haxe.ds.Vector<Float> ): T;
    function toVector(): haxe.ds.Vector<Float>;
    function staticFromArray( arr: Array<Float> ): T;
    function toArray(): Array<Float>;
}