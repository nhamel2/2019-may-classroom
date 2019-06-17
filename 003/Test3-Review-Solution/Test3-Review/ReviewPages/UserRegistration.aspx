<%@ Page Title="UserRegistration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="Test3_Review.ReviewPages.UserRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Page header                                               --%>
    <div class="page-header">
        <h1>User Registration</h1>
    </div>

    <%-- Page message                                              --%>
    <div class="row col-md-12">
        <div class="alert alert-info">
            <blockquote style="font-style: italic">
                Please fill in the form below and click submit. After submitting 
                the form you will recieve an email to confim your registration.
                By clicking the link, you will complete the registration process.
            </blockquote>
        </div>
    </div>

    <%-- Validators                                                 --%>
    <asp:RequiredFieldValidator ID="RequiredFirstName" 
                                runat="server" 
                                ErrorMessage="Enter a first name"
                                Display="None" 
                                SetFocusOnError="true" 
                                ForeColor="Firebrick" 
                                ControlToValidate="FirstName"> 
    </asp:RequiredFieldValidator>
    <%-- ID:               is good coding practice
        ControlToValidate: Requiredfield--%>
    <asp:RequiredFieldValidator ID="RequiredLastName" 
                                runat="server" 
                                ErrorMessage="Enter a last name"
                                Display="None" 
                                SetFocusOnError="true" 
                                ForeColor="Firebrick" 
                                ControlToValidate="LastName">
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredUserName" 
                                runat="server" 
                                ErrorMessage="Enter a user name"
                                Display="None" 
                                SetFocusOnError="true" 
                                ForeColor="Firebrick" 
                                ControlToValidate="UserName">
    </asp:RequiredFieldValidator>


    <asp:CompareValidator   ID="CompareEmailAddress" 
                            runat="server" 
                            ErrorMessage="Emails do not match"
                            Display="None" 
                            SetFocusOnError="true" 
                            ForeColor="Firebrick"
                            ControlToValidate="ConfirmEmailAddress" 
                            Type="String"                           
                            Operator="Equal"                        
                            ControlToCompare="EmailAddress"         
                            Visible="true">
    </asp:CompareValidator>

    <%-- 

        Requiredfields:
            - ControlValidate
            - Type              (String, Integer, Double, Date, Currency)
            - Operator          (DataTypeCheck, Equal, GreaterThan, GreaterThanEqual, LessThan, LessThanEqual, and NotEqual)
            - ControlToCompare  (OR ValueToCompare)


        *ID is just good coding practice*
    --%>

    <asp:CompareValidator   ID="ComparePassword" 
                            runat="server" 
                            ErrorMessage="Passwords do not match"
                            Display="None" 
                            SetFocusOnError="true" 
                            ForeColor="Firebrick"
                            ControlToValidate="ConfirmPassword"  
                            Type="String"                           
                            Operator="Equal"                        
                            ControlToCompare="Password"         
                            Visible="true">
    </asp:CompareValidator>


    <asp:RegularExpressionValidator ID="RegExpPassword" 
                                    runat="server" 
                                    ErrorMessage="Password Must be between 4 and 8 characters long and at least one numeric digit"
                                    Display="None"
                                    SetFocusOnError="true" 
                                    ForeColor="Firebrick"
                                    ControlToValidate="Password"          
                                    ValidationExpression="^[a-zA-Z]\w{4,8}$">
    </asp:RegularExpressionValidator>
    <%-- 

    Requiredfields:
        - ControlValidate
        -ValidationExpression


    *ID is just good coding practice*
--%>



    <%-- Validation error Display                          --%>
    <asp:ValidationSummary  ID="ValidationSummary1" 
                            runat="server" 
                            HeaderText="Correct the input for the following errors:"
                            CssClass="alert alert-warning"
    />



    <%-- Page Content                                     --%>
    <div class="row">
        <div class ="col-md-6">
            <fieldset class="form-horizontal">
                <legend>Application Form</legend>

                <asp:Label  ID="Label1" 
                            runat="server" 
                            Text="First Name"
                            AssociatedControlID="FirstName">
                </asp:Label>
                <asp:TextBox    ID="FirstName" 
                                runat="server" 
                                ToolTip="Enter your first name." 
                                MaxLength="25">
                </asp:TextBox>
<%-- 
    *TextBox ID is attached to validator
    *Label ID does NOT need validation*
--%>

     
                 <asp:Label ID="Label2" 
                            runat="server" 
                            Text="Last Name"
                            AssociatedControlID="LastName">
                 </asp:Label>
                <asp:TextBox    ID="LastName" 
                                runat="server" 
                                ToolTip="Enter your last name." 
                                MaxLength="25">
                </asp:TextBox> 

                <asp:Label ID="Label7" 
                            runat="server" 
                            Text="User Name"
                            AssociatedControlID="UserName">
                 </asp:Label>
                <asp:TextBox    ID="UserName" 
                                runat="server" 
                                ToolTip="Enter your User name." 
                                MaxLength="25">
                </asp:TextBox> 
                        
                <asp:Label  ID="Label3" 
                            runat="server" 
                            Text="Email"
                            AssociatedControlID="EmailAddress">
                </asp:Label>
                <asp:TextBox    ID="EmailAddress" 
                                runat="server" 
                                ToolTip="Enter your email address"
                                TextMode="Email">
                </asp:TextBox>
                
                <asp:Label  ID="Label4" 
                            runat="server" 
                            Text="Confirm Email"
                            AssociatedControlID="ConfirmEmailAddress">
                </asp:Label>
                <asp:TextBox    ID="ConfirmEmailAddress" 
                                runat="server" 
                                ToolTip="Re-Enter your email address"
                                TextMode="Email">
                </asp:TextBox>

                <asp:Label  ID="Label5" 
                            runat="server" 
                            Text="Password"
                            AssociatedControlID="Password">
                </asp:Label>
                <asp:TextBox    ID="Password" 
                                runat="server" 
                                ToolTip="Enter a password"
                                MaxLength="25">
                </asp:TextBox>
                
                <asp:Label  ID="Label6" 
                            runat="server" 
                            Text="Confirm Password"
                            AssociatedControlID="ConfirmPassword">
                </asp:Label>
                <asp:TextBox    ID="ConfirmPassword" 
                                runat="server" 
                                ToolTip="Re-Enter a password"
                                MaxLength="25">
                </asp:TextBox>
              </fieldset>   

              <asp:CheckBox ID="Terms" runat="server" Text="I agree to the terms of the site" />

        </div>
        <div class="col-md-6">   
            <div class="col-md-offset-2">
                <p>
                    <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click"  />&nbsp;&nbsp;
                    <asp:Button ID="Clear" runat="server" Text="Clear" OnClick="Clear_Click" CausesValidation="false"  />
                </p>
                <asp:Label ID="Message" runat="server" ></asp:Label><br /><br />
            </div>
<%--            <asp:GridView ID="EntriesList" runat="server"
                 BorderStyle="None" GridLines="Horizontal"
                 Caption="Contest Entries">
                <EmptyDataTemplate>
                    No contest entries at this time
                </EmptyDataTemplate>
            </asp:GridView>--%>
        </div>
    </div>

    <script src="../Scripts/bootwrap-freecode.js"></script>
</asp:Content>
