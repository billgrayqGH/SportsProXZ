<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Customers.aspx.cs" Inherits="Customers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 154px;
        }
        .auto-style3 {
            width: 154px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
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
        <h2>Sports management software for the sports enthusiast</h2>
        <br />
        <br />
        <br />
           <h3>Customers - Search and view your customer contact information</h3><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name], [Address], [Phone], [Email], [CustomerID] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
                      </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Select a customer</td>
                <td>
                      <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID" Height="22px" Width="213px" AutoPostBack="True">
                      </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Address</td>
                <td class="auto-style4">
                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Phone</td>
                <td>
                    <asp:Label ID="lblPhone" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Email</td>
                <td>
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnAddContact" runat="server" OnClick="btnAddContact_Click" Text="Add to Contact List" Width="130px" />
                </td>
                <td>
                    <asp:Button ID="btnDisplayContact" runat="server" Text="Display Contact List" Width="144px" OnClick="btnDisplayContact_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnback" runat="server" OnClick="btnback_Click" Text="Back to Main Menu" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
