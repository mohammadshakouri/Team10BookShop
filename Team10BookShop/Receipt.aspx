<%@ Page Title="رسید خرید" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="Team10BookShop.Receipt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        
    <h4 class="alert alert-success text-center">سفارش شما با موفقیت ثبت شد</h4><br />
    <h3>جزئیات سفارش</h3><br />
        <div>
            <asp:GridView ID="PurchaseGridView" CssClass="table table-hover" runat="server" AutoGenerateColumns="False">
            <Columns>                
                <asp:TemplateField HeaderText="ردیف" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" itemStyle-Width="50px">
                <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Title" HeaderText="عنوان کتاب" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" itemStyle-Width="200px" />
                <asp:BoundField DataField="Author" HeaderText="نویسنده" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" itemStyle-Width="220px" />
                <asp:BoundField DataField="ISBN" HeaderText="شابک" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" itemStyle-Width="200px" />
                <asp:BoundField DataField="Price" HeaderText="قیمت (تومان)" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" itemStyle-Width="200px" />
                <asp:TemplateField HeaderText="تصویر کتاب" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" itemStyle-Width="250px">
                    <ItemTemplate>
                        <image src="../Images/<%# Eval("ISBN") %>.jpg" width="90" height="120"></image>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="لینک دانلود" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" itemStyle-Width="200px">
                    <ItemTemplate>
                        <a class="btn btn-outline-success" href="../PDF/<%# Eval("ISBN") %>.pdf">دانلود کتاب</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView>
        </div>
        <br />
        <div>
            جمع کل هزینه پرداخت شده: <asp:Label CssClass="alert alert-success p-1" ID="PriceLabel" runat="server" Text="Label"></asp:Label> تومان
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
</asp:Content>
