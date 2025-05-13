class sample extends Thread
{
    public void run()
	{
	    for(int i=0;i<10;i++)
		{
		   System.out.println("child"+i);
		}
	}

}
class demoThread1
{
	public static void main(String ars[])
	{
     sample s=new sample();
	 s.start();
		for(int i=0;i<10;i++)
		{
		   System.out.println("main"+i);
		}
	}
   
}
