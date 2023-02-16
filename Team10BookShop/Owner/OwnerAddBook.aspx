<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OwnerAddBook.aspx.cs" Inherits="Team10BookShop.OwnerAddBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Title -->
    <h1>افزودن کتاب</h1>

    <!-- Input fields -->
    <table class="table">
        <tr>
            <td>
                <asp:Label ID="lblBookTitle" runat="server" Text="عنوان کتاب"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtBookTitle" runat="server" TabIndex="2" Width="250px" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorBookTitle" runat="server" ErrorMessage="عنوان کتاب را وارد کنید" ControlToValidate="txtBookTitle" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCategory" runat="server" Text="دسته بندی"></asp:Label></td>
            <td>
                <asp:DropDownList CssClass="form-select" ID="ddCategory" runat="server" TabIndex="3" Width="250px" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CategoryID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyBooks %>" SelectCommand="SELECT [CategoryID], [Name] FROM [Category]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" runat="server" ControlToValidate="ddCategory" ErrorMessage="لطفا دسته بندی را انتخاب کنید" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 25px">
                <asp:Label ID="lblisbn" runat="server" Text="شابک"></asp:Label></td>
            <td style="height: 25px">
                <asp:TextBox ID="txtISBN" runat="server" TabIndex="4" Width="250px" CssClass="form-control" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorISBN" runat="server" ControlToValidate="txtISBN" EnableTheming="False" ErrorMessage="شابک الزامی است" ForeColor="Red">*</asp:RequiredFieldValidator>
                <%--                   <asp:RegularExpressionValidator ID="RegularExpressionValidatorISBN" runat="server" ControlToValidate="txtISBN" Display="Dynamic" ErrorMessage="Invalid ISBN" ForeColor="Red" ValidationExpression="\d{13}">*</asp:RegularExpressionValidator>--%>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAuthor" runat="server" Text="نویسنده"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtAuthor" runat="server" TabIndex="5" Width="250px" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAuthor" runat="server" ControlToValidate="txtISBN" ErrorMessage="لطفا نام نویسنده را وارد کنید" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <%-- <tr>
            <td><asp:Label ID="lblStock" runat="server" Text="Stock"></asp:Label></td>
            <td> <asp:TextBox ID="txtStock" runat="server" TabIndex="6" TextMode="Number" Width="40px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorStock" runat="server" ControlToValidate="txtStock" ErrorMessage="Stock is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidatorStock" runat="server" ControlToValidate="txtStock" ErrorMessage="Stock needs to be at least 0" ForeColor="Red" MaximumValue="10000" MinimumValue="0" Type="Integer">*</asp:RangeValidator>
            </td>
        </tr>--%>

        <tr>
            <td>
                <asp:Label ID="lblPrice" runat="server" Text="قیمت"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtPrice" runat="server" TabIndex="7" TextMode="Number" Width="250px" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="لطفا قیمت را وارد کنید" ForeColor="Red">*</asp:RequiredFieldValidator>
                <%--                     <asp:RangeValidator ID="RangeValidatorPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="حداقل قیمت باید مقدار 1 باشد" ForeColor="Red" MaximumValue="10000" MinimumValue="1" Type="Integer">*</asp:RangeValidator></td>--%>
        </tr>

        <tr>
            <td>
                <asp:Label ID="lblCover" runat="server" Text="تصویر کاور کتاب"></asp:Label></td>
            <td>
                <asp:FileUpload ID="FileUploadImage" CssClass="btn btn-outline-secondary" runat="server" TabIndex="8" EnableTheming="true" /></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblpdf" runat="server" Text="فایل PDF کتاب"></asp:Label></td>
            <td>
                <asp:FileUpload ID="FileUploadpdf" CssClass="btn btn-outline-secondary" runat="server" TabIndex="9" EnableTheming="true" /></td>
        </tr>
    </table>
    <!-- File Upload, Confirm button and Errors Display -->
    <asp:Button ID="btnConfirm" runat="server" Text="تأیید و بارگذاری" TabIndex="9" CssClass="btn btn-success" OnClick="btnConfirm_Click" />

    <br />
    <br />
    <label id="msg" runat="server"></label>
    <asp:Label ID="lblErrorFileUpload" runat="server" ForeColor="Red"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummaryAddBook" runat="server" ForeColor="Red" />
</asp:Content>
