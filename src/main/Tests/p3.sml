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
			writeln(j);
		}
		return j;
	}
}