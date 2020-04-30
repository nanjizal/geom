package geom.obj;
import geom.matrix.Matrix4x3;
/**
 * left
 *  5
 *  1 3 6 4
 *  2
 * right
 *  4
 *  1 2 6 5
 *  3
 */
enum abstract LeftisRight( Bool ) from Bool to Bool {
    var LEFT = true;
    var RIGHT = false;
}
@:structInit
class DieLayout {
    public var radius: Float;
    public var isLeft: LeftisRight; 
    public function new( radius: Float, isLeft: LeftisRight = RIGHT ){
        this.radius = radius;
        this.isLeft = isLeft;
    }
}
class CubeTransforms {
    // transforms to a plane to layout a cube ( die )
    public static inline
    function getDieLayout( layout: DieLayout ): Array<Matrix4x3> {
        var t1 = Matrix4x3.translationZ( layout.radius );
        var t2 = Matrix4x3.rotationY( Math.PI/2  )*Matrix4x3.translationZ( layout.radius );
        var t3 = Matrix4x3.rotationX( Math.PI/2  )*Matrix4x3.translationZ( layout.radius );
        var t4 = Matrix4x3.rotationX( -Math.PI/2 )*Matrix4x3.translationZ( layout.radius );
        var t5 = Matrix4x3.rotationY( -Math.PI/2 )*Matrix4x3.translationZ( layout.radius );
        var t6 = Matrix4x3.rotationY( Math.PI    )*Matrix4x3.translationZ( layout.radius );
        var tt2 = ( layout.isLeft == true )? t3: t2;
        var tt3 = ( layout.isLeft == true )? t2: t3;
        var tt4 = ( layout.isLeft == true )? t5: t4;
        var tt5 = ( layout.isLeft == true )? t4: t5;
        return [ t1, tt2, tt3, tt4, tt5, t6 ];
    }
}