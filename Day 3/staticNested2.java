class  tamilNadu
{
     static int state_No=10;
	 tamilNadu()
	 {
		 System.out.println("Details of the district");
	 }

      static class coimbatore
	  {
	     int dist_No;
		 String spec;
		 public void displayDetails(int dist_No,String spec)
		 {
		     this.dist_No=dist_No;
			 this.spec=spec;
			 System.out.println(state_No);
			 System.out.println(dist_No);
			 System.out.println(spec);
		 }
	      
	  }
	  
}
class staticNested2
{
       public static void main(String a[])
	   {
	      tamilNadu t=new tamilNadu();
		  tamilNadu.coimbatore c=new tamilNadu.coimbatore();
		  c.displayDetails(2,"Wet Grinders");
	   }
}