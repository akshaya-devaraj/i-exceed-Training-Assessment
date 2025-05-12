import java.util.*;
class ifelse
{
       public static void main(String ar[])
	   {
	     Scanner sc=new Scanner(System.in);
		 int a=sc.nextInt();
		 int b=sc.nextInt();
		 int c=sc.nextInt();
		 if(a==b && a==c && b==c)
		 {
		     System.out.println("Equilateral triangle");
		 }
		 else if(a==b || a==c ||b==c)
		 {
		     System.out.println("Isosceles triangle");
		 }
		 else
		 {
		     System.out.println("Scalene triangle");
		 }
		 
	   }
}