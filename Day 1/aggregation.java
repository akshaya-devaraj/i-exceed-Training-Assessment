class bank
{
    String b_name;
	int ifsc;
	bank(String b_name,int ifsc)
	{
	this.b_name=b_name;
	this.ifsc=ifsc;
	}
	public void displayBank(customer cus)
	{
	   System.out.println(b_name);
	   System.out.println(ifsc);
	   System.out.println(cus.name);
	   System.out.println(cus.acc);
	   System.out.println(cus.bal);
	   
	}
}
class customer
{
     String name;
	 int acc,bal;
	 customer(String name,int acc,int bal)
	 {
	   this.name=name;
	   this.acc=acc;
	   this.bal=bal;
	 }

}
class aggregation
{
     public static void main(String args[])
	 {
	     bank b=new bank("sbi",1234);
		 customer c=new customer("aksh",13446,100000);
		 b.displayBank(c);
	 }
}
