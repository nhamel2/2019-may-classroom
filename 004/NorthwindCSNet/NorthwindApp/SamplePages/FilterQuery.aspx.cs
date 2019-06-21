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
    }
}