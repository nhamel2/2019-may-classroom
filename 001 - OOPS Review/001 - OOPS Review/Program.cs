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
            Console.ReadLine();
            Console.WriteLine("test");


            //create an instance of a none static class
            //if you  create a declaritive using JUST the class name then this is ONLY a "pointer"
                //a "pointer" can only hold a instance of the class specified.
            //Therefore the value of aVariable is NULL
            FencePanel aVariable;

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



            Console.ReadLine();
        }//eom

    }//eoc

}//eon
