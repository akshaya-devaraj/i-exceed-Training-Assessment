interface student
{
    String name="Akshaya";
	int age=21;
	String dept="IT";
	public void displayStudent();
	public void displayDepartment();
}
class display implements student
{
     @Override
     public void displayStudent()
	 {
	    System.out.println(name);
		System.out.println(age);
	 }
	 
	 @Override
	 public void displayDepartment()
	 {  
	   System.out.println(dept);
	 }
}
class Inheritance
{
     public static void main(String args[])
	 {
	    display d=new display();
		d.displayStudent();
		d.displayDepartment();
	 }
}