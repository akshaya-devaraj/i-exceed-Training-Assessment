
class sample
{
       
	int a;
	   public void check(int a)
	   {
	   if(a!=0)
	   {
	      if(a==18)
		  {
		     System.out.println("eligible");
		  }
		  else
		  {
		      System.out.println("Not eligible");
		  }
	   }
	   }
   
   
}
class nestedif
{
    public static void main(String ar[])
	{
	  	   sample s=new sample();
		s.check(18);
		
	   
	}
}