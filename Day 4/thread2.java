class sample extends Thread
{
    public void run()
	{
	     System.out.print("Thread1");
	}
}
class thread2
{
     public static void main(String args[])
	 {
	     sample s1=new sample();
		 s1.start();
		 sample s2=new sample();
		 s2.start();
	 }
}
