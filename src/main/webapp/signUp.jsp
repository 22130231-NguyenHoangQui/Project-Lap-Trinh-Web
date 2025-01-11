<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng kí</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/settingAll.css">
    <link rel="stylesheet" href="css/signUp.css">
</head>

<body>

    <main>
        <div class="container container1 ">
            <a href="homepage.jsp" class="close-btn" title="Quay lại trang chủ">
                <i class="bi bi-x-circle-fill"></i>
            </a>
            <h2>Đăng Kí</h2>
            <form id="signup-form">
                <div class="info-login">
                    <span class="info">Thông Tin Đăng Nhập</span>
                    <div class="form-group form1">
                        <label for="username" class="required">Tên đăng nhập</label>
                        <div class="wrapper">
                            <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
                            <span id="errUser"></span>
                        </div>
                    </div>

                    <div class="form-group form1 login">
                        <label for="password" class="required">Mật khẩu</label>
                        <div class="wrapper">
                            <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
                            <span id="errPW"></span>
                        </div>
                    </div>

                    <div class="form-group form1">
                        <label for="confirm-password" class="required">Nhập lại mật khẩu</label>
                        <div class="wrapper">
                            <input type="password" id="confirm-password" name="confirm_password"
                                placeholder="Nhập lại mật khẩu" required>
                            <span id="errRePW"></span>
                        </div>
                    </div>
                </div>

                <div class="info-customer">
                    <span class="info">Thông Tin Khách Hàng</span>
                    <div class="form-group form1">
                        <label for="fname" class="required">Họ và tên</label>
                        <div class="wrapper">
                            <input type="text" id="fname" name="ho_ten" placeholder="Nhập họ và tên" required>
                            <span id="errName"></span>
                        </div>
                    </div>

                    <div class="form-group form1">
                        <label for="sdt" class="required">Số điện thoại</label>
                        <div class="wrapper">
                            <input type="text" id="sdt" name="so_dien_thoai" placeholder="Nhập số điện thoại" required>
                            <span id="errTell"></span>
                        </div>
                    </div>

                    <div class="form-group form1">
                        <label for="email" class="required">Email</label>
                        <div class="wrapper">
                            <input type="email" id="email" name="email" placeholder="Nhập Email" required>
                            <span id="errEmail"></span>
                        </div>
                    </div>

                    <div class="form-group form1">
                        <label class="lgender">Giới tính</label>
                        <div class="wrapper-gender">
                            <label><input type="radio" name="gender" checked> Nam</label>
                            <label><input type="radio" name="gender"> Nữ</label>
                            <label><input type="radio" name="gender"> Khác</label>
                        </div>
                    </div>

                    <div class="form-group form1">
                        <label for="date" class="required">Ngày sinh</label>
                        <div class="wrapper">
                            <input type="date" id="date" name="ngay_sinh" required>
                            <span id="errDate"></span>
                        </div>
                    </div>

                    <div class="form-group form1">
                        <label for="address" class="required">Địa chỉ</label>
                        <div class="wrapper">
                            <input type="text" id="address" name="dia_chi" placeholder="Nhập địa chỉ" required>
                            <span id="errAd"></span>
                        </div>
                    </div>

                    <div class="form-group form1">
                        <label for="receive" class="required">Địa chỉ nhận hàng</label>
                        <div class="wrapper">
                            <input type="text" id="receive" name="dia_chi_nhan_hang"
                                placeholder="Nhập địa chỉ nhận hàng" required>
                            <span id="errAdRecei"></span>
                        </div>
                    </div>
                </div>

                <div class="form-terms">
                    <input id="acp" type="checkbox" id="terms" name="terms" required>
                    <div class="wrapper">
                        <label for="terms">Bạn đồng ý với các điều khoản của chúng tôi</label>
                        <span id="errAcp"></span>
                    </div>
                </div>

                <button class="button-real" type="submit">Xác Nhận</button>
            </form>
        </div>
    </main>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script src="js/signUp.js"></script>
</body>

</html>