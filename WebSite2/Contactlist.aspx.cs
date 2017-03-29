using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contactlist : System.Web.UI.Page
{
    private Customerlist cus_list;
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        cus_list = Customerlist.GetCustomer();
        if (!IsPostBack)
            this.ShowList();
    }

    private void ShowList()
    {
        ListBox1.Items.Clear();
        CustomerContact cuscon;
        for (int i = 0; i < cus_list.Count; i++)
        {
            cuscon = cus_list[i];
            ListBox1.Items.Add(cuscon.Display());
        }
    }



    protected void btnAdditonal_Click(object sender, EventArgs e)
    {
        Server.Transfer("Customers.aspx");
    }

    protected void btnEmpty_Click(object sender, EventArgs e)
    {
        if (cus_list.Count > 0)
        {
            cus_list.Clear();
            ListBox1.Items.Clear();
        }
    }


    protected void btnRemove_Click(object sender, EventArgs e)
    {
        if (cus_list.Count > 0)
        {
            if (ListBox1.SelectedIndex > -1)
            {
                cus_list.RemoveAt(ListBox1.SelectedIndex);
                this.ShowList();
            }
            else
            {
                lblMessage.Text = "Select contact you want to remove.";
            }
        }
    }


    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}