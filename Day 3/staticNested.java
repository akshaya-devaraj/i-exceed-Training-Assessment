class student
{

     static String name="Aksh";
	student()
	{
	    System.out.println("The details of the student:");
	
	}
	
	static class college
	{
	    String college_Name;
		int code;
		public void display(String college_Name,int code)
		{
			  this.college_Name=college_Name;
			  this.code=code;
			System.out.println(name);
			System.out.println(college_Name);
			System.out.println(code);
		}
	}
}
class staticNested
{
    public static void main(String ar[])
	{
	   student s=new student();
	   student.college c=new student.college();
	   c.display("Skct",2522);
	}
}