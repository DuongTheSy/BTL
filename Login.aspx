<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BTL.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="CSS/login.css"/>
</head>
<body>
    <div class="login-container">
        <h2 id="successMessage" runat="server" style="color: green;">Đăng nhập</h2>
        <form id ="form1" runat="server" method="post">
            <div class="input-group">
                <label for="username">Tài khoản</label>
                <input type="text" id="username" name="username" placeholder="Nhập tài khoản"/>
            </div>
            <div id="advertise" runat="server"></div>
            <div class="input-group">
                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" placeholder="Nhập mật khẩu"/>
            </div>
            <button type="submit" class="login-button">Đăng nhập</button>
        </form>
        <p>Bạn chưa có tài khoản? <a href="Register.aspx">Đăng ký ngay</a></p>
    </div>
    <script>
        document.querySelector(".login-button").addEventListener("click",(event) =>{
            var tk = document.getElementById("username");
            var mk = document.getElementById("password");
            if(tk.value.trim() === "" || mk.value.trim() === ""){
                event.preventDefault();
            }
        })
    </script>
</body>
</html>
