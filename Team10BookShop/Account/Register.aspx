<%@ Page Title="ثبت نام" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Team10BookShop.Account.Register" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cap" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
    <h2>ثبت نام در انتشارات سیماک</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>یک حساب کاربری جدید بسازید</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">ایمیل</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="لطفا ایمیل را به درستی وارد کنید" ValidationGroup="register"/>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">رمز عبور</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="لطفا رمز عبور را وارد کنید" ValidationGroup="register" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">تکرار رمز عبور</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="لطفا تکرار رمز عبور را وارد کنید" ValidationGroup="register"/>
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="تکرار رمز عبور با رمز عبور وارد شده مطابقت ندارد" ValidationGroup="register"/>
            </div>
        </div>
        <br />
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">             
                        <cap:CaptchaControl ID="captcha1" runat="server" CssClass="d-inline" CaptchaLength="5" CaptchaHeight="50" CaptchaWidth="200" CaptchaLineNoise="none" CaptchaMinTimeout="1" CaptchaMaxTimeout="240" ForeColor="Blue" BackColor="Wheat" CaptchaChars="ABCDEFGHIJKLMNOPQRSTUVWX123456789" Height="46px" Width="200px" CustomValidatorErrorMessage="لطفا مقدار داخل تصویر را به درستی وارد کنید" />
                        <asp:Button runat="server" CssClass="d-inline mx-2 btn btn-primary" Text="بعدی" />          
                <br />
                <br />
                <asp:Label runat="server" AssociatedControlID="TxtCaptcha" CssClass="col-md-6 control-label">مقدار کادر بالا را وارد کنید</asp:Label>
                <asp:TextBox runat="server" ID="TxtCaptcha" CssClass="form-control" MaxLength="5" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="TxtCaptcha" CssClass="text-danger" ErrorMessage="لطفا مقدار کادر بالا را  وارد کنید" ValidationGroup="register" />
                <br />
                <br />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="ثبت نام" CssClass="btn btn-info" ValidationGroup="register" />
            </div>
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
      </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
