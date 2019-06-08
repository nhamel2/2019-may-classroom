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
        //global static variable
        public static List<DDLClass> DataCollection = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            //excecutes before event
            MessageLabel.Text = "";
            if(!Page.IsPostBack)
            {
                DataCollection = new List<DDLClass>();
                DataCollection.Add(new DDLClass(1, "COMP1008"));
                DataCollection.Add(new DDLClass(2, "CPSC1517"));
                DataCollection.Add(new DDLClass(4, "DMIT2018"));
                DataCollection.Add(new DDLClass(3, "DMIT1508"));
                //.Sort(delagate)
                //delegate syntax
                //  (x,y) => x.propertyName.CompareTo(y.Propertyname)
                DataCollection.Sort((x, y) => x.DisplayField.CompareTo(y.DisplayField));

                //Attatch 
                CollectionList.DataSource = DataCollection;
                //Assign 
                CollectionList.DataValueField = nameof(DDLClass.ValueField);
                //Bind
                CollectionList.DataBind();


                //optional prompt
                CollectionList.Items.Insert(0,"select...");

            }
        }

        protected void SubmitChoice_Click(object sender, EventArgs e)
        {
            //Event Code

            //validate
            if(string.IsNullOrEmpty(TextBoxNumberChoice.Text))
            {
                MessageLabel.Text = "Enter a course number (1-4)";
            }
            else
            {
                //grab value
                string numberchoice = TextBoxNumberChoice.Text;

                //use value for radiobuttonlist
                RadioButtonListChoice.SelectedValue = numberchoice;

                //use value to set checkbox
                if(numberchoice.Equals("2") || numberchoice.Equals("4"))
                {
                    CheckBoxChoice.Checked = true;
                }
                else
                {
                    CheckBoxChoice.Checked = false;
                }
                
                //use this value to position inside the DDL
                CollectionList.SelectedValue = numberchoice;

                //obtain values from ddl and display as readonly text
                DisplayReadOnly.Text = CollectionList.SelectedItem.Text + " at index" + CollectionList.SelectedIndex + " have a value of " + CollectionList.SelectedValue;

            }


        }

        protected void LinkButtonSubmit_Click(object sender, EventArgs e)
        {
            //Event Code

        }
    }
}