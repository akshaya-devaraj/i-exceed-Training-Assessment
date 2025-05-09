interface add
{
    public void add(int a,int b);
}
interface sub extends add
{ 
    public void sub(int a,int b);
}
class calculation implements sub
{ 
 @Override
 public void add(int a,int b)
 {
    System.out.println(a+b);
 }
 
 @Override
 public void sub(int a,int b)
 {
    System.out.println(a-b);
 }
    
}
class inher
{
    public static void main(String args[])
	{
	      calculation c=new calculation();
		  c.add(10,20);
		  c.sub(10000,900);
	}
	
}
