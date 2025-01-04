<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chào mừng đến với IT Cakes</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- File CSS -->
    <link rel="stylesheet" href="css/introWebsite.css">
    <link rel="stylesheet" href="css/fotter.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
    <header>
        <jsp:include page="./header.jsp"></jsp:include>
    </header>

    <!-- Thanh điều hướng -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <div class="d-flex justify-content-center my-4">
                <ul class="nav nav-tabs" id="navbarNav" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link active" id="about-tab" data-bs-toggle="tab" href="#about" role="tab">Giới thiệu</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a class="nav-link" id="policy-tab" href="deliveryPolicy.jsp" role="tab">Chính sách </a>
                    </li>
                   
                </ul>
            </div>
        </div>
    </nav>

    <!-- Nội dung các tab -->
    <div class="tab-content main">
        <!-- Phần giới thiệu -->
        <div class="tab-pane fade show active" id="about" role="tabpanel" aria-labelledby="about-tab">
            <header class="hero py-5 text-center bg-light">
                <div class="container">
                    <h1 class="display-4 fw-bold text-primary">
                        <i class="fas fa-birthday-cake"></i> Hãy ăn mừng khoảnh khắc với những chiếc bánh của chúng tôi
                    </h1>
                    <p class="lead text-secondary">
                        Ngon miệng, đẹp mắt và làm từ tâm, bánh của chúng tôi là lựa chọn hoàn hảo cho mọi dịp đặc biệt!
                    </p>
                </div>
            </header>
            <section class="py-5 bg-white">
                <div class="container text-center">
                    <h2 class="fw-bold mb-4 text-success">
                        <i class="fas fa-info-circle"></i> Về chúng tôi
                    </h2>
                    <p class="text-muted fs-5">
                        Tại <span class="fw-bold text-primary">IT Cakes</span>, chúng tôi chuyên tạo ra những chiếc bánh tuyệt đẹp cho các bữa tiệc sinh nhật, 
                        đám cưới và các sự kiện đặc biệt. Mỗi chiếc bánh được làm từ nguyên liệu cao cấp và thiết kế để tạo nên những kỷ niệm khó quên.
                    </p>
                </div>
            </section>
        </div>       

    </div>

    <!-- Chân trang -->
    <footer>
            <!-- Footer Top -->
            <div class="footer-top">
                <!-- Giới thiệu -->
                <div class="ft-uniform">
                    <h6>GIỚI THIỆU</h6>
                    <div class="is-divider"></div>
                    <div class="ft-introduce">
                        <p>
                            <a href="../pages/home.html" title="Đi tới Trang Chủ">IT Cake</a> – Bánh sinh nhật đậm chất riêng của bạn. Chúng tôi tự hào mang đến những chiếc bánh sinh nhật tươi ngon, thiết kế độc đáo và sáng tạo theo yêu cầu.
                            Hãy để IT Cake cùng bạn tạo nên những khoảnh khắc ngọt ngào và đáng nhớ nhất.
                        </p>
                        <div class="ft-img">
                            <a href="//theme.hstatic.net/1000313040/1000406925/14/hg_img1.png?v=2177"
                               data-fancybox="home-gallery-images" data-caption="">
                                <img src="//theme.hstatic.net/1000313040/1000406925/14/hg_img_thumb1.png?v=2177" alt="Hình ảnh IT Cake">
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Liên hệ -->
                <div class="ft-uniform">
                    <h6>LIÊN HỆ</h6>
                    <div class="is-divider"></div>
                    <div class="ft-contact">
                        <div class="ft-contact-address">
                            <i class="bi bi-geo-alt-fill" aria-hidden="true"></i>
                            Đại Học Nông Lâm TP.Hồ Chí Minh, Phường Linh Trung, Q.Thủ Đức, TP.Hồ Chí Minh
                        </div>
                        <div class="ft-contact-tel">
                            <i class="bi bi-telephone-fill" aria-hidden="true"></i>
                            <a href="tel:#">0123 456 789</a>
                        </div>
                        <div class="ft-contact-email">
                            <i class="bi bi-envelope-fill" aria-hidden="true"></i>
                            <a href="mailto:itcake@gmail.com">itcake@gmail.com</a>
                        </div>
                        <div class="ft-contact-facebook">
                            <i class="bi bi-facebook" aria-hidden="true"></i>
                            <a href="#">www.facebook-itcake.com</a>
                        </div>
                    </div>
                </div>
                <!-- Chính sách -->
                <div class="ft-uniform">
                    <h6>CHÍNH SÁCH</h6>
                    <div class="is-divider"></div>
                    <ul class="ft-policy">
                        <li><a href="deliveryPolicy.jsp">Chính sách đổi, trả,hoàn tiền</a></li>
                        <li><a href="/pages/chinh-sach-giao-dich-thanh-toan">Chính sách bảo mật</a></li>
                        <li><a href="/pages/chinh-sach-doi-tra">Hướng dẫn thanh toán</a></li>
                    </ul>
                </div>
            </div>
            <!-- Footer Bottom -->
            <div class="footer-bottom">
                <div class="ft-copyright">
                    Copyrights © 2024 by
                    <a target="_blank" href="homepage.jsp" title="Đi tới Trang Chủ">IT Cake</a>.
                </div>
            </div>

    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/homepage.js"></script>
</body>
</html>
