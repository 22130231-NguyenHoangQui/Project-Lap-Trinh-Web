<%@ page import="com.edu.hcmuaf.fit.model.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    Object object = session.getAttribute("account");
    Account account = null;
    if (object != null) {
        account = (Account) object;
    }
    if (account == null) {
%>
    <div class="container p-0 mgt text-center fw-bold">Bạn chưa đăng nhập! <a href="<%=url%>/SignIn.jsp">Đăng nhập</a></div>
<%
    } else {
%>
    <section class="signup mt-5">
        <div class="contain">
            <div class="signup-content">
                <form id="signup-form" class="signup-form" action="changePassword" method="post">
                    <h5>ĐỔI MẬT KHẨU</h5>
                    <% String success = (String) request.getAttribute("success");
                       success = (success == null) ? "" : success;
                    %>
                    <div class="text-success text-center mt-3" id="res"><%= success %></div>
                    <div class="form-SignUp">
                        <% String errPassword = (String) request.getAttribute("errPass");
                           errPassword = (errPassword == null) ? "" : errPassword;
                           String errNewPassword = (String) request.getAttribute("errNewPass");
                           errNewPassword = (errNewPassword == null) ? "" : errNewPassword;
                           String errReNewPassword = (String) request.getAttribute("errReNewPass");
                           errReNewPassword = (errReNewPassword == null) ? "" : errReNewPassword;
                        %>
                        <div class="form-group">
                            <label>Mật khẩu hiện tại<span class="text-danger">*</span></label><span class="text-danger" id="errPW"><%= errPassword %></span>
                            <input type="password" class="form-input" placeholder="Nhập mật khẩu hiện tại" name="password" id="password"/>
                        </div>
                        <div class="form-group">
                            <label for="re_password">Mật khẩu mới<span class="text-danger">*</span></label><span class="text-danger" id="errNPW"><%= errNewPassword %></span>
                            <input type="password" class="form-input" placeholder="Nhập mật khẩu mới" name="new_password" id="new_password"/>
                        </div>
                        <div class="form-group">
                            <label for="re_password">Xác nhận mật khẩu<span class="text-danger">*</span></label><span class="text-danger" id="errReNPW"><%= errReNewPassword %></span>
                            <input type="password" class="form-input" placeholder="Nhập lại mật khẩu mới" name="re_password" id="re_password"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit">XÁC NHẬN</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
<%
    }
%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="js/changePassword.js"></script>
<script>
    if ($('#res').text() === "Đổi mật khẩu thành công!") {
        setTimeout(function () {
            window.location.href = 'homePage';
        }, 2000);
    }
</script>
</body>
</html>