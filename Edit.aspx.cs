using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                List<Product> list_pro = (List<Product>)Application["product"];
                List<Product> list_acc = (List<Product>)Application["accessory"];

                List<Product> list = new List<Product>();


                list.AddRange(list_pro);
                list.AddRange(list_acc);

                string id = Request.Form.Get("ProductId");
                string trangthai = Request.Form.Get("Trangthai");

                foreach(Product product in list)
                {
                    if(product.Id == Int32.Parse(id))
                    {
                        if(trangthai == "conhang")
                        {
                            product.Trangthai = "1";
                        }
                       if(trangthai == "hethang")
                        {
                            product.Trangthai = "0";
                        }
                    }
                }
                
            }

        }
    }
}