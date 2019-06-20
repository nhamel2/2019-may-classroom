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
    }
}
