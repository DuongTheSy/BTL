using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] + "" != "admin")
            {
                Response.Redirect("khongcoquyen.html");
            }

            List<Product> list_clothes = (List<Product>)Application["product"];
            List<Product> list_accessory = (List<Product>)Application["accessory"];
            if (IsPostBack)
            {
                Product new_pro = new Product();
   
                new_pro.Name = Request.Form.Get("productName");
                string type = Request.Form.Get("productCategory");
                new_pro.Price = Request.Form.Get("productPrice");
                new_pro.Description = Request.Form.Get("productDescription");

                string fileName = Path.GetFileName(productImage.PostedFile.FileName);

                if (type == "clothes")
                {
                    new_pro.Id = list_clothes.Count + 1;
                    new_pro.Link = "../Image/clothes/" + fileName;
                    string path = Server.MapPath("~/Image/clothes/" + fileName);
                    productImage.PostedFile.SaveAs(path);
                    list_clothes.Add(new_pro);
                }
                else
                {
                    new_pro.Id = list_clothes.Count + 1;
                    new_pro.Link = "../Image/accessory/" + fileName;
                    string path = Server.MapPath("~/Image/accessory/" + fileName);
                    productImage.PostedFile.SaveAs(path);
                    list_accessory.Add(new_pro);
                }

                advertise.InnerHtml = "Thêm sản phẩm thành công";
                advertise.Style["color"] = "green";

            }
        }
    }
}