using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using static System.Net.Mime.MediaTypeNames;

namespace BTL
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Carts> list_carts = (List<Carts>)Application["cart"];
            List<Product> list_pro = (List<Product>)Application["product"];
            List<Product> list_acc = (List<Product>)Application["accessory"];
            List<Product> list = new List<Product>();

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
                bill.Style["display"] = "none";
                admin.Style["display"] = "none";
                add_pro.Style["display"] = "none";
            }

            string chuoi = "";

            int j = 0;
            for(int i = 1; i < 11; i++)
            {
                if (i % 2 != 0)
                {
                    list = list_pro;
                    j = (int)(list_pro.Count - 0.5 * (i + 1 ));
                }
                else
                {
                    list = list_acc;
                    j = (int)(list_acc.Count - 0.5 * i) ;
                }

                chuoi += "<a href=\"Detail.aspx?id="+ list[j].Id + "\" class=\"product\">\r\n" +
                    "<div class=\"product-top\">\r\n\r\n" +
                        "<img src=\""+ list[j].Link +"\" alt=\"\" class=\"product-image\">\r\n" +
                    "</div>\r\n\r\n        " +
                    "<div class=\"product-info\">\r\n" +
                        "<div class=\"product-left\">\r\n" +
                            "<h3 class=\"product-name\">\r\n" +
                                ""+ list[j].Name +"\r\n" +
                            "</h3>\r\n" +
                            "<h4 class=\"product-price\">\r\n" +
                                ""+ list[j].Price +"\r\n" +
                            "</h4>\r\n" +
                        "</div>\r\n" +
                        "<div class=\"product-right\">\r\n" +
                            "<img src=\"../Image/icon/shopping-cart.png\" alt=\"\" class=\"add-to-cart\">\r\n" +
                        "</div>\r\n" +
                     "</div>\r\n" +
                 "</a>";
            }

    

            new_product.InnerHtml = chuoi;
        }

        protected void btnclick_dangxuat(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
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