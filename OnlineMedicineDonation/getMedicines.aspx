<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="getMedicines.aspx.cs" Inherits="OnlineMedicineDonation.getMedicines" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="p-4">
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="gridview w-100 container-fluid" GridLines="None">

            <Columns>

                <asp:TemplateField>

                    <ItemTemplate>
                        <div class="border-secondary text-decoration-none text-dark card card-body bg-white w-100">

                            <div class="row mx-2">
                                <h5 class="col"><%# Eval("med_name") %></h5>
                                <h5 class="col"><%# Eval("med_desc") %></h5>

                                <h5 class="col"><%# ((int)Eval("med_quantity") == 0) ? "Out of Stock" : Eval("med_quantity") + " Qty." %></h5>

                                <asp:HyperLink ID="lnkUserProfile" Text="User" runat="server" Target="_blank" NavigateUrl='<%# Eval("user_id", "/ViewUser.aspx?userId={0}") %>'></asp:HyperLink>
                                <asp:HyperLink ID="lnkViewMed" Text="View" runat="server" CssClass="ml-3" NavigateUrl='<%# Eval("id", "/viewMedicine.aspx?medId={0}") %>'></asp:HyperLink>
                            </div>
                        
                        </div>

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>
        
        </asp:GridView>
    </div>

</asp:Content>
