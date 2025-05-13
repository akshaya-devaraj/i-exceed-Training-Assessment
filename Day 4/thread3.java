class sample extends Thread
{
     Thread t=new Thread(this);
     public void run()
	 {
	     t.setName("Child Thread");
		 System.out.println("Display the ThreadName "+t.getName());
		 System.out.println(getPriority());
	 }
}
class thread3
{
     public static void main(String ar[])
	 {
		 new sample().start();
	     Thread t=new Thread();
		 t.setName("Main Thread");
		 System.out.println("Display the ThreadName "+t.getName());
	 }
      
}