<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="OnlineMedicineDonation.forgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="border border-light bg-light mx-auto p-lg-4 p-4 mt-4 form-size rounded">
        <p class="h6 lead mb-4">Note : Enter your email address here. The credentials will be sent to your verified email.</p>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-4" TextMode="Email" placeholder="Email ID" required="required"></asp:TextBox>
        
        <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>

        <div class="text-right">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit"  CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
        </div>
    </div>

</asp:Content>
