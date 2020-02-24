<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AccountInfo.aspx.cs" Inherits="OnlineMedicineDonation.AccountInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="border border-light bg-light mx-auto p-lg-4 p-4 mt-4 form-size rounded">
        <p class="h2 mb-4 text-center">Account Info</p>
        
        <asp:Label ID="Label1" runat="server" Text="Name" CssClass="h6"></asp:Label> <br />
        <asp:Label ID="userName" runat="server" Text="Name" CssClass="h4 lead"></asp:Label> <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Name" CssClass="h6"></asp:Label> <br />
        <asp:Label ID="userEmail" runat="server" Text="Email" CssClass="h4 lead"></asp:Label> <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Address" CssClass="h6"></asp:Label> <br />
        <asp:Label ID="userAddress" runat="server" Text="Address" CssClass="h4 lead"></asp:Label>     
        <br />
        
        <br />
        <asp:Button ID="btnChangeAddress" runat="server" Text="Change Address" CssClass="btn btn-primary w-100" OnClick="btnChangeAddress_Click" />
        <br /><br />
        <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" CssClass="btn btn-primary w-100" />

        <br />
        <br />
        <div class="text-center">
            <asp:Label ID="lblResult" runat="server" CssClass="text-center"></asp:Label>
        </div>
        <div id="viewAddressInput" runat="server" visible="false">
            
            <asp:TextBox ID="txtNewAddress" runat="server" CssClass="form-control mb-4" TextMode="MultiLine" placeholder="Enter new Address"></asp:TextBox>

            <asp:Button ID="btnSubmitNewAddress" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmitNewAddress_Click"/>
            
        </div>
        <div id="viewPasswordInput" runat="server" visible="false">
            
            <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control mb-4" TextMode="Password" placeholder="Enter new password"></asp:TextBox>

            <asp:Button ID="btnSubmitNewPassword" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmitNewPassword_Click"/>
            
        </div>

    </div>


</asp:Content>