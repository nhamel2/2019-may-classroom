
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
    public partial class SimpleQuery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MessageLabel.Text = "";

            if (!Page.IsPostBack)
            {
                BindProductList();
            }
        }

        protected void BindProductList()
        {
            try
            {
                //connect to the appropriate BLL class
                ProductController sysmgr = new ProductController();
                //call the appropriate BLL class method
                List<Product> datainfo = sysmgr.Product_List();
                //optionally sort the returned collection
                datainfo.Sort((x, y) => x.ProductName.CompareTo(y.ProductName));
                //setup the dropdownlist
                // a) assign datasource
                ProductList.DataSource = datainfo;
                // b) assign the display text property
                ProductList.DataTextField = nameof(Product.ProductName);
                // c) assign the value text property
                ProductList.DataValueField = nameof(Product.ProductID);
                // d) bind the data to the control
                ProductList.DataBind();
                //optionally you can place a prompt at the start
                //  of your ddl data collection
                ProductList.Items.Insert(0, "select ...");
            }
            catch(Exception ex)
            {
                MessageLabel.Text = ex.Message;
            }
        }
        protected void Fetch_Click(object sender, EventArgs e)
        {
            if (ProductList.SelectedIndex == 0)
            {
                MessageLabel.Text = "Select a product to fetch";
            }
            else
            {
                try
                {
                    //connect to the appropriate BLL
                    ProductController sysmgr = new ProductController();
                    //call the appropriate BLL method
                    Product datainfo = sysmgr.Product_FindByID(int.Parse(ProductList.SelectedValue));
                    //check for results
                    if (datainfo == null)
                    {
                        //no data : issue message
                        MessageLabel.Text = "Product not on file";
                        BindProductList();
                    }
                    else
                    {
                        //data: move values to output fields
                        ProductID.Text = datainfo.ProductID.ToString();
                        Productname.Text = datainfo.ProductName;
                        QuantityPerUnit.Text = datainfo.QuantityPerUnit == null ? "" : datainfo.QuantityPerUnit;
                        UnitPrice.Text = datainfo.UnitPrice == null ? "" : datainfo.UnitPrice.ToString();
                        UnitsInStock.Text = datainfo.UnitsInStock == null ? "" : datainfo.UnitsInStock.ToString();
                        UnitsOnOrder.Text = datainfo.UnitsOnOrder == null ? "" : datainfo.UnitsOnOrder.ToString();
                        ReorderLevel.Text = datainfo.ReorderLevel == null ? "" : datainfo.ReorderLevel.ToString();
                        Discontinued.Checked = datainfo.Discontinued;
                    }
                    
                    
                }
                catch(Exception ex)
                {
                    MessageLabel.Text = ex.Message;
                }
            }
        }
    }
}