<%@ Page Title="ورود" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Team10BookShop.Account.Login" Async="true" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cap" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <%--<h2><%: Title %></h2>--%>
    <h2>ورود به انتشارات سیماک</h2>

    <div class="row  justify-content-md-center">
        <div class="col-md-7">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>لطفا برای ادامه وارد حساب کاربری خود شوید</h4>
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
                                CssClass="text-danger" ErrorMessage="وارد کردن ایمیل ضروری است" ValidationGroup="login"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">رمز عبور</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="لطفا رمز عبور را وارد کنید" ValidationGroup="login" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">اطلاعات ورود را بخاطر داشته باش</asp:Label>
                            </div>
                        </div>
                        <br />
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <cap:CaptchaControl ID="captcha1" runat="server" CssClass="d-inline" CaptchaLength="5" CaptchaHeight="50" CaptchaWidth="200" CaptchaLineNoise="none" CaptchaMinTimeout="1" CaptchaMaxTimeout="240" ForeColor="Blue" BackColor="Wheat" CaptchaChars="ABCDEFGHIJKLMNOPQRSTUVWX123456789" Height="46px" Width="200px" />
                                    <asp:Button runat="server" CssClass="d-inline mx-2 btn btn-primary" Text="بعدی"/>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
                            <br />
                            <asp:Label runat="server" AssociatedControlID="TxtCaptcha" CssClass="col-md-6 control-label">مقدار کادر بالا را وارد کنید</asp:Label>
                            <asp:TextBox runat="server" ID="TxtCaptcha" CssClass="form-control" MaxLength="5" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="TxtCaptcha" CssClass="text-danger" ErrorMessage="لطفا مقدار کادر بالا را  وارد کنید" ValidationGroup="login"/>
                            <br />
                            <br />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="ورود" CssClass="btn btn-success" ValidationGroup="login" />
                            <span class="p-x-5"></span>
                            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" CssClass="btn btn-outline-success">ثبت نام</asp:HyperLink>
                            <asp:HyperLink NavigateUrl="~/Account/Forgot.aspx" runat="server" ID="ForgotPasswordHyperLink" CssClass="btn btn-outline-info" ViewStateMode="Enabled">فراموشی رمز عبور</asp:HyperLink>

                        </div>
                    </div>
                </div>

                <p>
                    <%--Enable this once you have account confirmation enabled for password reset functionality--%>
                </p>
            </section>
        </div>

        <div class="col-md-5">
            <%-- <section id="socialLoginForm">
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </section>--%>
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
</asp:Content>
