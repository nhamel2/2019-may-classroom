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
        //Without a Database, use page level static variable to hold data
        //The data will be described in the class entry
        //The collection will be in a List<T> where T is Entry

        private static List<Entry> contestentries = new List<Entry>();        

        protected void Page_Load(object sender, EventArgs e)
        {
            Message.Text = "";
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            //the client side validation can be re-executed on the server side
            if(Page.IsValid)
            {
                //logical validation/business rules can be done HERE (after validation)
                
                //Business rule: Terms must be checked
                if(Terms.Checked)
                {
                    //accept entry

                    //create an instance of entry
                    Entry theEntry = new Entry();
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
                    Message.Text = "You did not agree to the entry terms. Entry Rejected";
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