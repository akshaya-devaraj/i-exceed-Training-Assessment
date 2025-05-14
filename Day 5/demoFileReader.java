import java.io.FileReader;
import java.io.File;
class demoFileReader
{
    public static void main(String args[]) throws Exception
	{
		File fo=new File("sample1.txt");
		System.out.println(fo.getAbsolutePath());
		System.out.println(fo.getName());
	    FileReader fr=new FileReader(fo);
		int i=0;
		
		while((i=fr.read())!=-1)
		{
	    System.out.print((char)i);
		}
		
	    System.out.println(fr.getEncoding());
		fr.close();
	}
}