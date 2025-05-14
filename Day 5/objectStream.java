import java.io.Serializable;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.io.FileInputStream;

class detail implements Serializable
{
    String name,city;
	transient int age;
	 
	detail(String name,int age,String city)
	{
	this.name=name;
	this.age=age;
	this.city=city;
	}
}
class objectStream
{
     public static void main(String ar[])
	 {
		 try{
	     detail d=new detail("Aksh",21,"cbe");
		  FileOutputStream fs=new FileOutputStream("object.txt");
		 ObjectOutputStream obs=new ObjectOutputStream(fs);
		 obs.writeObject(d);
		 obs.close();
	     ObjectInputStream obi=new ObjectInputStream(new FileInputStream("object.txt"));
		 detail ds=(detail)obi.readObject();	 
		 System.out.println(ds.name+" "+ds.age+" "+ds.city);
			 
		 }
		 catch(Exception e)
		 {
			 
		 }
	  }
}