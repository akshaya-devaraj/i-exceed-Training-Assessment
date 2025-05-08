class student
{
         student()
         {
               System.out.println("Base class is called");
          }
          student(int a,int b)
          {
                this();
                System.out.println(a*b);
           }
    
}
class department extends student
{
          department()
           {
                 super(120,100);
                 System.out.print("Department class is called");
            }
 
}
class thisMethod
{

         public static void main(String ar[])
         {
               new department();
                  
          }
}