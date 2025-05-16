import java.util.*;
class linkedListRemove
{
    public static void main(String ar[])
	{
	      LinkedList ll=new LinkedList();
		  ll.add("India");
		  ll.add("Japan");
		  ll.add("Russia");
		  ll.add("USA");
		  System.out.println("Printing the list: "+ll);
		  
		  ll.removeIf(x->(x.equals("Russia")));
		  
		  System.out.println("Using removeIf"+ll);
		ll.removeAll(ll);
		
		  System.out.println(ll);
	}
}