class A
{
    public void display()
	{
	    System.out.println("A");
	}
}
class B extends A
{
    public void display()
	{
	  System.out.print("B");
	}
}
class override
{
    public static void main(String ar[])
	{
	   A ref;
	   A obj1=new A();
	   B obj2=new B();
	   ref=obj2;
		ref.display();
	}
}