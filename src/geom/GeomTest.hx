package geom;
import utest.Runner;
import utest.Test;
import utest.ui.Report;
import equals.Equal;

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