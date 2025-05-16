import java.util.*;
class listIterator
{
    public static void main(String ars[])
	{
	     LinkedList ll=new LinkedList();
		 ll.add("java");
		 ll.add("python");
		 ll.add("c++");
		 ll.add("Ruby");
		 ll.add("Dart");
		 ll.add("Flutter");
		 
		 ListIterator li=ll.listIterator();
		 
		 while(li.hasNext())
		 {
		      System.out.println(li.next());
		 }
		
		System.out.println("Has previous Method:");
		 while(li.hasPrevious())
		 {
		      System.out.println(li.previous());
		 }
	}
}