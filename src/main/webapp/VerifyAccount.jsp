<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/settingAll.css">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/fotter.css">
    <link rel="stylesheet" href="./css/authentic.css">
    <link rel="stylesheet" href="./css/changePassword.css">
</head>

<body>
<header>
    <jsp:include page="header.jsp"></jsp:include>

</header>
<main style="padding: 110px;">
    <section class="signup mt-5">
        <%
            String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
            String email = (String) request.getAttribute("email");
            String err = (String) request.getAttribute("errCode");
            email = (email == null) ? " " : email;
            err = (err == null) ? " " : err;
        %>
        <div class="contain">
            <div class="signup-content">
                <form id="verify-form" class="signup-form" action="<%=url%>/verifyAccount" method="post" onsubmit="return verifyAccount()">
                    <div class="text-end pe-4">
                        <% Object obj = session.getAttribute("account"); %>
                        <a class="text-decoration-none" href="<%=url%>/<%=(obj==null)?"signIn.jsp":"homepage"%>">Bỏ qua</a>
                    </div>
                    <img src="images/verify.jpg" alt="" width="400px">
                    <h5>Xác thực tài khoản của bạn</h5>
                    <div class="verify">
                        <p class="text-group" style="margin-bottom: 0">Chúng tôi đã gửi mã xác thực đến <span class="text-primary" id="email"><%=email%></span></p>
                        <input type="text" name="email" value="<%=email%>" class="d-none">
                        <p class="">Vui lòng nhập mã để xác thực tài khoản của bạn</p>
                        <p class="mb-0">Mã xác thực chỉ có hiệu lực trong vòng 10 phút</p>
                        <div class="form-group text-center">
                            <span class="text-danger" id="errVerify"><%=err%></span>
                            <input type="text" class="form-input" placeholder="Nhập mã xác thực ở đây" name="verify" id="verify"/>
                        </div>
                        <p class="text-group"><a href="<%=url%>/reVerifyCode?email=<%=email%>">Nhấn vào đây</a> để nhận lại mã xác thực</p>
                    </div>
                    <div class="form-group">
                        <button type="submit" id="confirm">XÁC NHẬN</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</main>

<footer>
    <jsp:include page="./Footer.jsp"></jsp:include>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    function verifyAccount() {
        var verifyVal = document.getElementById("verify");
        var error = document.getElementById("errVerify");
        var flag = true;
        if (verifyVal.value == "") {
            flag = false;
            error.innerHTML = '(*)Vui lòng nhập mã xác thực!';
        }
        return flag;
    }
</script>
</body>
</html>