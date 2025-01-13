<%@ page import="java.util.Date" %>
<%@ page import="java.io.Serializable" %>
<%@ page import="com.edu.hcmuaf.fit.model.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thay Đổi Thông Tin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/changeInformation.css">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/settingAll.css">
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<jsp:include page="./header.jsp"></jsp:include>
<div class="changeInF">
    <%
        Object object = session.getAttribute("account");
        Account account = null;
        if(object != null)
            account = (Account) object;
        if(account == null){
    %> <p  style="text-align: center; margin-top: 15px"><a href="<%=url%>/signInAccount" >Bạn chưa đăng nhập</a></p>
    <%}else{%>
    <%
        String name = account.getName();
        String phoneNumber = account.getPhoneNumber();
        String email = account.getEmail();
        String gender = account.getGender();
        Date birthDay = account.getBirthDay();
        String address = account.getAddress();
        String addressReceive = account.getAddressReceive();
        String res = (String) request.getAttribute("res");
        res =(res == null)?"":res;
    %>
    <form id="changeNam" onsubmit="return check()" action="changeInfo" method="post">
        <table>
            <thead>
            <tr>
                <td colspan ="4">
                    <h5 class = "pt-3 pb-1"> THAY ĐỔI THÔNG TIN </h5>
                    <p class="text-center w-100 mb-0 <%=(res.equals("Cập nhật thành công!"))?"text-success":"text-danger"%>" id="res"><%=res%></p>
                </td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td colspan="2">
                    <%
                        if (account.getVerifyAccount().isStateVerify()) {%>
                    <label class="w-100">Tài khoản đã xác thực <i class="fa fa-check-circle text-success" aria-hidden="true"></i></label>
                    <%} else {%>
                    <label class="w-100 ">Tài khoản của bạn chưa xác thực, <a href="<%=url%>/reVerifyCode">xác thực ngay</a></label>
                    <%}%>
                </td>
            </tr>
            <tr id="changeName">
                <td >
                    <label>Họ và tên <span class="text-danger">*</span></label>
                </td>
                <td class="w-50">
                    <div id="InName">
                        <input id="HienThiTen" name="TenHT" type="text" value="<%= name%>">
                    </div>
                </td>
            </tr>
            <tr id="changeSDT">
                <td>
                    <label> Số điện thoại <span class="text-danger">*</span></label>
                </td>
                <td>
                    <div id="InSDT">
                        <input id="HienThiSDT" name="SDTHT" type="text" value="<%=phoneNumber%>">
                    </div>
                </td>
            </tr>
            <tr id="changegGmail">
                <td>
                    <label>Email<span class="text-danger">*</span></label>
                </td>
                <td>
                    <div id="InGmail">
                        <input id="HienThiGmail" name="GmailHT" type="text" value="<%=email%>">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Giới tính<span class="text-danger">*</span></label>
                </td>
                <td >
                    <div class = "gender">
                        <label class="ms-0" for="male">Nam</label><input class="ms-2 me-3" type="radio" id="male" name="gender" value="Nam" <%= gender.equals("Nam") ? "checked" : "" %> >
                        <label for="female">Nữ</label> <input class="ms-2 me-3" type="radio" id="female" name="gender" value="Nữ" <%= gender.equals("Nữ") ? "checked" : "" %>>
                        <label for="other">Khác</label> <input class="ms-2 me-3" type="radio" id="other" name="gender" value="Khác" <%= gender.equals("Khác") ? "checked" : "" %>>
                    </div>
                </td>
            </tr>
            <tr id="changeNgaySinh">
                <td>
                    <label>Ngày sinh<span class="text-danger">*</span></label>
                </td>
                <td>
                    <div id="InNS">
                        <input id="HienThiNS" name="HienThiNS" type="date" value="<%=birthDay%>">
                    </div>
                </td>
            </tr>
            <tr id="changeDC">
                <td>
                    <label> Địa chỉ<span class="text-danger">*</span></label>
                </td>
                <td>
                    <div id="InDiaChi">
                        <input id="HienThiDC" name="DCHT" type="text" value="<%=address%>">
                    </div>
                </td>
            </tr>
            <tr id="changeDCReceive">
                <td>
                    <label> Địa chỉ nhận hàng<span class="text-danger">*</span></label>
                </td>
                <td>
                    <div id="">
                        <input id="HienThiDCReice" name="DCNHHT" type="text" value="<%=addressReceive%>">
                    </div>
                </td>
            </tr>
            <tr id="SubmitSB">
                <td colspan="2">
                    <div><button id="submit" name="SB" onclick="my_function()" style="color: white"> LƯU </button></div>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <%}%>
</div>
<script>
    $(document).ready(function () {
        var res = $('#res');
        if (res.text() === "Cập nhật thành công!") {
            res.addClass("text-success");
        } else {
            res.addClass("text-danger");
        }
    });
    function check() {
        var flag = true;
        var tenElement = document.getElementById("HienThiTen");
        var gmailElement = document.getElementById("HienThiGmail");
        var sdtElement = document.getElementById("HienThiSDT");
        var dcElement = document.getElementById("HienThiDC");
        var nsElement = document.getElementById("HienThiNS");
        var error = document.getElementById("res");

        var gmailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var phoneReg = /^\d{10}/;
        if(tenElement.value == "") {
            error.innerHTML = "Vui lòng nhập họ và tên!";
            flag = false;
        }else if(gmailElement.value == "") {
            error.innerHTML = "Vui lòng nhập Email!";
            flag = false;
        }else if(!gmailElement.value.match(gmailReg)) {
            error.innerHTML = "Email không hợp lệ!";
            flag = false;
        }else if(sdtElement.value == "") {
            error.innerHTML = "Vui lòng nhập số điện thoại!";
            flag = false;
        }else if(!sdtElement.value.match(phoneReg)) {
            error.innerHTML = "Số điện thoại không hợp lệ!";
            flag = false;
        }
        else if(dcElement.value == "") {
            error.innerHTML = "Vui lòng nhập địa chỉ!";
            flag = false;
        }else if(nsElement.value == "") {
            error.innerHTML = "Vui lòng chọn ngày sinh!";
            flag = false;
        }
        console.log(sdtElement.value);
        return flag;
    }
</script>
<script>
    if($('#res').text() === "Cập nhật thành công!") {
        setTimeout(function () {
            window.location.href = 'homepage';
        }, 2000);
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>