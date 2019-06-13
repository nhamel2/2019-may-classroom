<%@ Page Title="Contest" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="ContestEntry.aspx.cs" Inherits="WebApp.SamplePages.ContestEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="page-header">
        <h1>Contest Entry</h1>
    </div>

    <div class="row col-md-12">
        <div class="alert alert-info">
            <blockquote style="font-style: italic">
                This illustrates some simple controls to fill out an entry form for a contest. 
                This form will use basic bootstrap formatting and illustrate Validation.
            </blockquote>
            <p>
                Please fill out the following form to enter the contest. This contest is only available to residents in Western Canada.
            </p>

        </div>
    </div>
 <%-- Validation Controls --%>
<%-- 

    Rules:
    - Any control can have 1 or more validation control
    - A control may only have one instance of a particular type of control
    - Validation Error messages can be place in a summary and/or beside the input
    - Validation controls within a fieldset USING bootwrap do NOT format well
    - Validation controls have common AND specific parameters
    - CASE SENSITIVE

--%>
    
    <asp:RequiredFieldValidator ID="RequiredFirstName" 
                                runat="server" 
                                ErrorMessage="First Name is Required" 
                                Display="None" 
                                SetFocusOnError="true" 
                                ForeColor="Firebrick"
                                ControlToValidate="FirstName">
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredLastName" 
                                runat="server" 
                                ErrorMessage="Last Name is Required" 
                                Display="None" 
                                SetFocusOnError="true" 
                                ForeColor="Firebrick"
                                ControlToValidate="LastName">
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredStreetAddress" 
                                runat="server" 
                                ErrorMessage="An Address is Required" 
                                Display="None" 
                                SetFocusOnError="true" 
                                ForeColor="Firebrick"
                                ControlToValidate="StreetAddress1">
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredCity" 
                                runat="server" 
                                ErrorMessage="A City is Required" 
                                Display="None" 
                                SetFocusOnError="true" 
                                ForeColor="Firebrick"
                                ControlToValidate="City">
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredPostalCode" 
                                runat="server" 
                                ErrorMessage="A Postal Code is Required" 
                                Display="None" 
                                SetFocusOnError="true" 
                                ForeColor="Firebrick"
                                ControlToValidate="PostalCode">
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredEmail" 
                                runat="server" 
                                ErrorMessage="An Email Address is Required" 
                                Display="None" 
                                SetFocusOnError="true" 
                                ForeColor="Firebrick"
                                ControlToValidate="EmailAddress">
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredAnswer" 
                                runat="server" 
                                ErrorMessage="An Answer is Required" 
                                Display="None" 
                                SetFocusOnError="true" 
                                ForeColor="Firebrick"
                                ControlToValidate="CheckAnswer">
    </asp:RequiredFieldValidator>


    <asp:RegularExpressionValidator ID="RegExpPostalCode" 
                                    runat="server" 
                                    ErrorMessage="Invalid Postal Code (ex. t6a8g2)" 
                                    Display="None" 
                                    SetFocusOnError="true" 
                                    ForeColor="Firebrick" 
                                    ControlToValidate="PostalCode" 
                                    ValidationExpression="[a-zA-Z][0-9][a-zA-Z][0-9][a-zA-Z][0-9]">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegExpEmailAddress" 
                                    runat="server" 
                                    ErrorMessage="Invalid Email Address" 
                                    Display="None" 
                                    SetFocusOnError="true" 
                                    ForeColor="Firebrick" 
                                    ControlToValidate="EmailAddress" 
                                    ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$]">
    </asp:RegularExpressionValidator>


    <asp:RangeValidator ID="RangeJustAnExample" 
                        runat="server" 
                        ErrorMessage="Data in street address 2 is out of range"
                        Display="None" 
                        SetFocusOnError="true" 
                        ForeColor="Firebrick" 
                        ControlToValidate="StreetAddress2"
                        Type="Integer"
                        MaximumValue="100"
                        MinimumValue="0">
    </asp:RangeValidator>

<%-- 

    Compare Validator has 3 Versions:
    - datatype parameters type and operator
    - against a constant parameters type, operator and value
    - against another form control parameters type, operator and controlToCompare

--%>
    <asp:CompareValidator   ID="CompareCheckAnswer" 
                            runat="server" 
                            ErrorMessage="Skill Testing Error is incorrect"
                            SetFocusOnError="true" 
                            ForeColor="Firebrick" 
                            ControlToValidate="CheckAnswer"
                            Type="Integer"
                            Operator="Equal"
                            ValueToCompare="15">
    </asp:CompareValidator>

    <%-- Validation error display --%>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Correct the input for the following errors:" CssClass="alert alert-warning" />


    <div class="row">
        <div class ="col-md-6">
            <fieldset class="form-horizontal">
                <legend>Application Form</legend>

                <asp:Label ID="Label1" runat="server" Text="First Name"
                     AssociatedControlID="FirstName"></asp:Label>
                <asp:TextBox ID="FirstName" runat="server" 
                    ToolTip="Enter your first name." MaxLength="25"></asp:TextBox> 
                  
                 <asp:Label ID="Label6" runat="server" Text="Last Name"
                     AssociatedControlID="LastName"></asp:Label>
                <asp:TextBox ID="LastName" runat="server" 
                    ToolTip="Enter your last name." MaxLength="25"></asp:TextBox> 
                        
                <asp:Label ID="Label3" runat="server" Text="Street Address 1"
                     AssociatedControlID="StreetAddress1"></asp:Label>
                <asp:TextBox ID="StreetAddress1" runat="server" 
                    ToolTip="Enter your street address." MaxLength="75"></asp:TextBox> 
                  
                  <asp:Label ID="Label7" runat="server" Text="Street Address 2"
                     AssociatedControlID="StreetAddress2"></asp:Label>
                <asp:TextBox ID="StreetAddress2" runat="server" 
                    ToolTip="Enter your additional street address." MaxLength="75"></asp:TextBox> 
                  <br />
                 <asp:Label ID="Label8" runat="server" Text="City"
                     AssociatedControlID="City"></asp:Label>
                <asp:TextBox ID="City" runat="server" 
                    ToolTip="Enter your City name" MaxLength="50"></asp:TextBox> 
                  
                 <asp:Label ID="Label9" runat="server" Text="Province"
                     AssociatedControlID="Province"></asp:Label>
                <asp:DropDownList ID="Province" runat="server" Width="75px">
                    <asp:ListItem Value="AB" Text="AB"></asp:ListItem>
                     <asp:ListItem Value="BC" Text="BC"></asp:ListItem>
                     <asp:ListItem Value="MN" Text="MN"></asp:ListItem>
                     <asp:ListItem Value="SK" Text="SK"></asp:ListItem>
                </asp:DropDownList>
                  
                 <asp:Label ID="Label10" runat="server" Text="Postal Code"
                     AssociatedControlID="PostalCode"></asp:Label>
                <asp:TextBox ID="PostalCode" runat="server" 
                    ToolTip="Enter your postal code"  MaxLength="6"></asp:TextBox> 
                 
                <asp:Label ID="Label2" runat="server" Text="Email"
                     AssociatedControlID="EmailAddress"></asp:Label>
                <asp:TextBox ID="EmailAddress" runat="server" 
                    ToolTip="Enter your email address"
                     TextMode="Email"></asp:TextBox> 
                  
              </fieldset>   
           <p>Note: You must agree to the contest terms in order to be entered.
               <br />
               <asp:CheckBox ID="Terms" runat="server" Text="I agree to the terms of the contest" />
           </p>

            <p>
                Enter your answer to the following calculation instructions:<br />
                Multiply 15 times 6<br />
                Add 240<br />
                Divide by 11<br />
                Subtract 15<br />
                <asp:TextBox ID="CheckAnswer" runat="server" ></asp:TextBox>
            </p>
        </div>
        <div class="col-md-6">   
            <div class="col-md-offset-2">
                <p>
                    <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click"  />&nbsp;&nbsp;
                    <asp:Button ID="Clear" runat="server" Text="Clear" OnClick="Clear_Click" CausesValidation="false"  />
                </p>
                <asp:Label ID="Message" runat="server" ></asp:Label><br />
              
            </div>

            <asp:GridView   ID="EntriesList" 
                            runat="server" 
                            BorderStyle="None" 
                            GridLines="Horizontal" 
                            Caption="Contest Entries">
                <EmptyDataTemplate>
                    No Contrast Entries at this time
                </EmptyDataTemplate>
            </asp:GridView>

        </div>
    </div>
    <script src="../Scripts/bootwrap-freecode.js"></script>
</asp:Content>
