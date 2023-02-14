namespace Team10BookShop
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MyBooks : DbContext
    {
        public MyBooks()
            : base("name=MyBooks")
        {
        }

        public virtual DbSet<Book> Books { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Order> Orders { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Book>()
                .Property(e => e.Title)
                .IsUnicode(true);

            modelBuilder.Entity<Book>()
                .Property(e => e.ISBN)
                .IsUnicode(true);

            modelBuilder.Entity<Book>()
                .Property(e => e.Author)
                .IsUnicode(true);

            modelBuilder.Entity<Book>()
                .HasMany(e => e.OrderDetails)
                .WithRequired(e => e.Book)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.Name)
                .IsUnicode(true);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.OrderDetails)
                .WithRequired(e => e.Order)
                .WillCascadeOnDelete(false);
        }
    }
}
