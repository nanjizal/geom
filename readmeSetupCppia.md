# For using Cppia to test with latest Haxe.
- Get latest Haxe from:

      http://build.haxe.org/builds/haxe/
    
- setup haxelib ( I use lib in same level as haxe folder named haxeLibrary

      haxelib setup
    
- Install latest hxcpp

      haxelib git hxcpp https://github.com/HaxeFoundation/hxcpp.git
    
- Then go to your lib folder for haxe and into hxcpp folder, normally I just drag the folder to terminal ( on mac ).

- run the commands from terminal to rebuild your hxcpp

      https://github.com/HaxeFoundation/hxcpp/blob/master/README.md#building-the-tools
    
- run the commands to build cppia

      https://github.com/HaxeFoundation/hxcpp/blob/master/README.md#cppia
    
- you can use cppia 

      https://code.haxe.org/category/other/working-with-cppia/01.creating-cppia-script.html
    
So for instance script I am using for test.
```
#    Cppia test
-cp src
-lib utest
-lib haxe-doctest
-lib equals
-main geom.GeomTest
-cppia geomTest.cppia
-cmd haxelib run hxcpp geomTest.cppia
```
