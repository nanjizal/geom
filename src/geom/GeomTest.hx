package geom;
#if !geomDoc
import utest.Runner;
import utest.Test;
import utest.ui.Report;
import equals.Equal;
import utest.Assert;
// subfolders
import geom.Numerical;
import geom.constraints.*;
import geom.curve.*;
import geom.flat.*;
import geom.matrix.*;
import geom.move.*;
import geom.obj.*;
import geom.structure.*;
import geom.systemL.*;
import geom.tydef.*;
import geom.matrixConversion.*;

@:build(hx.doctest.DocTestGenerator.generateDocTests())
@:build(utest.utils.TestBuilder.build())
class GeomTest extends utest.Test {
    public static function main() {
        var runner = new Runner();
        runner.addCase( new GeomTest() );
        Report.create(runner);
        runner.run();
    }
    function new() {
        super();
    }
}
#end