using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Surveys : System.Web.UI.Page
{
    Incident inc = new Incident();
    protected void Page_Load(object sender, EventArgs e)
    {
        customerIDtxtBox.Focus();
    }

    protected void getIncidentsBtn_Click(object sender, EventArgs e)
    {
   
        addCommentstxtBox.Text = "";
        ResponseList.ClearSelection();
        TechEffList.ClearSelection();
        ProResList.ClearSelection();
        RadioButtonList1.ClearSelection();
      
        
        contactMechkBox.Checked = false;   
        ResponseList.Enabled = false;
        TechEffList.Enabled = false;
        ProResList.Enabled = false;
        addCommentstxtBox.Enabled = false;
        contactMechkBox.Enabled = false;
        RadioButtonList1.Enabled = false;
        submitBtn.Enabled = false;
        listBoxIncidents.Enabled = false;
      
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        dv.RowFilter = "CustomerID= '" + customerIDtxtBox.Text + "'";
       
        listBoxIncidents.Items.Clear();
        if (dv.Count > 0)
        {
            inc.ProductCode = (string)dv.Table.Rows[0][0];
            inc.DateClosed = (string)dv.Table.Rows[0][1].ToString();
            inc.Title = (string)dv.Table.Rows[0][2];
            inc.IncidentID = (int)dv.Table.Rows[0][3];
            inc.CustomerID = (int)dv.Table.Rows[0][4];
            inc.TechID = (int)dv.Table.Rows[0][5];
            inc.DateOpened = (string)dv.Table.Rows[0][6].ToString();
            inc.Description = (string)dv.Table.Rows[0][7];
            inc.ResolutionNotes = (string)dv.Table.Rows[0][8];
            if (inc.DateClosed.Length > 0)
            {
                listBoxIncidents.Enabled = true;
                listBoxIncidents.Focus();
                listBoxIncidents.Items.Add(inc.CustomerIncidentDisplay());
                ResponseList.Enabled = true;
                TechEffList.Enabled = true;
                ProResList.Enabled = true;
                addCommentstxtBox.Enabled = true;
                contactMechkBox.Enabled = true;
                RadioButtonList1.Enabled = true;
                submitBtn.Enabled = true;
                
            }
          
            
        }


    }
    protected void submitBtn_Click(object sender, EventArgs e)
    {
        RequiredFieldValidator2.Enabled = true;
        RequiredFieldValidator3.Enabled = true;
        RequiredFieldValidator4.Enabled = true;
        RequiredFieldValidator5.Enabled = true;
       
        
        Survey surv = new Survey();
        surv.CustomerID = inc.CustomerID;
        surv.IncidentID = inc.IncidentID;
        surv.ResponseTime = Int32.Parse(ResponseList.SelectedValue);
        surv.TechEfficiency = Int32.Parse(TechEffList.SelectedValue);
        surv.Resolution = Int32.Parse(ProResList.SelectedValue);
        surv.Comments = addCommentstxtBox.Text;
        
        
        if (contactMechkBox.Checked == true)
        {
            surv.Contact = true;
            Session["Contact"] = true;
            surv.ContactBy = RadioButtonList1.Enabled.ToString();
        }
        else
        {
            surv.Contact = false;
            Session["Contact"] = false;
        }

        Server.Transfer("SurveyComplete.aspx");

    }
    protected void btnback_Click(object sender, EventArgs e)
    {
      
    }
    protected void ProResList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void contactMechkBox_CheckedChanged(object sender, EventArgs e)
    {
     

            
        
    }
    protected void ResponseList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void cPhone_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    
}