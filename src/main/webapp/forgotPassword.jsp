<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên Mật Khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/forgotPassword.css">
</head>

<body>
    <main id="mainContent">
        <div class="container container1">
            <a href="../homepage.jsp" class="close-btn" title="Quay lại trang chủ">
                <i class="bi bi-x-circle-fill"></i>
            </a>
            <h2>Quên Mật Khẩu</h2>
            <form id="forgotPasswordForm" onsubmit="return handleFormSubmit(event)">
                <label for="fname" class="required">Tên đăng nhập</label>
                <input type="text" id="fname" name="username" placeholder="Nhập tên đăng nhập" required>

                <label for="email" class="required">Email</label>
                <input type="email" id="email" name="email" placeholder="Nhập email" required>

                <button class="button1" type="submit">Xác Nhận</button>
            </form>
        </div>
    </main>
    <script>
        function handleFormSubmit(event) {
            event.preventDefault();
            const mainContent = document.getElementById("mainContent");
            mainContent.innerHTML = `
                <div class="alert alert-success text-center">
                    <p>Mật khẩu mới của bạn đã được gửi về Mail. <a href="SignIn.html">Đăng Nhập</a></p>
                </div>
            `;
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>