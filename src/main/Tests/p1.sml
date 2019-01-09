class Test {
	def main() : int {
		writeln("123");
		writeln(1 + 2);
		writeln(1 * 2 / 3 - 4);
		writeln(new Test2().a(100) + 100);
		writeln(new Test2().b());
		writeln(new Test2().c("hi"));
		writeln(new Test2().d());
		writeln(new Test2().e());
		writeln(new Test3().bb().aaa());
		writeln((new Test3().bb().aaa())[0]);
		return 0;
	}
}
class Test2{
	def a(i : int):int{
		return i + 2;
	}
	def b():int{
	 	return 33;
	}
	def c(g:string):string{
		return g;
	}
	def d():string{
		return "hello";
	}
	def e():string{
		return new Test3().aa();
	}
}
class Test3{
	var a :string;
	def cc():int{
		a = "bye";
		return 0;
	}
	def aa():string{
		this.cc() + 1;
		return a;
	}
	def bb():Test4{
		return new Test4();
	}
}
class Test4{
	def aaa(w:int):int[]{
		var k :int[];
		k = new int [2];
		k[0] = w;
		k[1] = 1;
		return k;
	}
}