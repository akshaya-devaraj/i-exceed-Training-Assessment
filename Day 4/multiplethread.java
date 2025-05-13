class thread1 extends Thread
{
      public void run()
	  {
	      for(int i=0;i<5;i++)
		  {
		     System.out.println("Thread1="+i);
		  }
	  }
}
class thread2 extends Thread
{
     public void run()
	 {
	    for(int i=0;i<5;i++)
		{
		   System.out.println("Thread2="+i);
		}
	 }
}
class multiplethread
{
  	public static void main(String ar[])
  	{
       thread1 t1=new thread1();
	   thread2 t2=new thread2();
	   t1.start();
	   t2.start();
  	}
}