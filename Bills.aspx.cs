using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Bills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] + "" != "admin")
            {
                Response.Redirect("khongcoquyen.html");
            }

            List<Bill> bills = (List<Bill>)Application["bill"];

            string chuoi = "";

            foreach (Bill bill in bills)
            {
                chuoi += "<tr>\r\n" +
                    "<td>" + bill.Id + "</td>\r\n" +
                    "<td>" + bill.TimeStamp +"</td>\r\n" +
                    "<td><a href = \"Bill_infor.aspx?id="+ bill.Id +"\" class=\"detail-button\">Chi tiết</a></td>\r\n " +
                    " </tr>";
            }

            content.InnerHtml = chuoi;
        }
    }
}