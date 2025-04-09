<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="BTL.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/style.css"/>
    <style>
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .title {
            margin-top: 0;
        }

        .user-table {
            border-collapse: collapse;
        }

        .table-header {
            background-color: #f4f4f4;
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .table-cell {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .btn {
            padding: 5px 10px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }
        #password {
            margin-right: 10px;
            height: 25px;
        } 
    </style>
</head>
<body>
    <form id="form1" runat="server" method="post">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
        <div class="home" id="home">
        <header class="header">
            <nav class="navbar">
                <div class="format-header">
                <div class="nav-left">
                    <img src="../Image/icon/logo.png" alt="Logo" class="logo"/>
                    <ul class="navigator">
                        <li class="nav-selector"><a href="Home.aspx">TRANG CHỦ</a></li>
                        <li class="nav-selector"><a href="Clothes.aspx">QUẦN ÁO NAM</a></li>
                        <li class="nav-selector"><a href="Accessory.aspx">PHỤ KIỆN NAM</a></li>
                    </ul>
                </div>
                <div class="nav-right">
                    <div class="nav-search nav-btn">
                        <div class="searcher nav-btn">
                            <input type="text" name="" id="Searcher" class="search-input" placeholder="Tìm kiếm..."/>
                            <div id="search-result"></div>
                        </div>
                        <img src="../Image/icon/search.png" alt="Search" class="nav-button"/>
                    </div>
                    <div class="nav-btn account">
                        <a id="login" href="Login.aspx"><img src="../Image/icon/user.png" alt="Sign In" class="nav-button"/></a>
                        <ul class="subnav">
                            <li id ="user" runat="server"></li>
                                <li id ="btn_admin"><asp:Button ID="admin" class ="btn_admin" runat="server" Text="Quản trị" onclick="btnclick_admin" /></li>
                                                            <li id ="btn_bill"><asp:Button ID="bill" class ="btn_admin" runat="server" Text="Đơn hàng" onclick="btnclick_bill" /></li>
                                <li id ="btn_addpro"><asp:Button ID="add_pro" class ="btn_admin" runat="server" Text="Thêm sản phẩm" onclick="btnclick_addpro" /></li>
                            <li id ="btn_dangxuat"><asp:Button ID="dangxuat" class ="btn_dangxuat" runat="server" Text="Đăng xuất" onclick="btnclick_dangxuat" /></li>
                        </ul>
                    </div>
                    <div class="nav-btn"><a href="Cart.aspx"><img src="../Image/icon/cart.png" alt="Cart" class="nav-button"/></a></div>
                </div>
                </div>
            </nav>
        </header>
        <main style =" margin-top: 125px;
    margin-bottom: 5rem;">
            <div class="container">
        <h2 class="title">Danh sách Người dùng</h2>
        <table class="user-table">
            <thead>
                <tr>
                    <th class="table-header">Tên người dùng</th>
                    <th class="table-header">Thao tác</th>
                </tr>
            </thead>
            <tbody id ="content" runat ="server">
            </tbody>
        </table>
    </div>
        </main>
        <footer class="footer">
                <div class="footer-top">
                    <div class="footer-body">
                        <h4 class="font-larger">Về chúng tôi</h4>
                        <div class="footer-body hover-red">Thông tin</div>
                        <div class="footer-body hover-red">Vị trí cửa hàng</div>
                    </div>
                    <div class="footer-body">
                        <h4 class="font-larger">Hỗ trợ</h4>
                        <div class="footer-body hover-red">Câu hỏi thường gặp</div>
                        <div class="footer-body hover-red">Chính sách trả hàng</div>
                        <div class="footer-body hover-red">Chính sách bảo mật</div>
                        <div class="footer-body hover-red">Khả năng tiếp cận</div>
                    </div>
                    <div class="footer-body">
                        <h4 class="font-larger">Tài khoản</h4>
                        <div class="footer-body hover-red">Thành viên</div>
                        <div class="footer-body hover-red">Hồ sơ</div>
                        <div class="footer-body hover-red">Phiếu giảm giá</div>
                    </div>
                    <div class="footer-body">
                        <h4 class="font-larger">Tài khoản mạng xã hội</h4>
                        <div class="social-img">
                            <img src="../Image/icon/facebook.png" alt="Facebook" class="social-icon"/>
                            <img src="../Image/icon/instagram.png" alt="Instagram" class="social-icon"/>
                            <img src="../Image/icon/youtube.png" alt="Youtube" class="social-icon"/>
                            <img src="../Image/icon/tik-tok.png" alt="Tiktok" class="social-icon"/>
                        </div>
                    </div>
                </div>
                <div class="footer">
                <div class="footer-bot">
                    <div class="fbot-head">
                        <h3 class="blur-text">&copy; 2024 HNST Shop. Đã đăng ký bản quyền</h3>
                        <div class="fbot-head-right">
                            <h3 class="blur-text highlight">Điều khoản sử dụng</h3>
                            <h3 class="blur-text highlight">Chính sách bảo mật</h3>
                        </div>
                    </div>
                    <div class="fbot-title">Tên công ty: Công ty TNHH 4 thành viên</div>
                    <div class="fbot-title">MST: 0123456798</div>
                    <div class="fbot-title">Địa chỉ: 96 - Định Công, Thanh Xuân, Hà Nội</div>
                    <div class="fbot-title">Nếu có bất kỳ thắc mắc nào, vui lòng truy cập trang Câu hỏi thường gặp của chúng tôi</div>
                    <div class="fbot-title">Giờ làm việc: 7:30 sáng đến 5:00 chiều giờ hành chính</div>
                </div>
                </div>
            </footer>
        </div>
    </form>
    <script>
        document.querySelector(".nav-button").addEventListener("click", () => {
            var search = document.getElementById("Searcher").value;
            if (search) {
                var url = "AllProducts.aspx?search=" + encodeURIComponent(search);
                window.location.href = url;
            }
        });
        document.querySelector("#login").addEventListener("click", (event) => {
            if (document.querySelector("#user").style.display != "none") {
                event.preventDefault();
            }
        });
        document.querySelector("#Searcher").addEventListener('keypress', function (event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                document.querySelector(".nav-button").click();
            }
        });
        function changePassword(userId) {

            var row = document.querySelector("#user" + userId);
            var buttonCell = row.querySelector(".change");
            buttonCell.innerHTML = `
                <input type="text" id="password" name="password" placeholder="Nhập mật khẩu mới">
                <button class="btn" onclick="confirmChange(${userId})">Xác nhận</button>
            `;
        }



        function confirmChange(userId) {
            var row = document.querySelector("#user" + userId);
            var buttonCell = row.querySelector(".change");

            PageMethods.ChangePasswordServerSide(userId, document.querySelector("#password").value , onSuccess, onError);
            alert('Mật khẩu đã được cập nhật cho người dùng')
.
             buttonCell.innerHTML = `<button class="btn" onclick="changePassword(${userId})">Đổi Mật khẩu</button>`;
        }

        function onSuccess(result) {
            // thành công
        }

        function onError(error) {
            alert("Lỗi: " + error.get_message());
        }
    </script>
</body>
</html>
