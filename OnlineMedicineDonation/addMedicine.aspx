<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="addMedicine.aspx.cs" Inherits="OnlineMedicineDonation.addMedicine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="border border-light bg-light mx-auto p-lg-4 p-4 mt-4 form-size rounded">
        <p class="h2 mb-4 text-center">Add Medicine</p>
        
        <asp:TextBox ID="txtMedName" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="Medicine Name"></asp:TextBox>
        <asp:RequiredFieldValidator ID="nameRequired" runat="server" ControlToValidate="txtMedName" ErrorMessage="Please enter the Medicine Name."></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtMedDesc" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Medicine Details"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMedDesc" ErrorMessage="Please enter the Medicine Description."></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtMedQuantity" runat="server" CssClass="form-control" TextMode="Number" placeholder="Medicine Quantity"></asp:TextBox>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMedQuantity" ErrorMessage="Please enter the Medicine Quantity."></asp:RequiredFieldValidator>
        <br />

        <asp:Label ID="lblResult" runat="server" CssClass="text-center"></asp:Label>

        <div class="text-right">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit"  CssClass="btn btn-primary" OnClick="btnSubmit_Click"/>
        </div>

    </div>

</asp:Content>
