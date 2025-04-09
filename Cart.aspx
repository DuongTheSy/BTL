 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BTL.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="CSS/cart.css"/>
    <link rel="stylesheet" href="CSS/style.css"/>
</head>
<body>
    <div id ="test" runat ="server"></div>
 <form id ="form1" runat="server" method="post">
    <div class="home" id="home">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
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
                <div class="content">
                    <div class="table-hnf">
                        <div class="layer-name">Sản phẩm</div>
                        <div class="layer-price">Giá</div>
                        <div class="layer-quantities">Số lượng</div>
                        <div class="layer-money">Thành tiền</div>
                    </div>
                    <div class="table-body border-outside" runat="server" id="cart">
                    </div>
                    <div class="table-hnf">
                        <div class="layer-50"></div>
                        <div class="total">Tổng tiền:</div>
                        <div class="total-price">100000</div>
                        <div id="openPopupBtn" class="payment">
                            Mua
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
                        <asp:Button ID="xacnhan" Text ="Xác Nhận" runat="server" class ="btn" OnClick ="btnclick_confirm" />
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
    updateTotal();

    function tang(id) {
        var value = document.getElementById(id).innerText;
        value = Number.parseInt(value);
        value = value + 1;
        document.getElementById(id).innerText = value;
        updateTotal();
    }

    function giam(id) {
        var value = document.getElementById(id).innerText;
        value = Number.parseInt(value);
        if (value > 1) {
            value = value - 1;
            document.getElementById(id).innerText = value;
            updateTotal();
        }
    }

    function remove(id) {
        if (confirm("Bạn có chắc chắn muốn loại bỏ sản phẩm này?")) {
            document.getElementById(id).style.display = 'none';
            id = removeSpGetId(id);
            PageMethods.RemoveServerSide(id, onSuccess, onError);
            updateTotal();
        }
    }

    function onSuccess(result) {
        // thành công
    }

    function onError(error) {
        alert("Lỗi: " + error.get_message());
    }

    function updateTotal() {
        var total = 0;
        var all_product = document.querySelectorAll(".product");
        all_product.forEach((element) => {
            var quantity = element.querySelector(".quantity").innerText;
            var price = element.querySelector(".layer-price").innerText;
            price = changeFormat(price);
            if (element.style.display !== 'none') {
                var sum = Number(quantity) * Number(price);
                element.querySelector(".layer-money").innerHTML = convertToFomat(sum);
                total += sum;
            }
        });

        document.querySelector(".total-price").innerText = convertToFomat(total);
    }

    function removeSpGetId(value) {
        var result = "";
        for (var i = 2; i < value.length; i++) {
            result += value[i];
        }
        return result;
        
    }

    function changeFormat(value) {
        var result = "";
        for (var i = 0; i < value.length; i++) {
            if (value[i] != "₫" && value[i] != "." && value[i] != " ") {
                result += value[i];
            }
        }
        return result;
    }

    function convertToFomat(value) {
        var reverse = "";
        var result = "";

        value = value.toString();
        var length = value.length;
        var j = 0;
        for (var i = length - 1; i >= 0; i--) {
            if (j == 3) {
                reverse += ".";
                j = 0;
            }
            reverse += value[i];
            j++;
        }

        for (var i = reverse.length - 1; i >= 0; i--) {
            result += reverse[i];
        }
        return result + " ₫";
    }
    document.querySelector(".nav-button").addEventListener("click", () => {
        var search = document.getElementById("Searcher").value;
        if (search) {
            var url = "AllProducts.aspx?search=" + encodeURIComponent(search);
            window.location.href = url;
        }
    });
    document.getElementById('openPopupBtn').addEventListener('click', function (event) {
        if (document.getElementById("user").innerText == "") {
            window.location.href = "Login.aspx";
        }
        if (document.querySelectorAll(".product").length == 0 && document.querySelector("#user").innerText != "") {
            document.querySelector("#successMessage").innerText = "Giỏ hàng đã có gì đâu? Nhầm à";
        } else {
            document.querySelector("#successMessage").innerText = "";
            document.getElementById('popupContainer').style.display = 'flex';
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

    //
    document.getElementById("name").value = document.getElementById("user").innerText

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
</script>
</body>
</html>
