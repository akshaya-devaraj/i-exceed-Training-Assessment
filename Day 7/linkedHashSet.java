import java.util.*;
class linkedHashSet
{
      public static void main(String ar[])
	  {
	     LinkedHashSet s=new LinkedHashSet<>();
		 s.add("java");
	 	 s.add("python");
	     s.add("c++");
	     s.add("c");
	     s.add("Selenium");
	     s.add("Dart");
	     s.add("Flutter");
		 s.add("Flutter");
		 
		 Iterator i=s.iterator();
		  System.out.println("Displaying the Iterator");
		 while(i.hasNext())
		 {
			 System.out.println(i.next());
		 }
		  
		  Spliterator sp=s.spliterator();
		  
		  System.out.println("Displaying the spliterator");
		  sp.forEachRemaining(x->System.out.println(x));
		  
		  LinkedHashSet s1=new LinkedHashSet();
		  s1.addAll(s);
		  System.out.println(s1);
		  boolean b=s1.equals(s);
		  System.out.println("Check sets are equal: "+b);
		  boolean b1=s1.containsAll(s);
		  System.out.println("Check set contain all elements : "+b1);
		  boolean ra=s1.removeAll(s);
		  System.out.println("Is elements removed: "+ra);
		  System.out.println(s1);
	  }
}