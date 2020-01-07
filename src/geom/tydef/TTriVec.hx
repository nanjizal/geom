package geom.tydef;
import geom.matrix.Matrix1x4;
/** 
   triangle corners a,b,c with coordinates x, y, z, w.
   
   { a, b, c }
**/
typedef TTriVec = {
   var a: Matrix1x4;
   var b: Matrix1x4;
   var c: Matrix1x4;
}