using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _001___OOPS_Review
{
    //the default access permissions is private
    //if an outside user of this class wanted
    //     access to the class contents; then
    //     the access permissions needs to be public
    //if this class was static; the class would not
    //     hold data
    //For a class to hold data, DO NOT make it static
    //     unless you want everyone to have access
    //     to that data (read and change)
    public class FencePanel
    {
        //Properties
        //a property is associated with a single piece of
        //    data
        //a property has two sub components:
        //     get: returns a value to the calling client
        //     set: receives a value from the calling client
        //          the keyword use to represent incoming data
        //              is value
        //a property DOES NOT take in a parameter

        //there are two ways to code a property: Fully Implemented and Auto-Implemented

        //Auto-Implemented Property: the property does not need
        //     a private data member to hold the actual data.
        //     The data storage will be managed by the system.
        public double Height { get; set; }
        public double Width { get; set; }

        //Fully Implemented Property: The property will have a
        //     a private data member to hold the actual data.
        //     Usually, this coding form is used when additional
        //     logic/criteria is associated with the data value.
        //     Since, the property will be doing some actions 
        //     against the data, you MUST supply a storage area.
        //     This storage area is referred to as a private
        //     data member

        //Private data member
        private string _Style;

        //Fully Implemented Property
        public string Style
        {
            get
            {
                return _Style;
            }
            set
            {

                //value contains the incomming data to the property
                //the contents of value needs to be stored
                //creteria: DO NOT store an empty string
                //          Store either null or the characters in the
                //           string
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

        //a nullable numeric (xxx?) will content either a null or
        //     a number
        //therefore nullable numerics DO NOT need to be fully 
        //     implement UNLESS you have additional criteria to 
        //     cover
        public double? Price { get; set; }

        //Constructors
        //Constructor(s) are executed for the client caller during
        //    the execution of the "new" command
        //the client caller DOES NOT call a constructor directly
        //if no constructors ae coded in a class definition, then
        //     the data storage within the class definition is set
        //     to the system defaults (string -> null, numerics -> 0
        //     bool -> false, ...)
        //if one codes a constructor within the class definitin
        //     then the coder is responsible for ALL constructors
        //syntax   public classname(list of parameters) { code }

        //there are two generally create constructor 
        //Default: simulates the System default initialization of
        //         your data storage items using their datatype
        //Greedy: this has a parameter list of all data storage
        //        items defined within the class definition

        //Default
        public FencePanel()
        {
            //optionally you may wish to have your own default
            //    values for your data storage items
        }

        //Greedy
        public FencePanel(double height, double width,
                            string style, double? price)
        {
            Height = height;
            Width = width;
            Style = style;
            Price = price;
        }

        //Behaviour (method)
        public double EstimatedNumberOfPanels(double linearlength)
        {

            double numberofpanels = linearlength / Width;
            return numberofpanels;
        }
    }
}
