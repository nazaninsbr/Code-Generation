class Calculation {
   int z;
   public void addition(int x, int y) {
   }
   public void Subtraction(int x, int y) {
   }
}

public class z8 extends Calculation {
   public void multiplication(int x, int y) {
   }
	
   public static void main(String args[]) {
      int a = 20, b = 10;
      z8 demo = new z8();
      demo.addition(a, b);
      demo.Subtraction(a, b);
      demo.multiplication(a, b);
   }
}