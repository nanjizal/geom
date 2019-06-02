# For using Cppia to test with latest Haxe.
- Get latest Haxe from: [http://build.haxe.org/builds/haxe](http://build.haxe.org/builds/haxe)
      
- setup haxelib ( I use lib in same level as haxe folder named haxeLibrary

      haxelib setup
    
- Install latest hxcpp

      haxelib git hxcpp https://github.com/HaxeFoundation/hxcpp.git
    
- Then go to your lib folder for haxe and into hxcpp folder, normally I just drag the folder to terminal ( on mac ).

- run the commands from terminal to rebuild your hxcpp [README.md#building-the-tools](https://github.com/HaxeFoundation/hxcpp/blob/master/README.md#building-the-tools)
      
- run the commands to build cppia [README.md#cppia](https://github.com/HaxeFoundation/hxcpp/blob/master/README.md#cppia)
      
- you can use cppia [working-with-cppia/01.creating-cppia-script.html](https://code.haxe.org/category/other/working-with-cppia/01.creating-cppia-script.html)
      
# Testing your library

- You can put your tests above your methods, which solves the age old problem of do you clutter your library repo with the tests or put them is a separate repo - simple just put them with your code and just add one extra small class. [haxe-doctest#haxe](https://github.com/vegardit/haxe-doctest#haxe-doctest---haxedoc-based-unit-testing)
      
- HaxeFoundation have switched to use [utest](https://github.com/haxe-utest/utest), based off Franco's library, and latest haxe-doctest support this. But you can use munit or a tink one lots are supported by haxe-doctest.
      
- It's quite easy to setup in my case [geom/GeomTest.hx](https://github.com/nanjizal/geom/blob/master/src/geom/GeomTest.hx)
      
- So far I have only implemented some tests in one class still very much work in progress library, but already helped clarify my thoughts, and document aspects of my library as it progresses. [/geom/Matrix1x2.hx](https://github.com/nanjizal/geom/blob/master/src/geom/Matrix1x2.hx) 

- Then to run my tests:

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
