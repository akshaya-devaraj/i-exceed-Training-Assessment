class A
{
    A()
	{
	System.out.println("parent class");
	}
	A(int a,int b)
	{
	System.out.println(a+b);
	}
}
class overload
{
     public static void main(String args[])
	 {
	    new A();
	  
	 }
	 
}