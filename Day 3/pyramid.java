import java.util.*;
class pyramid
{
    public static void main(String ar[])
	{
	
	   Scanner sc=new Scanner(System.in);
	   int n=sc.nextInt();
	   int i,j=1;
	   for(i=1;i<n;i++)
	   {
	     for(j=1;j<n-1;j++)
		 {
		     System.out.print(" ");
		 }
		 for(j=1;j<i*2;j++)
		 {
		     System.out.print("*"+" ");
		 }
		   System.out.println();
	   }
	   
	}
}