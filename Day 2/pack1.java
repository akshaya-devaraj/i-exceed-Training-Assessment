import APackage.college;

class student extends college
{
        String stu_name;
		int rno;

        student(String name,int code,String city,int rno,String stu_name)
		{
		     super(name,code,city);
			 this.rno=rno;
			 this.stu_name=stu_name;
			 
		}
		public void displayStudent()
		{
		    System.out.println("Student RollNo: "+rno);
			System.out.println("Student Name: "+stu_name);
		}

}
class pack1
{

    public static void main(String args[])
	{
	   student s=new student("SKCT",2522,"cbe",8,"Akshaya");
	   s.displayCollege();
	   s.displayStudent();
	   
	}
}