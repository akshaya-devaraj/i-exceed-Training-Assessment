class bufferAndBuilder
{
      public static void main(String ar[])
	  {
	      long buffer=System.currentTimeMillis();
		  StringBuffer sb1=new StringBuffer("Hello");
		  for(int i=0;i<10000000;i++)
		  {
		       sb1.append("All");
		  }
		  System.out.println("The time taken by Buffer");
		  System.out.println(System.currentTimeMillis()-buffer+" ms ");
		  
		  
		  long builder=System.currentTimeMillis();
		  StringBuilder sb2=new StringBuilder("Hello");
		  for(int i=0;i<10000000;i++)
		  {
			  sb2.append("All");
		  }
		  System.out.println("The time taken by Builder");
		  System.out.println(System.currentTimeMillis()-builder+" ms ");
	  }
}