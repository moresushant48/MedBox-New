<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddRequest.aspx.cs" Inherits="OnlineMedicineDonation.AddRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="border border-light bg-light mx-auto p-lg-4 p-4 mt-4 form-size rounded">
        <p class="h2 mb-4 text-center">Add Donation Request</p>
        
        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="Donation Request Title"></asp:TextBox>
        <asp:RequiredFieldValidator ID="nameRequired" runat="server" ControlToValidate="txtTitle" ErrorMessage="Please enter the Title of Donation Request."></asp:RequiredFieldValidator>
        
        <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Enter your reasons for requesting a donation, with proper links to documents."></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDesc" ErrorMessage="Please enter the reason."></asp:RequiredFieldValidator>
        
        <asp:TextBox ID="txtGoal" runat="server" CssClass="form-control" TextMode="Number" placeholder="Required Donation Amount"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtGoal" ErrorMessage="Please enter Required Donation Amount."></asp:RequiredFieldValidator>
        <br />

        <asp:Label ID="lblResult" runat="server" CssClass="text-center"></asp:Label>

        <div class="text-right">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit"  CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
        </div>

    </div>

</asp:Content>
