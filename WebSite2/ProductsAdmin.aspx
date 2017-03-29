<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductsAdmin.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:GridView ID="GridView1" runat="server" 
        AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="ProductCode" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None"
        OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" ReadOnly="True" SortExpression="ProductCode" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="100px" />
                </asp:BoundField>
            <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridName" runat="server" 
                            Width="125px" MaxLength="15" 
                            Text='<%# Bind("Name") %>'>
                        </asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator5" runat="server"
                                ControlToValidate="txtGridName" 
                                ErrorMessage="Name is a required field." 
                                ForeColor="White" 
                                ValidationGroup="Edit">*
                            </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridName" runat="server" 
                            Text='<%# Bind("Name") %>'>
                        </asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
            <asp:TemplateField HeaderText="Version">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridVersion" runat="server" 
                            Width="125px" MaxLength="15" 
                            Text='<%# Bind("Version") %>'>
                        </asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator6" runat="server"
                                ControlToValidate="txtGridVersion" 
                                ErrorMessage="Version is a required field." 
                                ForeColor="White" 
                                ValidationGroup="Edit">*
                            </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridVersion" runat="server" 
                            Text='<%# Bind("Version") %>'>
                        </asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
            <asp:TemplateField HeaderText="Release Date">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridReleaseDate" runat="server" 
                            Width="125px" MaxLength="15" 
                            Text='<%# Bind("ReleaseDate") %>'>
                        </asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator7" runat="server"
                                ControlToValidate="txtGridReleaseDate" 
                                ErrorMessage="Release Date is a required field." 
                                ForeColor="White" 
                                ValidationGroup="Edit">*
                            </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridReleaseDate" runat="server" 
                            Text='<%# Bind("ReleaseDate") %>'>
                        </asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
            <asp:CommandField ButtonType="Button" CausesValidation="True" 
                    ShowEditButton="True" ValidationGroup="Edit" />
            <asp:CommandField ButtonType="Button" CausesValidation="False" 
                    ShowDeleteButton="True" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate"
        InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" 
        OldValuesParameterFormatString="original_{0}"
         SelectCommand="SELECT * FROM [Products]"
        UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate">
        <DeleteParameters>
            <asp:Parameter Name="original_ProductCode" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Version" Type="Decimal" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductCode" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Version" Type="Decimal" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Version" Type="Decimal" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            <asp:Parameter Name="original_ProductCode" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Version" Type="Decimal" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            HeaderText="Please correct the following errors:" 
            ValidationGroup="Edit" CssClass="error" />
    <p>To create a new product, enter the product information and click Add New Product.</p>

    <p><asp:Label ID="lblError" runat="server"></asp:Label>
    </p>
       <label>Product Code:</label>
        <asp:TextBox ID="txtProductCode" runat="server" MaxLength="20" CssClass="entry"></asp:TextBox>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                runat="server" ControlToValidate="txtProductCode" CssClass="validator"  
                ErrorMessage="Product Code is a required field."></asp:RequiredFieldValidator><br />
    <label>Name:</label>
        <asp:TextBox ID="txtName" runat="server" MaxLength="20" CssClass="entry"></asp:TextBox>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                runat="server" ControlToValidate="txtName" CssClass="validator"  
                ErrorMessage="Name is a required field."></asp:RequiredFieldValidator><br />
    <label>Version:</label>
        <asp:TextBox ID="txtVersion" runat="server" MaxLength="20" CssClass="entry"></asp:TextBox>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                runat="server" ControlToValidate="txtVersion" CssClass="validator"  
                ErrorMessage="Version is a required field."></asp:RequiredFieldValidator><br />
    <label>Release Date:</label>
        <asp:TextBox ID="txtReleaseDate" runat="server" MaxLength="20" CssClass="entry"></asp:TextBox>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                runat="server" ControlToValidate="txtReleaseDate" CssClass="validator"  
                ErrorMessage="Release Date is a required field."></asp:RequiredFieldValidator><br />
    <asp:Button ID="btnAdd" runat="server" Text="Add New Product" 
            OnClick="btnAdd_Click" />
 






    


</asp:Content>

