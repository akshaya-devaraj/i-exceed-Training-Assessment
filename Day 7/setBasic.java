import java.util.*;
class setBasic
{
	public static void main(String ar[])
	{
     HashSet<String> s=new HashSet<>();
	 s.add("java");
	 s.add("python");
	 s.add("c++");
	 s.add("c");
	 s.add("Selenium");
	 s.add("Dart");
	 s.add("Flutter");
	 
	 HashSet<String> s2=new HashSet<>();
		s2.addAll(s);
		System.out.println("Set is empty : "+s2.isEmpty());
		boolean b=s2.containsAll(s);
		System.out.println("Both set are equal : "+b);
		System.out.println(s2);
		
		Iterator i=s2.iterator();
		while(i.hasNext())
		{
			 System.out.println(i.next());
		}
		boolean b1=s2.removeAll(s);
		
		System.out.println(b1);
		
		
	}
}