import java.io.BufferedReader;
import java.io.FileReader;
class demoBuffered
{
   public static void main(String ar[]) throws Exception
   {
       FileReader fr=new FileReader("sample1.txt");
       BufferedReader br=new BufferedReader(fr);
	   int i=0;
	  
	   System.out.println(br.markSupported());
	    System.out.println((char)br.read());
	   br.mark(5);
	    System.out.println((char)br.read());
	   System.out.println((char)br.read());
	   br.reset();
	    System.out.println((char)br.read());
	   
	   
   }
}