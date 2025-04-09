<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Accessory.aspx.cs" Inherits="BTL.Accessory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Quần áo nam</title>
    <link rel="stylesheet" href="CSS/home.css"/>    
    <link rel="stylesheet" href="CSS/style.css"/>
    <style>
        /* CSS để tạo layout cho sidebar */
        .content {
            display: flex;
        }
        .sidebar {
            width: 250px; /* Độ rộng của sidebar */
            background-color: #f0f0f0; /* Màu nền của sidebar */
            padding: 20px; /* Khoảng cách từ nội dung vào biên của sidebar */
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* Hiệu ứng bóng đổ */
            margin-top: 40px;
            margin-left: 10px;
        }
        .content-main {
            flex: 1;
            padding: 20px;
        }
        .sidebar h3 {
            margin-top: 0;
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }
        .sidebar ul li {
            margin: 10px 0;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #333;
        }
        .sidebar ul li a:hover {
            color: #007BFF;
        }
        .sidebar input, .sidebar select {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            box-sizing: border-box;
        }
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0;
        }

        .pagination button, .pagination div span {
            margin: 0 5px;
            padding: 10px 15px;
            text-decoration: none;
            background-color: #f1f1f1;
            color: #333;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .pagination button:hover, .pagination div span:hover, .pagination div span.active {
            background-color: #333;
            color: #fff;
        }

        .active{
            display:inline !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" >
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
            <div class="content">
                <div class="sidebar">
                    <!-- Nội dung của sidebar -->
                    <h3>Tìm kiếm sản phẩm</h3>
                    <input type="text" id="product-name" placeholder="Nhập tên sản phẩm"/>

                    <h3>Khoảng giá</h3>
                    <input type="number" id="min-price" placeholder="Giá thấp nhất"/>
                    <input type="number" id="max-price" placeholder="Giá cao nhất"/>

                    <input type="button" id = "btn-filter" style = "background-color: rgb(224, 239, 20);" value = "Áp dụng"/>
                </div>
                <div class="content-main">
                    <div class="content-part">
                        <div class="content-top">
                            <div class="content-list">
                                <div class="product-row" id="accessory" runat="server">
                                    <!-- Nội dung danh sách sản phẩm  -->
                                </div>
                            </div>
                        </div>
                        <div class="product-poster"></div>
                    </div>
                </div>
            </div>
        </main>
        <div class="pagination">
            <div id="page-numbers"></div>
        </div>
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
        document.getElementById('btn-filter').addEventListener('click', function () {
            const productName = document.getElementById('product-name').value.toLowerCase(); // thành chữ thường
            const minPrice = parseFloat(document.getElementById('min-price').value);
            const maxPrice = parseFloat(document.getElementById('max-price').value);

            const products = document.querySelectorAll('.product-row .product');

            products.forEach(product => {
                const name = product.querySelector('.product-name').innerText.toLowerCase();
                const price = parseFloat(product.querySelector('.product-price').innerText.replace('$', ''));

                let matches = true;

                if (productName && !name.includes(productName)) {
                    matches = false;
                }
                if (!isNaN(minPrice) && price < minPrice) {
                    matches = false;
                }
                if (!isNaN(maxPrice) && price > maxPrice) {
                    matches = false;
                }

                if (matches) {
                    product.style.display = '';
                } else {
                    product.style.display = 'none';
                }
            });
        });

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
    </script>
    <script>
        let currentPage = 1;
        const itemsPerPage = 8; // Số sản phẩm hiển thị trên mỗi trang
        const products = document.querySelectorAll('.product');

        function displayPage(page) {
            currentPage = page;
            const start = (page - 1) * itemsPerPage;
            const end = page * itemsPerPage;

            products.forEach((product, index) => {
                product.style.display = (index >= start && index < end) ? 'block' : 'none';
            });

            updatePagination();
        }

        function updatePagination() {
            const pageCount = Math.ceil(products.length / itemsPerPage);
            const pageNumbers = document.getElementById('page-numbers');
            pageNumbers.innerHTML = '';

            for (let i = 1; i <= pageCount; i++) {
                const span = document.createElement('span');
                span.textContent = i;
                span.className = (i === currentPage) ? 'active' : '';
                span.onclick = () => displayPage(i);
                pageNumbers.appendChild(span);
            }
        }

        // Hiển thị trang đầu tiên khi trang web được tải
        displayPage(1);
    </script>
</body>
</html>
