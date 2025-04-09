<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BTL.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Đăng ký</title>
    <link rel="stylesheet" href="CSS/login.css"/>
</head>
<body>
<div class="login-container">
        <h2 id="successMessage" runat="server" style="color: green;">Đăng ký</h2>
        <form id ="form1" runat ="server" method="post">
            <div class="input-group">
                <label for="username">Tài khoản</label>
                <input type="text" id="username" name="username" placeholder="Nhập tài khoản" />
            </div>
            <div class="advertise" id = "advertise_tk" runat ="server">

            </div>
            <div class="input-group">
                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" />
            </div>
            <div class="advertise" id = "advertise-mk">

            </div>
            <div class="input-group">
                <label for="password">Nhập lại mật khẩu</label>
                <input type="password" id="re-password" name="re-password" placeholder="Nhập mật khẩu" />
            </div>
            <button type="submit" class="login-button">Đăng ký</button>
        </form>
        <p>Bạn đã có tài khoản? <a href="Login.aspx">Đăng nhập ngay</a></p>
    </div>
     <script>
        var tk = document.getElementById("username");
        var mk = document.getElementById("password");
        var re_mk = document.getElementById("re-password");
        var advertise_tk = document.getElementById("advertise_tk");
        var advertise_mk = document.getElementById("advertise-mk");
        document.querySelector(".login-button").addEventListener("click", (event) =>{
            if(tk.value.trim() == ""){
                advertise_tk.innerText = "Vui lòng nhập tài khoản";
                event.preventDefault();
            }else{
                advertise_tk.innerText = "";
            }            
            if(mk.value.trim() == ""){
                advertise_mk.innerHTML = "Vui lòng nhập mật khẩu";
                event.preventDefault();

            }else if(mk.value.trim() != re_mk.value.trim()){
                mk.style.border = "1px solid red";
                re_mk.style.border = "1px solid red";
                advertise_mk.innerText = "Không khớp rồi!!";
                mk.value = "";
                re_mk.value = "";
                event.preventDefault();
            }else{
                advertise_mk.innerText = "";
                mk.style.border = "1px solid #ddd";
                re_mk.style.border = "1px solid #ddd";
            }
           /* if (advertise_mk.innerText == "" && advertise_tk.innerText == "" && advertise_mk.innerText == ""){
                alert("Tạo tài khoản thành công. Chuyển hướng đến trang chủ");
            }*/
        })
     </script>
</body>
</html>
