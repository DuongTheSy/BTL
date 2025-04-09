using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace BTL
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["product"] = new List<Product>();{
                List<Product> list_product = new List<Product>();
                Product sp1 = new Product();
                sp1.Id = 1;
                sp1.Name = "Quần Short Unisex Basic";
                sp1.Link = "../Image/clothes/sp1.jpg";
                sp1.Price = "79000";
                sp1.Description = "Quần short unisex cơ bản, phù hợp cho cả nam và nữ. Thiết kế đơn giản, thoải mái cho các hoạt động hàng ngày.";
                sp1.Trangthai = "0";
                list_product.Add(sp1);

                Product sp2 = new Product();
                sp2.Id = 2;
                sp2.Name = "Quần Jogger Nam";
                sp2.Link = "../Image/clothes/sp2.jpg";
                sp2.Price = "695000";
                sp2.Description = "Quần jogger nam chất liệu cao cấp, thiết kế thể thao, phù hợp cho các hoạt động ngoài trời và tập luyện. Tạo cảm giác thoải mái và phong cách.";
                list_product.Add(sp2);

                Product sp3 = new Product();
                sp3.Id = 3;
                sp3.Name = "Quần Short";
                sp3.Link = "../Image/clothes/sp3.jpg";
                sp3.Price = "123000";
                sp3.Description = "Quần short thoải mái với thiết kế trẻ trung. Phù hợp cho các hoạt động thể thao và dạo phố trong những ngày hè nóng bức.";
                list_product.Add(sp3);

                Product sp4 = new Product();
                sp4.Id = 4;
                sp4.Name = "Quần short Thể Thao";
                sp4.Link = "../Image/clothes/sp4.jpg";
                sp4.Price = "234000";
                sp4.Description = "Quần short thể thao với chất liệu thoáng khí, hỗ trợ tốt cho các hoạt động thể chất. Thiết kế thời trang và tiện lợi.";
                list_product.Add(sp4);

                Product sp5 = new Product();
                sp5.Id = 5;
                sp5.Name = "Quần Kaki Nam Cạp Chun";
                sp5.Link = "../Image/clothes/sp5.jpg";
                sp5.Price = "345000";
                sp5.Description = "Quần kaki nam với cạp chun thoải mái, phù hợp cho cả công sở và dạo phố. Chất liệu kaki bền bỉ và dễ bảo quản.";
                list_product.Add(sp5);

                Product sp6 = new Product();
                sp6.Id = 6;
                sp6.Name = "Quần tây cao cấp";
                sp6.Link = "../Image/clothes/sp6.jpg";
                sp6.Price = "150000";
                sp6.Description = "Quần tây cao cấp, thiết kế sang trọng và thanh lịch. Chất liệu vải cao cấp mang đến sự thoải mái và phong cách cho người mặc.";
                list_product.Add(sp6);

                Product sp7 = new Product();
                sp7.Id = 7;
                sp7.Name = "Quần ống suông";
                sp7.Link = "../Image/clothes/sp7.jpg";
                sp7.Price = "300000";
                sp7.Description = "Quần ống suông với thiết kế hiện đại, mang đến vẻ ngoài thanh lịch và thoải mái. Phù hợp cho cả công việc và dạo phố.";
                list_product.Add(sp7);

                Product sp8 = new Product();
                sp8.Id = 8;
                sp8.Name = "Quần Jean Nam";
                sp8.Link = "../Image/clothes/sp8.jpg";
                sp8.Price = "50000";
                sp8.Description = "Quần jean nam với thiết kế cổ điển và chất liệu denim bền bỉ. Dễ phối hợp với nhiều trang phục khác nhau, tạo phong cách thời trang trẻ trung.";
                list_product.Add(sp8);

                Product sp9 = new Product();
                sp9.Id = 9;
                sp9.Name = "Áo Thun Nam";
                sp9.Link = "../Image/clothes/sp1.jpg";
                sp9.Price = "89000";
                sp9.Description = "Áo thun nam chất liệu cotton thoáng mát, phù hợp cho các hoạt động thường ngày và thể thao.";
                list_product.Add(sp9);

                Product sp10 = new Product();
                sp10.Id = 10;
                sp10.Name = "Áo Sơ Mi Nam";
                sp10.Link = "../Image/clothes/sp2.jpg";
                sp10.Price = "190000";
                sp10.Description = "Áo sơ mi nam với thiết kế trang nhã, chất liệu mềm mại. Phù hợp cho công sở và các dịp trang trọng.";
                list_product.Add(sp10);

                Product sp11 = new Product();
                sp11.Id = 11;
                sp11.Name = "Áo Khoác Jean Nam";
                sp11.Link = "../Image/clothes/sp3.jpg";
                sp11.Price = "450000";
                sp11.Description = "Áo khoác jean nam với phong cách năng động, phù hợp cho cả mùa đông và mùa hè. Chất liệu bền đẹp.";
                list_product.Add(sp11);

                Product sp12 = new Product();
                sp12.Id = 12;
                sp12.Name = "Áo Hoodie Unisex";
                sp12.Link = "../Image/clothes/sp4.jpg";
                sp12.Price = "320000";
                sp12.Description = "Áo hoodie unisex với thiết kế thời trang và thoải mái. Phù hợp cho cả nam và nữ trong các hoạt động hàng ngày.";
                list_product.Add(sp12);

                Product sp13 = new Product();
                sp13.Id = 13;
                sp13.Name = "Áo Len Nam";
                sp13.Link = "../Image/clothes/sp5.jpg";
                sp13.Price = "250000";
                sp13.Description = "Áo len nam chất liệu ấm áp, thiết kế đơn giản và tinh tế. Phù hợp cho mùa đông lạnh giá.";
                list_product.Add(sp13);

                Product sp14 = new Product();
                sp14.Id = 14;
                sp14.Name = "Áo Vest Nam";
                sp14.Link = "../Image/clothes/sp6.jpg";
                sp14.Price = "550000";
                sp14.Description = "Áo vest nam với thiết kế lịch lãm, chất liệu cao cấp. Tạo phong cách chuyên nghiệp cho người mặc.";
                list_product.Add(sp14);

                Product sp15 = new Product();
                sp15.Id = 15;
                sp15.Name = "Áo Khoác Dạ Nam";
                sp15.Link = "../Image/clothes/sp7.jpg";
                sp15.Price = "750000";
                sp15.Description = "Áo khoác dạ nam ấm áp, thiết kế sang trọng. Phù hợp cho mùa đông và các dịp trang trọng.";
                list_product.Add(sp15);

                Product sp16 = new Product();
                sp16.Id = 16;
                sp16.Name = "Áo Khoác Gió Nam";
                sp16.Link = "../Image/clothes/sp8.jpg";
                sp16.Price = "290000";
                sp16.Description = "Áo khoác gió nam với thiết kế thể thao và tiện lợi. Chất liệu chống gió, phù hợp cho các hoạt động ngoài trời.";
                list_product.Add(sp16);

                Product sp17 = new Product();
                sp17.Id = 17;
                sp17.Name = "Quần Short Nam";
                sp17.Link = "../Image/clothes/sp1.jpg"; // Giữ link từ sp1
                sp17.Price = "150000";
                sp17.Description = "Quần short nam thiết kế đơn giản, chất liệu thoáng mát. Phù hợp cho mùa hè và các hoạt động ngoài trời.";
                list_product.Add(sp17);

                Product sp18 = new Product();
                sp18.Id = 18;
                sp18.Name = "Quần Kaki Nam";
                sp18.Link = "../Image/clothes/sp2.jpg"; // Giữ link từ sp2
                sp18.Price = "290000";
                sp18.Description = "Quần kaki nam với thiết kế thanh lịch, chất liệu bền bỉ. Phù hợp cho cả công sở và dạo phố.";
                list_product.Add(sp18);

                Product sp19 = new Product();
                sp19.Id = 19;
                sp19.Name = "Quần Ống Suông Nam";
                sp19.Link = "../Image/clothes/sp3.jpg"; // Giữ link từ sp3
                sp19.Price = "350000";
                sp19.Description = "Quần ống suông nam với thiết kế thời trang và thoải mái. Tạo vẻ ngoài thanh lịch cho người mặc.";
                list_product.Add(sp19);

                Product sp20 = new Product();
                sp20.Id = 20;
                sp20.Name = "Quần Jean Nam";
                sp20.Link = "../Image/clothes/sp4.jpg"; // Giữ link từ sp4
                sp20.Price = "450000";
                sp20.Description = "Quần jean nam với thiết kế cổ điển, chất liệu denim bền bỉ. Phù hợp với nhiều phong cách thời trang khác nhau.";
                list_product.Add(sp20);

                Product sp21 = new Product();
                sp21.Id = 21;
                sp21.Name = "Áo Khoác Gió Nam";
                sp21.Link = "../Image/clothes/sp5.jpg"; // Giữ link từ sp5
                sp21.Price = "320000";
                sp21.Description = "Áo khoác gió nam với chất liệu chống nước và gió, phù hợp cho các hoạt động ngoài trời và thời tiết thất thường.";
                list_product.Add(sp21);

                Product sp22 = new Product();
                sp22.Id = 22;
                sp22.Name = "Áo Sơ Mi Nam";
                sp22.Link = "../Image/clothes/sp6.jpg"; // Giữ link từ sp6
                sp22.Price = "250000";
                sp22.Description = "Áo sơ mi nam với thiết kế hiện đại, chất liệu thoáng mát. Phù hợp cho cả công sở và dạo phố.";
                list_product.Add(sp22);

                Product sp23 = new Product();
                sp23.Id = 23;
                sp23.Name = "Áo Thun Dài Tay Nam";
                sp23.Link = "../Image/clothes/sp7.jpg"; // Giữ link từ sp7
                sp23.Price = "180000";
                sp23.Description = "Áo thun dài tay nam với thiết kế đơn giản và thoải mái. Phù hợp cho mùa thu và đông.";
                list_product.Add(sp23);

                Product sp24 = new Product();
                sp24.Id = 24;
                sp24.Name = "Áo Vest Nam";
                sp24.Link = "../Image/clothes/sp8.jpg"; // Giữ link từ sp8
                sp24.Price = "550000";
                sp24.Description = "Áo vest nam cơ bản với thiết kế trang nhã, chất liệu cao cấp. Phù hợp cho các dịp trang trọng và công sở.";
                list_product.Add(sp24);

                Product sp25 = new Product();
                sp25.Id = 25;
                sp25.Name = "Áo Khoác Da Nam";
                sp25.Link = "../Image/clothes/sp1.jpg"; // Giữ link từ sp1
                sp25.Price = "600000";
                sp25.Description = "Áo khoác da nam với thiết kế thời trang, chất liệu da bền bỉ. Tạo phong cách mạnh mẽ và cá tính cho người mặc.";
                list_product.Add(sp25);

                Product sp26 = new Product();
                sp26.Id = 26;
                sp26.Name = "Áo Thun Ngắn Tay Nam";
                sp26.Link = "../Image/clothes/sp2.jpg"; // Giữ link từ sp2
                sp26.Price = "120000";
                sp26.Description = "Áo thun ngắn tay nam với chất liệu cotton thoáng mát. Phù hợp cho các hoạt động hàng ngày và thể thao.";
                list_product.Add(sp26);

                Product sp27 = new Product();
                sp27.Id = 27;
                sp27.Name = "Quần Short Thể Thao";
                sp27.Link = "../Image/clothes/sp3.jpg"; // Giữ link từ sp3
                sp27.Price = "200000";
                sp27.Description = "Quần short thể thao nam với chất liệu thấm hút mồ hôi, hỗ trợ tốt cho các hoạt động thể dục thể thao.";
                list_product.Add(sp27);

                Product sp28 = new Product();
                sp28.Id = 28;
                sp28.Name = "Quần Tây Nam";
                sp28.Link = "../Image/clothes/sp4.jpg"; // Giữ link từ sp4
                sp28.Price = "400000";
                sp28.Description = "Quần tây nam với thiết kế thanh lịch, chất liệu vải cao cấp. Phù hợp cho công sở và các dịp trang trọng.";
                list_product.Add(sp28);

                Product sp29 = new Product();
                sp29.Id = 29;
                sp29.Name = "Áo Hoodie Nam";
                sp29.Link = "../Image/clothes/sp5.jpg"; // Giữ link từ sp5
                sp29.Price = "350000";
                sp29.Description = "Áo hoodie nam với chất liệu ấm áp, thiết kế năng động. Phù hợp cho mùa thu và đông.";
                list_product.Add(sp29);

                Product sp30 = new Product();
                sp30.Id = 30;
                sp30.Name = "Áo Sơ Mi Công Sở";
                sp30.Link = "../Image/clothes/sp6.jpg"; // Giữ link từ sp6
                sp30.Price = "280000";
                sp30.Description = "Áo sơ mi công sở nam với thiết kế thanh lịch, chất liệu dễ chịu. Phù hợp cho môi trường làm việc chuyên nghiệp.";
                list_product.Add(sp30);

                Product sp31 = new Product();
                sp31.Id = 31;
                sp31.Name = "Quần Kaki Mùa Hè";
                sp31.Link = "../Image/clothes/sp7.jpg"; // Giữ link từ sp7
                sp31.Price = "270000";
                sp31.Description = "Quần kaki mùa hè nam với chất liệu mỏng nhẹ, thoáng khí. Phù hợp cho mùa hè và các hoạt động ngoài trời.";
                list_product.Add(sp31);

                Product sp32 = new Product();
                sp32.Id = 32;
                sp32.Name = "Áo Thun Polo Nam";
                sp32.Link = "../Image/clothes/sp8.jpg"; // Giữ link từ sp8
                sp32.Price = "200000";
                sp32.Description = "Áo thun polo nam với thiết kế cổ bẻ, chất liệu cotton mềm mại. Phù hợp cho các dịp không trang trọng và dạo phố.";
                list_product.Add(sp32);


                Application["product"] = list_product;
            }

            Application["accessory"] = new List<Product>();{
                List<Product> list_accessory = new List<Product>();
                Product pk1 = new Product();
                pk1.Id = 101;
                pk1.Name = "Kính Mát Phân Cực";
                pk1.Link = "../Image/accessory/pk1.jpg";
                pk1.Price = "150000";
                pk1.Description = "Description 1";
                list_accessory.Add(pk1);

                Product pk2 = new Product();
                pk2.Id = 102;
                pk2.Name = "Thắt lưng nam da bò";
                pk2.Link = "../Image/accessory/pk2.jpg";
                pk2.Price = "59000";
                pk2.Description = "Description 2";
                list_accessory.Add(pk2);

                Product pk3 = new Product();
                pk3.Id = 103;
                pk3.Name = "Dây chuyền titan";
                pk3.Link = "../Image/accessory/pk3.jpg";
                pk3.Price = "155000";
                pk3.Description = "Description 3";
                list_accessory.Add(pk3);

                Product pk4 = new Product();
                pk4.Id = 104;
                pk4.Name = "Dây chuyền bạc";
                pk4.Link = "../Image/accessory/pk4.jpg";
                pk4.Price = "639000";
                pk4.Description = "Description 4";
                list_accessory.Add(pk4);

                Product pk5 = new Product();
                pk5.Id = 105;
                pk5.Name = "Nhẫn nam kim cương";
                pk5.Link = "../Image/accessory/pk5.jpg";
                pk5.Price = "579000";
                pk5.Description = "Description 5";
                list_accessory.Add(pk5);

                Product pk6 = new Product();
                pk6.Id = 106;
                pk6.Name = "Vòng cổ hình tiền đô la";
                pk6.Link = "../Image/accessory/pk6.jpg";
                pk6.Price = "232000";
                pk6.Description = "Description 6";
                list_accessory.Add(pk6);

                Product pk7 = new Product();
                pk7.Id = 107;
                pk7.Name = "Dây chuyền ngọc trai";
                pk7.Link = "../Image/accessory/pk7.jpg";
                pk7.Price = "285000";
                pk7.Description = "Description 7";
                list_accessory.Add(pk7);

                Product pk8 = new Product();
                pk8.Id = 108;
                pk8.Name = "Dây chuyền xoắn vuông";
                pk8.Link = "../Image/accessory/pk8.jpg";
                pk8.Price = "197000";
                pk8.Description = "Description 8";
                list_accessory.Add(pk8);

                Application["accessory"] = list_accessory;
            }

            Application["account"] = new List<Account>();{
                List<Account> list_acc = new List<Account>();
                Account acc1 = new Account();
                acc1.Id = 1;
                acc1.Username = "duongthesy";
                acc1.Password = "123456";
                list_acc.Add(acc1);

                Account admin = new Account();
                admin.Id = 2;
                admin.Username = "admin";
                admin.Password = "1";

                list_acc.Add(admin);
                Application["account"] = list_acc;
            }

            Application["cart"] = new List<Carts>();

            Application["bill"] = new List<Bill>();
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session["pre_page"] = null;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}