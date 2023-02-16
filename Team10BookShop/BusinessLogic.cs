using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Team10BookShop.Models;

namespace Team10BookShop
{
    public class BusinessLogic
    {
        Team10BookShopEntities Team10BookShopEntities;
        public static void EditInventory(int bookID, string title, int categoryID, string isbn, string author, decimal price)
        {
            using(Team10BookShopEntities entities = new Team10BookShopEntities())
            {
                
                Book book = entities.Books.Where(x => x.BookID == bookID).First<Book>();
                book.Title = title;
                book.CategoryID = categoryID;
                book.ISBN = isbn;
                book.Author = author;
                //book.Stock = stock;
                book.Price = price;
                entities.SaveChanges();
            }
        }

        public static List<Book> ListBooksBy()
        {
            using (Team10BookShopEntities entities = new Team10BookShopEntities())
            {
                    return entities.Books.ToList<Book>();
            }
        }

        public static void DeleteBooks(string title)
        {
            using (Team10BookShopEntities entities = new Team10BookShopEntities())
            {
                Book book = entities.Books.Where(z => z.Title == title).First<Book>();
                entities.Books.Remove(book);
                entities.SaveChanges();
            }
        }

        public static Book getBookByID(int bookID)
        {
            using (Team10BookShopEntities entities = new Team10BookShopEntities())
            {
                return entities.Books.Where
                    (x => x.BookID == bookID).ToList<Book>()[0];
            }
                
        }
    }
}