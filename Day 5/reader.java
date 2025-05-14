import java.io.Reader;
import java.io.FileReader;
class reader
{
     public static void main(String args[]) throws Exception
	 {
		 char []ch=new char[100];
	    Reader read=new FileReader("sample1.txt");
		System.out.println(read.ready());
		 read.read(ch);
		 System.out.println(ch);
		 read.close();
	 }
}