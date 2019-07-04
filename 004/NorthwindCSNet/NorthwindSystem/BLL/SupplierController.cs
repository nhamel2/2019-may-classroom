using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using NorthwindSystem.Data;
using NorthwindSystem.DAL;
using NorthwindSystem.Data.Views;
using System.Data.SqlClient;
#endregion

namespace NorthwindSystem.BLL
{
    public class SupplierController
    {
        public List<Supplier> Supplier_List()
        {
            using (var context = new NorthwindSystemContext())
            {
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

        public List<SupplierCategories> Suppliers_GetCategories(int suppilerid)
        {
            using (var context = new NorthwindSystemContext())
            {
                IEnumerable<SupplierCategories> results =
                    context.Database.SqlQuery<SupplierCategories>("Suppliers_GetCategories @SupplierID",
                                    new SqlParameter("SupplierID", suppilerid));
                return results.ToList();
            }
        }
    }
}
