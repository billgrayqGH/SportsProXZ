using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Incident
{
    public int IncidentID;
    public int CustomerID;
    public string ProductCode;
    public int TechID;
    public string DateOpened;
    public string DateClosed;
    public string Title;
    public string Description;
    public string ResolutionNotes;

    public string CustomerIncidentDisplay()
    {
        return "Incident for product " + ProductCode + " closed " + DateClosed.ToString() + " (" + Title + ")";
    }


}