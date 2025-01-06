<%@ page import="com.edu.hcmuaf.fit.model.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi Mật Khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/changePassword.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/settingAll.css">
</head>

<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
    <main style="background-color: transparent;">
        <div class="container container1">
            <a href="<%=url%>/homepage" class="close-btn" title="Quay lại trang chủ">


                <i class="bi bi-x-circle-fill"></i>
            </a>

            <h2>Đổi Mật Khẩu</h2>
            <form>
                <div>
                    <label for="currentpw" class="required">Mật khẩu hiện tại</label>
                    <input type="password" id="currentpw" name="mk_hien_tai" placeholder="Nhập mật khẩu hiện tại"
                        required>
                    <span id="errPW"></span>
                </div>

                <div>
                    <label for="newpw" class="required">Mật khẩu mới</label>
                    <input type="password" id="newpw" name="mk_moi" placeholder="Nhập mật khẩu mới" required>
                    <span id="errNPW"></span>
                </div>

                <div>
                    <label for="re-enterpw" class="required">Xác nhận mật khẩu</label>
                    <input type="password" id="re-enterpw" name="mk_xac_nhan" placeholder="Nhập lại mật khẩu mới"
                        required>
                    <span id="errReNPW"></span>
                </div>

            <button class="button1" type="submit">XÁC NHẬN</button>
        </form>
    </div>
</main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script src="js/changePassword.js"></script>


</body>

</html>