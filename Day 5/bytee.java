import java.io.ByteArrayInputStream;

class bytee
{
   public static void main(String arg[])
   {
      byte[] b={65,66,67,97};
	   
	   ByteArrayInputStream bais=new ByteArrayInputStream(b);
	   System.out.println("Available bytes "+bais.available());
	  /*for(int i=0;i<b.length;i++)
	  {
	      System.out.println(bais.read());
	  }*/
	   int i=0;
	   while((i=bais.read())!=-1)
	   {
		      System.out.println((char)bais.read());
	   }
	   System.out.println("Bytes Available after reading "+bais.available());
	   }
}