interface student
{
     public void displayStudent();

}
interface department 
{
     public void displayDepartment();
}
class college implements student,department
{
     public void displayStudent()
	 {
	 
	  System.out.println("Display the Student details");
	 }
	 public void displayDepartment()
	 {
	   System.out.println("Display the Department details");
	 }
}
class multipleInheritance 
{
    public static void main(String arg[])
	{
	 college c=new college();
	 c.displayStudent();
	 c.displayDepartment();
	}

}