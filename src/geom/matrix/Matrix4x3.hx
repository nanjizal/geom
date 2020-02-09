package geom.matrix;
import haxe.io.Float32Array;
import geom.tydef.*;
/** 
   ![4x3](../../bootstrap/img/matrix4x3.png)
**/
@:forward // treat like 4x4 matrix but don't store last row!
abstract Matrix4x3( geom.structure.Mat4x3 ) from geom.structure.Mat4x3 to geom.structure.Mat4x3 {
    public inline
    function new( m: geom.structure.Mat4x3 ){ this = m; }
    var self(get,never):Matrix4x3;
    inline function get_self() return (cast this : Matrix4x3);
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.zero == new Matrix4x3({ a: 0., b: 0., c: 0., d: 0.
     * ...                                   , e: 0., f: 0., g: 0., h: 0.
     * ...                                   , i: 0., j: 0., k: 0., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var zero( get, never ): Matrix4x3;
    static inline
    function get_zero(): Matrix4x3 {
        return new Matrix4x3({ a: 0., b: 0., c: 0., d: 0.
                             , e: 0., f: 0., g: 0., h: 0.
                             , i: 0., j: 0., k: 0., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... Matrix4x3.unit == new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
     * ...                                   , e: 0., f: 1., g: 0., h: 0.
     * ...                                   , i: 0., j: 0., k: 1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var unit( get, never ): Matrix4x3;
    static inline
    function get_unit(): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: 1., g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.topLeft == new Matrix4x3({ a: -1., b: 0., c: 0., d: 0.
     * ...                                      , e: 0.,  f: 1., g: 0., h: 0.
     * ...                                      , i: 0.,  j: 0., k: 0., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var topLeft( get, never ): Matrix4x3;
    static inline
    function get_topLeft(): Matrix4x3 {
        return new Matrix4x3({ a: -1., b: 0., c: 0., d: 0.
                             , e: 0.,  f: 1., g: 0., h: 0.
                             , i: 0.,  j: 0., k: 0., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.topRight == new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
     * ...                                       , e: 0., f: 1., g: 0., h: 0.
     * ...                                       , i: 0., j: 0., k: 0., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var topRight( get, never ): Matrix4x3;
    static inline
    function get_topRight(): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: 1., g: 0., h: 0.
                             , i: 0., j: 0., k: 0., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.bottomLeft == new Matrix4x3({ a: -1., b: 0.,  c: 0., d: 0.
     * ...                                         , e: 0.,  f: -1., g: 0., h: 0.
     * ...                                         , i: 0.,  j: 0.,  k: 0., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var bottomLeft( get, never ): Matrix4x3;
    static inline 
    function get_bottomLeft(): Matrix4x3 {
         return new Matrix4x3({ a: -1., b: 0.,  c: 0., d: 0.
                              , e: 0.,  f: -1., g: 0., h: 0.
                              , i: 0.,  j: 0.,  k: 0., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.bottomRight == new Matrix4x3({ a: 1., b: 0.,  c: 0., d: 0.
     * ...                                          , e: 0., f: -1., g: 0., h: 0.
     * ...                                          , i: 0., j: 0.,  k: 0., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var bottomRight( get, never ): Matrix4x3;
    static inline
    function get_bottomRight(): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0.,  c: 0., d: 0.
                                 , e: 0., f: -1., g: 0., h: 0.
                                 , i: 0., j: 0.,  k: 0., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.north == new Matrix4x3({ a: 0., b: 0., c: 0., d: 0.
     * ...                                    , e: 0., f: 1., g: 0., h: 0.
     * ...                                    , i: 0., j: 0., k: 0., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var north( get, never ): Matrix4x3;
    static inline
    function get_north(): Matrix4x3 {
        return new Matrix4x3({ a: 0., b: 0., c: 0., d: 0.
                                , e: 0., f: 1., g: 0., h: 0.
                                , i: 0., j: 0., k: 0., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.south == new Matrix4x3({ a: 0., b: 0.,  c: 0., d: 0.
     * ...                                    , e: 0., f: -1., g: 0., h: 0.
     * ...                                    , i: 0., j: 0.,  k: 0., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var south( get, never ): Matrix4x3;
    static inline
    function get_south(): Matrix4x3 {
        return new Matrix4x3({ a: 0., b: 0.,  c: 0., d: 0.
                                , e: 0., f: -1., g: 0., h: 0.
                                , i: 0., j: 0.,  k: 0., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.west == new Matrix4x3({ a: -1., b: 0., c: 0., d: 0.
     * ...                                   , e: 0.,  f: 0., g: 0., h: 0.
     * ...                                   , i: 0.,  j: 0., k: 0., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var west( get, never ): Matrix4x3;
    static inline
    function get_west(): Matrix4x3 {
        return new Matrix4x3({ a: -1., b: 0., c: 0., d: 0.
                             , e: 0.,  f: 0., g: 0., h: 0.
                             , i: 0.,  j: 0., k: 0., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.east == new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
     * ...                                   , e: 0., f: 0., g: 0., h: 0.
     * ...                                   , i: 0., j: 0., k: 0., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var east( get, never ): Matrix4x3;
    static inline
    function get_east(): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: 0., g: 0., h: 0.
                             , i: 0., j: 0., k: 0., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.front == new Matrix4x3({ a: 0., b: 0., c: 0., d: 0.
     * ...                                  , e: 0., f: 0., g: 0., h: 0.
     * ...                                  , i: 0., j: 0., k: 1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var front( get, never ): Matrix4x3;
    static inline
    function get_front(): Matrix4x3 {
        return new Matrix4x3({ a: 0., b: 0., c: 0., d: 0.
                             , e: 0., f: 0., g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.frontNorth == new Matrix4x3({ a: 0., b: 0., c: 0., d: 0.
     * ...                                       , e: 0., f: 1., g: 0., h: 0.
     * ...                                       , i: 0., j: 0., k: 1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var frontNorth( get, never ): Matrix4x3;
    static inline
    function get_frontNorth(): Matrix4x3 {
        return new Matrix4x3({ a: 0., b: 0., c: 0., d: 0.
                             , e: 0., f: 1., g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.frontTopLeft == new Matrix4x3({ a: -1., b: 0., c: 0., d: 0.
     * ...                                         , e: 0.,  f: 1., g: 0., h: 0.
     * ...                                         , i: 0.,  j: 0., k: 1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var frontTopLeft( get, never ): Matrix4x3;
    static inline
    function get_frontTopLeft(): Matrix4x3 {
        return new Matrix4x3({ a: -1., b: 0., c: 0., d: 0.
                             , e: 0.,  f: 1., g: 0., h: 0.
                             , i: 0.,  j: 0., k: 1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.frontTopRight == new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
     * ...                                          , e: 0., f: 1., g: 0., h: 0.
     * ...                                          , i: 0., j: 0., k: 1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var frontTopRight( get, never ): Matrix4x3;
    static inline
    function get_frontTopRight(): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: 1., g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.frontBottomLeft == new Matrix4x3({ a: -1., b: 0.,  c: 0., d: 0.
     * ...                                            , e: 0.,  f: -1., g: 0., h: 0.
     * ...                                            , i: 0.,  j: 0.,  k: 1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var frontBottomLeft( get, never ): Matrix4x3;
    static inline
    function get_frontBottomLeft(): Matrix4x3 {
        return new Matrix4x3({ a: -1., b: 0.,  c: 0., d: 0.
                             , e: 0.,  f: -1., g: 0., h: 0.
                             , i: 0.,  j: 0.,  k: 1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.frontBottomRight == new Matrix4x3({ a: 1., b: 0.,  c: 0., d: 0.
     * ...                                             , e: 0., f: -1., g: 0., h: 0.
     * ...                                             , i: 0., j: 0.,  k: 1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var frontBottomRight( get, never ): Matrix4x3;
    static inline
    function get_frontBottomRight(): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0.,  c: 0., d: 0.
                             , e: 0., f: -1., g: 0., h: 0.
                             , i: 0., j: 0.,  k: 1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.frontSouth == new Matrix4x3({ a: 0., b: 0.,  c: 0., d: 0.
     * ...                                       , e: 0., f: -1., g: 0., h: 0.
     * ...                                       , i: 0., j: 0.,  k: 1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var frontSouth( get, never ): Matrix4x3;
    static inline
    function get_frontSouth(): Matrix4x3 {
        return new Matrix4x3({ a: 0., b: 0.,  c: 0., d: 0.
                             , e: 0., f: -1., g: 0., h: 0.
                             , i: 0., j: 0.,  k: 1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.frontWest == new Matrix4x3({ a: -1., b: 0., c: 0., d: 0.
     * ...                                      , e: 0.,  f: 0., g: 0., h: 0.
     * ...                                      , i: 0.,  j: 0., k: 1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var frontWest( get, never ): Matrix4x3;
    static inline
    function get_frontWest(): Matrix4x3 {
        return new Matrix4x3({ a: -1., b: 0., c: 0., d: 0.
                             , e: 0.,  f: 0., g: 0., h: 0.
                             , i: 0.,  j: 0., k: 1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.frontEast == new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
     * ...                                      , e: 0., f: 0., g: 0., h: 0.
     * ...                                      , i: 0., j: 0., k: 1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var frontEast( get, never ): Matrix4x3;
    static inline
    function get_frontEast(): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: 0., g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.back == new Matrix4x3({ a: 0., b: 0., c: 0.,  d: 0.
     * ...                                   , e: 0., f: 0., g: 0.,  h: 0.
     * ...                                   , i: 0., j: 0., k: -1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var back( get, never ): Matrix4x3;
    static inline
    function get_back(): Matrix4x3 {
        return new Matrix4x3({ a: 0., b: 0., c: 0.,  d: 0.
                             , e: 0., f: 0., g: 0.,  h: 0.
                             , i: 0., j: 0., k: -1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.backTopLeft == new Matrix4x3({ a: -1., b: 0., c: 0., d: 0.
     * ...                                        , e: 0.,  f: 1., g: 0., h: 0.
     * ...                                        , i: 0.,  j: 0., k: -1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var backTopLeft( get, never ): Matrix4x3;
    static inline
    function get_backTopLeft(): Matrix4x3 {
        return new Matrix4x3({ a: -1., b: 0., c: 0.,  d: 0.
                             , e: 0.,  f: 1., g: 0.,  h: 0.
                             , i: 0.,  j: 0., k: -1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.backTopRight == new Matrix4x3({ a: 1., b: 0., c: 0.,  d: 0.
     * ...                                         , e: 0., f: 1., g: 0.,  h: 0.
     * ...                                         , i: 0., j: 0., k: -1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var backTopRight( get, never ): Matrix4x3;
    static inline
    function get_backTopRight(): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0.,  d: 0.
                             , e: 0., f: 1., g: 0.,  h: 0.
                             , i: 0., j: 0., k: -1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.backBottomLeft == new Matrix4x3({ a: -1., b: 0.,  c: 0.,  d: 0.
     * ...                                           , e: 0.,  f: -1., g: 0.,  h: 0.
     * ...                                           , i: 0.,  j: 0.,  k: -1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var backBottomLeft( get, never ): Matrix4x3;
    static inline
    function get_backBottomLeft(): Matrix4x3 {
        return new Matrix4x3({ a: -1., b: 0.,  c: 0.,  d: 0.
                             , e: 0.,  f: -1., g: 0.,  h: 0.
                             , i: 0.,  j: 0.,  k: -1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.backBottomRight == new Matrix4x3({ a: 1., b: 0.,  c: 0.,  d: 0.
     * ...                                            , e: 0., f: -1., g: 0.,  h: 0.
     * ...                                            , i: 0., j: 0.,  k: -1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var backBottomRight( get, never ): Matrix4x3;
    static inline
    function get_backBottomRight(): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0.,  c: 0.,  d: 0.
                             , e: 0., f: -1., g: 0.,  h: 0.
                             , i: 0., j: 0.,  k: -1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.backNorth == new Matrix4x3({ a: 0., b: 0., c: 0.,  d: 0.
     * ...                                      , e: 0., f: 1., g: 0.,  h: 0.
     * ...                                      , i: 0., j: 0., k: -1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var backNorth( get, never ): Matrix4x3;
    static inline
    function get_backNorth(): Matrix4x3 {
        return new Matrix4x3({ a: 0., b: 0., c: 0.,  d: 0.
                             , e: 0., f: 1., g: 0.,  h: 0.
                             , i: 0., j: 0., k: -1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.backSouth == new Matrix4x3({ a: 0., b: 0.,  c: 0.,  d: 0.
     * ...                                      , e: 0., f: -1., g: 0.,  h: 0.
     * ...                                      , i: 0., j: 0.,  k: -1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var backSouth( get, never ): Matrix4x3;
    static inline
    function get_backSouth(): Matrix4x3 {
        return new Matrix4x3({ a: 0., b: 0.,  c: 0.,  d: 0.
                             , e: 0., f: -1., g: 0.,  h: 0.
                             , i: 0., j: 0.,  k: -1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.backWest == new Matrix4x3({ a: -1., b: 0., c: 0.,  d: 0.
     * ...                                     , e: 0.,  f: 0., g: 0.,  h: 0.
     * ...                                     , i: 0.,  j: 0., k: -1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var backWest( get, never ): Matrix4x3;
    static inline
    function get_backWest(): Matrix4x3 {
        return new Matrix4x3({ a: -1., b: 0., c: 0.,  d: 0.
                             , e: 0.,  f: 0., g: 0.,  h: 0.
                             , i: 0.,  j: 0., k: -1., l: 0. } );
    }
    /**
     * <pre><code>
     * >>> ({
     * ... Matrix4x3.backEast == new Matrix4x3({ a: 1., b: 0., c: 0.,  d: 0.
     * ...                                     , e: 0., f: 0., g: 0.,  h: 0.
     * ...                                     , i: 0., j: 0., k: -1., l: 0. } );
     * ... }) == true
     * </code></pre>
     */
    public static var backEast( get, never ): Matrix4x3;
    static inline
    function get_backEast(): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0.,  d: 0.
                             , e: 0., f: 0., g: 0.,  h: 0.
                             , i: 0., j: 0., k: -1., l: 0. } );
    }
    public static inline
    function radianX( theta: Float ): Matrix4x3 {
        var c = Math.cos( theta ); var s = Math.sin( theta );
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: c,  g: -s, h: 0.
                             , i: 0., j: s,  k: c,  l: 0. } );
    }
    public inline
    function rotateX( theta: Float ) : Matrix4x3 { return this * radianX( theta ); }
    public static inline
    function rotationX( theta: Float ): Matrix4x3 { return unit.rotateX( theta ); };
    public static inline
    function radianY( theta: Float ): Matrix4x3 {
        var c = Math.cos( theta ); var s = Math.sin( theta );
        return new Matrix4x3({ a: c,   b: 0.,  c: s,  d: 0.
                             , e: 0.,  f: 1.,  g: 0., h: 0.
                             , i: -s,  j: 0.,  k: c,  l: 0. } );
    }
    public inline
    function rotateY( theta: Float ) : Matrix4x3 { return this * radianY( theta ); }
    public static inline
    function rotationY( theta: Float ): Matrix4x3 { return unit.rotateY( theta ); };    
    public static inline
    function radianZ( theta: Float ): Matrix4x3 {
        var c = Math.cos( theta ); var s = Math.sin( theta );
        return new Matrix4x3({ a: c,  b: -s, c: 0.,  d: 0.
                             , e: s,  f: c,  g: 0.,  h: 0.
                             , i: 0., j: 0., k: 1.,  l: 0. } );
    }
    public inline
    function rotateZ( theta: Float ) : Matrix4x3 { return this * radianZ( theta ); }
    public static inline
    function rotationZ( theta: Float ): Matrix4x3 { return unit.rotateZ( theta ); };    
    public static inline
    function sxy( x: Float, y: Float ): Matrix4x3 {
       return new Matrix4x3({  a: x,  b: 0., c: 0., d: 0.
                             , e: 0., f: y,  g: 0., h: 0.
                             , i: 0., j: 0., k: 1,  l: 0. } );
    }
    public inline 
    function scaleXY( x: Float, y: Float ){ return this * sxy( x, y ); }
    public static inline
    function scalarXY( x: Float, y: Float ): Matrix4x3 { return unit.scaleXY( x, y ); };    
    public static inline
    function sxyz( x: Float, y: Float, z: Float ): Matrix4x3 {
        return new Matrix4x3({ a: x,  b: 0., c: 0., d: 0.
                             , e: 0., f: y,  g: 0., h: 0.
                             , i: 0., j: 0., k: z,  l: 0. } );
    }
    public inline
    function scaleXYZ( x: Float, y: Float, z: Float ){ return this * sxyz( x, y, z ); }
    public static inline
    function scalarXYZ( x: Float, y: Float, z: Float ){ return unit.scaleXYZ( x, y, z ); }
    public static inline
    function sx( x: Float ): Matrix4x3 {
        return new Matrix4x3({ a: x,  b: 0., c: 0., d: 0.
                             , e: 0., f: 1., g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    public inline
    function scaleX( x: Float ): Matrix4x3 { return this * sx( x ); }
    public static inline
    function scalarX( x: Float ): Matrix4x3 { returt unit.scaleX( x ); }
    public static inline
    function sy( y: Float ): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: y,  g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    public inline
    function scaleY( y: Float ): Matrix4x3 { return this * sy( y ); }
    public static inline
    function scalarY( y: Float ): Matrix4x3 { returt unit.scaleY( y ); }    
    public static inline
    function sz( z: Float ): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: 1., g: 0., h: 0.
                             , i: 0., j: 0., k: z,  l: 0. } );
    }
    public inline
    function scaleZ( z: Float ): Matrix4x3 { return this * sz( z ); }
    public static inline
    function scalarZ( z: Float ): Matrix4x3 { returt unit.scaleZ( z ); }    
    public inline
    function scale( s: Float ): Matrix4x3 { return this * scaleXYZ( s, s, s ); }
    public static inline
    function scalar( s: Float ): Matrix4x3 { returt unit.scale( s ); }    
    public static inline
    function txyz( x: Float, y: Float, z: Float ): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: x
                             , e: 0., f: 1., g: 0., h: y
                             , i: 0., j: 0., k: 1., l: z } );
    }
    public inline
    function translateXYZ( x: Float, y: Float, z: Float ): Matrix4x3 { return this * txyz( x, y, z ); }
    public static inline
    function transformationXYZ( x: Flox: Float, y: Float, z: Float ): Matrix4x3 { returt unit.transformXYZ( x, y, z ); }    
    public static inline
    function tx( x: Float ): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: x
                             , e: 0., f: 1., g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    public inline
    function translateX( x: Float ): Matrix4x3 { return this * tx( x ); }
    public static inline
    function transformationX( x: Float ): Matrix4x3 { return unit.translateX( x ); }
    public static inline
    function ty( y: Float ): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: 1., g: 0., h: y
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    public inline
    function translateY( y: Float ): Matrix4x3 { return this * ty( y ); }
    public static inline
    function transformationY( y: Float ): Matrix4x3 { return unit.translateY( y ); }    
    public static inline
    function tz( z: Float ): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: 0.
                             , e: 0., f: 1., g: 0., h: 0.
                             , i: 0., j: 0., k: 1., l: z } );
    }
    public inline
    function translateZ( z: Float ): Matrix4x3 { return this * tz( z ); }
    public static inline
    function transformationZ( z: Float ): Matrix4x3 { return unit.translateZ( z ); }    
    public static inline
    function txy( x: Float, y: Float ): Matrix4x3 {
        return new Matrix4x3({ a: 1., b: 0., c: 0., d: x
                             , e: 0., f: 1., g: 0., h: y
                             , i: 0., j: 0., k: 1., l: 0. } );
    }
    public inline
    function translateXY( x: Float, y: Float ): Matrix4x3 { return this * txy( x, y ); }
    public static inline
    function transformationXY( x: Float, y: Float ): Matrix4x3 { return unit.translateXY( x, y ); }    
   /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix4x3({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9., j:10., k:11., l:12. });
     * ... var b = new Matrix4x3({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9., j:10., k:11., l:12. });
     * ... a == b; }) == true
     * </code></pre>
     */
    @:op( A == B )
    public static inline
    function equal( a: Matrix4x3, b: Matrix4x3 ): Bool {
        var delta = 0.0000001;
        return !(
               Math.abs(a.a - b.a) >= delta
            || Math.abs(a.b - b.b) >= delta
            || Math.abs(a.c - b.c) >= delta
            || Math.abs(a.d - b.d) >= delta
            || Math.abs(a.e - b.e) >= delta
            || Math.abs(a.f - b.f) >= delta
            || Math.abs(a.g - b.g) >= delta
            || Math.abs(a.h - b.h) >= delta
            || Math.abs(a.i - b.i) >= delta
            || Math.abs(a.j - b.j) >= delta
            || Math.abs(a.k - b.k) >= delta
            || Math.abs(a.l - b.l) >= delta
        );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Matrix4x3({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9., j:10., k:11., l:12. });
     * ... var b = new Matrix4x3({ a: 1., b: 2., c: 3., d: 4., e: 5., f: 6., g: 7., h: 8., i: 9., j:10., k:11., l:11. });
     * ... a != b; }) == true
     * </code></pre>
     */
    @:op(A != B) public static inline
    function notEqual( a: Matrix4x3, b:Matrix4x3 ): Bool {
        return !equal( a, b );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix4x3.unit;
     * ... a + a == new Matrix4x3( { a: 2., b: 0., c: 0., d: 0.
     * ...                         , e: 0., f: 2., g: 0., h: 0.
     * ...                         , i: 0., j: 0., k: 2., l: 0. } ); }) == true
     * </code></pre>
     */
    @:op(A + B) public static inline
    function add( m0: Matrix4x3, m1: Matrix4x3 ): Matrix4x3 {
        return new Matrix4x3( { a: m0.a + m1.a, b: m0.b + m1.b, c: m0.c + m1.c, d: m0.d + m1.d
                              , e: m0.e + m1.e, f: m0.f + m1.f, g: m0.g + m1.g, h: m0.h + m1.h
                              , i: m0.i + m1.i, j: m0.j + m1.j, k: m0.k + m1.k, l: m0.l + m1.l } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Matrix4x3.unit;
     * ... a - a == Matrix4x3.zero; }) == true
     * </code></pre>
     */
    @:op(A - B) public static inline
    function sub( m0: Matrix4x3, m1: Matrix4x3 ): Matrix4x3 {
        return new Matrix4x3( { a: m0.a - m1.a, b: m0.b - m1.b, c: m0.c - m1.c, d: m0.d - m1.d
                              , e: m0.e - m1.e, f: m0.f - m1.f, g: m0.g - m1.g, h: m0.h - m1.h
                              , i: m0.i - m1.i, j: m0.j - m1.j, k: m0.k - m1.k, l: m0.l - m1.l } );
    }
    @:op(A * B) public static inline
    function scaleMultiply1( p: Matrix1x4, m: Matrix4x3 ): Matrix4x3 {
        return new Matrix4x3( { a: m.a*p.x, b: m.b,     c: m.c,     d: m.d
                              , e: m.e,     f: m.f*p.y, g: m.g,     h: m.h
                              , i: m.i,     j: m.j,     k: m.k*p.z, l: m.l } );
    }
    @:op(A * B) public static inline
    function scaleMultiply2( m: Matrix4x3, p: Matrix1x4 ): Matrix4x3 {
        return new Matrix4x3( { a: m.a*p.x, b: m.b,     c: m.c,     d: m.d
                              , e: m.e,     f: m.f*p.y, g: m.g,     h: m.h
                              , i: m.i,     j: m.j,     k: m.k*p.z, l: m.l } );
    }
    @:op(A / B) public static inline
    function scaleDivide( m: Matrix4x3, p: Matrix1x4 ): Matrix4x3 {
        var pd = 1 / p;  
        return new Matrix4x3( { a: m.a*pd.x, b: m.b,      c: m.c,      d: m.d
                              , e: m.e,      f: m.f*pd.y, g: m.g,      h: m.h
                              , i: m.i,      j: m.j,      k: m.k*pd.z, l: m.l } );
    }
    @:op(A * B) public static inline // emulates 4x4 matrib with assumption last row is 0,0,0,1.
    function multiply( r: Matrix4x3, s: Matrix4x3 ): Matrix4x3 {
        return new Matrix4x3(
        { a: r.a*s.a+r.b*s.e+r.c*s.i, b: r.a*s.b+r.b*s.f+r.c*s.j
                                , c: r.a*s.c+r.b*s.g+r.c*s.k, d: r.a*s.d+r.b*s.h+r.c*s.l+r.d
        , e: r.e*s.a+r.f*s.e+r.g*s.i, f: r.e*s.b+r.f*s.f+r.g*s.j
                                , g: r.e*s.c+r.f*s.g+r.g*s.k, h: r.e*s.d+r.f*s.h+r.g*s.l+r.h
        , i: r.i*s.a+r.j*s.e+r.k*s.i, j: r.i*s.b+r.j*s.f+r.k*s.j
                                , k: r.i*s.c+r.j*s.g+r.k*s.k, l: r.i*s.d+r.j*s.h+r.k*s.l+r.l
                                
        } );
    }
    public inline // https://www.mathsisfun.com/algebra/matrix-determinant.html
    function cofactor( a: Float, b: Float, c: Float,
                       d: Float, e: Float, f: Float,
                       g: Float, h: Float, i: Float): Float {
        return a * ( e * i - f * h ) - b * ( d * i - f * g ) + c * ( d * h - e * g );
    }
    public inline
    function det(): Float {
        var m = 0.; var n = 0.; var o = 0.; var p = 1.;
        return   this.a * cofactor( this.f, this.g, this.h
                                  , this.j, this.k, this.l
                                  , n, o, p ) 
               - this.b * cofactor( this.e, this.g, this.h
                                  , this.i, this.k, this.l
                                  , m, o, p )
               + this.c * cofactor( this.e, this.f, this.h
                                  , this.i, this.j, this.l
                                  , m, p, n )
               - this.d * cofactor( this.e, this.f, this.g
                                  , this.i, this.j, this.k
                                  , m, n, o );
    }
    // could optimize?
    public inline
    function inverse(): Matrix4x3 {
        var a = this.a; var b = this.b; var c = this.c; var d = this.d;
        var e = this.e; var f = this.f; var g = this.g; var h = this.h;
        var i = this.i; var j = this.j; var k = this.k; var l = this.l;
        var m = 0.; var n = 0.; var o = 0.; var p = 1.;
        var q = j*o*h - n*k*h + n*g*l - f*o*l - j*g*p + f*k*p;
        var r = m*k*h - i*o*h - m*g*l + e*o*l + i*g*p - e*k*p;
        var s = i*n*h - m*j*h + m*f*l - e*n*l - i*f*p + e*j*p;
        var t = m*j*g - i*n*g - m*f*k + e*n*k + i*f*o - e*j*o;
        var det = a * q + b * r + c * s + d * t;
        return if( det == 0 ){
            null;
        } else {
            var detI = 1 / det;
            new Matrix4x3( {
                    a: q * detI
                  , b: ( n*k*d - j*o*d - n*c*l + b*o*l + j*c*p - b*k*p ) * detI
                  , c: ( f*o*d - n*g*d + n*c*h - b*o*h - f*c*p + b*g*p ) * detI
                  , d: ( j*g*d - f*k*d - j*c*h + b*k*h + f*c*l - b*g*l ) * detI
                  , e: r * detI
                  , f: ( i*o*d - m*k*d + m*c*l - a*o*l - i*c*p + a*k*p ) * detI
                  , g: ( m*g*d - e*o*d - m*c*h + a*o*h + e*c*p - a*g*p ) * detI
                  , h: ( e*k*d - i*g*d + i*c*h - a*k*h - e*c*l + a*g*l ) * detI
                  , i: s * detI
                  , j: ( m*j*d - i*n*d - m*b*l + a*n*l + i*b*p - a*j*p ) * detI
                  , k: ( e*n*d - m*f*d + m*b*h - a*n*h - e*b*p + a*f*p ) * detI
                  , l: ( i*f*d - e*j*d - i*b*h + a*j*h + e*b*l - a*f*l ) * detI
            });
        }
    }
    /**
     * Untested - check that this matrix is not transposed
     */
    public static inline// Maps 0,0,0 to pos,maps x-axis to dir,maps y-axis to up.maps z-axis to the right.
    function orientation( pos: Matrix1x4, dir: Matrix1x4, up: Matrix1x4 ): Matrix4x3 {
        var right = dir.cross( up );
        return new Matrix4x3( { a: dir.x, b: up.x, c: right.x, d: pos.x
                              , e: dir.y, f: up.y, g: right.y, h: pos.y
                              , i: dir.z, j: up.z, k: right.z, l: pos.z  } );
    }
    /**
     * Untested - check that this matrix is not transposed
     */
    public inline // check if Z should be included
    function applyRotation( p: Matrix1x4 ): Matrix1x4 {
        return new Matrix1x4({ x: this.a * p.x + this.b * p.y + this.c * p.z
                             , y: this.e * p.x + this.f * p.y + this.g * p.z
                             , z: this.h * p.x + this.i * p.y + this.j * p.z
                             , w: 1. });
    }
    /**
     * Untested - check that this matrix is not transposed
     */
    public inline
    function applyInverseRotation( p: Matrix1x4 ): Matrix1x4 {
        return new Matrix1x4({ x: this.a * p.x + this.e * p.y + this.i * p.z
                             , y: this.b * p.x + this.f * p.y + this.j * p.z
                             , z: this.c * p.x + this.g * p.y + this.k * p.z
                             , w: 1. });
    }
    /**
     * Untested - check that this matrix is not transposed
     */
    public inline
    function orthonormalizeRotation(){
        var new_x = new Matrix1x4({ x: this.a, y: this.e, z: this.i, w: 1. } ).normalize();
        var new_z = ( new_x.cross( new Matrix1x4( { x: this.b, y: this.f, z: this.j, w: 1. } ) ) ).normalize();
        var new_y = new_z.cross( new_x );
        this.a = new_x.x; this.b = new_y.x; this.c = new_z.x;
        this.e = new_x.y; this.f = new_y.y; this.g = new_z.y;
        this.i = new_x.z; this.j = new_y.z; this.k = new_z.z;
        return this;
    }
    /**
     * Untested - check that this matrix is not transposed
     */
    public inline // Swap x & z axes, negate z axis (even number of swaps
    function makeViewFromOrientation(): Matrix4x3 { // maintains right-handedness).
        var m = new Matrix4x3({ a: this.c,  b: this.b, c: -this.a, d: this.d
                              , e: this.g,  f: this.f, g: -this.e, h: this.h
                              , i: this.k,  j: this.j, k: -this.i, l: this.l } );
        return m.invertNormalized();
    }
    /**
     * Untested - check that this matrix is not transposed
     */
    public inline
    function invertNormalizedRotation( ): Matrix4x3 {
        return new Matrix4x3( { a: this.a, b: this.e, c: this.i, d: 0.
                              , e: this.b, f: this.f, g: this.j, h: 0.
                              , i: this.c, j: this.g, k: this.k, l: 0. } );
    }
    public inline
    function invertNormalized(): Matrix4x3 {
        var m = invertNormalizedRotation();
        var trans_prime = new Matrix1x4( { x: this.d, y: this.h, z: this.l, w: 1. } ).transformPoint( m );
        m.d = -trans_prime.x; m.h = -trans_prime.y; m.l = -trans_prime.z;
        return m;
    }
    @:to
    public inline
    function toAffineMatrix(): TAffineMatrix return Conversion._4x3toTAffineMatrix( this );
    @:from
    public static inline 
    function fromNumbered( m: Tmatrix4x4numbered ): Matrix4x3 return Conversion.Tmatrix4x4numberedto4x3( m );
    @:to
    public inline
    function toNumbered(): Tmatrix4x4numbered return Conversion._4x3toTmatrix4x4numbered( this );
    @:from
    public static inline
    function fromArr( arr: Array<Float> ): Matrix4x3 return Conversion.ArraytoMatrix4x3( arr );
    @:to
    public inline
    function toArray(): Array<Float> return Conversion._4x3toArray( this );
    @:from // assumes z == 0
    public static inline
    function from2x2( m2: Matrix2x2 ) return Conversion._2x2to4x3( m2 );
    @:to
    public inline
    function to2x2(): Matrix2x2 return Conversion._4x3to2x2( this );
    @:from
    public static inline
    function from3x3( m3: Matrix3x3 ) return Conversion._3x3to4x3( m3 );
    @:to
    public inline
    function to3x3(): Matrix3x3 return Conversion._4x3to3x3( this );
    @:from
    public static inline
    function fromVec( v: haxe.ds.Vector<Float> ): Matrix4x3 return Conversion.Vectorto4x3( v );
    @:to
    public inline
    function toVector(): haxe.ds.Vector<Float> return Conversion._4x3toVector( this );
    /**
     *
     */
    public inline function setXY( x: Int, y: Int, v: Float  ): Float {
        return switch [ x, y ] {
    case [ 0,0 ]: this.a = v; case [ 0,1 ]: this.b = v; case [ 0,2 ]: this.c = v; case [ 0,3 ]: this.d = v;
    case [ 1,0 ]: this.e = v; case [ 1,1 ]: this.f = v; case [ 1,2 ]: this.g = v; case [ 1,3 ]: this.h = v;
    case [ 2,0 ]: this.i = v; case [ 2,1 ]: this.j = v; case [ 2,2 ]: this.k = v; case [ 2,3 ]: this.l = v;
    case _: throw ('bad set $x, $y on Matrix4x4' ); }
    }
    public inline function getXY( x: Int, y: Int  ): Float {
        return switch [ x, y ] {
            case [ 0, 0 ]: this.a; case [ 0, 1 ]: this.b; case [ 0, 2 ]: this.c; case [ 0, 3 ]: this.d;
            case [ 1, 0 ]: this.e; case [ 1, 1 ]: this.f; case [ 1, 2 ]: this.g; case [ 1, 3 ]: this.h;
            case [ 2, 0 ]: this.i; case [ 2, 1 ]: this.j; case [ 2, 2 ]: this.k; case [ 2, 3 ]: this.l;
            case _: throw ('bad get $x, $y on Matrix4x3' ); }
    }  
    @:to
    public inline
    function toWebGL(): Float32Array return Conversion._4x3toFloat32Array_( this );
    @:from
    public static inline
    function fromWebGL( arr: Float32Array ): Matrix4x3 { return Conversion.Float32Array_to4x3( arr );
    }
    public inline
    function updateWebGL( arr: Float32Array ): Float32Array {
        arr[ 0 ]  = this.a; arr[ 1 ]  = this.e; arr[ 2 ]  = this.i; arr[ 3 ]  = 0.;
        arr[ 4 ]  = this.b; arr[ 5 ]  = this.f; arr[ 6 ]  = this.j; arr[ 7 ]  = 0.;
        arr[ 8 ]  = this.c; arr[ 9 ]  = this.g; arr[ 10 ] = this.k; arr[ 11 ] = 0.;
        arr[ 12 ] = this.d; arr[ 13 ] = this.h; arr[ 14 ] = this.l; arr[ 15 ] = 0.;
        return arr;
    }
    // used to print out a pretty representation of the matrix for debugging,
    // likely quite slow and not optimum.
    public inline
    function pretty( prec: Int ):String {
        var sa = floatToStringPrecision( this.a, prec );
        var sb = floatToStringPrecision( this.b, prec );
        var sc = floatToStringPrecision( this.c, prec );
        var sd = floatToStringPrecision( this.d, prec );
        var se = floatToStringPrecision( this.e, prec );
        var sf = floatToStringPrecision( this.f, prec );
        var sg = floatToStringPrecision( this.g, prec );
        var sh = floatToStringPrecision( this.h, prec );
        var si = floatToStringPrecision( this.i, prec );
        var sj = floatToStringPrecision( this.j, prec );
        var sk = floatToStringPrecision( this.k, prec );
        var sl = floatToStringPrecision( this.l, prec );
        var la = sa.length;
        var lb = sb.length;
        var lc = sc.length;
        var ld = sd.length;
        var le = se.length;
        var lf = sf.length;
        var lg = sg.length;
        var lh = sh.length;
        var li = si.length;
        var lj = sj.length;
        var lk = sk.length;
        var ll = sl.length;
        var r0: Int = Math.round( Math.max( Math.max( la, le ), li ) );
        var r1: Int = Math.round( Math.max( Math.max( lb, lf ), lj ) );
        var r2: Int = Math.round( Math.max( Math.max( lc, lg ), lk ) );
        var r3: Int = Math.round( Math.max( Math.max( ld, lh ), ll ) );
        var spaces = '';
        for( n in 0...r0 ) spaces = spaces + ' ';
        sa = spaces.substr( 0, r0 - la ) + sa;
        se = spaces.substr( 0, r0 - le ) + se;
        si = spaces.substr( 0, r0 - li ) + si;
        var spaces = '';
        for( n in 0...r1 ) spaces = spaces + ' ';
        sb = spaces.substr( 0, r1 - lb ) + sb;
        sf = spaces.substr( 0, r1 - lf ) + sf;
        sj = spaces.substr( 0, r1 - lj ) + sj;
        var space = '';
        for( n in 0...r2 ) spaces = spaces + ' ';
        sc = spaces.substr( 0, r2 - lc ) + sc;
        sg = spaces.substr( 0, r2 - lg ) + sg;
        sk = spaces.substr( 0, r2 - lk ) + sk;
        var space = '';
        for( n in 0...r3 ) spaces = spaces + ' ';
        sd = spaces.substr( 0, r3 - ld ) + sd;
        sh = spaces.substr( 0, r3 - lh ) + sh;
        sl = spaces.substr( 0, r3 - ll ) + sl;
        return '\n'
             + '/ ' + sa + ', ' + sb + ', ' + sc + ', ' + sd + ' \\\n'
             + '| ' + se + ', ' + sf + ', ' + sg + ', ' + sh + ' |\n'
             + '\\ ' + si + ', ' + sj + ', ' + sk + ', ' + sl + ' /\n';
    }
    /*
        credit: sea_jackel https://stackoverflow.com/questions/23689001/how-to-reliably-format-a-floating-point-number-to-a-specified-number-of-decimal
    */
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
 }
