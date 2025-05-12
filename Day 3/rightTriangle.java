import java.util.*;
class rightTriangle
{

    public static void main(String ar[])
	{
	   Scanner sc=new Scanner(System.in);
	   int n=sc.nextInt();
	   int i=1,j=1;
	   for(i=1;i<=n;i++)
	   {
	      for(j=1;j<=i;j++)
		  {
		    System.out.print("*"+" ");
		  }
		  System.out.println();
	   }
	}
}
