using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _001___OOPS_Review
{
	public class Gate
	{
        private string _style;
        public double Height { get; set; }
        public double Width { get; set; }
        public double? Price { get; set; }



        public string Style
        {
            get
            {
                return _style;
            }
            set
            {
                if (string.IsNullOrEmpty(value))
                {
                    _style = null;
                }
                else
                {
                    _style = value;
                }
            }
        }

        public Gate()
        {

        }

        public Gate(double height, double width, string style, double? price)
        {
            Height = height;
            Width = width;
            Style = style;
            Price = price;
        }

        //Read-Only property
            //contains no set{}
            //data used in this property is data that is currently within the instance of this class
        public double GateArea
        {
            get
            {
                return Height * Width;
            }
        }



    }
}
