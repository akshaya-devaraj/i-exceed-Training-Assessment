class call
{
    synchronized public void call(String msg)
	{
		System.out.print("[");
	    System.out.print(msg);
		System.out.print("]");
		this.display();
	}
	public void display()
	{
		 for(int i=0;i<10;i++)
		 System.out.println(i);
	}
}
class caller extends Thread
{
      Thread t=new Thread(this);
      call targ;
	  String msg;
	  
      caller(call targ,String msg)
	  {
	   this.targ=targ;
	   this.msg=msg;
	   t.start();
	  }
	  public void run()
	  {
	      synchronized(targ)
		  {
	      targ.call(msg);
		  }
	  }
}
class syncBlock
{
       public static void main(String args[]) 
	   {
	       call c=new call();
		   caller cl=new caller(c,"Welcome");
		   caller cl1=new caller(c,"you");
		   caller cl2=new caller(c,"all");
		   
	   }
}