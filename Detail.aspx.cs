using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace BTL
{
    public partial class Detail : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                List<Product> list_pro = (List<Product>)Application["product"];
                List<Product> list_acc = (List<Product>)Application["accessory"];
                int id = Int32.Parse(Request.QueryString["id"]);


                foreach (Product p in list_pro)
                {
                    if(id == p.Id)
                    {
                        title.Text = p.Name;
                        p_id.InnerText = p.Id + "";
                        img_sanpham.Src = p.Link;
                        if(p.Trangthai == "0")
                        {
                            tinhtrang.InnerHtml = "Hết hàng";
                        }
                        gia_sanpham.InnerText = p.Price;
                        ten_sanpham.InnerText = p.Name;
                        description.InnerText = p.Description;
                    }
                }
                foreach (Product p in list_acc)
                {
                    if (id == p.Id)
                    {
                        title.Text = p.Name;
                        p_id.InnerText = p.Id + "";
                        img_sanpham.Src = p.Link;
                        if (p.Trangthai == "0")
                        {
                            tinhtrang.InnerHtml = "Hết hàng";
                        }
                        gia_sanpham.InnerText = p.Price;
                        ten_sanpham.InnerText = p.Name;
                        description.InnerText = p.Description;
                    }
                }

                List<Account> accounts = (List<Account>)Application["account"];
                foreach (Account a in accounts)
                {
                    if (a.Username == (Session["username"] + ""))
                    {
                        address.Text = a.Address;
                    }
                }
            }
        }
        protected void btnclick_add(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Application["cart"] == null)
            {
                Application["cart"] = new List<Carts>();
            }

            List<Carts> list_carts = (List<Carts>)Application["cart"];
            List<Product> list_pro = (List<Product>)Application["product"];
            List<Product> list_acc = (List<Product>)Application["accessory"];
            List<Account> list_account = (List<Account>)Application["account"];
            List<Product> list = new List<Product>();

            list.AddRange(list_pro);
            list.AddRange(list_acc);

            Purchase new_purchase = new Purchase();
            new_purchase.Id = Int32.Parse(p_id.InnerText);
            new_purchase.Quantity = Int32.Parse(hfQuantities.Value);
            new_purchase.Size = hfSize.Value;
            int flag = 0;

            foreach(Carts cart in list_carts)
            {
                if(cart.Username == (Session["username"] + ""))
                {
                    flag = 1;
                    cart.List.Add(new_purchase);
                    break;
                }
            }

            if(flag == 0)
            {
                Carts new_cart = new Carts();
                new_cart.Username = (Session["username"] + "");
                new_cart.List.Add(new_purchase);
                list_carts.Add(new_cart);
            }
            

            successMessage.InnerHtml = "Đã thêm vào giỏ hàng!";
            Application["cart"] = list_carts;

        }
        protected void btnclick_buy(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnclick_confirm(object sender, EventArgs e)
        {
            List<Account> accounts = (List<Account>)Application["account"];
            List<Carts> list_carts = (List<Carts>)Application["cart"];

            string add = Request.Form.Get("address");
            foreach (Account a in accounts)
            {
                if (a.Username == (Session["username"] + ""))
                {
                    a.Address = add;
                    address.Text = add;
                }
            }
            successMessage.InnerHtml = "Bạn đã đặt hàng thành công!";
            Response.AddHeader("REFRESH", "2;URL=AllProducts.aspx");
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