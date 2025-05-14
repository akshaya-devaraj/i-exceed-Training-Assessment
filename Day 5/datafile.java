import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.lang.Integer;
class datafile
{
    public static void main(String arg[]) throws Exception
	{
	   DataOutputStream dos=new DataOutputStream(new FileOutputStream("data.txt"));
	   dos.writeInt(1234);
	   dos.writeBoolean(true);
	   dos.writeDouble(23.0);
	   
	    DataInputStream dis=new DataInputStream(new FileInputStream("data.txt"));
		System.out.println(dis.readInt());
		System.out.println(dis.readBoolean());
		System.out.println(dis.readDouble());
		
		DataInputStream dis1=new DataInputStream(System.in);
		int x=dis1.readInt();
		int y=Integer.valueOf(dis1.readLine()).intValue();
		
		System.out.println(x);
		System.out.println(y);
	}
}