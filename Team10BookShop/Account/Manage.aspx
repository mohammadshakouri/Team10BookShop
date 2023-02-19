<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="Team10BookShop.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
   <%-- <h2><%Title %>.</h2>--%>
    <h2>مدیریت حساب کاربری</h2>
    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <span class="h4">تنظیمات حساب کاربری خود را مدیریت کنید</span>
                                        <asp:HyperLink CssClass="btn btn-primary" NavigateUrl="/Account/ManagePassword" Text="تغییر رمز عبور" Visible="true" ID="ChangePassword" runat="server" />

                <hr />
                           
                   <%-- <dt>ورود از خارج</dt>
                    
                    <dd>  
                        
                        <asp:HyperLink CssClass="btn btn-primary" NavigateUrl="/Account/ManageLogins" Text="مدیریت" runat="server" />
                        <br /><br />
                        تعداد دفعات ورود <%: LoginsCount %> 

                    </dd>--%>
                    <%--
                        Phone Numbers can used as a second factor of verification in a two-factor authentication system.
                        See <a href="https://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                        for details on setting up this ASP.NET application to support two-factor authentication using SMS.
                        Uncomment the following blocks after you have set up two-factor authentication
                    --%>
                    <%--
                    <dt>Phone Number:</dt>
                    <% if (HasPhoneNumber)
                       { %>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Add]" />
                    </dd>
                    <% }
                       else
                       { %>
                    <dd>
                        <asp:Label Text="" ID="PhoneNumber" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Change]" /> &nbsp;|&nbsp;
                        <asp:LinkButton Text="[Remove]" OnClick="RemovePhone_Click" runat="server" />
                    </dd>
                    <% } %>
                    --%>

                   <%-- <dt>Two-Factor Authentication:</dt>
                    <dd>
                        <p>
                            There are no two-factor authentication providers configured. See <a href="https://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                            for details on setting up this ASP.NET application to support two-factor authentication.
                        </p>--%>
                        <% if (TwoFactorEnabled)
                          { %> 
                        <%--
                        Enabled
                        <asp:LinkButton Text="[Disable]" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />
                        --%>
                        <% }
                          else
                          { %> 
                        <%--
                        Disabled
                        <asp:LinkButton Text="[Enable]" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />
                        --%>
                        <% } %>
                   <%-- </dd>--%>
                </dl>
            </div>
        </div>
    </div>
    <br />
    <br />
    <div class="row text-center justify-content-center">
        <div class="col-12"><span class="alert alert-success h2">سوابق سفارش شما</span></div>
        <br />
        <br />
        <br />
        <br />
     
    
        <div class="col-12">
            <asp:GridView ID="UserPurchaseHistory" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" AllowPaging="true" OnPageIndexChanging="gdview_PageIndexChanging">
            <Columns>                
                <asp:TemplateField HeaderText="ردیف" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" itemStyle-Width="50px">
                <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UserName" HeaderText="نام کاربری" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" itemStyle-Width="200px" />
                
                <asp:BoundField DataField="Title" HeaderText="عنوان کتاب" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" itemStyle-Width="220px" />
               <asp:TemplateField HeaderText="قیمت" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" itemStyle-Width="250px">
                    <ItemTemplate>
                        <label><%# Eval("Price") %> تومان</label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تاریخ سفارش" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" itemStyle-Width="200px">
                    <ItemTemplate>
                        <label><%# showtime(Eval("OrderDate").ToString()) %></label>                                                
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تصویر کتاب" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" itemStyle-Width="250px">
                    <ItemTemplate>
                        <image src="../Images/<%# Eval("ISBN") %>.jpg" width="90" height="120"></image>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="لینک دانلود" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" itemStyle-Width="150px">
                    <ItemTemplate>
                        <a class="btn btn-outline-success" href="../PDF/<%# Eval("ISBN") %>.pdf">دانلود کتاب</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
