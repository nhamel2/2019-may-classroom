using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Addtional namespaces
using System.Data.Entity;
#endregion

namespace NorthwindSystem.DAL
{
    //restrict public access to this class to other classes in Proj (internal)
    //this class must inherit entity framework abilities (another class)
    //syntax:
    //currentclassname:inheritedclassname

    internal class NorthwindSystemContext:DBContext
    {
    }
}
