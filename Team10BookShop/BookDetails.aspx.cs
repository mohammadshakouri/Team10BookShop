using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Team10BookShop.Models;

namespace Team10BookShop
{
    public partial class Book_Details : System.Web.UI.Page
    {
        Team10BookShopEntities context;
        Book selectedBook;
        int selectedID;
        Category cat;
        int qty;

        List<Book> bookList;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                selectedID = (int)Session["id"];

                if (!IsPostBack)
                {
                    ViewState["qty"] = 1;
                }
                //txQty.Controls[0].Dispose();

                qty = (int)ViewState["qty"];
                context = new Team10BookShopEntities();
                selectedBook = context.Books.Where(b => b.BookID.Equals(selectedID)).FirstOrDefault();

                cat = new Category();
                if (context.Categories.Where(c => c.CategoryID.Equals(selectedBook.CategoryID)) != null)
                {
                    cat = context.Categories.Where(c => c.CategoryID.Equals(selectedBook.CategoryID)).FirstOrDefault();

                }

                display(selectedBook);

                bookList = (List<Book>)Session["cart"];
            }
            catch(Exception)
            {
                Response.Redirect("~/Default.aspx");
            }
           
        }
     
        protected void bookID(int id)
        {
            selectedID = id;
        }

        protected void display(Book a)
        {
            lbTitle.Text = a.Title;
            lbAuthor.Text = a.Author;
            lbBookID.Text = a.BookID.ToString();
            lbCategory.Text = cat.Name;
            lbISBN.Text = a.ISBN;
            lbPrice.Text = $"{a.Price} تومان";
            //lbStock.Text = a.Stock.ToString();
            Image1.ImageUrl = $"../Images/{a.ISBN}.jpg";
            //txQty.Text = qty.ToString();
        }

        //protected void btnMinus_Click(object sender, EventArgs e)
        //{
        //    qty =(int) ViewState["qty"];
        //    if (qty > 1)
        //    {
        //        qty--;
        //    }
        //    else
        //    {
        //        qty = 1;
        //        btnMinus.Enabled = false;
        //    }
        //    txQty.Text = qty.ToString();
        //    ViewState["qty"] = qty;
        //}

        //protected void btnPlus_Click(object sender, EventArgs e)
        //{
        //    qty = (int)ViewState["qty"];
        //    //if (qty >= selectedBook.Stock)
        //    //{
        //    //    qty = selectedBook.Stock;
        //    //    btnPlus.Enabled = false;
        //    //}
        //    else
        //    {
        //        qty++;
        //    }
        //    txQty.Text = qty.ToString();
        //    ViewState["qty"] = qty;
        //}

        //protected void txQty_TextChanged(object sender, EventArgs e)
        //{
        //    if (Convert.ToInt32(txQty.Text)<=selectedBook.Stock&& Convert.ToInt32(txQty.Text) > 0)
        //    {
        //        qty= Convert.ToInt32(txQty.Text);
        //        ViewState["qty"] = qty;
        //    }
        //    txQty.Text= qty.ToString();
        //}

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            //qty = (int)ViewState["qty"];

            //if (qty <= selectedBook.Stock)
            //{
            //    for (int i = 0; i < qty; i++)
            //    {
            //        
            //        //Label1.Text += selectedBook.BookID;
            //    }


            //Response.Write("<script>confirm('Added to Cart!!')</script>");

            //}
            //else
            //{
            //    btnAddToCart.Enabled = false;
            //}
            bookList.Add(selectedBook);
            Response.Redirect("~/CheckOut");
            Session["cart"] = bookList;

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}