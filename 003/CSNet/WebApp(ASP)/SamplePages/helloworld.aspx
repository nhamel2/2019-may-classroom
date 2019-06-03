<%@ Page    Title="HelloWorld" 
            Language="C#" 
            MasterPageFile="~/Site.Master" 
            AutoEventWireup="true" 
            CodeBehind="helloworld.aspx.cs" 
            Inherits="WebApp_ASP_.SamplePages.helloworld" 
%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Default Body Content --%>
    
    <asp:Label ID="MessageArea" runat="server" Text="Label"></asp:Label>
    <%-- Instance of a class --%>
    <%-- The ID is the coding name of the instance --%>

    <br />
    <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />

</asp:Content>
