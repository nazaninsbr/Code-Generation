class RunThis {
    def main() : int {
        new XXX().main();
        return 0;
    }
}
class XXX {
    var a : boolean;
    var b : boolean;
    var c : int;
    var d : string;
    var k : int;

	def main():int {
		var hhh : Helper;
	    #var x : X;
	    hhh = new Helper();
	    writeln("111111111111111111");
	    writeln(hhh.pow(1,2));
	    writeln("2222222222222222222");
	    writeln(hhh.someFunc(1,2));
	    writeln("3333333333333333333");
	    writeln(hhh.getArray());
	    writeln("4444444444444444444");
	    writeln(hhh.changeAll2(1,2));
	    writeln("5555555555555555555");
	    writeln(hhh.changeAll(1,2,"hiii"));
	    writeln("6666666666666666666");
	    writeln(hhh.printAll());
	    writeln("777777777777777777777");
	   # x = new X();

	    if(1 <> 2) then {
	        writeln("ok");
	    } else {
	        writeln("nnoooooo");
	    }
		return 11;
	}
}
class Helper {
    var b : boolean;
    var i : int;
    var s : string;
    var a : int[];
    var tmp : int;

    def pow(aa : int, b : int) : int {
        var result : int;

        if(b == 0) then
            result = 1;
        if(b == 1) then
            result = aa;
        else
            result = 90;

        return result;
    }

    def someFunc(aa : int, i : int) : int {
        aa = 231 / (i + aa * i + 1) + 1;
        i = 234 / (i+1) / (i+1) / (i+1);
        return i / i+1;
    }

    def getArray() : int[] {
        return a;
    }



    def changeAll2(aVal : int, bVal : int) : int {

        var i : int;
        #tmp = this.someFunc(31, 3123);
        a = new int[5];
        a = new int[100];

        i = 0;
        while(i < aVal) {
            a[i] = i * bVal + aVal;
            i = i + 1;
        }

        i = 0;
        while(i < aVal-1) {
            a[i] = a[i+1] + 100 + aVal;
            i = i + 2;
        }

        i = 1;
        while(i < aVal) {
            a[0] = a[i -1];
            i = i + 1;
        }

        return 0;
    }

    def changeAll(xx : int, yy : int, ss : string) : int {
        b = true;
        i = 10001;
        s = ss;
        a = new int[150];
        a[0] = xx + yy;
        a[10] = xx / yy;
        a[100] = (((xx - yy))) + (2 + a[10] - 100) + 34 / 3;
        a[2] = a[0] + a[1] * a[100];
        return xx;
    }

    def printAll() : string {
        writeln("------------");
        writeln(a.length);
        writeln(3 + 3 - 5 * 6 / 7 + a[3] / (a[4] * i + i) + 1);
        writeln(a);
        writeln(this.pow(12, 6));
        #writeln(new int[10][5] / 32);
        writeln(i);
        writeln(s);
        writeln(a);
        writeln(this.toString());
        i = -i;
        writeln(i);
        if(b) then
            writeln("true");
        else
            writeln("false");

        i = i + i / 34;
        s = "fsdffs";
        a = new int[100];

        {
            writeln("this is a block!");
        }

        return "ok";
    }

}