<%@ Page Title="Simple query" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SimpleQuery.aspx.cs" Inherits="NorthwindApp.SamplePages.SimpleQuery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbrotron">
        <h1>Simple Query</h1>
    </div>
    <div class="row">
        <asp:DropDownList ID="ProductList" runat="server">
        </asp:DropDownList> &nbsp;&nbsp;
        <asp:Button ID="Fetch" runat="server" Text="Fetch" OnClick="Fetch_Click" />
    </div>
    <div class ="row">
        <asp:Label ID="MessageLabel" runat="server" ></asp:Label>
    </div>
    <div class="row">
        <div class="col-md-offset-3">
            <fieldset>
            <asp:Label ID="Label1" runat="server" Text="ID:"
                 AssociatedControlID="ProductID">
            </asp:Label>
            <asp:TextBox ID="ProductID" runat="server"
                     ReadOnly="true" Enabled="false"></asp:TextBox>


            <asp:Label ID="Label2" runat="server" Text="Name:"
                 AssociatedControlID="ProductName">
            </asp:Label>
            <asp:TextBox ID="Productname" runat="server"
                     ></asp:TextBox>

            <asp:Label ID="Label9" runat="server" Text="Supplier:"
                 AssociatedControlID="SupplierList">
            </asp:Label>
            <asp:DropDownList ID="SupplierList" runat="server"></asp:DropDownList>

            <asp:Label ID="Label10" runat="server" Text="Category:"
                 AssociatedControlID="CategoryList">
            </asp:Label>
            <asp:DropDownList ID="CategoryList" runat="server"></asp:DropDownList>

            <asp:Label ID="Label3" runat="server" Text="Qty/Unit"
                 AssociatedControlID="QuantityPerUnit">
            </asp:Label>
            <asp:TextBox ID="QuantityPerUnit" runat="server"
                     ></asp:TextBox>

            <asp:Label ID="Label4" runat="server" Text="Price"
                 AssociatedControlID="UnitPrice">
            </asp:Label>
            <asp:TextBox ID="UnitPrice" runat="server"
                     ></asp:TextBox>

                <asp:Label ID="Label5" runat="server" Text="QoH"
                 AssociatedControlID="UnitsInStock">
            </asp:Label>
            <asp:TextBox ID="UnitsInStock" runat="server"
                     ></asp:TextBox>

                <asp:Label ID="Label6" runat="server" Text="QOO"
                 AssociatedControlID="UnitsOnOrder">
            </asp:Label>
            <asp:TextBox ID="UnitsOnOrder" runat="server"
                     ></asp:TextBox>

                <asp:Label ID="Label7" runat="server" Text="ROL"
                 AssociatedControlID="ReorderLevel">
            </asp:Label>
            <asp:TextBox ID="ReorderLevel" runat="server"
                     ></asp:TextBox>

                <asp:Label ID="Label8" runat="server" Text="Disc"
                 AssociatedControlID="Discontinued">
            </asp:Label>
                <asp:CheckBox ID="Discontinued" runat="server" />
            </fieldset>
           
        </div>

    </div>
    <script src="../Scripts/bootwrap-freecode.js"></script>
</asp:Content>
