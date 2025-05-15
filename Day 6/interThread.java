class food
{
    double amt=10000.00;
	synchronized public void amtPaid(double amt)
	{
	     
		 if(this.amt<amt)
		 {
	      System.out.println(amt+" Amount has to be paid");
			 this.amt=amt;
		 try
		 {
		      wait();
		 }
		 catch(InterruptedException e)
		 {
		 
		 }
		 }
		 this.amt-=amt;
		 System.out.println("Amount Received");
	}
	 synchronized public void amtNotPaid(double amt)
	{
		 this.amt+=amt;
	     System.out.println(amt+" Amount not paid");
		 notify();
	}

}
class interThread
{
   public static void main(String ar[])
   {
         food r=new food();
		 new Thread()
		 {
		      public void run()
			  {
			      r.amtPaid(20000.0);
			  }
		 }.start();
		 
		 new Thread()
		 {
		    public void run()
			{
			     r.amtNotPaid(20000.0);
			}
			    
		 }.start();
       
   }
     
}