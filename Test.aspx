<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="BTL.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
        <asp:Button ID="Button1" runat="server" Text="Gọi Server Method" OnClientClick="callServerMethod(); return false;" />

    </form>
    <script type="text/javascript">
    function callServerMethod() {
        var yourParameter = "Giá trị tham số";
        PageMethods.YourMethod(yourParameter, onSuccess, onError);
    }

    function onSuccess(result) {
        alert("Cái này từ client " + result);
    }

    function onError(error) {
        alert("Lỗi: " + error.get_message());
    }
</script>
</body>
</html>
