using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NorthwindSystem.BLL
{
    public class SupplierController
    {
        //Entity framework extension method will retrieve all records for DbSet<T>
        public List<Supplier> Supplier_List()
        {
            using (var context = new NorthwindSystemContext())
            {
                //.ToList() is required
                return context.Suppliers.ToList();
            }
        }
        public Supplier Supplier_FindByID(int supplierid)
        {
            using (var context = new NorthwindSystemContext())
            {
                return context.Suppliers.Find(supplierid);
            }
        }
    }
}
