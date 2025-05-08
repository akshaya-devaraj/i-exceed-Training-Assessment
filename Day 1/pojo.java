class student
{
     String name;
	 int age;
	address adr;
	college clg;
	 student(String name,int age,address adr,college clg)
	 {
	    this.name=name;
		this.age=age;
		this.adr=adr;
		this.clg=clg;
	 }
	 public void displayStudent()
	 {
	     System.out.println(name);
		 System.out.println(age);
		 adr.displayAddress();
		 clg.displayCollege();
		 
	 }
}
class pojo
{
       public static void main(String args[])
	   {
	     address a=new address(698,"8th cross","cbe",641006);
		 college c=new college("skct","IT");
		 student s=new student("aksh",21,a,c);
		 s.displayStudent();
	   }
}