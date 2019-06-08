<%@ Page Title="Hello" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Hello.aspx.cs" Inherits="WebApp.SamplePages.Hello" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- this MainContent is the default body content --%>

    <%-- the control is an instance of a class
        the ID is the coding name of this instance--%>
    <asp:Label ID="MessageArea" runat="server" ></asp:Label>
    <br />
    <asp:Button ID="PressMe" runat="server" Text="Press Me" OnClick="PressMe_Click" />&nbsp;&nbsp;
    <asp:Button ID="Reset" runat="server" Text="Clear" OnClick="Reset_Click" />
</asp:Content>
