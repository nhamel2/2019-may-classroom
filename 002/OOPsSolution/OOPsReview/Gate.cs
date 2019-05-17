using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OOPsReview
{
    public class Gate
    {
        private string _Style;
        public double Height { get; set; }
        public double Width { get; set; }
        public string Style
        {
            get
            {
                return _Style;
            }
            set
            {
                if (string.IsNullOrEmpty(value))
                {
                    _Style = null;
                }
                else
                {
                    _Style = value;
                }
            }
        }
        public double? Price { get; set; }

        public Gate()
        {

        }

        //Greedy
        public Gate(double height, double width,
                            string style, double? price)
        {
            Height = height;
            Width = width;
            Style = style;
            Price = price;
        }

        //Read-Only Property
        //Contains NO set{}
        //data used in this property is data that is currently
        //    within the instance of this class
        public double GateArea
        {
            get
            {
                return Height * Width;
            }
        }
    }
}
