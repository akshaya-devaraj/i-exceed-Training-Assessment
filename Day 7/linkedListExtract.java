import java.util.*;
class linkedListExtract
{
     public static void main(String ar[])
	 {
	     LinkedList ll=new LinkedList();
		 ll.add("Hr");
		 ll.add("consultant");
		 ll.add("Developer");
		 ll.add("Manager");
		 
		 System.out.println("Get the Department: "+ll.get(2));
		 System.out.println("Get the getFirst Element: "+ll.getFirst());
		 System.out.println("Get the getLast Element: "+ll.getLast());
		 System.out.println("get the peek Element: "+ll.peek());
		 System.out.println("Get the peekFirst Element: "+ll.peekFirst());
		 System.out.println("Get the peekLast Element: "+ll.peekLast());
		 System.out.println("Using Element Method: "+ll.element());
		 System.out.println("using Poll method: "+ll.poll());
		 System.out.println(ll);
		 System.out.println("Using PollFirst: "+ll.pollFirst());
		 System.out.println("Using PollLast: "+ll.pollLast());
		 System.out.println(ll);

	 }
}