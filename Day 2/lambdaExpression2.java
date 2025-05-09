
interface functional1
{ 
    public void display1();
}


interface functional2
{
     public void display2();
}


class lambdaExpression2
{
    public static void main(String args[])
	{
	   new functional1()
	   {
	        @Override
			public void display1()
			{
			  System.out.println("Lambda Expression 1 is displayed");
			}
	   }.display1();
	   
	   new functional2()
	   {
	       @Override
		   public void display2()
		   {
		       System.out.println("Lambda Expression 2 is displayed");
		   }
	   }.display2();
	}
}