# geom
[unit tests](https://nanjizal.github.io/geom/geomTest.html) ( using haxe-doctest and utest )

[doc](https://nanjizal.github.io/geom/pages) ( using doc-gen to provide documentation )

geom library to provide some Vector and Matrix tools for 2D and 3D graphics.

  - **constraints**  
      contains some of Johnathon Selstad constraints ported to haxe using geom.matrix.Matrix1x4  
      also contains Interval and RadianInterval it allows open or closed clamping of a range or wrapping a range.  
  - **curve**  
      Bezier single dimension equations including curveThru suited as base rather than complete solution.  
      Partially ported some Raph Levin bezier segment approximation work - WIP  
      ComplexTrig has some trig functions for geom.matrix.Complex numbers needs verification.  
      Cubic provides cubic functions to suplement Square  
      Hyperbolic maths functions needs verifications.  
      Logarithmic maths functions needs verifications.  
  - **flat**  
      array datastructures suitable for storing groups of data, [0] stores position and [1] stores length, allows array access of the grouped data and 'next' used to increment groups.  
      UInt16Flat stores position [0] [1] and length [2] [3] since UInt16 was too low for practically storing these properties.  
  - **matrix**  
       matrix with operators and plenty of functionality such as skew.  
       conversion for Matrix changes including to alternate property naming.  
       Vectors in the form of Matrix1x2 for 2D, Matrix1x4 for 3D with constraints.  
       Matrices in the form Matrix2x2 for 2D/3D, Matrix4x3 ( optimal ) for 3D.  
       Complex for complex numbers.  
       Quaternion for angles.  
       DualQuaternions for Angle and Position.  
       Projection for setting up 3D projection.  
  - **move**  
      Axis2 not really used tested  
      Axis3 provides a DualQuaternion approach to pan, tilt, rotate and translations.  
      Parameter and Trinary used for stepping, Trinary is like Bool but with 3 states.  
  - **obj**  
      Quad2D provides 2D quad using Matrix1x2  
      Quad3D provides quad for use in 3D.  
      Tri provides 2D triangle, hitTest point, adjustWinding, and rotation.  
      Tri3D provides triangle for use in 3D using Matrix1x4, multiplyQ for rotation.  
  - **structure**  
      structInit's for matrix folder.  
  - **systemL**  
      LNode and LNode3D ( using DualQuaternions ) for use with LSystems
  - **tydef**  
      typedef alternate matrix structures for integration with other libraries.
  - *Numerical* has min and max for Integers ( 2 and 3 ), Maths constants, and clz32 broken?
  