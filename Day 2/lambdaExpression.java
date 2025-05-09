@FunctionalInterface
interface functional
{
     public void show();
}
class lambdaExpression
{
      public static void main(String args[])
	  {
	      new functional()
		  {
		    @Override
			public void show()
			{
			   System.out.println("Functional Interface is displayed");
			}
		  }.show();
	  }
}