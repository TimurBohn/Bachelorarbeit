public class collatzEvenOdd{
  public static void main (String[] args) {
    int even = 0;
    int odd = 0;
    for (int i = 1; i<=1000; i++){
      System.out.println("Durchlauf : " + i);
      int n = i;
      while (n >=0) {
        if (n==1){
	  odd++;
	  System.out.println("even = " + even + "; odd = " + odd);
          break;
        } else if (n % 2 == 0) {
          n = n/2;
          even++;
        } else {
          n = 3*n + 1;
          odd++;
        }
      }
    }
  }
}