using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

#region Additional Namespaces
using NorthwindSystem.BLL;
using NorthwindSystem.Data;
using System.Data.Entity.Validation;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Core;
#endregion

namespace WebApp.NorthwindPages
{
    public partial class ProductCRUD : System.Web.UI.Page
    {
        List<string> errormsgs = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            Message.DataSource = null;
            Message.DataBind();

            if (!Page.IsPostBack)
            {
                BindProductList();
                BindSupplierList();
            }
        }

        //use this method to discover the inner most error message.
        //this rotuing has been created by the user
        protected Exception GetInnerException(Exception ex)
        {
            //drill down to the inner most exception
            while (ex.InnerException != null)
            {
                ex = ex.InnerException;
            }
            return ex;
        }

        //use this method to load a DataList with a variable
        //number of message lines.
        //each line is a string
        //the strings (lines) are passed to this routine in
        //   a List<string>
        //second parameter is the bootstrap cssclass
        protected void LoadMessageDisplay(List<string> errormsglist, string cssclass)
        {
            Message.CssClass = cssclass;
            Message.DataSource = errormsglist;
            Message.DataBind();
        }

        protected void BindProductList()
        {
            try
            {
                ProductController sysmgr = new ProductController();
                List<Product> datainfo = sysmgr.Product_List();
                datainfo.Sort((x, y) => x.ProductName.CompareTo(y.ProductName));
                ProductList.DataSource = datainfo;
                ProductList.DataTextField = nameof(Product.ProductName);
                ProductList.DataValueField = nameof(Product.ProductID);
                ProductList.DataBind();
                ProductList.Items.Insert(0, "select ...");
            }
            catch (DbUpdateException ex)
            {
                UpdateException updateException = (UpdateException)ex.InnerException;
                if (updateException.InnerException != null)
                {
                    errormsgs.Add(updateException.InnerException.Message.ToString());
                }
                else
                {
                    errormsgs.Add(updateException.Message);
                }
                LoadMessageDisplay(errormsgs, "alert alert-danger");
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var entityValidationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in entityValidationErrors.ValidationErrors)
                    {
                        errormsgs.Add(validationError.ErrorMessage);
                    }
                }
                LoadMessageDisplay(errormsgs, "alert alert-danger");
            }
            catch (Exception ex)
            {
                errormsgs.Add(GetInnerException(ex).ToString());
                LoadMessageDisplay(errormsgs, "alert alert-danger");
            }

        }

        protected void BindSupplierList()
        {
            try
            {
                SupplierController sysmgr = new SupplierController();
                List<Supplier> datainfo = sysmgr.Supplier_List();
                datainfo.Sort((x, y) => x.CompanyName.CompareTo(y.CompanyName));
                SupplierList.DataSource = datainfo;
                SupplierList.DataTextField = nameof(Supplier.CompanyName);
                SupplierList.DataValueField = nameof(Supplier.SupplierID);
                SupplierList.DataBind();
                SupplierList.Items.Insert(0, "select ...");
            }
            catch (DbUpdateException ex)
            {
                UpdateException updateException = (UpdateException)ex.InnerException;
                if (updateException.InnerException != null)
                {
                    errormsgs.Add(updateException.InnerException.Message.ToString());
                }
                else
                {
                    errormsgs.Add(updateException.Message);
                }
                LoadMessageDisplay(errormsgs, "alert alert-danger");
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var entityValidationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in entityValidationErrors.ValidationErrors)
                    {
                        errormsgs.Add(validationError.ErrorMessage);
                    }
                }
                LoadMessageDisplay(errormsgs, "alert alert-danger");
            }
            catch (Exception ex)
            {
                errormsgs.Add(GetInnerException(ex).ToString());
                LoadMessageDisplay(errormsgs, "alert alert-danger");
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            //check for search arg
            if(ProductList.SelectedIndex == 0)
            {
                //missing message
            }
            else
            {
                //good arg
                try
                {
                    //connect BLL
                    ProductController sysmgr = new ProductController();

                    //call BLL method with arg
                    Product item = sysmgr
                    //check return
                    // missing message
                    // good return, load returns to control

                }
                catch (DbUpdateException ex)
                {
                    UpdateException updateException = (UpdateException)ex.InnerException;
                    if (updateException.InnerException != null)
                    {
                        errormsgs.Add(updateException.InnerException.Message.ToString());
                    }
                    else
                    {
                        errormsgs.Add(updateException.Message);
                    }
                    LoadMessageDisplay(errormsgs, "alert alert-danger");
                }
                catch (DbEntityValidationException ex)
                {
                    foreach (var entityValidationErrors in ex.EntityValidationErrors)
                    {
                        foreach (var validationError in entityValidationErrors.ValidationErrors)
                        {
                            errormsgs.Add(validationError.ErrorMessage);
                        }
                    }
                    LoadMessageDisplay(errormsgs, "alert alert-danger");
                }
                catch (Exception ex)
                {
                    errormsgs.Add(GetInnerException(ex).ToString());
                    LoadMessageDisplay(errormsgs, "alert alert-danger");
                }

            }
            


            
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            ProductID.Text = "";
            ProductName.Text = "";
            QuantityPerUnit.Text = "";
            UnitPrice.Text = "";
            UnitsInStock.Text = "";
            UnitsOnOrder.Text = "";
            ReorderLevel.Text = "";
            Discontinued.Checked = false;

            ProductList.ClearSelection();
            SupplierList.ClearSelection();
            CategoryList.ClearSelection();
        }

        protected void AddProduct_Click(object sender, EventArgs e)
        {
            //server side validation
            if(Page.IsValid)
            {
                //code behind validation
                if(SupplierList.SelectedIndex == 0)
                {
                    errormsgs.Add("Supplier is required.");
                }
                if (CategoryList.SelectedIndex == 0)
                {
                    errormsgs.Add("Category is required.");
                }
                if(errormsgs.Count > 0)
                {
                    LoadMessageDisplay(errormsgs, "alert alert-warning");
                }
                else
                {
                    //data is good
                    try
                    {
                        //collect data from controls
                        Product item = new Product();
                        item.ProductName = ProductName.Text;
                        item.QuantityPerUnit = string.IsNullOrEmpty(QuantityPerUnit.Text) ? null : QuantityPerUnit.Text;


                        if (SupplierList.SelectedIndex == 0)
                        {
                            item.SupplierID = null;
                        }
                        else
                        {
                            item.SupplierID = int.Parse(SupplierList.SelectedValue);
                        }


                        if (CategoryList.SelectedIndex == 0)
                        {
                            item.CategoryID = null;
                        }
                        else
                        {
                            item.CategoryID = int.Parse(CategoryList.SelectedValue);
                        }


                        if (string.IsNullOrEmpty(UnitPrice.Text))
                        {
                            item.UnitPrice = null;
                        }
                        else
                        {
                            item.UnitPrice = decimal.Parse(UnitPrice.Text);
                        }


                        if (string.IsNullOrEmpty(UnitsInStock.Text))
                        {
                            item.UnitsInStock = null;
                        }
                        else
                        {
                            item.UnitsInStock = Int16.Parse(UnitsInStock.Text);
                        }


                        if (string.IsNullOrEmpty(UnitsOnOrder.Text))
                        {
                            item.UnitsOnOrder = null;
                        }
                        else
                        {
                            item.UnitsOnOrder = Int16.Parse(UnitsOnOrder.Text);
                        }


                        item.Discontinued = false;


                        //connect to BLL
                        ProductController sysmgr = new ProductController();

                        //pass data to BLL
                        int newproductid = sysmgr.Product_Add(item);

                        //success message
                        errormsgs.Add("Product has been added.");
                        LoadMessageDisplay(errormsgs, "alert alert-success");

                        //refresh page
                        ProductID.Text = newproductid.ToString();
                        BindProductList();
                        ProductList.SelectedValue = ProductID.ToString();
                    }
                    catch (DbUpdateException ex)
                    {
                        UpdateException updateException = (UpdateException)ex.InnerException;
                        if (updateException.InnerException != null)
                        {
                            errormsgs.Add(updateException.InnerException.Message.ToString());
                        }
                        else
                        {
                            errormsgs.Add(updateException.Message);
                        }
                        LoadMessageDisplay(errormsgs, "alert alert-danger");
                    }
                    catch (DbEntityValidationException ex)
                    {
                        foreach (var entityValidationErrors in ex.EntityValidationErrors)
                        {
                            foreach (var validationError in entityValidationErrors.ValidationErrors)
                            {
                                errormsgs.Add(validationError.ErrorMessage);
                            }
                        }
                        LoadMessageDisplay(errormsgs, "alert alert-danger");
                    }
                    catch (Exception ex)
                    {
                        errormsgs.Add(GetInnerException(ex).ToString());
                        LoadMessageDisplay(errormsgs, "alert alert-danger");
                    }
                }
            
            }
        }

        protected void UpdateProduct_Click(object sender, EventArgs e)
        {

        }

        protected void RemoveProduct_Click(object sender, EventArgs e)
        {

        }
    }
}