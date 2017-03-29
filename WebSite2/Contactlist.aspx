<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contactlist.aspx.cs" Inherits="Contactlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 601px;
        }

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
        <br />
        <h3>Contact List - Manage your contact list</h3>
        <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name], [Address], [Phone], [Email], [CustomerID] FROM [Customers] ORDER BY [Name]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
        <br />
        Contact list<br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:ListBox ID="ListBox1" runat="server" Height="197px" style="margin-top: 0px" Width="567px"></asp:ListBox>
                </td>
                <td>
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    <br />
                    <asp:Button ID="btnRemove" runat="server" Text="Remove Contact" Width="109px" OnClick="btnRemove_Click" />
                    <br />
                    <br />
                    <asp:Button ID="btnEmpty" runat="server" Text="Empty List" Width="108px" OnClick="btnEmpty_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnAdditonal" runat="server" OnClick="btnAdditonal_Click" Text="Select Additional Customers" Width="217px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
