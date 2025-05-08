class student
{
            String name;
             int age;
             student(String name,int age)
              {
                   this.name=name;
                   this.age=age;
               }       
}
class department extends student
{
          String dept_name;
          department(String name,int age,String dept_name)
          {
               super(name,age);
               System.out.println(name);
               System.out.println(age);
               System.out.println(dept_name);
           }
}
class superMethod
{
              public static void main(String arg[])
              {
                     new department("aksh",21,"IT");
               }
}