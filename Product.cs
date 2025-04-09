using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL
{
    public class Product
    {
        int id;
        string name;
        string link;
        string price;
        string description;

        string trangthai = "1";

        public string Trangthai
        {
            get { return trangthai; } set { trangthai = value; }
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public string Link
        {
            get { return link; }
            set { link = value; }
        }

        public string Price
        {
            get { return price; }
            set 
            {
                string reverse = "";
                string result = "";

                int length = value.Length;
                int j = 0;
                for (int i = length - 1; i >= 0; i--)
                {
                if (j == 3)
                {
                    reverse += ".";
                    j = 0;
                }
                    reverse += value[i];
                    j++;
                }

                for (int i = reverse.Length - 1; i >= 0; i--)
                {
                    result += reverse[i];
                }

                price = result + " ₫"; 
            }
        }

        public string Description
        {
            get { return description; }
            set { description = value; }
        }

        public int convertToInt()
        {
            string result = "";

            for(int i = 0; i < price.Length; i++)
            {
                if(price[i] + "" != " " && price[i] + "" != "₫" && price[i] + "" != ".")
                {
                    result += price[i];
                }
            }
            return Int32.Parse(result);
        }

        public string convertToVND(int sum)
        {
            string value = sum + "";
            string reverse = "";
            string result = "";

            int length = value.Length;
            int j = 0;
            for (int i = length - 1; i >= 0; i--)
            {
                if (j == 3)
                {
                    reverse += ".";
                    j = 0;
                }
                reverse += value[i];
                j++;
            }

            for (int i = reverse.Length - 1; i >= 0; i--)
            {
                result += reverse[i];
            }

            return result + " ₫";
        }
    }
}