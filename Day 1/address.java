class address
{
    int plt,pin;
	String strt,city;
	address(int plt,String strt,String city,int pin)
	{
	    this.plt=plt;
		this.strt=strt;
		this.city=city;
		this.pin=pin;		
	}
	
	public void displayAddress()
	{
	    System.out.print(plt+" "+strt+" "+city+" "+pin);
	}

}