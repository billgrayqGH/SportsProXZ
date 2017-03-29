using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CList
/// </summary>
public class CList
{
	public CList(){}

	public CList(Customer customer)
    {
        this.Customer= customer;
      
    }

    public Customer Customer { get; set; }
    

   
    public string Display()
    {
        string displayString = 
            Customer.Name +  "    " + Customer.Email + "     " + Customer.Phone;

        return displayString;
    }
    
}