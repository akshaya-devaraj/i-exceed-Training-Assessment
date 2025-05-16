import java.util.*;
class arrayList
{
     public static void main(String ar[])
	 {
	  ArrayList<String> a=new ArrayList<>();
	  {
	      a.add("Hello");
		  a.add("Welcome");
		  a.add("All");
	  }
		 
	   ArrayList<String> b=new ArrayList<>(a);
		 {
			 b.add("Chennai");
			 b.add("mumbai");
			 b.add("Bengaluru");
			 b.remove("mumbai");
		 }
		 
		 System.out.println("Is Array is Empty : "+a.isEmpty());
		 System.out.println("Array 1 equals to array 2 :"+a.equals(b));
		 
	  Iterator i=b.iterator();
		 
	  while(i.hasNext())
	  {
		  
	    System.out.println(i.next());    
	  }
	  
	 }
}