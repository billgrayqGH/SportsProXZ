using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Customers : System.Web.UI.Page
{

    private Customer customerdata;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) ddlCustomers.DataBind();
        customerdata = this.GetSelectedCustomer();
        lblAddress.Text = customerdata.Address;
        lblPhone.Text = customerdata.Phone;
        lblEmail.Text = customerdata.Email;

    }
    
    
    private Customer GetSelectedCustomer()
    {
 
        DataView customerdata = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        customerdata.RowFilter = "CustomerID= '" + ddlCustomers.SelectedValue + "'";
       
        DataRowView row = (DataRowView)customerdata[0];


        Customer cus1 = new Customer();
        
        cus1.CustomerID = row["CustomerID"].ToString();
        cus1.Name = row["Name"].ToString();
        cus1.Address = row["Address"].ToString();
        cus1.Phone = row["Phone"].ToString();
        cus1.Email = row["Email"].ToString();


        return cus1;
    }


    protected void btnAddContact_Click(object sender, EventArgs e)
    {


        if (Page.IsValid)
        {

            Customerlist list = Customerlist.GetCustomer();
            CustomerContact con = list[customerdata.CustomerID];
            if (con == null) {
                list.AddItem(customerdata);
            }
            else
            {
            }
                
                Server.Transfer("Contactlist.aspx");
            }
        }
    

    protected void btnDisplayContact_Click(object sender, EventArgs e)
    {
        Server.Transfer("Contactlist.aspx");
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Server.Transfer("Default.aspx");
    }
}



