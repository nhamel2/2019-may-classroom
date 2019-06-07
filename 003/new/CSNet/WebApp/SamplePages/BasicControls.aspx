<%@ Page Title="BasicControls" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="BasicControls.aspx.cs" 
    Inherits="WebApp.SamplePages.BasicControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Basic Form Controls</h1>
        <table align="center" style="width: 80%">
            <tr>
                <td>Enter Course Code:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;
                    <asp:Button ID="TextBoxNumberChoice" runat="server" OnClick="Button1_Click" Text="Submit Choice" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonListChoice" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">COMP1008 &nbsp;</asp:ListItem>
                        <asp:ListItem Value="2">CPSC1517 &nbsp;</asp:ListItem>
                        <asp:ListItem Value="3">DMIT1508 &nbsp;</asp:ListItem>
                        <asp:ListItem Value="4">DMIT2018 &nbsp;</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td><asp:Literal ID="Literal1" runat="server">Choice: Checkbox</asp:Literal></td>
                <td><asp:CheckBox ID="CheckBoxChoice" runat="server" Text="(Programming choice if checked)" Font-Bold="true" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
                <td><asp:Label ID="DisplayReadOnly" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label3" runat="server" Text="Course List Collection"></asp:Label></td>
                <td><asp:DropDownList ID="CollectionList" runat="server"></asp:DropDownList>
                    <asp:LinkButton ID="LinkButtonubmit" runat="server">Submit from collection</asp:LinkButton></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center">&nbsp;</td>
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </tr>
        </table>
    </div>



</asp:Content>
