using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

#region Additional Namespaces
using NorthwindSystem.BLL;
using NorthwindSystem.Data;
#endregion

namespace NorthwindApp.SamplePages
{
    public partial class FilterQuery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MessageLabel.Text = "";
        }

        protected void Fetch_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(ProductSearchArg.Text))
                {
                    throw new Exception("Enter a product name to look up.");
                }
                else
                {
                    ProductController sysmgr = new ProductController();
                    List<Product> datainfo = sysmgr.Product_FindByName(ProductSearchArg.Text);
                    ProductList.DataSource = datainfo;
                    ProductList.DataBind();
                }
            }
            catch(Exception ex)
            {
                MessageLabel.Text = ex.Message;
            }
        }

        protected void ProductList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //access a value out of a web control under a particular column on a 
            //   selected GridView Row

            //get a pointer to the GridView Row
            GridViewRow agvrow = ProductList.Rows[ProductList.SelectedIndex];

            //this technique is used when you have a ItemTemple column with a web
            //    control
            //syntax
            // (rowpointer.FindControl("controlIDname") as controltype).controlaccessmethod
            // string xxxx = (agvrow.FindControl("ProductID") as Label).Text;
            string pid = (agvrow.FindControl("ProductID") as Label).Text;
            string pn = (agvrow.FindControl("ProductName") as Label).Text;
            MessageLabel.Text = string.Format("{0} ( {1})", pn, pid);
            //Response.Redirect("someotherpage.aspx?pid=" + pid);
        }

        protected void ProductList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //change the PageIndex of your GridView
            //the new PageIndex is located in the e parameter of this method
            ProductList.PageIndex = e.NewPageIndex;

            Fetch_Click(sender, new EventArgs());
        }
    }
}