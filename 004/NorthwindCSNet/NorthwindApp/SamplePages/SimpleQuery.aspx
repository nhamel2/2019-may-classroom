<%@ Page Title="Simple Query" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SimpleQuery.aspx.cs" Inherits="NorthwindApp.SamplePages.SimpleQuery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Simple Query</h1>
    </div>
    <div class="row">
        <asp:DropDownList ID="ProductList" runat="server">
        </asp:DropDownList> &nbsp; &nbsp;
        <asp:Button ID="Fetch" runat="server" Text="Fetch" />
    </div>
    <div class="row">
        <div class="col-md-offset-3">
            <fieldset>
                <asp:Label  ID="Label1" 
                            runat="server" 
                            Text="Label" 
                            AssociatedControlID="ProductID">
                </asp:Label>
                <asp:TextBox    ID="ProductID" 
                                runat="server">
                </asp:TextBox>
            </fieldset>
        </div>
    </div>

    <script src="../Scripts/bootwrap-freecode.js"></script>
</asp:Content>
