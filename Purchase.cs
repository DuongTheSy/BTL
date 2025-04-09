using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL
{
    public class Purchase
    {
        int id; // id_sản phẩm
        int quantity;
        string size;

        public string Size
        {
            get { return size; }
            set { size = value; }
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public int Quantity
        {
            get { return quantity; }
            set { quantity = value; }
        }
    }
}