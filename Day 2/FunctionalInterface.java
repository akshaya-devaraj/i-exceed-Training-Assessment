
interface function
{
  public void display();
}
class FunctionalInterface implements function
{
      public static void main(String rsg[])
	  {
	     FunctionalInterface f=new FunctionalInterface();
		 f.display();
	  }
	  public void display()
	  {
	   System.out.println("Displayed Functional Interface");
	  }
}