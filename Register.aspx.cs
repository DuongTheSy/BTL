using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Account> accounts = (List<Account>)Application["account"];
            string username = Request.Form.Get("username");
            string password = Request.Form.Get("password");

            if (IsPostBack)
            {
                int flag = 0;

                foreach (var account in accounts)
                {
                    if (username == account.Username)
                    {
                        flag = 1; break;
                    }
                }

                if(flag == 1)
                {
                    advertise_tk.InnerHtml = "Tài khoản đã tồn tại";
                }
                else
                {
                    Account new_account = new Account();
                    new_account.Username = username;
                    new_account.Password = password;
                    new_account.Id = accounts.Count + 1;
                    accounts.Add(new_account);

                    Application["account"] = accounts;
                    Session["username"] = username;
                    successMessage.InnerHtml = "Đăng ký thành công! Đang chuyển hướng...";
                    Response.AddHeader("REFRESH", "2;URL=Home.aspx"); // Chuyển hướng sau 2 giây
                }
            }
        }
    }
}