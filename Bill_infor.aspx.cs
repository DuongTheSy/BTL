using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Bill_infor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Bill> list_bill = (List<Bill>)Application["bill"];
            List<Product> list_pro = (List<Product>)Application["product"];
            List<Product> list_acc = (List<Product>)Application["accessory"];
            List<Product> list = new List<Product>();
            list.AddRange(list_pro);
            list.AddRange(list_acc);

            int id = Int32.Parse(Request.QueryString["id"]);

            string chuoi = "";
            int total = 0;

            foreach (Bill b in list_bill)
            {
                if (b.Id == id)
                {
                    code.InnerText = b.Id + "";
                    name.InnerHtml = b.Username;
                    date.InnerHtml = b.TimeStamp + "";
                    address.InnerHtml = b.Address;

                    foreach(Purchase p in b.List)
                    {
                        foreach(Product product in list)
                        {
                            if(p.Id == product.Id)
                            {
                                total += product.convertToInt() * p.Quantity;
                                chuoi += "<tr>\r\n" +
                                            "<td>" + product.Name +"</td>\r\n  " +
                                            "<td>" + p.Quantity +"</td>\r\n" +
                                            "<td>" + product.Price + "</td>\r\n " +
                                            "<td>" + product.convertToVND(product.convertToInt() * p.Quantity) + "</td>\r\n " +
                                        "</tr>";
                            }
                            sum.InnerHtml = product.convertToVND(total);
                        }
                    }
                    content.InnerHtml = chuoi;
                }
            }
            
        }
    }
}