import java.util.*;
class traverse
{
     public static void main(String arg[])
	 {
	     LinkedList ll=new LinkedList();
		 ll.add("Hi");
		 ll.add("Welcome");
		 ll.add("You");
		 ll.add("All");
		 
		 Iterator i=ll.iterator();
		 while(i.hasNext())
		 {
		     System.out.println(i.next());
		 }
		 
		 System.out.println("Splitator");
		 Spliterator s=ll.spliterator();
		 
		 s.forEachRemaining(e->System.out.println(e));
	 }
}