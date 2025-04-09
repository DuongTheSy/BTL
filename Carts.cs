using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL
{
    public class Carts
    {
        string username;
        List<Purchase> list = new List<Purchase>();

        public List<Purchase> List
        {
            get { return list; }
            set { list = value; }
        }

        public string Username
        {
            get { return username; }
            set { username = value; }
        }
    }
}