using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.Data.Entity;
using NorthwindSystem.Data;
#endregion

namespace NorthwindSystem.DAL
{
    //restrict public access to this class to other classes in Proj (internal)
    //this class must inherit entity framework abilities (another class)
    //syntax:
    //currentclassname:inheritedclassname

    internal class NorthwindSystemContext:DbContext
    {
        //the constructor will pass to the inherited class DbContext to you r web string connection name
        public NorthwindSystemContext():base("NWDB")
        {

        }

        //setup the data collection set for each entity in your application
        //each DbSet<T> will hold the data transfered for that particular
        //    entity class
        //each DbSet<T> definition is a property of this context class
        //course standard: DbSet<T> will be plural

        public DbSet<Product> Products { get; set; }
        public DbSet<Product> Categories { get; set; }
        public DbSet<Product> Supplier { get; set; }
    }
}
