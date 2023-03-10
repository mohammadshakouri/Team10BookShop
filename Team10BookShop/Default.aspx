<%@ Page Title="خانه" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Team10BookShop.Anonymous.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Update Panel-->
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <!-- Wrapper -->
            <div class="wrapper">
                <div class="row justify-content-center">
                    <div class="col">
                        <%--<div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-bs-ride="false">--%>
                        <%-- <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>--%>
                        <div class="carousel-inner rounded">
                            <div class="carousel-item active">
                                <img src="../Images/slide1.png" class="d-block w-100" alt="نشر سیماک" />
                                <div class="carousel-caption d-none d-md-block">
                                    <h4><span style="background-color: rgba(255,255,255,0.5); color: black" class="rounded">انتشارات سیماک</span></h4>
                                    <%--  <p>آخرین تحولات جهان را با ما دنبال کنید</p>--%>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <%--                        <img src="../Content/Images/2.jpg" class="d-block w-100" alt="...">--%>
                                <div class="carousel-caption d-none d-md-block">
                                    <h4><mark class="rounded">سریع ترین بروزرسانی</mark></h4>
                                    <p>آخرین تحولات جهان را با ما دنبال کنید</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <%--                        <img src="../Content/Images/3.jpg" class="d-block w-100" alt="...">--%>
                                <div class="carousel-caption d-none d-md-block">
                                    <h4><mark class="rounded">بیشترین بازدید در یک روز کاری</mark></h4>
                                    <p>آخرین تحولات جهان را با ما دنبال کنید</p>
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Search bar -->
            <div id="booksearchbar" class="jumbotron">
                <div class="container">
                  <div class="row text-center">
                        <div class="col-md-12">

                            <span id="search-title">دنبال چه کتابی می گردی؟</span>

                            <br />
                            <br />
                            <br />
                         
                        </div>
                        <br />
                        <br />
                        <br />
                        <div class="col-md-8 col-lg-5">
                            <span class="bg-secondary p-2 rounded text-light d-inline-block">دسته بندی خود را انتخاب کنید تا فیلتر اعمال شود</span>
                        </div>
                        <br />
                        <br />
                        <div class="col-md-4 col-lg-2">

                            <asp:DropDownList AutoPostBack="true" CssClass="form-select" ID="ddCategory" runat="server" TabIndex="3" DataTextField="Name" DataValueField="CategoryID" OnSelectedIndexChanged="ddCategory_SelectedIndexChanged">
                            </asp:DropDownList>
                            <br />
                        </div>
                    </div>
                    <br />
                  
                     <div class="row text-center">
                    <div class="col-md-8 col-lg-5">
                        <span class="bg-secondary p-2 rounded text-light d-inline-block">ابتدا معیار جستجو را انتخاب و سپس جستجو کنید</span><br />
                        <br />
                    </div>
                    <div class="col-md-4 col-lg-2">

                        <asp:DropDownList ID="ddDetails" class="form-select dropdown-toggle" runat="server">
                            <asp:ListItem>نویسنده</asp:ListItem>
                            <asp:ListItem>عنوان</asp:ListItem>
                            <asp:ListItem>شابک</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                    </div>

                    <div class="col-lg-5">

                        <asp:TextBox ID="txtSearch" runat="server" class="form-control d-inline" placeholder="نوع فیلتر را انتخاب و سپس جستجو کنید"></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" class="btn btn-light rounded" Text="جستجو" OnClick="btnSearch_Click" />
                    </div>
                </div>

                </div>
                <br />
              
                <!-- Books display-->
                <div id="booksdisplay" class="jumbotron">
                    <div class="container-fluid">
                    </div>
                    <asp:Panel ID="Panel1" CssClass="bg-dedicated" runat="server">
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="BookID" HorizontalAlign="Center" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" CellPadding="30" CellSpacing="30">
                            <ItemTemplate>
                                <div class="book-wrapper" style="text-align: center;">
                                    <div>

                                        <!-- Book top-->
                                        <div class="book-top">
                                            <image src="../Images/<%# Eval("ISBN") %>.jpg" width="180" height="210" />

                                            <br />
                                            <br />
                                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' Style="font-size: 20px; color: lightseagreen; font-weight: bolder;" />
                                        </div>

                                        <!-- Book middle-->
                                        <div class="book-middle" style="font-size: 18px; color: dimgray">
                                            <br />
                                            شناسه کتاب:
                                            <asp:Label ID="BookIDLabel" runat="server" Text='<%# Eval("BookID") %>' />
                                            <br />
                                            شابک:
                                            <asp:Label ID="ISBNLabel" runat="server" Text='<%# Eval("ISBN") %>' />
                                            <br />
                                            نویسنده:
                                            <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                                            <%--<br />
                                            CategoryID:
                                            <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                                            <br />--%>
                                        </div>

                                        <!-- Book bottom -->
                                        <div style="font-size: 20px; font-weight: bolder; padding-bottom: 50px">
                                            <%--                                            <div style="color:green"> موجودی:
                                                <asp:Label ID="StockLabel" runat="server" Text='<%# Eval("Stock") %>' />
                                            </div>--%>

                                            <div style="color: indianred">
                                                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                                                تومان
                                            </div>
                                            <asp:Button ID="DetailButton" class="btn btn-warning" runat="server" Text="مشاهده و خرید" CommandName="Details" />
                                            <br />
                                        </div>
                                        <!-- Book bottom (close) -->
                                    </div>
                                    <!-- Jumbotron (close)-->
                                </div>
                                <!-- Book wrapper (close)-->
                                </div><!--container-->
                            </ItemTemplate>
                            <SelectedItemStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
                        </asp:DataList>
                    </asp:Panel>
                </div>
                <!-- Book display (close)-->
            </div>
            </div>
            <br />
            <br />
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
