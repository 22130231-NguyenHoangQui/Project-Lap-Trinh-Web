<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử mua hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/settingAll.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/fotter.css">
        <link rel="stylesheet" href="css/HistoryBuy.css">
    <style>
          html, body {
        height: 100%;
        margin: 0;
    }
    
    body {
        display: flex;
        flex-direction: column;
    }
    
    main {
        flex: 1; 
    } 
    </style>
</head>

<body>
    <header>
        <div class="header-wrapper">
            <div class="header-top">
                <div class="container d-flex justify-content-between align-items-center">
                    <div class="d-flex flex-col flex-left">
                        <ul class="nav nav-left nav-small">

                            <li class="html li-first delivery-info">Đặt bánh lấy ngay tại Thành phố Hồ Chí Minh</li>
                            <li class="html li-first">Hệ thống bánh sinh nhật chính hãng</li>
                            <li class="html li-first">Hotline: 01234576789</li>
                        </ul>
                    </div>
                    <div class="flex-col hide-for-medium flex-right">
                        <ul class="nav top-bar-nav nav-right nav-small  nav-divided">
                            <li class="html header-social-icons ">
                                <div class="social-icons follow-icons">
                                    <a href="" class="button icon circle">
                                        <i class="fa-brands fa-facebook" style=" margin-right: auto;"></i>
                                    </a>
                                    <a href="" class="button icon circle">

                                        <i class="fa-brands fa-instagram"></i>
                                    </a>
                                    <a href="" class="button icon circle">

                                        <i class="fa-regular fa-envelope"></i>
                                    </a>
                                    <a href="" class="button icon circle">

                                        <i class="fa-solid fa-phone"></i>
                                    </a>

                                    <a href="" class="button icon circle">

                                        <i class="fa-brands fa-pinterest"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="header-center color-header-center ">
            <div class="container d-flex" style="width: 100%;">
                <div class="row row-center d-flex justify-content-between  align-items-center">
                    <div class="col-sm-1 col-md-1 col-lg-1 img-logo"
                        style="display: block; width: 10%; padding-left: 10px;">
                        <a href="../pages/HomePage.html">
                            <img src="../image/imghomepage/logo/logo1.jpg" alt="" class="img-logo-detail">

                        </a>
                    </div>
                    <div class=" col-sm-4 col-md-8 col-lg-11 d-flex justify-content-between align-items-center "
                        style="width: 87%; height: 100%;">
                        <ul class=" nav d-flex  list-item"
                            style="margin-left: 10px;width: auto; flex-wrap: nowrap; text-wrap: nowrap;">



                            <a href="homepage.jsp">
                                <li>Trang chủ</li>
                            </a>
                            <div class="dropdown" style=" display:flex; align-items: center;  height: 100%; ">
                                <a href="ProductCatalog.jsp" data-id="2">
                                    <li>Danh mục</li>

                                </a>
                                <ul class="dropdown-menu menu-danhmuc">
                                    <p
                                        style="text-wrap: nowrap; padding: 0 10px; font-weight: bold; background-color: white;">
                                        Danh mục bánh sinh nhật</p>
                                    <li><a href="#" class="product-link" data-category="banh_an_nhe">Bánh Ăn
                                            Nhẹ</a></li>
                                    <li><a href="#" data-category="banh_cac_ngay_le">Bánh Các Ngày Lễ</a></li>
                                    <li><a href="#" data-category="banh_chai_ruou">Bánh Chai Rượu Và Ly
                                            Bia Sang Trọng</a></li>
                                    <li><a href="#" class="product-link" data-category="banh_chu_nhat">Bánh Chủ
                                            Nhật</a>
                                    </li>
                                    <li><a href="#" data-category="banh_cong_chua">Bánh Công Chúa</a>
                                    </li>
                                    <li><a href="#" data-category="banh_giang_sinh">Bánh Giáng Sinh
                                            (Noel)</a></li>
                                    <li><a href="#" data-category="banh_hoa_qua_tuoi">Bánh Hoa Quả Tươi
                                            Theo Mùa</a></li>
                                    <li><a href="#" data-category="banh_khung_long">Bánh Khủng Long</a>
                                    </li>
                                    <li><a href="#" data-category="banh_ki_niem_ngay">Bánh Kỉ niệm ngày
                                            cưới</a></li>
                                    <li><a href="#" data-category="banh_lich">Bánh Lịch</a></li>
                                    <li><a href="#" data-category="banh_mousse">Bánh Mousse</a></li>

                                </ul>
                            </div>
                            <a href="introWebsite.jsp">
                                <li>Giới thiệu</li>
                            </a>

                        </ul>
                        <div style="position: relative; width: 45%; margin-right: 20px;">
                            <input type="search" id="keyword" class="form-control autocomplete-field js-ls"
                                placeholder="Tìm kiếm bánh sinh nhật,..." autocomplete="off"
                                style="width: 100%; padding-right: 40px; padding-left: 10px; font-size: 16px; height: 33px;">

                            <i class="fa-solid fa-magnifying-glass"
                                style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); color: gray; font-size: 16px; cursor: pointer;"></i>
                        </div>







                        <div class="d-flex">
                            <div class="row balance-row">
                                <div class="bag-shop">
                                    <div class="col1 d-flex justify-content-between" style="gap: 10px;">
                                        <i class="fa-solid fa-bag-shopping"></i>
                                        <button id="cart-button" class="col1 text"
                                            style="background: none; border: none; cursor: pointer;">
                                            GIỎ HÀNG
                                        </button>

                                    </div>

                                    <div class="col1">
                                        <div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button"
                                                id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                                Tài Khoản
                                            </button>
                                            <ul class="dropdown-menu account-dropdown-menu"
                                                aria-labelledby="dropdownMenuButton">
                                                <li><a class="dropdown-item" href="SignIn.html">Đăng Nhập</a></li>
                                                <li><a class="dropdown-item" href="SignUp.html">Đăng Ký</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </header>
    <main style="padding: 100px;">
        <div class="container my-5">
            <h2 class="text-lg font-semibold mb-4">Lịch sử mua hàng</h2>

            <!-- Nút lọc trạng thái -->
            <div class="status-buttons mb-3">
                <button class="btn btn-primary active" onclick="filterOrders('pending')">Chờ xác nhận</button>
                <button class="btn btn-secondary" onclick="filterOrders('confirmed')">Đã xác nhận</button>
                <button class="btn btn-danger" onclick="filterOrders('cancelled')">Đã hủy</button>
            </div>

            <!-- Bảng danh sách đơn hàng -->
            <table class="table table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Mã hóa đơn</th>
                        <th scope="col">Ngày mua</th>
                        <th scope="col">Tổng tiền</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Hành động</th>
                    </tr>
                </thead>
                <tbody id="orders">
                    <!-- Danh sách đơn hàng sẽ được render từ script.js -->
                </tbody>
            </table>

            <!-- Phần hiển thị chi tiết đơn hàng -->
            <div id="orderDetails" class="details" style="display: none;">
                <h5>Chi tiết hóa đơn</h5>
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <th>Mã hóa đơn</th>
                            <td id="orderId"></td>
                        </tr>
                        <tr>
                            <th>Ngày mua</th>
                            <td id="orderDate"></td>
                        </tr>
                        <tr>
                            <th>Tổng tiền</th>
                            <td id="orderTotal"></td>
                        </tr>
                        <tr>
                            <th>Sản phẩm</th>
                            <td>
                                <ul id="orderItems" style="list-style-type: none; padding: 0; margin: 0;"></ul>
                            </td>
                        </tr>
                        <tr>
                            <th>Ảnh sản phẩm</th>
                            <td>
                                <img id="orderImage" src="../image/imghomepage/product/product_danhmuc/2.webp" alt="Ảnh sản phẩm" style="max-width: 100%; height: auto;">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
        </div>
        
    </main>
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
                        <a href="../pages/home.html" title="Đi tới Trang Chủ">IT Cake</a> – Bánh sinh nhật đậm chất
                        riêng của bạn. Chúng tôi tự hào mang đến những chiếc bánh sinh nhật tươi ngon, thiết kế độc đáo
                        và sáng tạo theo yêu cầu.
                        Hãy để IT Cake cùng bạn tạo nên những khoảnh khắc ngọt ngào và đáng nhớ nhất.
                    </p>
                    <div class="ft-img">
                        <a href="//theme.hstatic.net/1000313040/1000406925/14/hg_img1.png?v=2177"
                            data-fancybox="home-gallery-images" data-caption="">
                            <img src="//theme.hstatic.net/1000313040/1000406925/14/hg_img_thumb1.png?v=2177"
                                alt="Hình ảnh IT Cake">
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
    <script src="js/HistoryBuy.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>