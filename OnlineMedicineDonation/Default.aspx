<%@ Page Title="Med Donation" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineMedicineDonation._Default" %>
<%@ Register Src="~/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <style>
            #bgimg{
            opacity: 0.7;
			height: 100vh;
			width: 100%;
			object-fit: cover;
			z-index: -1;
			position: fixed;
		}
        </style>
		<img id="bgimg" alt="" src="images/wall.jpg">
	</div>

    <div class=" row d-flex p-4 text-center vh-100">
        <div class="m-auto border border-light p-4 bg-light rounded">
            <h1 class="h1">Online Medicine Donation</h1>
            <asp:Label ID="username" runat="server" Text=""></asp:Label>
            <p class="lead">Medical Attention has become even easier.</p>
            <p><a href="getMedicines.aspx" class="btn btn-primary btn-lg">Get Medicines &raquo;</a></p>
        </div>
    </div>


    <div class="bg-light row d-flex justify-content-center vh-100">
        <div class="m-auto text-center">

            <h1 class="h1">About</h1>
            <hr class="m-4" />
            <p class="h4 lead " style="line-height:40px">
                Tired of going to medical stores, finding the right medicine ? You've come to right place. <br />
                Online MED Donation Portal lets you buy variety of Medicines
                and get them delivered to your doorstep. <br /><br />
                <img src="images/tablet.png" height="200px" width="270px"/>
            </p>
        </div>        
    </div>

    <uc1:footer runat="server" ID="footer" />
</asp:Content>
