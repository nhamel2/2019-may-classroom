using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp_ASP_.SamplePages
{
    public partial class helloworld : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MessageArea.Text = "Hello World!!!";
        }

        protected void Submit_Click(object sender, EventArgs e)
        {

        }
    }
}