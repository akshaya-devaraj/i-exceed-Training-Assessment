class multipleThread2
{
    public static void main(String ar[]) 
	{
	    new Thread()
		{
		   public void run()
		   {
			   try{
		      for(int i=0;i<5;i++)
			  {
				  
			     System.out.println("Credit:"+i);
				 Thread.sleep(1000);
			  }
			   }
			   catch(InterruptedException e)
			   {
			   }
		   }
		   
		}.start();
		
		new Thread()
		{
			 public void run()
			 {
				 try
				 {
				  for(int i=0;i<5;i++)
				  {
					  System.out.println("Debit:"+i);
					  Thread.sleep(2000);
				  }
				 }
				 catch(InterruptedException e)
				 {
					 
				 }
			 }
		}.start();
	}
}