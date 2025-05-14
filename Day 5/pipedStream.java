import java.io.PipedOutputStream;
import java.io.PipedInputStream;
class pipedStream
{
    public static void main(String arg[]) throws Exception
	{
	   PipedOutputStream pos=new PipedOutputStream();
	   PipedInputStream pis=new PipedInputStream(pos);
		Thread t1=new Thread(() ->
		{
			try
			{
				pos.write("Hello".getBytes());
				pos.close();
			}
			catch(Exception e)
			{
				
			}
		});
		
		Thread t2=new Thread(() ->
		{
			try
			{
				int i=0;
				while((i=pis.read())!=-1)
				{
					System.out.print((char)i);
				}
			}
			catch(Exception e)
			{
				
			}
		});
		t1.start();
		t2.start();
	}
}