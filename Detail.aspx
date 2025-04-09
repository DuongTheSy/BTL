<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="BTL.Detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="CSS/style.css"/>
    <link rel="stylesheet" href="CSS/detail.css"/>
    <title id ="title" runat ="server"></title>
    <style>
            #pay{
        font-family: 'Arial', sans-serif;
        background: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .btn {
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        background: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        transition: background 0.3s;
    }

        .btn:hover {
            background: #0056b3;
        }

    .popup-container {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
        animation: fadeIn 0.3s ease-in-out;
    }

    .popup {
        background: white;
        padding: 30px;
        border-radius: 8px;
        width: 400px;
        max-width: 90%;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        animation: slideIn 0.3s ease-in-out;
    }

    .close-btn {
        float: right;
        font-size: 24px;
        cursor: pointer;
        color: #333;
    }

    #paymentForm label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    #paymentForm input,
    #paymentForm select {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        transition: border-color 0.3s;
    }

        #paymentForm input:focus,
        #paymentForm select:focus {
            border-color: #007bff;
        }

    @keyframes fadeIn {
        from {
            opacity: 0;
        }

        to {
            opacity: 1;
        }
    }

    @keyframes slideIn {
        from {
            transform: translateY(-30px);
        }

        to {
            transform: translateY(0);
        }
    }
    </style>
</head>
<body>
    <div id="test" runat="server"></div>
    <form id ="form1" runat="server" method="post">
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
        <main>
            <h2 id ="successMessage" runat="server" style ="color:green;text-align:center; margin-bottom:10px"></h2>
            <div class="content" id = "detail">
                <div class="img-layer"><img id = "img_sanpham" src="null" alt="Img" runat ="server" class="product-img"/></div>
                <div class="details-layer">
                    <div class="details-title">
                        <h3 class="p-name" id = "ten_sanpham" runat ="server"></h3>
                        Id: 0<label class="p-id" id="p_id" runat ="server">1</label>
                        <div class="p-describe" id ="description" runat ="server">
                            <p>Không có mô tả nào ở đây cả</p>
                        </div>
                        <div id ="tinhtrang" style ="margin-bottom: 10px;color: red" runat ="server">

                        </div>
                    </div>
                    <div class="details-content">
                        <div class="p-price" id = "gia_sanpham" runat ="server">Không có sản phẩm nào được chọn</div>
                        <div class="size">
                            Size:
                            <div class="picker">
                                <div class="pick-box size-select">S</div>
                                <div class="pick-box size-select">M</div>
                                <div class="pick-box size-select">L</div>
                                <div class="pick-box size-select">XL</div>
                                <div class="pick-box size-select">XXL</div>
                            </div>
                        </div>
                        <div class="quantites-layer">
                            <div class="quantities-title">Quantities:</div>
                            <div class="picker">
                                <div class="pick-box no-select" onclick="decrease()">-</div>
                                <div class="pick-box no-select" id="quantities" name="quantities" runat ="server">1</div>
                                <div class="pick-box no-select" onclick="increase()">+</div>
                            </div>
                        </div>
                        <div class="purchase-layer">
                            <asp:Button ID="add_cart" class="purchase" runat="server" Text="Thêm vào giỏ hàng" onclick="btnclick_add" />
                            <asp:Button ID="openPopupBtn" class="purchase" runat="server" Text="Mua ngay" onclick="btnclick_buy" />
                        </div>
                        <asp:HiddenField ID="hfQuantities" runat="server" />
                        <asp:HiddenField ID ="hfSize" runat ="server" />
                    </div>
                </div>
            </div>
            <div id ="pay" style ="max-height:0;">
                   <div id="popupContainer" class="popup-container">
                   <div class="popup">
                       <span class="close-btn" id="closePopupBtn">&times;</span>
                       <h2 style ="margin-bottom: 30px;">Thanh Toán</h2>
                       <div id="paymentForm">
                           <label for="name">Tên:</label>
                           <input type="text" id="name" name="name"/>
       
                           <label for="address">Địa chỉ:</label>
                           <asp:TextBox ID="address" name= "address" runat="server"></asp:TextBox>
       
                           <label for="paymentMethod">Phương thức thanh toán:</label>
                           <select id="paymentMethod" name="paymentMethod" onchange="change(this.value)">
                               <option value="thanhtoankhinhanhang">Thanh toán khi nhận hàng</option>
                               <option value="thetindung">Thẻ tín dụng</option>
                           </select>
                           <div id = "credit-card" style="display: none;">
                               <label for="cardNumber">Số thẻ:</label>
                               <input type="text" id="cardNumber" name="cardNumber" />
           
                               <label for="expiryDate">Ngày hết hạn:</label>
                               <input type="text" id="expiryDate" name="expiryDate" />
           
                               <label for="cvv">CVV:</label>
                               <input type="text" id="cvv" name="cvv" />
                           </div>
                           <asp:Button ID="btn_confirm" class = "btn" runat ="server" Text ="Xác nhận" OnClick ="btnclick_confirm" />
                       </div>
                   </div>
                 </div>
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
        updateHiddenField();


        function updateHiddenField() {
            var value = document.getElementById("quantities").innerText;
            document.getElementById("hfQuantities").value = value;
        }

        function updateHfSize(value) {
            document.getElementById("hfSize").value = value;
        }

        function increase() {
            var value = document.getElementById("quantities");
            value.innerText = parseInt(value.innerText) + 1;
            updateHiddenField();
        }

        function decrease() {
            var value = document.getElementById("quantities");
            if (parseInt(value.innerText) > 1) {
                value.innerText = parseInt(value.innerText) - 1;
                updateHiddenField();
            }
        }
        var pick = document.querySelectorAll(".size-select");

        pick.forEach((element) => {
            element.addEventListener("click", () => {
                pick.forEach((a) => {
                    a.style.color = "black";
                    a.style.backgroundColor = "white";
                });
                updateHfSize(element.innerText);
                element.style.color = "white";
                element.style.backgroundColor = "black";
            })
        })
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

        document.querySelector("#add_cart").addEventListener("click", (event) => { 
            var flag = 0;
            document.querySelectorAll(".size-select").forEach((element) => {
                if (element.style.color == "white") {
                    flag = 1;
                }
            })

            if (document.querySelector("#tinhtrang").innerHTML == "Hết hàng") {
                event.preventDefault();
            } else {
                if (flag == 0) {
                    if (document.querySelector("#user").innerText != "") {
                        document.querySelector("#successMessage").innerHTML = "Bạn quên chọn Size kìa";
                        document.querySelector("#successMessage").style.color = "red";
                        event.preventDefault();
                    }
                }
            }
        })

        document.querySelector(".nav-button").addEventListener("click", () => {
            var search = document.getElementById("Searcher").value;
            if (search) {
                var url = "AllProducts.aspx?search=" + encodeURIComponent(search);
                window.location.href = url;
            }
        });

        //
        document.getElementById('openPopupBtn').addEventListener('click', function (event) {

            if (document.querySelector("#tinhtrang").innerHTML == "Hết hàng") {
                event.preventDefault();
            } else {
                if (document.getElementById("user").innerText != "") {
                    event.preventDefault();
                } else {
                    document.getElementById('popupContainer').style.display = 'flex';
                }

            }


        });

        document.getElementById('closePopupBtn').addEventListener('click', function () {
            document.getElementById('popupContainer').style.display = 'none';
        });

        document.getElementById('popupContainer').addEventListener('click', function (event) {
            if (event.target === document.getElementById('popupContainer')) {
                document.getElementById('popupContainer').style.display = 'none';
            }
        });

        function change(value) {
            if (value == "thetindung") {
                document.getElementById("credit-card").style.display = "block";
            } else {
                document.getElementById("credit-card").style.display = "none";
            }
        }

        document.getElementById("name").value = document.getElementById("user").innerText


    </script>
    
</body>
</html>
