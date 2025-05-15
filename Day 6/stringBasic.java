import java.util.*;
class stringBasic
{
     public static void main(String ar[])
	 {
	    String s1="Welcome";
		String s2=new String("Welcome").intern();
		 
		System.out.println("The length of the String 1 :\n"+s1.length());
		 
		System.out.println("The length of the String 2 :\n"+s2.length());
		 
		System.out.println("To find String is empty :"+s2.isEmpty());
		 
		 System.out.println("To change the String to LowerCase :"+s1.toLowerCase());
		 
		 System.out.println("To change the String to UpperCase :"+s2.toUpperCase());
		 
		 System.out.println("To check whether String1 contains the String2 :"+s1.contains(s2));
		 
		 System.out.println("To check Strings are equal :"+s1.equals(s2));
		 
		 System.out.println("To find the length before Trim the spaces :"+s1.length());
		 
		 System.out.println("To find the length after trim the whitespaces :"+s1.trim().length());
		 
		 System.out.println("To check the strings are equal using operator :"+s1==s2);
		 
		 String s4="Hello";
		 
		 
		 System.out.println("To change the value from the heap memory to the String constant Pool :"+(s1==s2));
		 
		 


		
	 }
	 
}