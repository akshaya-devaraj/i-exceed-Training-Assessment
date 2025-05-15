import java.util.*;
class sample
{
    List<String> ls=new ArrayList<>();
	sample()
	{
	    ls.add("Hello");
		ls.add("Welcome");
		ls.add("You");
		
		
		for(String s:ls)
		{
		    System.out.print(s+"\t");
		}
	}

}
class arrayUsingForEach
{
     public static void main(String args[])
	 {
	    new sample();
	 }
}