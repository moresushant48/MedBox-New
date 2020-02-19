<%@ Page Title="Register" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="OnlineMedicineDonation.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="border border-light bg-light mx-auto p-lg-4 p-4 mt-4 form-size rounded">
        <p class="h2 mb-4">Register</p>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-4" TextMode="Email" placeholder="Email ID"></asp:TextBox>
        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control mb-4" pattern="[a-zA-Z]+[ ][a-zA-Z]+" Title="First and Last Name (ex. John Walker)" TextMode="SingleLine" placeholder="Full Name"></asp:TextBox>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mb-4" pattern=".{5,15}" title="Min 5 and Max 15 characters allowed." TextMode="Password" placeholder="Password"></asp:TextBox>
        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control mb-4" pattern=".{10,50}" placeholder="Enter your address here"></asp:TextBox>
        <asp:Label ID="result" runat="server" Text=""></asp:Label>

        <div class="text-right">
            <asp:Button ID="btnRegister" runat="server" Text="Submit"  CssClass="btn btn-primary mb-4" OnClick="btnRegister_Click"/><br />
        </div>
        <br /><br />
        <div class="text-center">
            <asp:Label ID="lblResult" runat="server" CssClass="text-center"></asp:Label>
        </div>

    </div>

</asp:Content>
