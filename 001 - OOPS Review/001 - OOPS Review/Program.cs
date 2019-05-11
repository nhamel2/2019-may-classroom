using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _001___OOPS_Review
{
    class Program
    {
        static void Main(string[] args)
        {
            //"console" is a reference to a system static class
            //static classes are used by typing the class name
            //static classes do not store variable data
            //static classes are used by everyone (not private)
            //methods of a static class will be placed after the object operator
            // the "dot" operator
            //Console.ReadLine();
            //Console.WriteLine("test");


            //create an instance of a none static class
            //if you  create a declaritive using JUST the class name then this is ONLY a "pointer"
                //a "pointer" can only hold a instance of the class specified.
            //Therefore the value of aVariable is NULL
            FencePanel aVariable = null;

            //if you  use the new command with the class, 
            //the new command will physically create a new instance of the class.

            //when this statement is executed the default constructor of the fencepanel class will be called on your behalf
            FencePanel anInstance = new FencePanel();
            anInstance.Height = 5.8;
            anInstance.Width = 8.0;
            anInstance.Style = "neighbour friendly";
            Console.WriteLine("height is: " + anInstance.Height.ToString());
            Console.WriteLine("height is: " + anInstance.Width.ToString());
            Console.WriteLine("height is: " + anInstance.Style.ToString());
            Console.WriteLine("height is: " + anInstance.Price.ToString() + "\n");


            FencePanel anGInstance = new FencePanel(4.0, 6.8, "private", 32.89);
            Console.WriteLine("height is: " + anGInstance.Height.ToString());
            Console.WriteLine("height is: " + anGInstance.Width.ToString());
            Console.WriteLine("height is: " + anGInstance.Style.ToString());
            Console.WriteLine("height is: " + anGInstance.Price.ToString() + "\n");

            //Using instances of classes
            Console.WriteLine("\n Entering Gate data \n");

            FenceEstimate CustomerFence = new FenceEstimate();
            //placing data from the right side to the left side 
            CustomerFence.Fence = anGInstance;
            CustomerFence.Gates = new List<Gate>();


            string menuItem = "0";
            string inputValue;
            Gate theGate = null;    //new instance here instead of inside loop
            do
            {
                theGate = new Gate();
                Console.WriteLine("Height: ");
                inputValue = Console.ReadLine();
                theGate.Height = double.Parse(inputValue);

                theGate = new Gate();
                Console.WriteLine("Width: ");
                inputValue = Console.ReadLine();
                theGate.Width = double.Parse(inputValue);

                theGate = new Gate();
                Console.WriteLine("Style: ");
                inputValue = Console.ReadLine();
                theGate.Style = inputValue;

                theGate = new Gate();
                Console.WriteLine("Price: ");
                inputValue = Console.ReadLine();
                if(inputValue == "\n")
                {
                    theGate.Price = null;
                }
                else
                {
                    theGate.Price = double.Parse(inputValue);
                }
                //the local instance of gate needs to be saved into the fence estimate 
                CustomerFence.Gates.Add(theGate);
                

                Console.WriteLine("Another gate (Y or N) ");
                inputValue = Console.ReadLine();
                menuItem = inputValue.ToUpper().Equals("Y") ? "1" : "0";        //Single line IF statement
            }
            while (menuItem != "0");

            Console.WriteLine("Fence length: ");
            inputValue = Console.ReadLine();
            double linearLength = double.Parse(inputValue);

            //using the CustomerFence data calculate the cost

            double NumberOfPanels = CustomerFence.Fence.EstimatedNumberOfPanels(linearLength);      //Good example
            double FencePrice = Math.Ceiling(NumberOfPanels) * double.Parse(CustomerFence.Fence.Price.ToString());

            double gatecost = 0.0;
            foreach(Gate item in CustomerFence.Gates)
            {
                gatecost += double.Parse(item.Price.ToString()); 
            }


            Console.WriteLine("Total Fence Estimate");
            Console.WriteLine("Number of Panels: " +NumberOfPanels.ToString());
            Console.WriteLine("Cost of Panels: " + FencePrice.ToString());
            Console.WriteLine("Number of gates: " + CustomerFence.Gates.Count.ToString());
            Console.WriteLine("cost of gates: " + gatecost.ToString());
            Console.WriteLine("Total: " + (FencePrice + gatecost).ToString());


            Console.ReadLine();
        }//eom

    }//eoc

}//eon
