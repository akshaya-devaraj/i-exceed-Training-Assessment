class sample extends Thread
{
    Thread t=new Thread();
	public void run()
	{
	try{
	   for(int i=0;i<10;i++)
	   {
	       System.out.println("child "+i);
		   t.sleep(5000);
	   }
	   }
	   catch(Exception e)
	   {
	   
	   }
	}
}
class thread4 
{
public static void main(String args[]) throws Exception
{
     new sample().start();
	 Thread t=Thread.currentThread();
	 for(int i=0;i<10;i++)
	 {
	   System.out.println("Main"+i);
	   t.sleep(10000);
	 }
}
  
}