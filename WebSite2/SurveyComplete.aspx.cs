using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SurveyComplete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Convert.ToBoolean(Session["Contact"]))
            {
                contactLabel.Text = "A customer service representative will contact you within 24 hours.";
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Server.Transfer("Surveys.aspx");
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Server.Transfer("Default.aspx");
    }
}