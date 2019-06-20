using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
#endregion

namespace NorthwindSystem.Data
{
    //the default access type is private
    //you MUST alter this to public

    //use a data annonation to point this class to the
    //    appropriate Sql table
    [Table("Products")]
    public class Product
    {
        //private data members
        private string _QuantityPerUnit;

        //setup a property for each attrbute on your sql table
        //Rules:
        //  if your property name is the same as the sql attribute
        //      order of properties DOES NOT matter
        //  sql datatypes do NOT allow match C#, check for the correct
        //      C# datatype to match the sql datatype (Sql Sever Data Type Mappings)
        //   https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/sql-server-data-type-mappings
        //  some properties will require annotations

        //primary key
        // [Key]  default sql identity pkey field
        // [Key, DatabaseGenerated(DatabaseGeneratedOption.None)] non identity pkey
        // [Key, Column(Order=1)] [Key, Column(Order=2)]... compound pkey

        //Products is a sql identity pkey field
        [Key]
        public int ProductID { get; set; }

        //entity properties can have their own validation placed on the property
        [Required(ErrorMessage ="Product name is required")]
        [StringLength(160, ErrorMessage = "Product is limited to 160 characters")]
        public string ProductName { get; set; }
        public int? SupplierID { get; set; } //sql field is nullable
        public int? CategoryID { get; set; }

        //course standard: nullable strings MUST be fully implemented
        [StringLength(25, ErrorMessage ="Quantity per unit is limited to 25 characters")]
        public string QuantityPerUnit
        {
            get
            {
                return _QuantityPerUnit;
            }
            set
            {
                if (string.IsNullOrEmpty(value))
                {
                    _QuantityPerUnit = null;
                }
                else
                {
                    _QuantityPerUnit = value;
                }
            }
        }
        [Range(0.00,double.MaxValue, ErrorMessage ="Unit price must be 0.00 or greater" )]
        public decimal? UnitPrice { get; set; }
        [Range(0,Int16.MaxValue, ErrorMessage ="Units in stock must be 0 or greater")]
        public Int16? UnitsInStock { get; set; }
        [Range(0, Int16.MaxValue, ErrorMessage = "Units on order must be 0 or greater")]
        public Int16? UnitsOnOrder { get; set; }
        [Range(0, Int16.MaxValue, ErrorMessage = "Reorder Level must be 0 or greater")]
        public Int16? ReorderLevel { get; set; }
        public bool Discontinued { get; set; }

        //readonly display fields to be used with your application
        //these property are NOT mapped to ANY sql table attribute
        //to do this use the NotMapped annotation
        [NotMapped]
        public string ProductDescription
        {
            get
            {
                return ProductName + "(" + ProductID + ")";
            }
        }
    }
}
