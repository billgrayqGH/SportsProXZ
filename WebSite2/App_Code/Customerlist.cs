using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Customerlist
{
    private List<CustomerContact> cc;

    public Customerlist()
    {
        cc = new List<CustomerContact>();
    }

    public int Count
    {
        get { return cc.Count; }
    }

    public CustomerContact this[int index]
    {
        get { return cc[index]; }
        set { cc[index] = value; }
    }

    public CustomerContact this[string id]
    {
        get
        {
            foreach (CustomerContact customer1 in cc)
                if (customer1.Customer.CustomerID == id) return customer1;
            return null;
        }
    }

    public static Customerlist GetCustomer()
    {
        Customerlist cuslist = (Customerlist)HttpContext.Current.Session["list"];
        
        if (cuslist == null)
            HttpContext.Current.Session["list"] = new Customerlist();
        return (Customerlist)HttpContext.Current.Session["list"];
    }

    public void AddItem(Customer customer)
    {
        CustomerContact customer1 = new CustomerContact(customer);


        cc.Add(customer1);

    }
    private bool IsValidIndex(int index)
    {
        if (index >= 0 && index < Count)
            return true;
        else
            return false;
    }


    public bool RemoveAt(int index)
    {
        if (IsValidIndex(index))
        {
            cc.RemoveAt(index);
            return true;
        }
        else
            return false;
    }
    public void Clear()
    {
        cc.Clear();
    }
}
