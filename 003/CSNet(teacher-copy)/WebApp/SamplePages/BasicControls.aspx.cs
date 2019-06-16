using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.SamplePages
{
    public partial class BasicControls : System.Web.UI.Page
    {
        //If you need to have a variable "hanging" around
        //   between posting, then create a global static variable
        public static List<DDLClass> DataCollection = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            //this method is executed EACH and EVERY time you
            //   process this web page
            //this method executes BEFORE the event

            //this method is an excellent place to do
            //    initial form setup
            //this method is an excellent place to change
            //    any control that may need to be done
            //   for the same action under all events

            //example: clearing old messages

            //a control is referenced in the code-behind
            //    by using its ID="controlname"
            //control names are global to all events
            MessageLabel.Text = "";

            //Assume you wish to do page initialization of some
            //   type BUT ONLY ONCE when the page is first loaded
            if (!Page.IsPostBack)
            {
                DataCollection = new List<DDLClass>();
                //load collection using greedy constructor and
                //   add to the list
                DataCollection.Add(new DDLClass(1, "COMP1008"));
                DataCollection.Add(new DDLClass(2, "CPSC1517"));
                DataCollection.Add(new DDLClass(4, "DMIT2018"));
                DataCollection.Add(new DDLClass(3, "DMIT1508"));

                //LIst<T> can be sorted using .Sort(delagate)
                //syntax for delagate
                //  ascending sort
                // (x,y) => x.PropertyName.CompareTo(y.PropertyName)
                //  descending sort
                // (x,y) => y.PropertyName.CompareTo(x.PropertyName)
                DataCollection.Sort((x, y) => x.DisplayField.CompareTo(y.DisplayField));

                //attach the data to the dropdownlsit control
                //attach data
                CollectionList.DataSource = DataCollection;
                //assign the display text property to the ddl control
                CollectionList.DataTextField = "DisplayField";
                //assign the value data property to the ddl control
                CollectionList.DataValueField = nameof(DDLClass.ValueField);
                //bind the data to the control for display
                CollectionList.DataBind();

                //optionally add a prompt line
                CollectionList.Items.Insert(0, "select ....");
            }
        }

        protected void SubmitChoice_Click(object sender, EventArgs e)
        {
            //validate that a textbox value was entered
            if (string.IsNullOrEmpty(TextBoxNumberChoice.Text))
            {
                MessageLabel.Text = "Enter a course number (1-4)";
            }
            else
            {
                //grab the value from the textbox
                string numberchoice = TextBoxNumberChoice.Text;
                //use this value to set the radiobuttonlist
                //  access techniques to a "List" control
                //  .SelectedValue gets/sets to the value field value
                //  .SelectedIndex gets/sets to the control index value
                //  .SelectedItem.Text gets the control display value
                RadioButtonListChoice.SelectedValue = numberchoice;
                //use this value to set the checkbox
                if (numberchoice.Equals("2") || numberchoice.Equals("4"))
                {
                    CheckBoxChoice.Checked = true;
                }
                else
                {
                    CheckBoxChoice.Checked = false;
                }
                //use this value to position inside the DDL
                CollectionList.SelectedValue = numberchoice;
                //use the various data access techniques to
                //   obtain different values from the DDL
                //   and display as read only text
                DisplayReadOnly.Text = CollectionList.SelectedItem.Text
                        + " at index " + CollectionList.SelectedIndex
                        + " have a value of " + CollectionList.SelectedValue;
            }

        }

        protected void LinkButtonSubmit_Click(object sender, EventArgs e)
        {
            //enter your event code

            //test for the prompt line on the ddl
            //the prompt is in the first physical row of the ddl (index = 0)
            if (CollectionList.SelectedIndex == 0)
            {
                MessageLabel.Text = "Select a course.";
            }
            else
            {
                string numberchoice = CollectionList.SelectedValue;
                TextBoxNumberChoice.Text = numberchoice;
                RadioButtonListChoice.SelectedValue = numberchoice;
                //use this value to set the checkbox
                if (numberchoice.Equals("2") || numberchoice.Equals("4"))
                {
                    CheckBoxChoice.Checked = true;
                }
                else
                {
                    CheckBoxChoice.Checked = false;
                }
                DisplayReadOnly.Text = CollectionList.SelectedItem.Text
                       + " at index " + CollectionList.SelectedIndex
                       + " have a value of " + CollectionList.SelectedValue;
            }
        }


    }
}