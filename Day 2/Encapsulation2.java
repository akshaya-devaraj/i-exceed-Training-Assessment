class student
{
    protected String name;
	protected int age;
	public student(String name,int age)
	{
		this.name=name;
		this.age=age;
	}
	public void getname(String name)
	{
	  this.name=name;
	}
	public String setName()
	{
	  return name;
	}
	public void getAge(int age)
	{
	    this.age=age;
	}
	public int setAge()
	{
	   return age;
	}
}
class department extends student
{
     private String dept;
	 public department(String name,int age,String dept)
	 {
	 super(name,age);
	 this.dept=dept;
	 
	 }
	 public void display()
	 {
	  System.out.println(name);
	   System.out.println(age);
	 System.out.println(dept);
	 }
}
class Encapsulation2
{
   public static void main(String args[])
   {
       department d=new department("Akshaya",21,"IT");
	   d.display();
   }
}