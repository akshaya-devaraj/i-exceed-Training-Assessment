class student
{

       student()
	   {
	      System.out.println("student class extended");
	   }
}
class department extends student
{
       department()
	   {
	   
	    System.out.println("department class extended");
	   
	   }
}
class mark extends department
{

      mark()
	  {
		  
	     System.out.println("mark class extended");
	  }
}
class threeClassExtended
{

   public static void main(String ar[])
   {
      new mark();
   }
}
