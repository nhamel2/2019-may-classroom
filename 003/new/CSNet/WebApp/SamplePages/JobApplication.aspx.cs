using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.SamplePages
{
    public partial class JobApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //clear old message values
            MessageLabel.Text = "";
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string msg = "";
            msg += "Name = " + FullName.Text;
            msg += " Email = " + EmailAddress.Text;
            msg += " Phone = " + PhoneNumber.Text;
            msg += " Time: = " + (FullOrPartTime.SelectedValue.Equals("1") ? "FullTime (1)" : "part Time (2)");
            //process the checkoxList
            msg += " Jobs = ";
            bool found = false;
            foreach(ListItem jobrow in Jobs.Items)
            {
                if(jobrow.Selected)
                {
                    msg += jobrow.Text + " ";
                    found = true;
                }
            }
            if(!found)
            {
                msg += "You did not select a job. Application rejected.";
            }
            MessageLabel.Text = msg;
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            //Empty all textboxes and remove radiobutton and checkbox selections
            //ObjectName.Property = "";

            FullName.Text = "";
            EmailAddress.Text = "";
            PhoneNumber.Text = "";

            Jobs.ClearSelection();
            //OR set it to a null value (-1)
            //FullOrPartTime.SelectedIndex = -1;


        }
    }
}