import java.util.*;
class demoArray
{
 public static void main(String args[])
 {
    Scanner sc=new Scanner(System.in);
    int n=sc.nextInt();
	int []a=new int[n];
	int i=0;
	for(i=0;i<n;i++)
	{
	   a[i]=sc.nextInt();
	}
	for(i=0;i<n;i++)
	{
	  System.out.print(a[i]+" ");
	}
	
 }
}