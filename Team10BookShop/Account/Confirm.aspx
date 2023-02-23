<%@ Page Title="فعالسازی حساب" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="Team10BookShop.Account.Confirm" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <br />
   <h2 class="text-center">فعالسازی حساب کاربری</h2>
    <br />
    <br />
    <br />
    <br />
    <div>
        <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="true">
            <br />
            <br />
            <br />
            <br />
            <br />
           
            <p class="text-center h3 alert alert-success">
                حساب کاربری شما با موفقیت فعال شد برای ورود <asp:HyperLink ID="login" runat="server" NavigateUrl="~/Account/Login">اینجا</asp:HyperLink> کلیک کنید          
            </p>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="errorPanel" ViewStateMode="Disabled" Visible="false">
            <p class="text-center h3 alert alert-danger">
               متاسفانه خطایی پیش آمده اگر قبلا حساب کاربری خود را فعال کردید از <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/Login">اینجا</asp:HyperLink> وارد شوید
            </p>
        
        </asp:PlaceHolder>
    </div>
        <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
</asp:Content>
