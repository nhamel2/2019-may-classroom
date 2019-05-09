using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _001___OOPS_Review
{
    //the default acces permissions is private
    //If an outside user of this class wanted access to the class contents;
        //Then the access permissions must be public
    //If this class was static, thhe class would not hold data
    // For a class to hold data. DO NOT make it static.
        //Unless you want everyone have access to that data (read/change)

    class FencePanel
    {
        //PROPERTIES
        
        //a property is accosiated with a single piece of data
        //a property has two sub components:
            //get: returns a value to the calling client
            //set: recieves a value from the caling client
                //the key word used to represent incoming data is "value"
        //a property does not take in a parameter
        
        //there are two ways to code a property:
            //fully-implemented: the property will have a private data memember to hold the actual data
                //usually this codig form is used when additional logic/criteria is associated with tht data value
            //auto-implemented: the property does not need a private data member to hold the acutal data
                //the data stoage will be managed by the system
            //Since the property will be doing some actions against the data, you must supply a storage area
                //This storage area is refered to as a private data member

        //auto-implemented property
        public double Height { get; set; }
        public double Width { get; set; }

        //Private data member
        private string _Style;

        //fully-implemented property
        public string Style
        {
            get
            {
                return Style;
            }
            set
            {
                //value contains the incoming data to the property
                    //the contents of value needs to be stored
                //CRITERIA: DO NOT store an empty string
                    //store either null or the characters in the string
                if(string.IsNullOrEmpty(value))
                {
                    _Style = null; 
                }
                else
                {
                    _Style = value;
                }
            }
        }

        //a nullable numeric (xx?) will contain either a null or a number
            //therefore nullable numberics do not need to be full implemented UNLESS you have additional criteria to include
        public double? Price { get; set; }

        //CONSTRUCTOR(S)
        //Constructors are executed for the client caller during the execution of the "new" command
            //the client caller DOES NOT call a constructor directly
            //if no constructoes are coded in a class definition, 
                //then the data stored within the class definition is set to the system defaults (string:null, int/double: 0 etc...)
            //if one codes a constructor within the class definition, then the coder is responsible for ALL constructors
            //syntax ----->         public   classname(list of parameters)   { code }

        //there are two generally create constructors
            //default: simulates the system default initializing of your data storage items using their datatype
            //greddy: this has a parameter list of all the data storage items defined within the class definiation 

        
        //Default
        public FencePanel()
        {

        }
        //optionally you may want to have your own default values for your data storage items


        //Greddy
        public FencePanel(int height, int width, string style, double? price)
        {
            Height = height;
            Width = width;
            Style = style;
            Price = price;
        }

        //Behaviour (method)
        public double EstimatedNumberOfPanels(double linearlength, double gatewidth, int numberofgates)
        {
            double totalgatewidth = gatewidth * numberofgates;
            double fenceWidth = linearlength - totalgatewidth;
            double numberofpanels = fenceWidth / Width;
            return numberofpanels;
        }

    }   
}
