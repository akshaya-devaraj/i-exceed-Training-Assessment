import java.util.*;
class arrayListPerformance
{
     public static void main(String arg[])
	 {
	     ArrayList<Integer> a1=new ArrayList<>();
		 for(int i=0;i<10000000;i++)
		 {
			   a1.add(i);
		 }
		 long starttime1=System.nanoTime();
		 for(int i=0;i<a1.size();i++)
		 {
		     int a=a1.get(i);
		 }
		 long endtime1=System.nanoTime();
		 long dur1=endtime1-starttime1;
		 System.out.println("for loop execution:"+dur1);
		 
		 Iterator<Integer> i=a1.iterator();
		 long start=System.nanoTime();
		 while(i.hasNext())
		 {
		      int b=i.next();
		 }
		 long end=System.nanoTime();
		 long dur2=end-start;
		 System.out.println("Iterator execution:"+dur2);
		 }
}