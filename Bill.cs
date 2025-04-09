using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL
{
    public class Bill
    {
        int id;
        DateTime timeStamp;
        string address;
        string username;
        List<Purchase> list = new List<Purchase>();


        public string Address
        {
            get { return address; }
            set { address = value; }
        }

        public int Id
        {
            get { return id; } set { id = value; }
        }

        public DateTime TimeStamp
        {
            get { return timeStamp; } set { timeStamp = value; }
        }

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