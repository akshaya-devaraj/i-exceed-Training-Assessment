import java.io.StringReader;
class stringReader
{
	 public static void main(String ar[]) throws Exception
	 {
		 char [] ch=new char[100];
		 String str="welcome";
		 StringReader sr=new StringReader(str);
		 int i=0;
		 sr.skip(2);
		  System.out.println(sr.ready());
		 while((i=sr.read())!=-1)
		 {
		 System.out.println((char)i);
		 }
		 sr.read(ch);
		
		 System.out.print(ch);
	 }
}