<%@ page import="com.edu.hcmuaf.fit.model.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.edu.hcmuaf.fit.model.Account" %>
<%@ page import="com.edu.hcmuaf.fit.model.Cart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Header</title>
</head>
<body>

<%  String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>
<%  Cart cart = (Cart) session.getAttribute("Cart");
    int qtt = (cart != null) ? cart.list().size() : 0;
    String quantityItem = qtt + "";
    if (qtt > 99) quantityItem = "99+";
%>
<% Object obj = session.getAttribute("account");
    Account account = null;%>
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
                    <a href="./homepage.jsp">
                        <img src="./image/imghomepage/logo/logo1.jpg" alt="" class="img-logo-detail">

                    </a>
                </div>
                <div class=" col-sm-4 col-md-8 col-lg-11 d-flex justify-content-between align-items-center "
                     style="width: 87%; height: 100%;">
                    <ul class=" nav d-flex  list-item" style="margin-left: 10px; width: 25%;">



                        <a href=<%=url%>/homepage>
                            <li>Trang chủ</li>
                        </a>
                        <div class="dropdown  " style=" display:flex; align-items: center;  height: 100%; " >
                            <a href="<%=url%>/CateController-servlet" data-id="2">
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
                        <a href="./introWebsite.jsp">
                            <li>Giới thiệu</li>
                        </a>

                    </ul>
                    <div style="position: relative; width: 45%; margin-right: 20px;">
                        <form action="<%=url%>/LoadProductByName" method="get" style="width: 100%;">
                            <input type="search" id="keyword" class="form-control autocomplete-field js-ls"
                                   placeholder="Tìm kiếm bánh sinh nhật,..." autocomplete="off"
                                   name="search"
                                   style="width: 100%; padding-right: 40px; padding-left: 10px; font-size: 16px; height: 33px;">
                            <button type="submit" style="all: unset; position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;"
                                    data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
                                    aria-controls="navbarTogglerDemo01" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                <i class="fa-solid fa-magnifying-glass" style="color: gray; font-size: 16px;"></i>
                            </button>
                        </form>
                    </div>

                    <div class="d-flex">
                        <div class="row balance-row">
                            <div class="bag-shop">
                                <div class="col1 d-flex justify-content-between" style="gap: 10px;">
                                    <i class="fa-solid fa-bag-shopping" style="font-size: 25px;"></i>
                                    <button id="cart-button" class="col1 text"
                                            style="background: none; border: none; cursor: pointer;">
                                        GIỎ HÀNG
                                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                            <%=quantityItem%>
                                            <span class="visually-hidden">unread messages</span>
                                        </span>
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
                                            <%
                                                if (obj == null) {
                                            %>
                                            <li><a class="dropdown-item" href="<%=url%>/signIn.jsp">Đăng nhập</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/signUp.jsp">Đăng kí</a></li>
                                            <%
                                            } else {
                                                account = (Account) obj;
                                                if ((account != null) && (account.getRole() == 0 )) {
                                            %>
                                            <li class="dropdown-item">Xin chào: <span class="fw-bold name"><%=account.getName()%></span></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/manageAdmin">Quản lý</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/changeInformation">Thay đổi thông tin</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/changePassword">Đổi mật khẩu</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/signOut">Đăng xuất</a></li>
                                            <%
                                            } else {
                                            %>
                                            <li class="dropdown-item">Xin chào: <span class="fw-bold name"><%=account.getName()%></span></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/history">Lịch sử mua hàng</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/changeInformation.jsp">Thay đổi thông tin</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/changePassword.jsp">Đổi mật khẩu</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/signOut">Đăng xuất</a></li>
                                            <%
                                                    }
                                                }
                                            %>
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
<script>
    $(document).ready(function(){
        var placeholderText = "Tìm kiếm sản phẩm theo tên";
        var inputElement = $(".search");
        var currentIndex = 0;

        function updatePlaceholder() {
            var currentText = placeholderText.substring(0, currentIndex);
            inputElement.attr("placeholder", currentText);
            currentIndex = (currentIndex + 1) % (placeholderText.length + 1);
        }

        // set interval để lặp lại sau mỗi 100ms
        var intervalId = setInterval(updatePlaceholder, 100);

        // stop hành động lặp khi ấn vào
        inputElement.focus(function(){
            clearInterval(intervalId);
            inputElement.attr("placeholder", placeholderText);
        });

        // restart lại hành động lặp khi không ấn vào nữa
        inputElement.blur(function(){
            currentIndex = 0;
            intervalId = setInterval(updatePlaceholder, 100);
        });
    });
</script>
</html>
