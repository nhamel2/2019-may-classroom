using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NorthwindApp.SamplePages
{
    public partial class ODSQuery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(PartialNameArg.Text))
            {
                MessageLabel.Text = "Enter a Particular product name to query";
            }
        }

        protected void fetch_Click(object sender, EventArgs e)
        {

        }
    }
}