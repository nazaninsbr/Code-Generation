class Test {
	def main() : int {
		writeln(new Math().factorial(2));
		return 0;
	}
}

class Math {
	var i : int;
	def factorial(f: int): int {
		var j: int; 
		j = 1;
		while (j <> 128){
			j = j*f; 
<<<<<<< HEAD
			writeln(j);
=======
			f = f -1;
>>>>>>> 6ae898fd26954526c59f972669a064322576839d
		}
		return j;
	}
}