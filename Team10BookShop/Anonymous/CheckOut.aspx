<%@ Page Title="Cart Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="Team10BookShop.CheckOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>سبد خرید</h1>
    <div class="panel panel-default">
            <asp:GridView ID="CartGridView" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" OnRowDeleting="OnRowDeleting">
                <%--divClass--%>
                
            <Columns>
                <asp:TemplateField HeaderText="ردیف">
                <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Title" HeaderText="عنوان کتاب" />
                <asp:BoundField DataField="Author" HeaderText="نویسنده" />
                <asp:BoundField DataField="ISBN" HeaderText="شابک" />
                <asp:BoundField DataField="Price" HeaderText="قیمت (تومان)" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <image src="../Images/<%# Eval("ISBN") %>.jpg" width="90" height="120"></image>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:CommandField ControlStyle-CssClass="btn btn-warning" DeleteText="حذف"  ShowDeleteButton="True" HeaderText=""/>                
            </Columns>
            </asp:GridView>

               
        </div>
        </>
        <br />
        <div>
              مجموع هزینه قابل پرداخت به تومان  <asp:Label ID="PriceLabel" runat="server" Text="Label"></asp:Label>
        </div>
        <br />
        <div>
            <%--Changes--%>
            
            <asp:Button ID="BackButton" runat="server" Text="بازگشت" cssClass="btn btn-warning" OnClick="BackButton_Click"/>
            <asp:Button ID="ConfirmButton" runat="server" Text="تأیید و پرداخت" OnClick="ConfirmButton_Click" cssClass="btn btn-success" />
        </div>
        
</asp:Content>