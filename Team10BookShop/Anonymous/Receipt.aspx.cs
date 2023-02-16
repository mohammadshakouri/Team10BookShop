using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Team10BookShop
{
    public partial class Receipt : System.Web.UI.Page
    {
        List<Book> cartList;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                cartList = Session["cart"] as List<Book>;
                // Assign Session["cart"] into cartList, and add dummy book a and b into cartList

                if (cartList != null)
                {
                    PurchaseGridView.DataSource = cartList;
                    PurchaseGridView.DataBind();
                }

                decimal sum = 0;
                
                    foreach (Book c in cartList)
                    {
                        sum += c.Price;
                    }
                
                PriceLabel.Text = sum.ToString();

                cartList.Clear();
            }
           

        }
    }
}