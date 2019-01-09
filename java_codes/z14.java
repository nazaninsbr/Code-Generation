import java.util.Arrays;
/**
 * A Simple Program That Prints An Array In Java using Arrays.toString().
 */
public class z14 {
   private static void printArray(int[] anArray) {
      System.out.println(Arrays.toString(anArray));
   }
   public static void main(String[] args) {
      int[] testArray = { 1, 2, 3 };
      printArray(testArray);
   }
}