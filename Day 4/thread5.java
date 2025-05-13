class sample extends Thread
{
     Thread t=new Thread();
	 sample()
	 { 
	 t.start();
	 }

		public void run()
		{
            for(int i=0;i<10;i++)
			System.out.println(i);
		}

}
class thread5 
{
        public static void main(String arg[])
		{
		     new sample();
			 
		}


}
