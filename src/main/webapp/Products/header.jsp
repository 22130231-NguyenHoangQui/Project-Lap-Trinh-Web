<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
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
                    <ul class=" nav d-flex  list-item" style="margin-left: 10px; width: 25%;">



                        <a href="../pages/homepage.html" class="active">
                            <li>Trang chủ</li>
                        </a>
                        <div class="dropdown  " style=" display:flex; align-items: center;  height: 100%; " >
                            <a href="../pages/ProductCatalog.html" data-id="2">
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
                        <a href="../pages/introWebsite.html">
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

</body>
</html>
