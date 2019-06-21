using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NorthwindSystem.BLL
{
    public class CategoryController
    {
        //Entity framework extension method will retrieve all records for DbSet<T>
        public List<Category> Category_List()
        {
            using (var context = new NorthwindSystemContext())
            {
                //.ToList() is required
                return context.Categories.ToList();
            }
        }
        public Category Category_FindByID(int categoryid)
        {
            using (var context = new NorthwindSystemContext())
            {
                return context.Categories.Find(Categoryid);
            }
        }
    }
}
