using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Team10BookShop.Models;

namespace Team10BookShop
{
    public class CheckOutBusinessLogic
    {
        Team10BookShopEntities Team10BookShopEntities = new Team10BookShopEntities();

        public Order CreateOrderID(string userName)
        {
            Order order = new Order
            {
                UserName = userName
            };
            Team10BookShopEntities.Orders.Add(order);
            Team10BookShopEntities.SaveChanges();
            return order;
        }

        public void CreateOrderDetails(int orderID, int bookID, decimal price)
        {
            OrderDetail orderDetail = new OrderDetail
            {
                OrderID = orderID,
                BookID = bookID,
                Price = price

            };
            Team10BookShopEntities.OrderDetails.Add(orderDetail);
            Team10BookShopEntities.SaveChanges();
        }

        //public void ChangeStock(int bookID)
        //{
        //    Book book = Team10BookShopEntities.Books.Where(b => b.BookID == bookID).First<Book>();
        //    book.Stock -= 1;
        //    Team10BookShopEntities.SaveChanges();
        //}
    }
}