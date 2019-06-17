using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test3_Review.ReviewPages
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        //since we are not using a database to hold the data
        //    we will use a page level static variable to
        //    hold the data
        //the data will be described in the class Entry
        //the collection will be a List<T> where T is Entry
        private static List<Entry> userEntry = new List<Entry>();
        protected void Page_Load(object sender, EventArgs e)
        {
            Message.Text = "";
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            //the client side validation (Browser) done by the
            //  validation controls  can be re-executed on the
            //  server (web server)
            if (Page.IsValid)
            {
                //if you have logically validation or business
                //    rules to check, they can now be done
                //Business Rule: Terms must be checked
                if (Terms.Checked)
                {
                    // accept entry
                    //create an instance of the Entry
                    Entry acceptedEntry = new Entry();

                    //loaded the instance
                    acceptedEntry.FirstName = FirstName.Text;
                    acceptedEntry.LastName = LastName.Text;
                    acceptedEntry.UserName = LastName.Text;
                    acceptedEntry.EmailAddress = EmailAddress.Text;
                    acceptedEntry.Password = LastName.Text;

                    //add the instance to the data collection
                    userEntry.Add(acceptedEntry);



                    Message.Text = "Thank you for registering";
                    ////display the List<Entry> in the GridView
                    //EntriesList.DataSource = userEntry;
                    //EntriesList.DataBind();
                }
                else
                {
                    //reject entry
                    Message.Text = "You did not agree to the contest terms. Please try again.";
                }
            }
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            FirstName.Text = "";
            LastName.Text = "";
            UserName.Text = "";
            EmailAddress.Text = "";
            Password.Text = "";

            Terms.Checked = false;
        }
    }
}