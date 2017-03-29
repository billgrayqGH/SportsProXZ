using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["ProductCode"].DefaultValue
            = txtProductCode.Text;
        SqlDataSource1.InsertParameters["Name"].DefaultValue
            = txtName.Text;
        SqlDataSource1.InsertParameters["Version"].DefaultValue
            = txtVersion.Text;
        SqlDataSource1.InsertParameters["ReleaseDate"].DefaultValue
            = txtReleaseDate.Text;

        try
        {
            SqlDataSource1.Insert();
            txtProductCode.Text = "";
            txtName.Text = "";
            txtVersion.Text = "";
            txtReleaseDate.Text = "mm/dd/yy";
        }
        catch (Exception ex)
        {
            lblError.Text = "A database error has occurred.<br /><br />" +
                "Message: " + ex.Message;
        }
    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occurred.<br /><br />" +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that category." +
                "<br />Please try again.";
        }
    }

    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occurred.<br /><br />" +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that category." +
                "<br />Please try again.";
        }
    }
}