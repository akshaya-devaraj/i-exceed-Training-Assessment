class multi extends Thread
{
     Thread t=new Thread();
	 multi()
	 {
	 
	 }
	 public void run()
	 {
	 try{
	    for(int i=0;i<10;i++)
		{
		   System.out.println(i+t.getName());
		   t.sleep(500);
		}
		}
		catch(InterruptedException e)
		{
		
		}
	 }
}
class multiThread
{
    public static void main(String args[]) throws InterruptedException 
	{
	     multi m1=new multi();
		 multi m2=new multi();
		 multi m3=new multi();
		 m1.setPriority(8);
		 m2.setPriority(9);
		 m3.setPriority(5);
		 System.out.println(m1.getPriority());
		 System.out.println(m2.getPriority());
		 System.out.println(m3.getPriority());
		 m1.start();
		 m1.join();
		 m2.start();
		 m2.join();
		 m3.start();
	}
}