<%@ page import="java.util.Date" %>
<%@ page import="java.io.Serializable" %>
<%@ page import="com.edu.hcmuaf.fit.model.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thay Đổi Thông Tin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/settingAll.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/fotter.css">
    <link rel="stylesheet" href="css/changeInformation.css">
</head>

<body class="body-a">
<main style="display: flex; justify-content: center;">
    <%
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if account not found
            return;
        }

        String name = account.getName();
        String phoneNumber = account.getPhoneNumber();
        String email = account.getEmail();
        String gender = account.getGender();
        Date birthDay = account.getBirthDay();
        String address = account.getAddress();
        String addressReceive = account.getAddressReceive();
        String res = (String) request.getAttribute("res");
        res = (res == null) ? "" : res;
    %>

    <div class="container container1">
        <a href="homepage.jsp" class="close-btn" title="Quay lại trang chủ">
            <i class="bi bi-x-circle-fill"></i>
        </a>

        <h2 class="h2-change">Thay Đổi Thông Tin</h2>
        <p class="text-center w-100 mb-0 <%=(res.equals("Cập nhật thành công!")) ? "text-success" : "text-danger"%>" id="res"><%=res%></p>
        <div id="verification"></div>
        <form id="changeInfoForm" action="ChangeInformationServlet" method="post">
            <div class="form-group form1">
                <label for="fname" class="required">Họ và tên</label>
                <div>
                    <input type="text" id="fname" name="ho_ten" placeholder="Nhập họ và tên" value="<%=name%>" required>
                    <span class="error-message" id="error-fname"></span>
                </div>
            </div>

            <div class="form-group form1">
                <label for="sdt" class="required">Số điện thoại</label>
                <div>
                    <input type="text" id="sdt" name="so_dien_thoai" placeholder="Nhập số điện thoại" value="<%=phoneNumber%>" required>
                    <span class="error-message" id="error-sdt"></span>
                </div>
            </div>

            <div class="form-group form1">
                <label for="email" class="required">Email</label>
                <div>
                    <input type="email" id="email" name="email" placeholder="Nhập email" value="<%=email%>" required>
                    <span class="error-message" id="error-email"></span>
                </div>
            </div>

            <div class="form-group form1">
                <label class="gender">Giới tính</label>
                <div class="gender-container">
                    <label><input type="radio" name="gender" value="Nam" <%="Nam".equals(gender) ? "checked" : ""%>> Nam</label>
                    <label><input type="radio" name="gender" value="Nữ" <%="Nữ".equals(gender) ? "checked" : ""%>> Nữ</label>
                    <label><input type="radio" name="gender" value="Khác" <%="Khác".equals(gender) ? "checked" : ""%>> Khác</label>
                </div>
            </div>

            <div class="form-group form1">
                <label for="date" class="required">Ngày sinh</label>
                <div>
                    <input type="date" id="date" name="ngay_sinh" value="<%=birthDay != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(birthDay) : ""%>" required>
                    <span class="error-message" id="error-date"></span>
                </div>
            </div>

            <div class="form-group form1">
                <label for="address" class="required">Địa chỉ</label>
                <div>
                    <input type="text" id="address" name="dia_chi" placeholder="Nhập địa chỉ" value="<%=address%>" required>
                    <span class="error-message" id="error-address"></span>
                </div>
            </div>

            <div class="form-group form1">
                <label for="receive" class="required">Địa chỉ nhận hàng</label>
                <div>
                    <input type="text" id="receive" name="dia_chi_nhan_hang" placeholder="Nhập địa chỉ nhận hàng"
                           value="<%=addressReceive%>" required>
                    <span class="error-message" id="error-receive"></span>
                </div>
            </div>

            <button class="button1" type="submit">LƯU</button>
        </form>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="js/changeInformation.js"></script>
</body>

</html>
