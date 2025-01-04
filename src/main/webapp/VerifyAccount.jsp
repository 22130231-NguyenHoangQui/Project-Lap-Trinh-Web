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
    <link rel="stylesheet" href="../css/settingAll.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/fotter.css">
    <link rel="stylesheet" href="../css/authentic.css">
</head>

<body  >
<header>
    <jsp:include page="./header.jsp"></jsp:include>
</header>
<main style="padding: 110px;">
    <div class="container">
        <div class="verification-box">
            <a href="../homepage.jsp" class="skip-button">Bỏ qua</a>
            <div class="icon icon1">
                <i class="fas fa-envelope"></i>
            </div>
            <h2>Xác thực tài khoản của bạn</h2>
            <p>Vui lòng kiểm tra email của bạn để lấy mã xác thực và nhập mã đó để xác thực tài khoản.</p>
            <form action="#" method="POST">
                <input type="text" placeholder="Nhập mã xác thực" required>
                <button type="button" class="confirm-button"
                        onclick="window.location.href='successfulAuthentic.html'">Xác Nhận</button>
            </form>
        </div>
    </div>
</main>

<footer >
    <div class="footer-top">
        <div class="ft-uniform">
            <h6>GIỚI THIỆU</h6>
            <div class="is-divider"></div>
            <div class="ft-introduce">
                <p><a href="../pages/home.html" title="Đi tới Trang Chủ">IT Cake</a> – Bánh sinh nhật đậm chất riêng
                    của bạn, chúng tôi tự hào mang đến những chiếc bánh sinh
                    nhật tươi ngon, thiết kế độc đáo và sáng tạo theo yêu cầu. Hãy để IT Cake cùng bạn tạo nên những
                    khoảnh khắc ngọt ngào và đáng nhớ nhất.</p>
                <div class="ft-img">
                    <a href="//theme.hstatic.net/1000313040/1000406925/14/hg_img1.png?v=2177"
                       data-fancybox="home-gallery-images" data-caption=""><img
                            src="//theme.hstatic.net/1000313040/1000406925/14/hg_img_thumb1.png?v=2177" alt=""></a>
                </div>
            </div>
        </div>
        <div class="ft-uniform">
            <h6>LIÊN HỆ</h6>
            <div class="is-divider"></div>
            <div class="ft-contact">
                <div class="ft-contact-address">
                    <i class="bi bi-geo-alt-fill" aria-hidden="true"></i> Đại Học Nông Lâm TP.Hồ Chí Minh, Phường
                    Linh
                    Trung, Q.Thủ Đức, TP.Hồ Chí Minh
                </div>
                <div class="ft-contact-tel">
                    <i class="bi bi-telephone-fill" aria-hidden="true"></i><a href="tel:#"> 0123 456 789</a>
                </div>
                <div class="ft-contact-email">
                    <i class="bi bi-envelope-fill" aria-hidden="true"></i><a href="#"> itcake@gmail.com</a>
                </div>
                <div class="ft-contact-facebook">
                    <i class="bi bi-facebook" aria-hidden="true"></i><a href="#"> www.facebook-itcake.com</a>
                </div>
            </div>
        </div>
        <div class="ft-uniform">
            <h6>CHÍNH SÁCH</h6>
            <div class="is-divider"></div>
            <ul class="ft-policy">
                <li><a href="../pages/deliveryPolicy.html">Chính sách đổi, trả,hoàn tiền</a></li>
                <li><a href="/pages/chinh-sach-giao-dich-thanh-toan">Chính sách bảo mật</a></li>
                <li><a href="/pages/chinh-sach-doi-tra">Hướng dẫn thanh toán</a></li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="ft-copyright">
            Copyrights © 2024 by <a target="_blank" href="../homepage.jsp" title="Đi tới Trang Chủ">IT Cake</a>.
            <!--blank chuyển trang ở tab mới-->
        </div>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>