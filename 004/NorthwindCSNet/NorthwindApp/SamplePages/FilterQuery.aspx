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
        <br /><br />
        <asp:GridView ID="ProductList" runat="server"
            CssClass="table table-striped" GridLines="Horizontal"
            BorderStyle="None" Caption="Products by Name" 
            AutoGenerateColumns="False" AllowPaging="True" PageSize="3" OnPageIndexChanging="ProductList_PageIndexChanging" OnSelectedIndexChanged="ProductList_SelectedIndexChanged" >

            <Columns>
                <asp:CommandField CausesValidation="False" SelectText="View" ShowSelectButton="True"></asp:CommandField>
                <asp:TemplateField Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="ProductID" runat="server" 
                            Text='<%# Eval("ProductID") %>' Width="25">
                        </asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                     <ItemTemplate>
                        <asp:Label ID="ProductName" runat="server" 
                            Text='<%# Eval("ProductName") %>' Width="250">
                        </asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sup">
                    <ItemTemplate>
                        <asp:Label ID="SupplierID" runat="server" 
                            Text='<%# Eval("SupplierID") %>' Width="30">
                        </asp:Label>
                    </ItemTemplate>
                    <%--<ItemStyle HorizontalAlign="Center"></ItemStyle>--%>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cat">
                    <ItemTemplate>
                        <asp:Label ID="CategoryID" runat="server" 
                            Text='<%# Eval("CategoryID") %>' Width="30">
                        </asp:Label>
                    </ItemTemplate>
                   <%-- <HeaderStyle HorizontalAlign="Center"></HeaderStyle>--%>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Qty/Unit">
                    <ItemTemplate>
                        <asp:Label ID="QuantityPerUnit" runat="server" 
                            Text='<%# Eval("QuantityPerUnit") %>' Width="150">
                        </asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="$">
                    <ItemTemplate>
                        <asp:Label ID="UnitPrice" runat="server" 
                            Text='<%# string.Format("{0:0.00}",Eval("UnitPrice")) %>' Width="30">
                        </asp:Label>
                    </ItemTemplate>
                    <%--<ItemStyle HorizontalAlign="Right"></ItemStyle>--%>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="QoH">
                    <ItemTemplate>
                        <asp:Label ID="UnitsInStock" runat="server" 
                            Text='<%# Eval("UnitsInStock") %>' Width="30">
                        </asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
            No data for the product name.
        </EmptyDataTemplate>
            <PagerSettings FirstPageText="Start" LastPageText="End" Mode="NumericFirstLast" PageButtonCount="3" />
        </asp:GridView>
    </div>
</asp:Content>
