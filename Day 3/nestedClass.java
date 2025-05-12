class student
{
   private String name;
   student()
   {
       System.out.print("Display the name:");
   }
   
   
   class address
   {
    String strt,city;
	int plt,pin;
   
	   public void display(String name,int plt,String strt,String city,int pin)
	   {
		   this.plt=plt;
		   this.strt=strt;
		   this.city=city;
		   this.pin=pin;
		   System.out.println(name);
		  System.out.println(plt);
		  System.out.println(strt);
		  System.out.println(city);
		  System.out.println(pin); 
	   }
   }
   
}

class nestedClass
{
   public static void main(String args[])
   {
         student s=new student();
	     student.address a=s.new address();
	     a.display("Aksh",12,"kannan strt","cbe",641006);
	     
		 
		 
   }
}