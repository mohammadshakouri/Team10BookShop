using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Team10BookShop.Models;

namespace Team10BookShop
{
    public partial class OwnerAddBook : System.Web.UI.Page
    {
        Team10BookShopEntities context = new Team10BookShopEntities();
        Book b;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (Team10BookShopEntities db = new Team10BookShopEntities())
            {
                var dropdownitems = db.Categories.ToList();
                ddCategory.DataSource = dropdownitems;
                ddCategory.DataBind();
            }

        }
        
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            // Only proceed to save in database if book cover image is valid
            if (IsValidFiles())
            {
                b = new Book();
                b.Title = txtBookTitle.Text;
                b.CategoryID = Convert.ToInt32(ddCategory.SelectedValue);
                b.ISBN = txtISBN.Text;
                b.Author = txtAuthor.Text;
                b.Price = Convert.ToInt32(txtPrice.Text);
                FileUploadImage.SaveAs(Server.MapPath("~/images/" + b.ISBN + System.IO.Path.GetExtension(FileUploadImage.FileName).ToLower()));
                FileUploadpdf.SaveAs(Server.MapPath("~/PDF/" + b.ISBN + System.IO.Path.GetExtension(FileUploadpdf.FileName).ToLower()));

                try
                {
                    
                    
                        context.Books.Add(b);
                        context.SaveChanges();
                    
                    Response.Redirect("~/Anonymous/Default.aspx");
                    //msg.Attributes.Add("class", "alert alert-success alert-dismissible fade show");
                    //msg.InnerHtml = "کتاب با موفقیت اضافه شد";
                    //Response.Write("<script>confirm('Success!'); window.location = 'OwnerAddBook.aspx';</script>");
                }
                catch (Exception a)
                {
                    Response.Write("<script> if(confirm('Book add was unsuccessful...Would you like to add new book?'))" +
                        "{window.location = 'OwnerAddBook.aspx';} else {window.location = 'BookSearch.aspx';} </script>");
                }
            }
        }
        

        private bool IsValidFiles()
        {
            bool IsValid = false;

            // Validate whether file exists
            if (FileUploadImage.HasFile)
            {
                // Validate file type
                string fileExtension = System.IO.Path.GetExtension(FileUploadImage.FileName).ToLower();
                if ((fileExtension != ".jpg") && (fileExtension != ".png"))
                    lblErrorFileUpload.Text = "برای کاور کتاب فقط پسوند jpg و png و برای فایل کتاب فقط پسوند pdf مجاز است";

                else
                {
                    // Validate file size
                    int fileSize = FileUploadImage.PostedFile.ContentLength;

                    if (fileSize > 1097152)
                        lblErrorFileUpload.Text = "حداکثر حجم تصویر کاور کتاب باید 1 مگابایت باشد";

                    else
                    {
                        if (FileUploadpdf.HasFile)
                        {
                            // Validate file type
                            string fileExtension1 = System.IO.Path.GetExtension(FileUploadpdf.FileName).ToLower();
                            if (fileExtension1 != ".pdf")
                                lblErrorFileUpload.Text = "فقط پسوند pdf برای بارگذاری فایل کتاب مجاز است";

                            else
                            {
                                // Validate file size
                                int fileSize1 = FileUploadpdf.PostedFile.ContentLength;

                                if (fileSize > 5097152)
                                    lblErrorFileUpload.Text = "حداکثر حجم فایل pdf کتاب باید 5 مگابایت باشد";

                                IsValid = true;

                            }
                        }
                        else
                            lblErrorFileUpload.Text = "لطفا فایل pdf کتاب را برای بارگذاری انتخاب کنید";

                    }

                }
            }
            else
                lblErrorFileUpload.Text = "لطفا تصویر کاور کتاب را انتخاب کنید";

            return IsValid;
        }
    }
}