import java.util.*;
class sample
{
   List al=new ArrayList();
	
   
     sample()
      {
         al.add(100);
		 al.add(50);
		 al.add(60);
		 al.add(75);
		 al.add("Hello");
		 
		 Iterator i=al.iterator();
		 
		 while(i.hasNext())
		 {
			   System.out.println(i.next());
		 }
      }
	


}
class arrayList
{
    public static void main(String args[])
	{
	     new sample();
	}
}