<%@ Page Title="ویرایش کتاب ها" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OwnerUpdateInventory.aspx.cs" Inherits="Team10BookShop.OwnerUpdateInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row text-center justify-content-center">
        
        <div class="col">
    <asp:GridView CssClass="table table-hover" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"  AutoGenerateColumns="False" DataKeyNames="BookID" DataSourceID="SqlDataSource1" >
        <Columns>
            <asp:CommandField ShowDeleteButton="True" DeleteText="حذف" ShowEditButton="True" EditText="ویرایش" ControlStyle-CssClass="btn btn-light d-inline" UpdateText="بروزرسانی" CancelText="انصراف"/>
            <asp:BoundField DataField="BookID" HeaderText="شناسه کتاب" InsertVisible="False" ReadOnly="True" SortExpression="BookID" />
            <asp:BoundField DataField="Title" HeaderText="عنوان کتاب" SortExpression="Title" />
            <asp:BoundField DataField="CategoryID" HeaderText="شناسه دسته بندی" SortExpression="CategoryID" />
            <asp:BoundField DataField="ISBN" HeaderText="شابک" SortExpression="ISBN" ReadOnly="true" />
            <asp:BoundField DataField="Author" HeaderText="نویسنده" SortExpression="Author" />
            <asp:BoundField DataField="Price" HeaderText="قیمت (تومان)" SortExpression="Price" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=192.168.100.35\sql2017;Initial Catalog=Team10BookShop;Persist Security Info=True;User ID=EbookUser;Password=P@ssw0rd" DeleteCommand="DELETE FROM [Book] WHERE [BookID] = @BookID" InsertCommand="INSERT INTO [Book] ([Title], [CategoryID], [ISBN], [Author], [Price]) VALUES (@Title, @CategoryID, @ISBN, @Author, @Price)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Book]" UpdateCommand="UPDATE [Book] SET [Title] = @Title, [CategoryID] = @CategoryID, [Author] = @Author, [Price] = @Price WHERE [BookID] = @BookID">
        <DeleteParameters>
            <asp:Parameter Name="BookID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:Parameter Name="ISBN" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <%--<asp:Parameter Name="Stock" Type="Int32" />--%>
            <asp:Parameter Name="Price" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:Parameter Name="ISBN" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <%--<asp:Parameter Name="Stock" Type="Int32" />--%>
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="BookID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
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
</asp:Content>
