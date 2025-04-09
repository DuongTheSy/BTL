using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace BTL
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Purchase> cookie_cart = new List<Purchase>();
            List<Account> accounts = (List<Account>)Application["account"];
            List<Carts> list_carts = (List<Carts>)Application["cart"];
            List<Product> list_pro = (List<Product>)Application["product"];
            List<Product> list_acc = (List<Product>)Application["accessory"];
            List<Product> list = new List<Product>();
            list.AddRange(list_pro);
            list.AddRange(list_acc);

            // Đồng nhất lại
            foreach (Carts cart in list_carts)
            {
                for(int j = 0; j < cart.List.Count - 1; j++)
                {
                    for(int k = j + 1; k < cart.List.Count; k++)
                    {
                        if (cart.List[j].Id == cart.List[k].Id && cart.List[j].Size == cart.List[k].Size)
                        {
                            cart.List[j].Quantity += cart.List[k].Quantity;
                            cart.List.RemoveAt(k);
                        }
                    }
                }
            } 

            if (Session["username"] != null)
            {
                user.InnerHtml = Session["username"] + "";
                user.Style["display"] = "block";
                dangxuat.Style["display"] = "block";
                int flag = 0;

                foreach (Carts cart in list_carts)
                {
                    if (cart.Username == Session["username"] + "")
                    {
                        flag = 1;
                        cookie_cart = cart.List;
                        break;
                    }
                }
                if (flag == 0)
                {
                    cookie_cart = new List<Purchase>();

                }
            }
            else
            {
                user.Style["display"] = "none";
                dangxuat.Style["display"] = "none";
                Response.Redirect("Login.aspx");
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

            string chuoi = "";


            int i = 0;

            foreach(Purchase purchase in cookie_cart)
            {
                foreach(Product p in list)
                {
                    if(p.Id == purchase.Id)
                    {
                        if(p.Trangthai == "1")
                        {
                        chuoi += "<div id = \"sp" + purchase.Id + "\" class=\"product border-outside dis-flex\">\r\n" +
                                            "<div class=\"layer-name\">\r\n" +
                                                 "<div class=\"i-layer\">\r\n" +
                                                        "<img src=\"" + p.Link + "\" class=\"c-img\"/>\r\n" +
                                                        "<div class=\"resize\">" + p.Name + "<br><i style=\"color: gray;\">Size: "+ purchase.Size +"</i></div>\r\n" +
                                                   "</div>\r\n" +
                                                "</div>\r\n " +
                                                "<div class=\"layer-price resize\">" + p.Price + "</div>\r\n" +
                                                    "<div class=\"layer-quantities resize dis-flex\">\r\n " +
                                                        "<div class=\"quantity-width border-outside no-select\" onclick = \"giam('value" + (i) + "')\">-</div>\r\n " +
                                                        "<div class=\"quantity quantity-width\" id = \"value" + (i) + "\">" + purchase.Quantity + "</div>\r\n " +
                                                        "<div class=\"quantity-width border-outside no-select\" onclick=\"tang('value" + (i) + "')\">+</div>\r\n" +
                                                    "</div>\r\n " +
                                                    "<div class=\"layer-money resize\">100000</div>\r\n " +
                                                    "<div class=\"delete\" onclick=\"remove('sp" + purchase.Id + "')\">Remove</div>\r\n"
                                                    +

                                                "</div>";
                        }
                        i++;
                    }
                }
            }

            cart.InnerHtml = chuoi;

            // lấy địa chỉ điền vào TextBox
            foreach (Account a in accounts)
            {
                if (a.Username == (Session["username"] + ""))
                {
                    address.Text = a.Address;
                }
            }


        }
        protected void btnclick_confirm(object sender, EventArgs e)
        {
            List<Purchase> cookie_cart = new List<Purchase>();
            List<Account> accounts = (List<Account>)Application["account"];
            List<Carts> list_carts = (List<Carts>)Application["cart"];
            List<Bill> list_bill = (List<Bill>)Application["bill"];
            string add = Request.Form.Get("address");
            foreach (Account a in accounts)
            {
                if (a.Username == (Session["username"] + ""))
                {
                    a.Address = add;
                    address.Text = add;
                }
            }

            foreach (Carts cart in list_carts)
            {
                if (cart.Username == (Session["username"] + ""))
                {
                    Bill new_bill = new Bill();
                    new_bill.Id = list_bill.Count + 1;
                    new_bill.Username = cart.Username;
                    new_bill.TimeStamp = DateTime.Now;
                    new_bill.List = cart.List;
                    new_bill.Address = add;
                    list_bill.Add(new_bill);
                    Application["bill"] = list_bill;

                    cart.List = new List<Purchase>();
                    successMessage.InnerHtml = "Bạn đã đặt hàng thành công!";
                    Response.AddHeader("REFRESH", "2;URL=Cart.aspx");
                }
            }
        }


        protected void btnclick_admin(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }

        protected void btnclick_dangxuat(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        [WebMethod]
        public static string RemoveServerSide(string id)
        {

            List<Carts> list_carts = (List<Carts>)HttpContext.Current.Application["cart"]; ;

            foreach (Carts cart in list_carts)
            {
                if (cart.Username == (HttpContext.Current.Session["username"] + ""))
                {
                    for (int i = 0; i < cart.List.Count; i++)
                    {
                        if (cart.List[i].Id == Int32.Parse(id))
                        {
                            cart.List.RemoveAt(i);
                        }
                    }
                }
            }
            return "";
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