﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Addtional Namespaces
using System.ComponentModel.DataAnnotations.Schema; 
using System.ComponentModel.DataAnnotations;
#endregion

namespace NorthwindSystem.Data
{
    [Table("Supplier")]
    public class Supplier
    {
        [Key]
        public int SupplierID { get; set; }
        public string CompanyName { get; set; }
        public string ContactName { get; set; }
        public string ConstactTitle { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Region { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string HomePageTitle { get; set; }
        public string HomePageUrl { get; set; }
    }
}
