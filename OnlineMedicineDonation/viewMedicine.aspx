<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="viewMedicine.aspx.cs" Inherits="OnlineMedicineDonation.viewMedicine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid p-4">
        <div class="form-size card text-center bg-light p-4 m-auto">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:MultiView ID="MultiView1" runat="server">

                <asp:View ID="View1" runat="server" >
                    
                        <asp:Label ID="lblMedName" CssClass="h1 text-primary" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lblMedDesc" CssClass="h3 lead" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lblMedQuantity" CssClass="h3" runat="server"></asp:Label>
                        <asp:Label runat="server" Text='<%# Int32.Parse(lblMedQuantity.Text) %>'></asp:Label>
                        <asp:TextBox ID="txtEnteredQuantity" CausesValidation="true" placeholder="Enter your Qty" TextMode="Number" MaxLength="2"  runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator1" MinimumValue="1" Type="Integer" ControlToValidate="txtEnteredQuantity" runat="server" ErrorMessage="Quantity is greater than available."></asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter required Quantity." ControlToValidate="txtEnteredQuantity"></asp:RequiredFieldValidator>

                        <asp:Button ID="btnSubmit" runat="server" Text="Order Now" CssClass="btn btn-primary my-2" OnClick="btnSubmit_Click" />

                        <asp:Label ID="lblIsNotLoggedIn" runat="server"></asp:Label>
                    
                </asp:View>
                
                
                <asp:View ID="View2" runat="server">
                           
                    <asp:Label ID="userName" runat="server" CssClass="h3"></asp:Label>
                    <asp:Label ID="userEmail" runat="server" CssClass="h4 lead"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="userAddress" runat="server" CssClass="h5 lead text-black-50"></asp:Label>
                    <br />

                    <asp:Label ID="lblSuccessResult" runat="server"></asp:Label>

                    <asp:Button ID="btnPlaceOrder" CssClass="btn btn-primary m-3" runat="server" Text="Place Order" OnClick="btnPlaceOrder_Click" />
                        
                </asp:View>

            </asp:MultiView>
            
        </div>
    </div>

</asp:Content>
