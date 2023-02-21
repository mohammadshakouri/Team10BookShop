using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Team10BookShop.Models;

namespace Team10BookShop.Anonymous
{
    public partial class Default : System.Web.UI.Page
    {
        int catid;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (Team10BookShopEntities mb = new Team10BookShopEntities())
                {
                    DataList1.DataSource = mb.Books.ToList<Book>();
                    DataList1.DataBind();

                    var dropdownitems = mb.Categories.ToList();  
                    ddCategory.DataSource=dropdownitems;                  
                    ddCategory.DataBind();
                    ddCategory.Items.Insert(0, new ListItem { Text = "همه" });
                   
                    
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {           
            using (Team10BookShopEntities mb = new Team10BookShopEntities())
            {
                if (ddCategory.SelectedItem.Text == "همه")
                {                    
                        switch (ddDetails.SelectedValue)
                        {
                            case "نویسنده":

                                catid = Convert.ToInt32(ddCategory.SelectedValue);
                                var q = from x in mb.Books where x.Author.Contains(txtSearch.Text) select x;
                                DataList1.DataSource = q.ToList();
                                DataList1.DataBind();                              

                                break;
                            case "عنوان":
                                catid = Convert.ToInt32(ddCategory.SelectedValue);
                                var q1 = from x in mb.Books where x.Title.Contains(txtSearch.Text) select x;

                                DataList1.DataSource = q1.ToList();
                                DataList1.DataBind();

                                break;
                            case "شابک":
                                catid = Convert.ToInt32(ddCategory.SelectedValue);
                                var q2 = from x in mb.Books where x.ISBN.Contains(txtSearch.Text) select x;

                                DataList1.DataSource = q2.ToList();
                                DataList1.DataBind();                            

                                break;
                        }
                   
                }
                else
                {
                    catid = Convert.ToInt32(ddCategory.SelectedValue);
                    
                        switch (ddDetails.SelectedValue)
                        {
                            case "نویسنده":
                                var q = from x in mb.Books where x.Author.Contains(txtSearch.Text) && x.CategoryID == catid select x;
                               
                                    DataList1.DataSource = q.ToList();
                                    DataList1.DataBind();                               
                                break;

                            case "عنوان":
                                var q1 = from x in mb.Books where x.Title.Contains(txtSearch.Text) && x.CategoryID == catid select x;
                                DataList1.DataSource = q1.ToList();
                                    DataList1.DataBind();
                                break;

                            case "شابک":
                                var q2 = from x in mb.Books where x.ISBN.Contains(txtSearch.Text) && x.CategoryID == catid select x;                              
                                    DataList1.DataSource = q2.ToList();
                                    DataList1.DataBind();                            
                                break;
                            
                        }
                    
                    
                }
            }
        }
        protected void ddCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (Team10BookShopEntities mb = new Team10BookShopEntities())
            {
                int s;
                if (ddCategory.SelectedItem.Text == "همه")
                {
                    var q4 = from x in mb.Books select x;
                    
                    if (q4.Count() != 0)
                    {
                        DataList1.DataSource = q4.ToList();
                        DataList1.DataBind();
                    }
                }
                else
                {
                    s = Convert.ToInt32(ddCategory.SelectedValue);
                    var q4 = from x in mb.Books where (x.CategoryID == s) select x;
                        DataList1.DataSource = q4.ToList();
                        DataList1.DataBind();
                   
                }

            }
        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                Control control;
                control = e.Item.FindControl("BookIDLabel");
                int bookID = Convert.ToInt32(((Label)control).Text);
                Book b = BusinessLogic.getBookByID(bookID);
                Session["id"] = b.BookID;
                Console.WriteLine("book id is:" + Session["id"]);
                Response.Redirect("~/Anonymous/BookDetails.aspx");
            }
        }
        
    }
}