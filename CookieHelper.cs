using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace BTL
{
    public class CookieHelper
    {
        public void SaveCookie(List<Purchase> purchases, string name)
        {
            string jsonString = JsonConvert.SerializeObject(purchases);
            HttpCookie cookie = new HttpCookie(name, jsonString);
            cookie.Expires = DateTime.Now.AddDays(7); // Cookie sẽ hết hạn sau 7 ngày
            HttpContext.Current.Response.Cookies.Add(cookie);
        }


        public List<Purchase> GetCookie(string name)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies[name];
            if (cookie != null)
            {
                string jsonString = cookie.Value;
                List<Purchase> purchases = JsonConvert.DeserializeObject<List<Purchase>>(jsonString);
                return purchases;
            }
            return new List<Purchase>();
        }
    }
}