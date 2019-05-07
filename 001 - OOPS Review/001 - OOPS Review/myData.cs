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

    class myData
    {
        public int Height;
        public int Width;
    }
}
