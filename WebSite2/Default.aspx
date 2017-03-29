<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
         body {
                margin-top: 100px;
                margin-bottom: 100px;
                margin-left: 100px;
                background-color: #e0e0eb;
            }
        h1,h2 {
                text-align: center;
                color:#33adff;
                text-shadow: 1px 1px black;
                font: 30px arial, sans-serif;
            }

         h3 {
                color:#ff8533;
                text-shadow: 1px 1px black;
                font: 24px arial, sans-serif;
            }

        p {
             color:#34344c;
            }


    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>SportsPro</h1> 
        <h2>Sports management software for the sports enthusiast</h2><br />
        <br />
        <h3>Welcome to SportsPro Support Portal</h3><br />
        <br />
        <b>Getting Started</b></div>
        <p>
           Go to <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Customers.aspx">Customers</asp:HyperLink>     &nbsp;section to search for your customer information
        </p>
        <p>
            &nbsp;</p>
        <p>
            <b>What do you think about our service?</b></p>
        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Surveys.aspx">Submit a Survey</asp:HyperLink>
&nbsp;to provide your feedback for any support we have provided to you recently</p>
    </form>
    <p>
        &nbsp;</p>
    <p>
        <b>Group Members</b></p>
    <p>
        1. Rshaune Bailey</p>
    <p>
        2. Bill Gray Quitalig</p>
   
</body>
</html>
