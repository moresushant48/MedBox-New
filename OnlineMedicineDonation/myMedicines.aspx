<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="myMedicines.aspx.cs" Inherits="OnlineMedicineDonation.myMedicines" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="p-4">

        <p class="h3 alert alert-success m-2 text-center">You've added following Medicines.</p>

                <div class="table table-bordered table-hover">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" GridLines="None" CssClass="gridview w-100 container-fluid">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class="text-decoration-none text-dark w-100">
                                        <div class="row mx-2">
                                            <h5 class="col"><%# Eval("med_name") %></h5>
                                            <h5 class="col"><%# Eval("med_desc") %></h5>
                                            <h5 class="col"><%# Eval("med_quantity") %> Qty.</h5>
                                            <h5 class="col"><%# Eval("status") %></h5>
                                            <asp:HyperLink ID="lnkDeleteMed" runat="server" NavigateUrl='<%# Eval("id", "/myMedicines.aspx?deleteMed={0}") %>'><i class="fa fa-trash-o fa-lg text-danger"></i></asp:HyperLink>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

</asp:Content>
