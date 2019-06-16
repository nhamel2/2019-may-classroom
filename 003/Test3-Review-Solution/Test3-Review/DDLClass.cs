using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Test3_Review.ReviewPages
{
    public class DDLClass
    {
        public int ValueField { get; set; }
        public string DisplayField { get; set; }
        public DDLClass()
        {

        }
        public DDLClass(int valuefield, string displayfield)
        {
            ValueField = valuefield;
            DisplayField = displayfield;
        }
    }
}