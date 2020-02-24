<%@ Page Title="Login" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="OnlineMedicineDonation.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
        <div class="border border-light bg-light mx-auto p-lg-4 p-4 mt-4 form-size rounded">
            <p class="h2 mb-4">Login</p>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-4" TextMode="Email" placeholder="Email ID"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mb-4" TextMode="Password" placeholder="Password" pattern=".{5,15}" title="Min 5 and Max 15 characters allowed."></asp:TextBox>
            <small><a href="forgotPassword.aspx">Forgot Password ?</a></small>
            <br>
            <asp:Label ID="result" runat="server" Text=""></asp:Label>

            <div class="text-right">
                <asp:Button ID="btnLogin" runat="server" Text="Submit"  CssClass="btn btn-primary" OnClick="btnLogin_Click"/>
            </div>
        </div>

</asp:Content>
