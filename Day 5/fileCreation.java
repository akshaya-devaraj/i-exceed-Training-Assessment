import java.io.File;
class fileCreation
{
    public static void main(String args[]) throws Exception
	{
	   File f=new File(args[0]);
	   boolean status=f.createNewFile();
		if(status)
		{
			 System.out.println("File is created");
		}
		else
		{
			System.out.println("File not created");
		}
		System.out.println(f.getName());
		System.out.println(f.isAbsolute());
		System.out.println(f.getAbsolutePath());
		System.out.println(f.exists());
		System.out.println(f.canRead());
		System.out.println(f.canWrite());
		
	   
	}
}