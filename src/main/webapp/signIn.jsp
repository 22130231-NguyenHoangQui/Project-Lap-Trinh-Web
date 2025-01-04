<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <main>
        <div class="container container1">
            <a href="homepage.jsp" class="close-btn" title="Quay lại trang chủ">
                <i class="bi bi-x-circle-fill"></i>
            </a>
            <img src="image/imghomepage/logo/logo1.jpg" class="img-logo1" alt="logo-page">
            <h2 class="title-form">Đăng Nhập</h2>
            <div id="error-message" class="error-message">Tài khoản hoặc mật khẩu không chính xác!</div>
            <form id="login-form">
                <input type="text" id="username" name="username" placeholder="Tên đăng nhập" required>
                <input type="password" id="password" name="password" placeholder="Mật khẩu" required>
                <button type="submit" class="button-submit">Đăng Nhập</button>
            </form>
            <a href="pages/forgotPassword.html" class="forgot">Quên mật khẩu?</a>
            <div class="footer">
                <p>Bạn chưa có tài khoản? <a href="signUp.jsp">Đăng ký</a></p>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="js/signIn.js"></script>
</body>

</html>
