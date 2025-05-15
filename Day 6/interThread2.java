class customer
{
    int amt=10000;
	synchronized public void withdraw(int amt)
	{
	     if(this.amt<amt)
		 {
	     System.out.println("Insufficient balance");
		   try
		   {
		      wait();
		   }
		   catch(InterruptedException e)
		   {
		   
		   }
		 }
		 this.amt-=amt;
		 System.out.println("Withdraw done");
	}
	synchronized public void deposit(int amt)
	{ 
	      this.amt+=amt;
		  System.out.println("Amount Deposited");
		  notify();
	
	}

}
class interThread2
{
    	public static void main(String ar[])
		{
      		customer c=new customer();
	  		new Thread()
	  		{
			    public void run()
				{
				     c.withdraw(20000);
				}
			}.start();
			
			new Thread()
	  		{
			    public void run()
				{
				     c.deposit(200000);
				}
			}.start();
	   
	 	 }
	  
}