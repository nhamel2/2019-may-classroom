using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Addtional Namespaces
using System.ComponentModel.DataAnnotations.Schema; //  Table
using System.ComponentModel.DataAnnotations;//          Key
#endregion

namespace NorthwindSystem.Data
{
    //The default access is PRIVATE, Must be PUBLIC to access

    //Use Data annotation to point this class to a specific SQL table
    [Table("Products")]
    class Product
    {
        //private string
        private string _QuantityPerUnit;

        //set up each attribute for the sql table
        //if property name = sql attribute, order of properties does NOT matter
        //sql datatypes do NOT allow match C#, check for the correct C# datatype to match the sql datatype
        //      https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/sql-server-data-type-mappings

        //primarykey
        //[key] <-- default sql identity pkey field
        //[key, DatabaseGenerated(DatabaseGenerated.None)] <-- none identity pkey
        //[key, Column(Order=1)] [key, Column(Order=2)]... <-- compound key

        //products is a sql identity pkey field
        [Key]
        public int ProductID { get; set; }

        public string ProductName { get; set; }
        public int? SupplierID { get; set; } //? = null
        public int? CategoryID { get; set; }
        public string QuantityPerUnit
        {
            get
            {
                return _QuantityPerUnit;
            }
            set
            {
                if(string.IsNullOrEmpty(value))
                {
                    _QuantityPerUnit = null;
                }
                else
                {
                    _QuantityPerUnit = value;
                }
            }
        }

        public decimal? UnitPrice { get; set; }
        public Int16? UnitsInOrder { get; set; }
        public Int16? UnitsOnOrder { get; set; }
        public Int16? ReorderLevel { get; set; }
        public bool Discontinued { get; set; }

        //readonly display fields to be used with your application, these property are NOT mapped to ANY sql attribute


    }
}
