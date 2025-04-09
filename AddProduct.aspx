<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="BTL.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thêm sản phẩm</title>
    <style>
body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 500px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
}

h2 {
    text-align: center;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="text"],
input[type="file"],
input[type="number"],
textarea,
select {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    border: 1px solid #ddd;
    border-radius: 4px;
}

button {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

#confirmationMessage {
    text-align: center;
    margin-top: 20px;
    color: green;
    font-weight: bold;
}

.hidden {
    display: none;
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
    <div class="container">
        <a href="Home.aspx" id = "back" style="display: block;" runat ="server">Trở lại</a>
        <h2 id ="advertise" runat ="server">Thêm Sản Phẩm</h2>
        <div id="addProductForm">
            <div class="form-group">
                <label for="productName">Tên Sản Phẩm:</label>
                <input type="text" id="productName" name="productName"/>
            </div>
            <div class="form-group">
                <label for="productCategory">Loại Sản Phẩm:</label>
                <select id="productCategory" name="productCategory">
                    <option value="clothes">Quần Áo</option>
                    <option value="accessory">Phụ Kiện</option>
                </select>
            </div>
            <div class="form-group">
                <label for="productImage">Hình Ảnh Sản Phẩm:</label>
                <input type="file" id="productImage" name="productImage" runat="server" />
            </div>
            <div class="form-group">
                <label for="productPrice">Giá Sản Phẩm:</label>
                <input type="number" id="productPrice" name="productPrice"/>
            </div>
            <div class="form-group">
                <label for="productDescription">Mô Tả Sản Phẩm:</label>
                <textarea id="productDescription" name="productDescription" rows="4"></textarea>
            </div>
            <button type="submit">Thêm Sản Phẩm</button>
        </div>
    </div>
    <script>
        document.querySelector('button[type="submit"]').addEventListener("click", (event) =>{
            document.querySelectorAll("input").forEach((element)=>{
                if(element.value.trim() == ""){
                    event.preventDefault();
                }
            })
        })
        
    </script>
    </form>
</body>
</html>
