<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="Team10BookShop.Book_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style=" background: #eff5fd; border-radius: 10px;">
    <table class="">
        <tr>
            <td style="width: 97px">
                &nbsp;</td>
            <td style="width: 97px">
                &nbsp;</td>
            <td colspan="2" style="height: 30px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 97px">
                &nbsp;</td>
            <td rowspan="8" style="width: 97px;">
                <asp:Image CssClass="m-l-50 rounded book-image" ID="Image1" runat="server" />
            </td>
            <td colspan="2" style="height: 30px">
                <asp:Label ID="lbTitle" runat="server" Font-Size="X-Large" Text="Title"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 97px">
                &nbsp;</td>
            <td style="width: 189px; height: 30px;">شناسه کتاب:</td>
            <td style="height: 30px">
                <asp:Label ID="lbBookID" runat="server" Text="BookID"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 97px">
                &nbsp;</td>
            <td style="width: 189px; height: 30px;">شابک:</td>
            <td style="height: 30px">
                <asp:Label ID="lbISBN" runat="server" Text="ISBN"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 97px">
                &nbsp;</td>
            <td style="width: 189px; height: 21px;">دسته بندی:</td>
            <td style="height: 21px">
                <asp:Label ID="lbCategory" runat="server" Text="Category"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 97px">
                &nbsp;</td>
            <td style="width: 189px; height: 30px">نویسنده:</td>
            <td style="height: 30px">
                <asp:Label ID="lbAuthor" runat="server" Text="Author"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 97px">
                &nbsp;</td>
            <td style="width: 189px; height: 30px;">قیمت: </td>
            <td style="height: 30px">
                <asp:Label ID="lbPrice" runat="server" Text="Price"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 97px">
                <asp:Button ID="btnBack" runat="server" CssClass="btn btn-secondary" OnClick="btnBack_Click" Text="&lt;&lt; بازگشت" Width="88px" />
            </td>
            <td style="width: 250px">
               <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <span>
                            <asp:Button ID="btnMinus" CssClass="btn btn-light" runat="server" Text="-" Width="28px" OnClick="btnMinus_Click" />
                        </span>
                        <span>
                            <asp:TextBox ID="txQty" CssClass="form-control d-inline" runat="server" Width="101px" AutoPostBack="True" Font-Size="Medium" OnTextChanged="txQty_TextChanged" TextMode="Number"></asp:TextBox>
                        </span>
                        <span>
                            <asp:Button ID="btnPlus" CssClass="btn btn-light" runat="server" Text="+" OnClick="btnPlus_Click" Width="28px" />
                        </span>
                    </ContentTemplate>
                </asp:UpdatePanel>--%>
                
            </td>
            <td>
                <asp:Button ID="btnAddToCart" CssClass="btn btn-success" runat="server" Text="افزودن به سبد خرید" OnClick="btnAddToCart_Click" />
            </td>
        </tr>
    </table>
    <br />
        </div>
</asp:Content>
