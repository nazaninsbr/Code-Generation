class Test {
	def main() : int {
		writeln(1);
		writeln(new SecondMain().a(new int[2]));
		writeln(new SecondMain().b().constructor(1,2));
		return 0;
	}
}

class SecondMain extends Test{
	var x : Rectangle;
	def a(z: int[]):int[]{
		var o : int[];
		o = new int[2];
		return o;
	}
	def b():Rectangle{
		var q : Rectangle;
		q = new Rectangle();
		return q;
	}
	def area2(): int {
	return 3;
	}
}

class Rectangle extends SecondMain{

	def constructor(x: int, y:int): int {
		return 0;
	}

	def main2(): int {
		var x: int;
		#s = new Rectangle(); 
		#x = s;
		return 2;
	}

	def area(): int {
		return 23;
	}
	def f(z: int[]):int[]{
		return z;
	}
}
class A extends Rectangle{
		var s1 : Rectangle;
		var s2 : SecondMain;
		var s3 : Test;
		var s4 : A;
		var s5 : string;
		var s6 : int;
		var s7 : int[];
		def main3(): Rectangle {
		var x: int;
		s1 = new Rectangle();
		return s1;
	}
}