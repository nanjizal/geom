# geom
geom is experimental basic tools related to points and matrices useful for rendering

Ok currently you have to define constraints on types and his is too verbose...
```
var p: Apoint4<Tpoint4> = new Apoint4( { x: 1., y: 3., z: 4., w: 1. } );
```
So I need to strip out the constraints, abstract seems to work well so I need to hard code Tpoint4 or have a typedef to it so I can switch on compiler switch.  Matrix will need the same change.
