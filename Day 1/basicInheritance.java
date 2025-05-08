//Inhe
class student
{
      String name,city;
      int age;
            student(String name,int age,String city)
            {
                      this.name=name;
                      this.age=age;
                      this.city=city;
	   }
             public void displayStudent()
             {
                       System.out.println(name);
                       System.out.println(age);
                       System.out.println(city);

              }
     
}
class dept extends student
{
           int rno;
           String dept;
           dept(String name,int age,String city,int rno,String dept)
           {
                  super(name,age,city);
                  this.rno=rno;
                   this.dept=dept;
            }
            public void displayDept()
           {

                 System.out.println(name);
                 System.out.println(age);
                 System.out.println(city);             
                 System.out.println(rno);
                 System.out.println(dept);
            }         
      
}
class basicInheritance
{
            public static void main(String ar[])
            {
                 dept d=new dept("aksh",21,"cbe",1202,"IT");
                   d.displayDept();
                  
             }
}