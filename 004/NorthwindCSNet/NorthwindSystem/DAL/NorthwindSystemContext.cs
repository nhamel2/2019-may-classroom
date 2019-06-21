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
    //we wish to restrict public access to this class
    //    to classes within this project
    //the access type will be internal

    //this class needs to inherit the EntityFramework abilities
    //for a class to obtain the abilities of othe classes, you
    //   uses the OOP technique of inheritence
    //syntax for inheriting a class:    yourclassname:inheritedclassname
    internal class NorthwindSystemContext:DbContext
    {
        //the constructor will pass to the inherited class DbContext
        //    your web connection string name
        public NorthwindSystemContext():base("NWDB")
        {

        }

        //setup the data collection set for each entity in your application
        //each DbSet<T> will hold the data transfered for that particular
        //    entity class
        //each DbSet<T> definition is a property of this context class
        //course standard: DbSet<T> will be plural

        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Supplier> Suppliers { get; set; }

    }
}
