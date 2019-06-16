using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.SamplePages
{
    public partial class ContestEntry : System.Web.UI.Page
    {
        //since we are not using a database to hold the data
        //    we will use a page level static variable to
        //    hold the data
        //the data will be described in the class Entry
        //the collection will be a List<T> where T is Entry
        private static List<Entry> contestentries = new List<Entry>();
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
                    Entry theEntry = new Entry();

                    //loaded the instance
                    theEntry.FirstName = FirstName.Text;
                    theEntry.LastName = LastName.Text;
                    theEntry.StreetAddress1 = StreetAddress1.Text;
                    theEntry.StreetAddress2 = string.IsNullOrEmpty(StreetAddress2.Text)? null : StreetAddress2.Text;
                    theEntry.City = City.Text;
                    theEntry.Province = Province.SelectedValue;
                    theEntry.PostalCode = PostalCode.Text;
                    theEntry.EmailAddress = EmailAddress.Text;

                    //add the instance to the data collection
                    contestentries.Add(theEntry);

                    //display the List<Entry> in the GridView
                    EntriesList.DataSource = contestentries;
                    EntriesList.DataBind();
                }
                else
                {
                    //reject entry
                    Message.Text = "You did not agree to the contest terms. Entry rejected.";
                }
            }
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            FirstName.Text = "";
            LastName.Text = "";
            StreetAddress1.Text = "";
            StreetAddress2.Text = "";
            City.Text = "";
            PostalCode.Text = "";
            EmailAddress.Text = "";
            CheckAnswer.Text = "";
            Province.SelectedIndex = 0;
            Terms.Checked = false;
        }
    }
}