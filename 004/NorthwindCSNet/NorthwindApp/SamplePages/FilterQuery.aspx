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
            AutoGenerateColumns="False">

            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="ProductID" runat="server" 
                            Text='<%# Eval("ProductID") %>' Width="50">
                        </asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Name">
                     <ItemTemplate>
                        <asp:Label ID="ProductName" runat="server" 
                            Text='<%# Eval("ProductName") %>' Width="300">
                        </asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Sup">
                    <ItemTemplate>
                        <asp:Label ID="SupplierID" runat="server" 
                            Text='<%# Eval("SupplierID") %>' Width="50">
                        </asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cat">
                      <ItemTemplate>
                        <asp:Label ID="CategoryID" runat="server" 
                            Text='<%# Eval("CategoryID") %>' Width="50">
                        </asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Qty/Unit">
                    <ItemTemplate>
                        <asp:Label ID="QuantityPerUnit" runat="server" 
                            Text='<%# Eval("QuantityPerUnit") %>' Width="50">
                        </asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="$">
                    <ItemTemplate>
                        <asp:Label ID="Money" runat="server" 
                            Text='<%# Eval("Money") %>' Width="50">
                        </asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Qoh">
                    <ItemTemplate>
                        <asp:Label ID="QuantityOnHand" runat="server" 
                            Text='<%# Eval("QuantityOnHand") %>' Width="50">
                        </asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
            No data for the product name.
        </EmptyDataTemplate>
        </asp:GridView>
    </div>
</asp:Content>
