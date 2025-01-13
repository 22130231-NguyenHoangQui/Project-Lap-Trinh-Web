<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
          integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/FW.css">

</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%
    String done = (String)request.getAttribute("done");
    if(done!=null){
%>
<div class="container p-0 mgt text-center fw-bold">Mật khẩu mới của bạn đã được gửi về Mail!<a href = <%=url%>/signIn.jsp>Đăng nhập</a></div>

<%
}else{
%>
<section class="signup mt-5">
    <!-- <img src="images/signup-bg.jpg" alt=""> -->
    <div class="contain">
        <div class="signup-content">
            <form  id="signup-form" class="signup-form" method="post" action="forgetPassword">
                <%
                    String username = (String)request.getAttribute("user_name");
                    username =(username == null)?"":username;
                    String email = (String)request.getAttribute("email");
                    email =(email == null)?"":email;
                    String errUserName = (String)request.getAttribute("errUserName");
                    errUserName =(errUserName == null)?"":errUserName;
                    String errEmail = (String)request.getAttribute("errEmail");
                    errEmail =(errEmail == null)?"":errEmail;
                %>
                <a href="<%=url%>/signInAccount" class="close-btn" title="Quay lại đăng nhập">
                    <i class="bi bi-x-circle-fill"></i>
                </a>
                <h5>QUÊN MẬT KHẨU</h5>
                <div class="form-SignUp">
                    <div class="form-group">
                        <label>Tên đăng nhập<span class="text-danger">*</span></label><span class="text-danger" id="errUser"><%=errUserName%></span>
                        <input type="text" class="form-input" placeholder="Nhập tên đăng nhập" name="user_name"
                               id="user_name" value="<%=username%>"/>
                    </div>
                    <div class="form-group">
                        <label>Email<span class="text-danger">*</span></label><span class="text-danger" id="errEmail"><%=errEmail%></span>
                        <input type="text" class="form-input" placeholder="Nhập Email" name="email" id="email" value="<%=email%>"/>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit">
                        XÁC NHẬN
                    </button>
                </div>
            </form>
        </div>
    </div>
</section>
<%
    }
%>
<script src="js/ForgetPW.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>