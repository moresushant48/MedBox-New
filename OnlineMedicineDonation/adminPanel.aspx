<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="adminPanel.aspx.cs" Inherits="OnlineMedicineDonation.adminPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <nav class="navbar navbar-light bg-light">
        <ul class="navbar-nav mr-auto ml-4">
            <li class="nav-item" id="liLogin" runat="server"><asp:Button ID="btnViewCustomer" runat="server" CssClass="btn btn-light nav-link p-2" Text="View Customers" OnClick="btnViewCustomer_Click"></asp:Button></li>
        </ul>
    </nav>

    <asp:MultiView ID="MultiView1" runat="server">

        <asp:View ID="View1" runat="server">
            <div class="p-4">
                <div class="table table-bordered table-hover">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" GridLines="None" CssClass="gridview w-100 container-fluid">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class="text-decoration-none text-dark w-100">
                                        <div class="row mx-2">
                                            <h5 class="col"><%# Eval("id") %></h5>
                                            <h5 class="col"><%# Eval("full_name") %></h5>
                                            <h5 class="col"><%# Eval("email") %></h5>
                                            <h5 class="col"><%# Eval("address") %></h5>
                                            <asp:HyperLink ID="lnkViewMed" runat="server" NavigateUrl='<%# Eval("id", "/adminPanel.aspx?deleteUser={0}") %>'><i class="fa fa-trash-o fa-lg text-danger"></i></asp:HyperLink>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </asp:View>

        <asp:View ID="View2" runat="server">

            

        </asp:View>

        <asp:View ID="View3" runat="server">



        </asp:View>

    </asp:MultiView>

</asp:Content>