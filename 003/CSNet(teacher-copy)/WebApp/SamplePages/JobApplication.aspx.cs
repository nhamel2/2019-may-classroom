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
            //clear all old messages
            MessageLabel.Text = "";
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string msg = "";
            msg += "Name = " + FullName.Text;
            msg += " Email = " + EmailAddress.Text;
            msg += " Phone = " + PhoneNumber.Text;
            msg += " Time = " + (FullOrPartTime.SelectedValue.Equals("1") ? "Full Time (1)" : "Part Time (2)");
            //process the checkboxlist
            msg += " Jobs = ";
            bool found = false;
            foreach(ListItem jobrow in Jobs.Items)
            {
                if (jobrow.Selected)
                {
                    msg += jobrow.Text + " ";
                    found = true;
                }
            }
            if (!found)
            {
                msg = "You did not select a job. Application rejected.";
            }
            MessageLabel.Text = msg;
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            //empty all textboxs and remove RabioButton and CheckBox choices
            FullName.Text = "";
            EmailAddress.Text = "";
            PhoneNumber.Text = "";
            //one technique in emptying a List is to set the index
            //    to -1;
            FullOrPartTime.SelectedIndex = -1;
            //a second technique is to use a method of the object called
            //    ClearSelection()
            Jobs.ClearSelection();
        }
    }
}