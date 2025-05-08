class sim
{

      public void call()
	  {
	      System.out.println("sim ");	   
	  }
	  
}
class phone extends sim
{
      @Override
	  public void call()
	  {
	    System.out.println("phone sim");
	  }
     public void display()
	 {
	     System.out.println("Phone");
	 }
}
class upcast
{

    public static void main(String ar[])
	{
	  sim s=new phone();
	  s.call();
	  
	}
}