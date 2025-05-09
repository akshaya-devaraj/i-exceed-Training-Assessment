class bank
{
     private String name;
	 private int ifsc;
	 private String branch;
	 
	 public void setName(String name)
	 {
	   this.name=name;
	 }
	 public String getName()
	 {
	    return name;
	 }
	 public void setIfsc(int ifsc)
	 { 
	     this.ifsc=ifsc;
	 }
	 public int getIfsc()
	 {
	     return ifsc;
	 }
	 public void setBranch(String branch)
	 {
	     this.branch=branch;
	 }
	 public String getBranch()
	 {
	      return branch;
	 }
	 
}
class encapsulation1
{
   public static void main(String args[])
   {
      bank b=new bank();
	  b.setName("sbi");
	  b.setIfsc(12345);
	  b.setBranch("Bangalore");
	  System.out.println(b.getName());
	  System.out.println(b.getIfsc());
	  System.out.println(b.getBranch());
   }
}