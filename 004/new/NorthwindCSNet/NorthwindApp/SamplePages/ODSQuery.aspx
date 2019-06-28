<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ODSQuery.aspx.cs" Inherits="NorthwindApp.SamplePages.ODSQuery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1> ObjectDataSource (ODS) Query</h1>
    <asp:Label ID="label1" runat="server" Text="Enter a product name"></asp:Label>&nbsp;&nbsp;
    <asp:TextBox ID="PartialNameArg" runat="server"></asp:TextBox>&nbsp;&nbsp;
    <asp:Button ID="Fetch" runat="server" Text="Fetch" CssClass="btn btn-primary" OnClick="Fetch_Click" />
    <br />
    <br />
    <asp:Label ID="MessageLabel" runat="server" ></asp:Label>
    <asp:GridView ID="ProductList" runat="server" AutoGenerateColumns="False" DataSourceID="ProductListODS" AllowPaging="True">
        <Columns>
            <asp:CommandField SelectText="View" ShowSelectButton="True"></asp:CommandField>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID"></asp:BoundField>
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName"></asp:BoundField>
            <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" SortExpression="SupplierID"></asp:BoundField>
            <asp:TemplateField HeaderText="Category" SortExpression="CategoryID">
                <ItemTemplate>
              
                    <asp:DropDownList ID="CategoryList" runat="server"
                        DataSourceID="CategoryListODS" 
                       DataTextField="CategoryName" 
                        DataValueField="CategoryID"
                         SelectedValue='<%# Eval("CategoryID") %>'
                         Enabled="false"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="QuantityPerUnit" HeaderText="QuantityPerUnit" SortExpression="QuantityPerUnit"></asp:BoundField>
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice"></asp:BoundField>
            <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued"></asp:CheckBoxField>
        </Columns>
        <EmptyDataTemplate>
        No products were found for the query.
    </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource ID="ProductListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Product_FindByName" TypeName="NorthwindSystem.BLL.ProductController">
        <SelectParameters>
            <asp:ControlParameter ControlID="PartialNameArg" PropertyName="Text" DefaultValue="zzzzzz" Name="productname" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="CategoryListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Category_List" TypeName="NorthwindSystem.BLL.CategoryController"></asp:ObjectDataSource>
</asp:Content>
