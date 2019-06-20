
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


#region Additional Namespaces
using NorthwindSystem.Data;
using NorthwindSystem.DAL;
#endregion

namespace NorthwindSystem.BLL
{
    public class ProductController
    {

        //EntityFramework extension method will retreive all 
        //records for the DbSet<T>
        public List<Product> Product_List()
        {
            using (var context = new NorthwindSystemContext())
            {
                //ensure you add the .ToList() to your property
                //to convert the entityframe return datatype to
                // this method's return datatype
                //they MUST match
                return context.Products.ToList();
            }
        }
        //EntityFramework extension method will retreive a parrticular 
        //record from the DbSet<T> base on the records's primary key
        //field
        public Product Product_FindByID(int productid)
        {
            using (var context = new NorthwindSystemContext())
            {
                return context.Products.Find(productid);
            }
        }

    }
}
