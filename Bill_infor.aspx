<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bill_infor.aspx.cs" Inherits="BTL.Bill_infor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.bill-container {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

h1 {
    text-align: center;
    color: #333;
}

.bill-info p {
    font-size: 16px;
    margin: 10px 0;
    color: #555;
}

.bill-items h2 {
    margin-top: 20px;
    color: #333;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}

table th, table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

table th {
    background-color: #f4f4f4;
}

table td {
    background-color: #fff;
}

table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

p b {
    color: #333;
}
        #back{
            position: absolute; 
            left: 20px; 
            top: 20px;
            color: black;
            text-decoration: none;
            border: 1px solid black;
            padding: 10px;
            border-radius: 30%;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
<div class="bill-container">
            <a href="Bills.aspx" id = "back" style="display: block;">Trở lại</a>

        <h1>Thông tin hóa đơn</h1>
        <div class="bill-info">
            <p><b>Mã hóa đơn:</b> <label id ="code" runat ="server">NULL</label></p>
            <p><b>Tên khách hàng:</b> <label id ="name" runat ="server">Nguyễn văn A</label></p>
            <p><b>Ngày lập:</b> <label id ="date" runat ="server"> 12/01/2003</label></p>
            <p><b>Địa chỉ:</b> <label id ="address" runat="server">123 Đường ABC, Quận 1, TP.HCM</label></p>
            <p><b>Phương thức thanh toán:</b> <label>Thanh toán khi nhận hàng</label></p>
            <div class="bill-items">
                <h2>Chi tiết hóa đơn</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                            <th>Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody id ="content" runat ="server">
                        
                    </tbody>
                </table>
            </div>
            <p><b>Tổng cộng:</b> <label id ="sum" runat="server">0</label></p>
        </div>
    </div>
    </form>

    <script>

    </script>
</body>
</html>
