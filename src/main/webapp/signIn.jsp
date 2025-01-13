<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/signIn.css">
</head>

<body>
<% String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>
<%
    String userName = request.getParameter("idFormInput");
    String password = request.getParameter("idFormPass");
    userName = (userName == null)? "": userName;
    password = (password == null)? "": password;
    String err = (String) request.getAttribute("err");
    err =(err == null)?"":err;
%>
<main>
    <div class="container container1">
        <a href="<%=url%>/homepage" class="close-btn" title="Quay lại trang chủ">
            <i class="bi bi-x-circle-fill"></i>
        </a>
        <img src="image/imghomepage/logo/logo1.jpg" class="img-logo1" alt="logo-page">
        <h2 class="title-form">Đăng Nhập</h2>
        <form id="login-form" action="<%=url%>/signInAccount" method="post" onsubmit="return my_submit();">
            <div class="form-group-p">
                <div class="text-danger pb-2" id="inputError"><%=err%></div>
                <input class="form-input" id="idFormInput" name="idFormInput" type="text" placeholder="Tên đăng nhập" value ="<%=userName%>">
            </div>
            <div class="form-group-p">
                <input class="form-pass" id="idFormPass" name="idFormPass" type="password" placeholder="Mật khẩu" value ="<%=password%>">
            </div>
            <div>
                <button type="submit" class="button-submit" id="submitDangNhap">ĐĂNG NHẬP</button>
            </div>
            <div class="form-group-p" id="idFPass">
                <p id="idMK"><a href="<%=url%>/forgetPassword">Quên mật khẩu?</a></p>
            </div>
            <div class="form-group-p" id="idDK">
                <p>Bạn chưa có tài khoản?<a href="<%=url%>/registerAccount"> Đăng ký</a></p>
            </div>
        </form>
    </div>
</main>
<script>
    function my_submit() {
        var flag = true;
        let inputElement = document.getElementById("idFormInput");
        let passElement = document.getElementById("idFormPass");
        let inputError = document.getElementById("inputError");
        var specialCharacters = /[!@#$%^&*(),.?":{}|<>' -]/;
        inputError.textContent = "";
        if (inputElement.value === "" && passElement.value === "") {
            inputError.textContent = "Bạn chưa nhập tên đăng nhập hoặc mật khẩu!";
            flag = false;
        } else if (inputElement.value === "") {
            inputError.textContent = "Bạn chưa nhập tên đăng nhập!";
            flag = false;
        } else if (specialCharacters.test(inputElement.value)) {
            inputError.textContent = 'Tên đăng nhập không chứa kí tự đặc biệt!';
            flag = false;
        } else if (passElement.value === "") {
            inputError.textContent = "Bạn chưa nhập mật khẩu!";
            flag = false;
        }
        return flag;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>