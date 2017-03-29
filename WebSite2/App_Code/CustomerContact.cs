using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CustomerContact
{
	public CustomerContact(){}

	public CustomerContact(Customer customer1)
    {
        this.Customer= customer1;
      
    }

    public Customer Customer { get; set; }

    public string Display()
    {
       return  Customer.Name +  "    " + Customer.Email + "     " + Customer.Phone;

      
    }
    
}