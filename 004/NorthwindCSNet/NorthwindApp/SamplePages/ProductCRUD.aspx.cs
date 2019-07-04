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
            if (ProductList.SelectedIndex == 0)
            {
                //missing msg
                errormsgs.Add("Select a product to view");
                LoadMessageDisplay(errormsgs, "alert alert-info");
            }
            else
            {
                //there (try/catch)
                try
                {
                    //  connect to BLL
                    ProductController sysmgr = new ProductController();
                    //  call BLL method with arg
                    Product item = sysmgr.Product_FindByID(int.Parse(ProductList.SelectedValue));
                    //  check return
                    if (item == null)
                    {
                        //    missing/msg
                        errormsgs.Add("Product not on file");
                        LoadMessageDisplay(errormsgs, "alert alert-info");
                        //    refresh your page
                        BindProductList();
                        //optional
                        //clear your product detail controls
                        Clear_Click(sender, new EventArgs());
                    }
                    else
                    {
                        //    there/ load returns to controls
                        ProductID.Text = item.ProductID.ToString();
                        ProductName.Text = item.ProductName;
                        if (item.SupplierID == null)
                        {
                            SupplierList.SelectedIndex = 0;
                        }
                        else
                        {
                            SupplierList.SelectedValue = item.SupplierID.ToString();
                        }
                        if (item.CategoryID == null)
                        {
                            CategoryList.SelectedIndex = 0;
                        }
                        else
                        {
                            CategoryList.SelectedValue = item.CategoryID.ToString();
                        }
                        QuantityPerUnit.Text = string.IsNullOrEmpty(item.QuantityPerUnit) ? "" : item.QuantityPerUnit;
                        UnitPrice.Text = string.IsNullOrEmpty(item.UnitPrice.ToString()) ? "" : string.Format("{0:0.00}", item.UnitPrice);
                        UnitsInStock.Text = string.IsNullOrEmpty(item.UnitsInStock.ToString()) ? "" : item.UnitsInStock.ToString();
                        UnitsOnOrder.Text = string.IsNullOrEmpty(item.UnitsOnOrder.ToString()) ? "" : item.UnitsOnOrder.ToString();
                        ReorderLevel.Text = string.IsNullOrEmpty(item.ReorderLevel.ToString()) ? "" : item.ReorderLevel.ToString();
                        Discontinued.Checked = item.Discontinued;
                    }
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
            //run server-side validation
            if (Page.IsValid)
            {
                //do any server-side code-behind validation
                if (SupplierList.SelectedIndex == 0)
                {
                    errormsgs.Add("Supplier is required.");
                }
                if (CategoryList.SelectedIndex == 0)
                {
                    errormsgs.Add("Category is required.");
                }
                if (errormsgs.Count > 0)
                {
                    LoadMessageDisplay(errormsgs, "alert alert-warning");
                }
                else
                {
                    //good data (try/catch)
                    try
                    {
                        //   collect data from controls
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
                        if (string.IsNullOrEmpty(ReorderLevel.Text))
                        {
                            item.ReorderLevel = null;
                        }
                        else
                        {
                            item.ReorderLevel = Int16.Parse(ReorderLevel.Text);
                        }
                        item.Discontinued = false;
                        //   connect to BLL
                        ProductController sysmgr = new ProductController();
                        //   pass data to BLL
                        int newproductid = sysmgr.Product_Add(item);
                        //   success message
                        errormsgs.Add("Product has been added to file.");
                        LoadMessageDisplay(errormsgs, "alert alert-success");
                        //   refresh page
                        ProductID.Text = newproductid.ToString();
                        BindProductList();
                        ProductList.SelectedValue = ProductID.Text;
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
            //run server-side validation
            if (Page.IsValid)
            {
                //do any server-side code-behind validation
                if (SupplierList.SelectedIndex == 0)
                {
                    errormsgs.Add("Supplier is required.");
                }
                if (CategoryList.SelectedIndex == 0)
                {
                    errormsgs.Add("Category is required.");
                }
                //do you have your pkey
                if (string.IsNullOrEmpty(ProductID.Text))
                {
                    errormsgs.Add("Product Id is required.");
                }
                if (errormsgs.Count > 0)
                {
                    LoadMessageDisplay(errormsgs, "alert alert-warning");
                }
                else
                {
                    //good data (try/catch)
                    try
                    {
                        //   collect data from controls
                        Product item = new Product();
                        //remember to collect the pkey
                        item.ProductID = int.Parse(ProductID.Text);
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
                        if (string.IsNullOrEmpty(ReorderLevel.Text))
                        {
                            item.ReorderLevel = null;
                        }
                        else
                        {
                            item.ReorderLevel = Int16.Parse(ReorderLevel.Text);
                        }
                        //collect the actual control value
                        item.Discontinued = Discontinued.Checked;
                        //   connect to BLL
                        ProductController sysmgr = new ProductController();
                        //   pass data to BLL
                        int rowsaffected = sysmgr.Product_Update(item);
                        //check for actual change
                        if (rowsaffected > 0)
                        {
                            //   success message
                            errormsgs.Add("Product has been updated.");
                            LoadMessageDisplay(errormsgs, "alert alert-success");
                            //   refresh page
                            BindProductList();
                            ProductList.SelectedValue = ProductID.Text;
                        }
                        else
                        {
                            // product not update probably because it is missing
                            errormsgs.Add("Product no longer on file.");
                            LoadMessageDisplay(errormsgs, "alert alert-danger");
                            //refresh page
                            BindProductList();
                            //what about the currently displayed data??
                            ProductID.Text = "";
                        }
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

        protected void RemoveProduct_Click(object sender, EventArgs e)
        {
            //do you have your pkey
            if (string.IsNullOrEmpty(ProductID.Text))
            {
                errormsgs.Add("Product Id is required.");
            }
            if (errormsgs.Count > 0)
            {
                LoadMessageDisplay(errormsgs, "alert alert-warning");
            }
            else
            {
                //good data (try/catch)
                try
                {
                    //   connect to BLL
                    ProductController sysmgr = new ProductController();
                    //   pass data to BLL
                    int rowsaffected = sysmgr.Product_Delete(int.Parse(ProductID.Text));
                    //check for actual change
                    if (rowsaffected > 0)
                    {
                        //   success message
                        errormsgs.Add("Product has been discontinued.");
                        LoadMessageDisplay(errormsgs, "alert alert-success");
                        //   refresh page
                        BindProductList();
                        ProductList.SelectedValue = ProductID.Text;
                        //if it is a logically delete, set the control that
                        //    indicates the delete
                        Discontinued.Checked = true;
                    }
                    else
                    {
                        // product not update probably because it is missing
                        errormsgs.Add("Product no longer on file.");
                        LoadMessageDisplay(errormsgs, "alert alert-danger");
                        //refresh page
                        BindProductList();
                        //what about the currently displayed data??
                        ProductID.Text = "";
                    }
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
}