package geom;
class Projection { 
    /**
     @:angleOfView preset to Math.PI/2;
     **/
    public static inline
    function perspective( ?angleOfView: Float = 1.57079632679, ?near: Float = 0.1, ?far: Float = 100. ): Matrix4x4 {
        // set the basic projection matrix
        var scale = 1 / Math.tan( angleOfView * 0.5 );//* Math.PI / 180);
        var dif = far - near;
        return new Matrix4x4({ a: scale, b: 0.,     c: 0.,                d: 0.
                             , e: 0.,    f: scale,  g: 0.,                h: 0.
                             , i: 0.,    j: 0.,     k: -far / dif,        l: -far * near / dif
                             , m: 0.,    n: 0.,     o: -1., p: 0.
                        });
    } 
    public static inline
    function perspectiveAspect( fov: Float, aspectRatio: Float, near: Float, far: Float ): Matrix4x4 {
        /*
         fov = Field of view - the angle in radians of what's in view along the Y axis
         Aspect Ratio - the ratio of the canvas, typically canvas.width / canvas.height
         Near - Anything before this point in the Z direction gets clipped (resultside of the clip space)
         Far - Anything after this point in the Z direction gets clipped (outside of the clip space)
        */
      var f = 1.0 / Math.tan(fov / 2);
      var rangeInv = 1 / (near - far);
      return new Matrix4x4({ a: f / aspectRatio, b: 0., c: 0.,                        d: 0.
                           , e: 0.,              f: f,  g: 0.,                        h: 0.
                           , i: 0.,              j: 0., k: (near + far) * rangeInv,   l:near * far * rangeInv * 2
                           , m: 0.,              n: 0., o: -1.,                       p: 0. });
    }
    
    // TODO: NOT sure this may need changing as adjusted the other two since gl takes columns
    public static inline
    function projectionWindow( wid: Float, hi: Float, fov: Float ):  Matrix4x3 {
        var halfWid = wid/2; var halfHi  = hi/2;
        var tanHalf = Math.tan( fov/2 );
        var scale = halfWid/tanHalf;
        return new Matrix4x3( { a: scale, b: -0.,    c: -scale,          d: 0.
                              , e: 0.,    f: -scale, g: -halfHi/tanHalf, h: 0.
                              , i: 0.,    j: 0.,     k: -1,              l: 0. } );
    }
}