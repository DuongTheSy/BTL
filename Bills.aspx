<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bills.aspx.cs" Inherits="BTL.Bills" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Danh sách hóa đơn</title>
    <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.bills-container {
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

.bill-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.bill-table th, .bill-table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

.bill-table th {
    background-color: #f4f4f4;
    color: #333;
}

.bill-table td {
    background-color: #fff;
    color: #555;
}

.detail-button {
    display: inline-block;
    padding: 5px 10px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-decoration: none;
}

.detail-button:hover {
    background-color: #0056b3;
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
    <form id="form1" runat="server" method ="post">
                <a href="Home.aspx" id = "back" style="display: block;">Trở lại</a>

    <div class="bills-container">
        <h1>Danh sách hóa đơn</h1>
        <table class="bill-table">
            <thead>
                <tr>
                    <th>Mã hóa đơn</th>
                    <th>Ngày lập</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody id ="content" runat ="server">
                <tr>
                    <td>123456</td>
                    <td>29/07/2024</td>
                    <td><a class="detail-button">Chi tiết</a></td>
                </tr>
                <tr>
                    <td>789012</td>
                    <td>28/07/2024</td>
                    <td><a class="detail-button">Chi tiết</a></td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
</body>
</html>
