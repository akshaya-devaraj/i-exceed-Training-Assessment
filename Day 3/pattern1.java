import java.util.*;
class pattern1
{

     public static void main(String ar[])
	 {
		 Scanner sc=new Scanner(System.in);
	     int n=sc.nextInt();
		 int i=0,j=0;
		 
		 for(i=0;i<n;i++)
		 {
		   for(j=0;j<n;j++)
		   {
		        if(i==j)
				{
				  System.out.print("&"+" ");
				}
			   else
			   {
				   
				   System.out.print("*"+" ");
			   }
		   }
		   System.out.println();
		 }
	 }
}
