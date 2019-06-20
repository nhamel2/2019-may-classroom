using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace NorthwindSystem.BLL
{
    public class ProductController
    {
        //Entity framework extension method will retrieve all records for DbSet<T>
        public List<Product> Product_List()
        {
            using (var context = new NorthwindSystemContext())
            {
                //.ToList() is required
                return context.Products.ToList();
            }
        }
        public Product Product_FindByID(int productid)
        {
            using (var context = new NorthwindSystemContext())
            {
                return context.Products.Find(productid);
            }
        }

    }
}
