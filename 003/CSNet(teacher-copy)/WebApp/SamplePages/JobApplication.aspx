<%@ Page Title="Job Application" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobApplication.aspx.cs" Inherits="WebApp.SamplePages.JobApplication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Job Application</h3>
    <div class="row">
        <div class="col-md-offset-1 col-md-11">
            <div class="alert alert-info">
                <blockquote style="font-style:italic">
                    This form will illustrate some simple controls to fill out an online
                    job application. This form will use basic 2 colmn bootstrap formatting
                    with assistance for Bootwrap-Freecode. The form will investigate the 
                    processing for a CheckBoxList. This blockquote was formatted using the
                    bootstrap class alert with an alert-info coloring. Data will be collected
                    and displayed in a string.
                </blockquote>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <fieldset class="form-horizontal">
                <legend>This is a fieldset title</legend>
                <%-- fields are in pairs of Label/Input
                    The Label MUST have AssociatedControlID parameter whos
                       value is equal to the ID of the Input control--%>
                <asp:Label ID="Label1" runat="server" Text="Name"
                     AssociatedControlID="FullName"></asp:Label>
                <asp:TextBox ID="FullName" runat="server" ToolTip="Enter your full name"></asp:TextBox>

                 <asp:Label ID="Label2" runat="server" Text="Email"
                     AssociatedControlID="EmailAddress"></asp:Label>
                <asp:TextBox ID="EmailAddress" runat="server" placeholder="Enter your email address" ></asp:TextBox>

                 <asp:Label ID="Label3" runat="server" Text="Phone"
                     AssociatedControlID="PhoneNumber"></asp:Label>
                <asp:TextBox ID="PhoneNumber" runat="server" ToolTip="Enter your full name"></asp:TextBox>

                <asp:Label ID="Label4" runat="server" Text="Time"
                     AssociatedControlID="FullOrPartTime"></asp:Label>
                <asp:RadioButtonList ID="FullOrPartTime" runat="server"
                     RepeatDirection="Horizontal" RepeatLayout="Flow">

                    <asp:ListItem Value="1">Full Time&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="2">Part Time</asp:ListItem>
                </asp:RadioButtonList>

                <asp:Label ID="Label5" runat="server" Text="Position"
                      AssociatedControlID="Jobs"></asp:Label>
                <asp:CheckBoxList ID="Jobs" runat="server">
                    <asp:ListItem>Sales</asp:ListItem>
                    <asp:ListItem>Manufacturing</asp:ListItem>
                    <asp:ListItem>Accounting</asp:ListItem>
                    <asp:ListItem>Shipping/Receiving</asp:ListItem>
                </asp:CheckBoxList>
            </fieldset>
        </div>
        <div class="col-md-6">
            <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />&nbsp;&nbsp;
            <asp:Button ID="Clear" runat="server" Text="Clear" OnClick="Clear_Click" />
            <br /><br />
            <asp:Label ID="MessageLabel" runat="server" ></asp:Label>
        </div>
    </div>
    <script src="../Scripts/bootwrap-freecode.js"></script>
</asp:Content>
