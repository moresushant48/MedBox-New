<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="adminPanel.aspx.cs" Inherits="OnlineMedicineDonation.adminPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <nav class="navbar navbar-expand navbar-light bg-light">
        <ul class="navbar-nav mr-auto ml-4">
            <li class="nav-item" id="liLogin" runat="server"><asp:Button ID="btnViewCustomer" runat="server" CssClass="btn btn-light nav-link p-2" Text="View Customers" OnClick="btnViewCustomer_Click"></asp:Button></li>
            <li class="nav-item" id="liDonRequest" runat="server"><asp:Button ID="btnDonRequests" runat="server" CssClass="btn btn-light nav-link p-2" Text="View Donation Requests" OnClick="btnDonRequests_Click"></asp:Button></li>
            <li class="nav-item" id="liMedRequest" runat="server"><asp:Button ID="btnMedRequests" runat="server" CssClass="btn btn-light nav-link p-2" Text="View Medicine Requests" OnClick="btnMedRequests_Click"></asp:Button></li>
            <li class="nav-item" id="liDisaster" runat="server"><asp:Button ID="btnDisasters" runat="server" CssClass="btn btn-light nav-link p-2" Text="Add Disaster Ads" OnClick="btnDisasters_Click"></asp:Button></li>
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
                                            <asp:HyperLink ID="lnkDeleteUser" runat="server" NavigateUrl='<%# Eval("id", "/adminPanel.aspx?deleteUser={0}") %>'><i class="fa fa-trash-o fa-lg text-danger"></i></asp:HyperLink>
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
            <div class="p-4">
                <div class="table table-bordered table-hover">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" GridLines="None" CssClass="gridview w-100 container-fluid">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class="text-decoration-none text-dark w-100">
                                        <div class="row mx-2">
                                            <h5 class="col"><%# Eval("id") %></h5>
                                            <h5 class="col"><%# Eval("title") %></h5>
                                            <h5 class="col"><%# Eval("description") %></h5>
                                            <h5 class="col"><%# Eval("goal") %></h5>
                                            <h5 class="col"><%# Eval("status") %></h5>
                                            <asp:HyperLink ID="lnkApprove" runat="server" NavigateUrl='<%# Eval("id", "/adminPanel.aspx?approveDon={0}") %>'><i class="fa fa-check fa-lg text-success"></i></asp:HyperLink>
                                            &nbsp;&nbsp;&nbsp;
                                            <asp:HyperLink ID="lnkDeny" runat="server" NavigateUrl='<%# Eval("id", "/adminPanel.aspx?denyDon={0}") %>'><i class="fa fa-times fa-lg text-danger"></i></asp:HyperLink>
                                        </div>
                                    </div>
                                </ItemTemplate>   
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </asp:View>

        <asp:View ID="View3" runat="server">

            <div class="p-4">
                <div class="table table-bordered table-hover">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" GridLines="None" CssClass="gridview w-100 container-fluid">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class="text-decoration-none text-dark w-100">
                                        <div class="row mx-2">
                                            <h5 class="col"><%# Eval("id") %></h5>
                                            <h5 class="col"><%# Eval("med_name") %></h5>
                                            <h5 class="col"><%# Eval("med_desc") %></h5>
                                            <h5 class="col"><%# Eval("med_quantity") %></h5>
                                            <h5 class="col"><%# Eval("status") %></h5>
                                            <asp:HyperLink ID="lnkApproveMed" runat="server" NavigateUrl='<%# Eval("id", "/adminPanel.aspx?approveMed={0}") %>'><i class="fa fa-check fa-lg text-success"></i></asp:HyperLink>
                                            &nbsp;&nbsp;&nbsp;
                                            <asp:HyperLink ID="lnkDenyMed" runat="server" NavigateUrl='<%# Eval("id", "/adminPanel.aspx?denyMed={0}") %>'><i class="fa fa-times fa-lg text-danger"></i></asp:HyperLink>
                                        </div>
                                    </div>
                                </ItemTemplate>   
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

        </asp:View>

        <asp:View ID="View4" runat="server">

            <div class="border border-light bg-light mx-auto p-lg-4 p-4 mt-4 form-size rounded">
                <p class="h2 mb-4">Add Disaster Donation Request</p>
                <asp:TextBox ID="txtDisasterName" runat="server" CssClass="form-control mb-4" TextMode="SingleLine" placeholder="Disaster Name"></asp:TextBox>
                <asp:TextBox ID="txtDisasterDesc" runat="server" CssClass="form-control mb-4" TextMode="MultiLine" Rows="4" placeholder="Disaster Description"></asp:TextBox>
                <asp:TextBox ID="txtDisasterUrl" runat="server" CssClass="form-control mb-4" TextMode="Url" placeholder="Disaster Donation URL"></asp:TextBox>
                <asp:FileUpload ID="imgUpload" runat="server"  CssClass="form-control mb-4" AllowMultiple="false" />
            
                <br>
                <asp:Label ID="result" runat="server" Text=""></asp:Label>

                <div class="text-right">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit"  CssClass="btn btn-primary" OnClick="btnSubmit_Click"/>
                </div>
            </div>

        </asp:View>

    </asp:MultiView>

</asp:Content>