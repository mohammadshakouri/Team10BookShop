//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Team10BookShop.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class UsersOrderHistory
    {
        public string UserName { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public decimal Price { get; set; }
        public int OrderID { get; set; }
        public int OrderDetailID { get; set; }
        public System.DateTime OrderDate { get; set; }
        public string ISBN { get; set; }
    }
}