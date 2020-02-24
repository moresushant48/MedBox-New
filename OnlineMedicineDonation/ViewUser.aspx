<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewUser.aspx.cs" Inherits="OnlineMedicineDonation.ViewUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="border border-light bg-light mx-auto p-lg-4 p-4 mt-4 form-size rounded text-center">
        <p class="h2 mb-4">User Profile</p>
        <p>Full Name</p>
        <asp:Label ID="lblUserName" runat="server" CssClass="lead"></asp:Label>
        <br /><br />
        <p>Email</p>
        <asp:Label ID="lblUserEmail" runat="server"  CssClass="lead"></asp:Label>
        <br /><br />
        <p>Address</p>
        <asp:Label ID="lblUserAddress" runat="server"  CssClass="lead"></asp:Label>
    </div>

    

</asp:Content>
