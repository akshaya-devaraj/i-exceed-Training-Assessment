import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;

class byteoutput
{
    public static void main(String arg[]) throws Exception
	{
	     FileOutputStream file1=new FileOutputStream("file1.txt");
		 FileOutputStream file2=new FileOutputStream("file2.txt");
		 ByteArrayOutputStream b=new ByteArrayOutputStream();
		 String str="This is the file written using the ByteArrayOutputStream";
		 byte [] by=str.getBytes();
		
		 b.write(by); 
		 b.writeTo(file1);
		 b.writeTo(file2);
		 
		 b.flush();
		 b.close();
		 
		 
		 }
}