import java.io.DataInputStream;

class sample
{
   DataInputStream di=new DataInputStream(System.in);
     sample()
	 {
	       try
		   {
		   int a=Integer.parseInt(di.readLine());
		   int b=Integer.parseInt(di.readLine());
		   Double x=Double.parseDouble(di.readLine());
		   Double y=Double.parseDouble(di.readLine());
		   int m=Integer.valueOf(di.readLine()).intValue();
			   float n=Float.valueOf(di.readLine()).floatValue();
		   System.out.println(a+b);
		   System.out.println(x+y);
		   System.out.println(m);
			   System.out.println(n);
		       
		   }
		   catch(Exception e)
		   {
		    
		   }
	 }
}
class demoDataInputStream
{
	public static void main(String ar[])
	{
     new sample();
	}
	 
}