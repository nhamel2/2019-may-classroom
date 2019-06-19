using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Addtional namespaces
using System.Data.Entity;
#endregion

namespace NorthwindSystem.DAL
{
    //restrict public access to this class to other classes in Proj (internal)
    //this class must inherit entity framework abilities (another class)
    //syntax:
    //currentclassname:inheritedclassname

    internal class NorthwindSystemContext:DBContext
    {
        //the constructor will pass to the inherited class DbContext to you r web string connection name
        public NorthwindSystemContext():base("NWDB")
        {

        }


        public DbSet<Product> Products { get; set; }
        public DbSet<Product> Categories { get; set; }
        public DbSet<Product> Supplier { get; set; }
    }
}
