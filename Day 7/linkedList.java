import java.util.*;
class linkedList
{
    public static void main(String arg[])
	{
	    LinkedList ll=new LinkedList();
		ll.add("Maths");
		ll.add("english");
		ll.add("physics");
		ll.add(0,"tamil");
		ll.remove("physics");
		
		 Iterator i=ll.iterator();
		while(i.hasNext())
		{
		    System.out.println(i.next());
		} 
		
		
	}
}