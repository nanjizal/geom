# geom
[unit tests](https://nanjizal.github.io/geom/geomTest.html) ( using haxe-doctest and utest )

[doc](https://nanjizal.github.io/geom/pages) ( using doc-gen to provide documentation )

geom library to provide some Vector and Matrix tools for 2D and 3D graphics.

  - **constraints**  
      contains some of Johnathon Selstad constraints ported to haxe using geom.matrix.Matrix1x4  
      [Chain](https://nanjizal.github.io/geom/pages/geom/constraints/Chain.html)  
      [Collision](https://nanjizal.github.io/geom/pages/geom/constraints/Collision.html)  
      [Fabrik](https://nanjizal.github.io/geom/pages/geom/constraints/Fabrik.html)  
      [Inner](https://nanjizal.github.io/geom/pages/geom/constraints/Chain.html)  
      also contains [Interval](https://nanjizal.github.io/geom/pages/geom/constraints/Interval.html) and [RadianInterval](https://nanjizal.github.io/geom/pages/geom/constraints/RadianInterval.html) it allows open or closed clamping of a range or wrapping a range.  
      
  - **curve**  
      [Bezier](https://nanjizal.github.io/geom/pages/geom/curve/Bezier.html) single dimension equations including curveThru suited as base rather than complete solution.  
      Partially ported some Raph Levin bezier segment approximation work - WIP  
      [ComplexTrig](https://nanjizal.github.io/geom/pages/geom/curve/ComplexTrig.html) has some trig functions for geom.matrix.Complex numbers needs verification.  
      [Cubic](https://nanjizal.github.io/geom/pages/geom/curve/Cubic.html) provides cubic functions to suplement Square  
      [Hyperbolic](https://nanjizal.github.io/geom/pages/geom/curve/Hyperbolic.html) maths functions needs verifications.  
      [Logarithmic](https://nanjizal.github.io/geom/pages/geom/curve/Logarithmic.html) maths functions needs verifications.   
  - **flat**
      [flat](https://nanjizal.github.io/geom/pages/geom/flat/)  
      array datastructures suitable for storing groups of data, [0] stores position and [1] stores length, allows array access of the grouped data and 'next' used to increment groups. 
      [UInt16Flat](https://nanjizal.github.io/geom/pages/geom/flat/ui16/UInt16Flat.html) stores position [0] [1] and length [2] [3] since UInt16 was too low for practically storing these properties.  
      
  - **matrix**  
       matrix with operators and plenty of functionality such as skew.  
       conversion for Matrix changes including to alternate property naming.  
       Vectors in the form of [Matrix1x2](https://nanjizal.github.io/geom/pages/geom/matrix/Matrix1x2.html) for 2D, [Matrix1x4](https://nanjizal.github.io/geom/pages/geom/matrix/Matrix1x4.html) for 3D with constraints.  
       Matrices in the form [Matrix2x2](https://nanjizal.github.io/geom/pages/geom/matrix/Matrix2x2.html) for 2D/3D, [Matrix4x3](https://nanjizal.github.io/geom/pages/geom/matrix/Matrix4x3.html) ( optimal ) for 3D.  
       [Complex](https://nanjizal.github.io/geom/pages/geom/matrix/Complex.html) for complex numbers.  
       [Quaternion](https://nanjizal.github.io/geom/pages/geom/matrix/Quaternion.html) for angles.  
       [DualQuaternions](https://nanjizal.github.io/geom/pages/geom/matrix/DualQuaternions.html) for Angle and Position.  
       [Projection](https://nanjizal.github.io/geom/pages/geom/matrix/Projection.html) for setting up 3D projection.  
       
  - **move**  
      [Axis2](https://nanjizal.github.io/geom/pages/geom/move/Axis2.html) not really used tested  
      [Axis3](https://nanjizal.github.io/geom/pages/geom/move/Axis3.html) provides a DualQuaternion approach to pan, tilt, rotate and translations.  
      [Parameter](https://nanjizal.github.io/geom/pages/geom/matrix/Parameter.html) and [Trinary](https://nanjizal.github.io/geom/pages/geom/move/Trinary) used for stepping, Trinary is like Bool but with 3 states.  
      
  - **obj**  
      [Quad2D](https://nanjizal.github.io/geom/pages/geom/obj/Quad2D.html) provides 2D quad using Matrix1x2  
      [Quad3D](https://nanjizal.github.io/geom/pages/geom/obj/Quad3D.html) provides quad for use in 3D.  
      [Tri](https://nanjizal.github.io/geom/pages/geom/obj/Tri.html) provides 2D triangle, hitTest point, adjustWinding, and rotation.  
      [Tri3D](https://nanjizal.github.io/geom/pages/geom/obj/Tri3D.html) provides triangle for use in 3D using Matrix1x4, multiplyQ for rotation.  
      
  - **structure**
      [structure](https://nanjizal.github.io/geom/pages/geom/structure/)
      structInit's for matrix folder.  
      
  - **systemL**  
      [LNode](https://nanjizal.github.io/geom/pages/geom/systemL/LNode) and [LNode3D](https://nanjizal.github.io/geom/pages/geom/systemL/LNode3D) ( using DualQuaternions ) for use with LSystems  
  - **tydef**  
      [tydef](https://nanjizal.github.io/geom/pages/geom/tydef/)  
      typedef alternate matrix structures for integration with other libraries.  
      
  - *Numerical* has min and max for Integers ( 2 and 3 ), Maths constants, and clz32 broken?
  