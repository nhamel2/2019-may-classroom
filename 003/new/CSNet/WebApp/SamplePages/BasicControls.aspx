<%@ Page Title="Basic Controls" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BasicControls.aspx.cs" Inherits="WebApp.SamplePages.BasicControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Basic form Controls</h1>
    </div>
    <table align="center" style="width: 80%">
        <tr>
            <td align="right">Enter Course Number (1-4):&nbsp;&nbsp;</td>
            <td>
                <asp:TextBox ID="TextBoxNumberChoice" runat="server" ></asp:TextBox>
&nbsp;&nbsp;
                <asp:Button ID="SubmitChoice" runat="server" Text="Submit Choice" OnClick="SubmitChoice_Click" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#33CC33" Text="Choice: RadioButtonList"></asp:Label>&nbsp;&nbsp;
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonListChoice" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="1">COMP1008&nbsp;</asp:ListItem>
                    <asp:ListItem Value="2">CPCS1517&nbsp;</asp:ListItem>
                    <asp:ListItem Value="3">DMIT1508&nbsp;</asp:ListItem>
                    <asp:ListItem Value="4">DMIT2018</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Literal ID="Literal1" runat="server" 
                    Text="Choice: Checkbox"></asp:Literal>&nbsp;&nbsp;</td>
            <td>
                <asp:CheckBox ID="CheckBoxChoice" runat="server"
                    text=" (programming course if checked)"
                    Font-Bold="true" /></td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label2" runat="server" Text="Display Label"></asp:Label>&nbsp;&nbsp;</td>
            <td>
                <asp:Label ID="DisplayReadOnly" runat="server" ></asp:Label></td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label3" runat="server" Text="Course List Collection"></asp:Label>&nbsp;&nbsp;</td>
            <td>
                <asp:DropDownList ID="CollectionList" runat="server"></asp:DropDownList>&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButtonSubmit" runat="server" OnClick="LinkButtonSubmit_Click">Submit from Collection</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">&nbsp;
            <asp:Label ID="MessageLabel" runat="server" ></asp:Label>

            </td>
        </tr>
    </table>



</asp:Content>
