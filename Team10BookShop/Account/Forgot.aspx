<%@ Page Title="فراموشی رمز عبور" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="Team10BookShop.Account.ForgotPassword" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <h2>فراموشی رمز عبور</h2>

            <div class="row">
                <div class="col-md-8">
                    <asp:PlaceHolder ID="loginForm" runat="server">
                        <div class="form-horizontal">
                            <h4>رمز عبور خود را فراموش کرده اید؟</h4>
                            <hr />
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">ایمیل</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                        CssClass="text-danger" ErrorMessage="لطفا ایمیل خود را وارد کنید" />
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" OnClick="Forgot" Text="بازیابی رمز از طریق ایمیل" CssClass="btn btn-secondary" />
                                </div>
                            </div>
                        </div>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="DisplayEmail" Visible="false">
                        <p class="text-info">
                            لطفا صندوق ایمیل خود را برای بازیابی رمز عبور چک کنید
               
                        </p>
                    </asp:PlaceHolder>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
             </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
