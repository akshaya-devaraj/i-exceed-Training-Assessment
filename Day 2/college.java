package APackage;

public class college
{
     String name,city;
	 int code;
	 public college(String name,int code,String city)
	 {
	 this.name=name;
	 this.code=code;
	 this.city=city;
	 }
	 
	 public void displayCollege()
	 {
	  System.out.println("College Name: "+name);
	  System.out.println("Colege code: "+code);
	  System.out.println("College city: "+city);
	 }
}