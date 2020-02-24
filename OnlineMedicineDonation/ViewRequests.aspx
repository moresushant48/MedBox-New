<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewRequests.aspx.cs" Inherits="OnlineMedicineDonation.ViewRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:MultiView ID="MultiView1" runat="server">

        <asp:View ID="View1" runat="server">

            <p class="h3 alert alert-dark text-center m-3">You are free to donate with any amount of money.</p>
        
        <div class="p-4">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="gridview w-100 container-fluid" GridLines="None">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div class="border-secondary text-decoration-none text-dark card card-body bg-white w-100">

                            <div class="row mx-2">
                                <h5 class="col"><%# Eval("title") %></h5>
                                <h5 class="col"><%# Eval("description") %></h5>
                                <h5 class="col"><%# Eval("goal") %> Rs.</h5>

                                <asp:HyperLink ID="lnkUserProfile" Text="User" CssClass="" runat="server" Target="_blank" NavigateUrl='<%# Eval("user_id", "/ViewUser.aspx?userId={0}") %>'></asp:HyperLink>
                                <asp:HyperLink ID="lnkDonate" Text="Donate" CssClass="ml-3" runat="server" NavigateUrl='<%# Eval("id", "/ViewRequests.aspx?donId={0}") %>'></asp:HyperLink>
                            </div>
                        
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>

        </asp:View>

        <asp:View ID="View2" runat="server">

            <div class="border border-light bg-light mx-auto p-lg-4 p-4 mt-4 form-size rounded">
                <p class="h2 mb-4">Donation Options</p>
            
                <asp:CheckBoxList ID="cblPaymentOptions" runat="server">

                    <asp:ListItem Value="1">&nbsp;&nbsp;Paytm</asp:ListItem>
                    <asp:ListItem Value="2">&nbsp;&nbsp;Paypal</asp:ListItem>

                </asp:CheckBoxList>

                <asp:Label ID="result" runat="server"></asp:Label>

                <div class="text-right">
                    <asp:Button ID="btnDonate" runat="server" Text="Donate"  CssClass="btn btn-primary" OnClick="btnDonate_Click"/>
                </div>
            </div>

        </asp:View>

    </asp:MultiView>

</asp:Content>
