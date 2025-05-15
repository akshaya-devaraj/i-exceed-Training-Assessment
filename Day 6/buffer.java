class buffer
{
    public static void main(String ar[])
	{
	     StringBuffer sb=new StringBuffer("Welcome");
		 sb.append("Home");
		 System.out.println(sb);
		
		System.out.println("The length of the buffer : "+sb.length());
		
		System.out.println("The capacity of the given StringBuffer : "+sb.capacity());
		
				
	}
}