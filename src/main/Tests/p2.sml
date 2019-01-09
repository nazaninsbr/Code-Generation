class ww1 {
	def main() : int {
		writeln(new ww2().a());
		return 0;
	}
}
class ww2{
	def a(i : int,j:int[],k:string, e:ww3):int[]{
		j[0] = i * 2 * 3 ;
		j[1] = j[0] + e.bb();
		j[2] = (1 * (2 / 3 ))+ (4 - -5 );
		j[3] = 100;
		return j;
	}
}
class ww3 extends ww4{
	def bb():int {
		a = 45;
		return a;
	}
}
class ww4{
	var a :int;
	def vv():int{
		return 0;
	}
}