<%@ Page Title="Filter Query" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FilterQuery.aspx.cs" Inherits="NorthwindApp.SamplePages.FilterQuery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbrotron">
        <h1>Filter Query</h1>
    </div>
    <div class="row">
        <asp:Label ID="Label1" runat="server" Text="Enter partial product name"></asp:Label>
        &nbsp;&nbsp;
        <asp:TextBox ID="ProductSearchArg" runat="server"
             placeholder="enter product name"></asp:TextBox>
         &nbsp;&nbsp;
        <asp:LinkButton ID="Fetch" runat="server" OnClick="Fetch_Click">Fetch Product(s)</asp:LinkButton>
    </div>
    <div class="row">
        <asp:Label ID="MessageLabel" runat="server" ></asp:Label>
    </div>
    <div class="row">
        <asp:GridView ID="ProductList" runat="server"
             CssClass="table"></asp:GridView>
    </div>
</asp:Content>
