<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="OnlineMedicineDonation.header" %>

<header class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">

    <p class="navbar-brand m-auto">MedBox</p>
    <!-- Collapse button -->
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#nav"
		aria-controls="nav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

    <div class="collapse navbar-collapse justify-content-end" id="nav">
        
        <ul class="navbar-nav mr-auto ml-4">

            <li class="nav-item" id="liHome" runat="server"><asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" CssClass="btn btn-dark nav-link" Text="Home"></asp:HyperLink></li>
            <li class="nav-item" id="liLogin" runat="server"><asp:HyperLink runat="server" NavigateUrl="~/login.aspx" CssClass="btn btn-dark nav-link" Text="Login"></asp:HyperLink></li>
            <li class="nav-item" id="liRegister" runat="server"><asp:HyperLink runat="server" NavigateUrl="~/register.aspx" CssClass="btn btn-dark nav-link" Text="Register"></asp:HyperLink></li>
            <li class="nav-item" id="liAddMedicine" runat="server"><asp:HyperLink runat="server" NavigateUrl="~/addMedicine.aspx" CssClass="btn btn-dark nav-link" Text="Add Medicine"></asp:HyperLink></li>
            <li class="nav-item" id="liGetMedicines" runat="server"><asp:HyperLink runat="server" NavigateUrl="~/getMedicines.aspx" CssClass="btn btn-dark nav-link" Text="Get Medicine"></asp:HyperLink></li>
            <li class="nav-item" id="liMyMedicines" runat="server"><asp:HyperLink runat="server" NavigateUrl="~/myMedicines.aspx" CssClass="btn btn-dark nav-link" Text="My Medicines"></asp:HyperLink></li>
            
            <li class="nav-item dropdown show" id="liDonations" runat="server">
                <a class="btn btn-dark nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Donations
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <asp:HyperLink runat="server" NavigateUrl="~/AddRequest.aspx" CssClass="dropdown-item" Text="Add Requests"></asp:HyperLink>
                    <asp:HyperLink runat="server" NavigateUrl="~/ViewRequests.aspx" CssClass="dropdown-item" Text="View Requests"></asp:HyperLink>
                </div>
            </li>

            <li class="nav-item" id="liAdminPanel" runat="server"><asp:HyperLink runat="server" NavigateUrl="~/adminPanel.aspx" CssClass="btn btn-dark nav-link" Text="Admin Panel"></asp:HyperLink></li>

            <li class="nav-item" id="liMyAccount" runat="server"><asp:HyperLink runat="server" NavigateUrl="~/AccountInfo.aspx" CssClass="btn btn-dark nav-link" Text="My Account"></asp:HyperLink></li>

            <li class="nav-item"><asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-dark nav-link" OnClick="btnLogout_Click" /></li>

        </ul>

    </div>

    <p id="liUserEmail" runat="server" class="text-white m-auto float-right">MedBox</p>

</header>