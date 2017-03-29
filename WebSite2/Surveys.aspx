<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Surveys.aspx.cs" Inherits="Surveys" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 158px;
        }
        .auto-style3 {
            width: 75px;
        }
        #TextArea1 {
            height: 106px;
            width: 406px;
        }
        .auto-style7 {
            width: 195px;
        }
        .auto-style8 {
            width: 185px;
        }
        #addCommentsTxt {
            height: 77px;
            width: 352px;
        }
        .auto-style9 {
            width: 531px;
        }
        .auto-style10 {
            width: 146px;
        }
        .auto-style11 {
            width: 180px;
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
        <h2>Sports management software for the sports enthusiast</h2></div>
        <p><h3><b>Surveys - </b>Collect feedback from customers</h3></p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style11">Enter your customer ID:<br />
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="customerIDtxtBox" runat="server" Width="58px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="getIncidentsBtn" runat="server" style="margin-left: 0px" Text="Get Incidents" Width="92px" OnClick="getIncidentsBtn_Click" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="customerIDtxtBox" ErrorMessage="Customer ID is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="customerIDtxtBox" ErrorMessage="Must be a valid Customer ID" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductCode], [DateClosed], [Title], [IncidentID], [CustomerID], [TechID], [DateOpened], [Description], [ResolutionNotes] FROM [Incidents] WHERE ([CustomerID] = @CustomerID) ORDER BY [DateClosed]">
            <SelectParameters>
                <asp:ControlParameter ControlID="customerIDtxtBox" Name="CustomerID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table class="auto-style1">
            <tr>
                <td>
        <asp:ListBox ID="listBoxIncidents" runat="server" Height="66px" Width="564px" Enabled="False"></asp:ListBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="listBoxIncidents" Enabled="False" ErrorMessage="Please select an incident" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <p><b>Please rate this incident by the following categories:</b></p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style10">Response time:</td>
                <td class="auto-style9">
                    <asp:RadioButtonList ID="ResponseList" runat="server" Enabled="False" Height="32px" RepeatDirection="Horizontal" Width="582px" OnSelectedIndexChanged="ResponseList_SelectedIndexChanged">
                        <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied</asp:ListItem>
                        <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ResponseList" Enabled="False" ErrorMessage="Please select a feedback" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">Technician efficiency:</td>
                <td class="auto-style9">
                    <asp:RadioButtonList ID="TechEffList" runat="server" Enabled="False" Height="32px" RepeatDirection="Horizontal" Width="582px">
                        <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied</asp:ListItem>
                        <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TechEffList" Enabled="False" ErrorMessage="Please select a feedback" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">Problem resolution:</td>
                <td class="auto-style9">
                    <asp:RadioButtonList ID="ProResList" runat="server" Enabled="False" Height="32px" RepeatDirection="Horizontal" Width="582px" OnSelectedIndexChanged="ProResList_SelectedIndexChanged">
                        <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied</asp:ListItem>
                        <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ProResList" Enabled="False" ErrorMessage="Please select a feedback" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Additonal comments:</td>
                <td>
                    <asp:TextBox ID="addCommentstxtBox" runat="server" Height="84px" Width="276px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:CheckBox ID="contactMechkBox" runat="server" Text="Please contact me to discuss this incident" Enabled="False" OnCheckedChanged="contactMechkBox_CheckedChanged" />
        <table class="auto-style1">
            <tr>
                <td class="auto-style7">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="45px" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" Width="156px">
                        <asp:ListItem>Contact by email</asp:ListItem>
                        <asp:ListItem>Contact by phone</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style8" aria-disabled="True">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <asp:Button ID="submitBtn" runat="server" Text="Submit" Enabled="False" OnClick="submitBtn_Click" />
    </form>
</body>
</html>
