
import java.io.FileInputStream;
import java.io.FileOutputStream;
class file
{
    public static void main(String ar[]) throws Exception
	{
	   FileOutputStream fos=new FileOutputStream("sample1.txt");
	   String a="Hi all!";
	   byte[] b=a.getBytes();
	   fos.write(b);
	   fos.close();
		
		FileInputStream fis=new FileInputStream("sample1.txt");
		int i=0;
		while((i=fis.read())!=-1)
		{
			 System.out.print((char)i);
		}
	   
	}
}