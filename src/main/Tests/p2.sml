class ww1 {
	def main() : int {
		new ww3().cc();
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
	def cc():int{
		var l : int[];
		var t :string;
		l = new int[4];
		t = "hello";
		writeln(new ww2().a(11,l,t,new ww3()));
		return 10;
	}
}
class ww4{
	var a :int;
	def vv():int{
		return 0;
	}
}