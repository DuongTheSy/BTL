using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Clothes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["pre_page"] = Request.Url;
            if (Session["username"] != null)
            {
                user.InnerHtml = Session["username"] + "";
                user.Style["display"] = "block";
                dangxuat.Style["display"] = "block";
            }
            else
            {
                user.Style["display"] = "none";
                dangxuat.Style["display"] = "none";
            }

            if (Session["username"] + "" == "admin")
            {
                admin.Style["display"] = "block";
                bill.Style["display"] = "block";
                add_pro.Style["display"] = "block";
            }
            else
            {
                admin.Style["display"] = "none";
                bill.Style["display"] = "none";
                add_pro.Style["display"] = "none";
            }

            List<Product> list = (List<Product>)Application["product"];

            string chuoi = "";

            foreach (Product product in list)
            {
                chuoi += "<a href=\"Detail.aspx?id=" + product.Id + "\" class=\"product\">\r\n" +
                    "<div class=\"product-top\">\r\n\r\n" +
                        "<img src=\"" + product.Link + "\" alt=\"\" class=\"product-image\">\r\n" +
                    "</div>\r\n\r\n        " +
                    "<div class=\"product-info\">\r\n" +
                        "<div class=\"product-left\">\r\n" +
                            "<h3 class=\"product-name\">\r\n" +
                                "" + product.Name + "\r\n" +
                            "</h3>\r\n" +
                            "<h4 class=\"product-price\">\r\n" +
                                "" + product.Price + "\r\n" +
                            "</h4>\r\n" +
                        "</div>\r\n" +
                        "<div class=\"product-right\">\r\n" +
                            "<img src=\"../Image/icon/shopping-cart.png\" alt=\"\" class=\"add-to-cart\">\r\n" +
                        "</div>\r\n" +
                     "</div>\r\n" +
                 "</a>";
            }

            clothes.InnerHtml = chuoi;
        }
        protected void btnclick_dangxuat(object sender, EventArgs e)
        {
            Session["username"] = null;
            //Session.Clear();
            //Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void btnclick_admin(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }
        protected void btnclick_bill(object sender, EventArgs e)
        {
            Response.Redirect("Bills.aspx");
        }
        protected void btnclick_addpro(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }
    }
}