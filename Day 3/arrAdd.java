import java.util.*;
class arrAdd
{
   public static void main(String args[])
   {
      Scanner sc=new Scanner(System.in);
	  int n=sc.nextInt();
	  int a[]=new int[n];
	  int i=0;
	  for(i=0;i<n;i++)
	  {
	   a[i]=sc.nextInt();
	  }
	  int sum=0;
	  for(i=0;i<n;i++)
	  {
	     sum+=a[i];
	  }
	  
	      System.out.println("Sum of the Array: "+sum);
	  }
}
