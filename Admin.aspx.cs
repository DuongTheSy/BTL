using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Account> list_accounts = (List<Account>)Application["account"];

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
                Response.Redirect("khongcoquyen.html");
            }

            if (Session["username"] + "" == "admin")
            {
                string chuoi = "";

                foreach(Account acc in list_accounts)
                {
                    chuoi += "<tr id=\"user" + acc.Id + "\">\r\n" +
                                "<td class=\"table-cell\">" + acc.Username +"</td>\r\n" +
                                "<td class=\"table-cell change\"><input type=\"button\" class=\"btn\" onclick=\"changePassword("+ acc.Id +")\" value = \"Đổi Mật khẩu\"></td>\r\n" +
                             "</tr>";
                }

                content.InnerHtml= chuoi;
            }
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

        [WebMethod]

        public static string ChangePasswordServerSide(string id, string password)
        {
            List<Account> list_accounts = (List<Account>)HttpContext.Current.Application["account"];
            
            foreach(Account acc in list_accounts)
            {
                if(acc.Id == Int32.Parse(id))
                {
                    acc.Password = password;
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