<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
          integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/settingAll.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/fotter.css">
    <link rel="stylesheet" href="css/product_catalog.css">

</head>

<body>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<div class="is-medium">
    <div class="container"></div>
</div>

<main id="main">

    <div class="container">
        <div class="row category-page-row">
            <div class="col-lg-3 large-3">
                <div id="shop-sidebar" class="sidebar-inner">
                    <aside class="widget widget_aws_widget">
                        <div>
                            <form id="search-form">
                                <div class="search-input-container">
                                    <input type="search" name="s" id="search-input" class="aws-search-field"
                                           placeholder="Tìm kiếm sản phẩm" autocomplete="off"
                                           style="width: 100%; padding-right: 10px;" onkeyup="searchProduct()">
                                    <input type="hidden" name="post_type" value="product">
                                    <input type="hidden" name="type_aws" value="true">
                                    <div class="aws-loader"></div>
                                </div>
                                <div class="aws-search-btn">
            <span class="aws-search-btn_icon" aria-label="Tìm kiếm">
                <svg focusable="false" xmlns="http://www.w3.org/2000/svg"
                     viewBox="0 0 24 24" width="24">
                    <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                </svg>
            </span>
                                </div>
                            </form>
                        </div>


                     </aside>

                    <aside id="woocommerce_price_filter-15" class="widget woocommerce widget_price_filter">
                        <span class="widget-title shop-sidebar">Lọc theo giá</span>
                        <div class="is-divider small"></div>
                        <form>
                            <div class="price_slider_wrapper">
                                <div class="price_slider ">
                                    <div class="price_slider_range"></div>
                                    <div class="price_slider_handle" id="handle-left"></div>
                                    <div class="price_slider_handle" id="handle-right"></div>
                                </div>
                                <div class="price_slider_amount" data-step="10">
                                    <button type="submit" class="button button-loc">Lọc</button>
                                    <div class="price_label">
                                        Giá <span class="from">230.000₫</span> — <span class="to">1.350.000₫</span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </form>

                    </aside>
<%--                    <c:forEach var="listOk" items="${}"></c:forEach>--%>
                    <aside id="custom_html-5" class="widget_text widget widget_custom_html">
                        <div class="textwidget custom-html-widget">
                            <p><a href="" style="text-decoration: none; color: inherit; font-weight: bold;">Bánh Kem
                                Bento
                                Cake 80k</a></p>
                        </div>
                    </aside>
                    <aside id="custom_html-6" class="widget_text widget widget_custom_html">
                        <div class="textwidget custom-html-widget">
                            <p><a href="" style="text-decoration: none; color: inherit; font-weight: bold;">Bánh Kem
                                Mini
                                120k</a></p>
                        </div>
                    </aside>

                    <aside id="woocommerce_product_categories-15"
                           class="widget woocommerce widget_product_categories">


                        <ul class="product-categories">
                            <c:forEach var="listCate" items="${listCate}">

                                <li class="cat-item" data-category="banh_cac_ngay_le">
                                    <a href="#" onclick="loadProductByIdCate(${listCate.id})">${listCate.name}</a>
                                </li>

                            </c:forEach>

                        </ul>

                    </aside>

                </div>
            </div>
            <div class="col large-9">
                <div class="shop-container">
                    <div class="products row  row-small large-columns-4 medium-columns-3 small-columns padding-p"
                         id="content">
                        <c:forEach var="product_list" items="${listProductRandom}">
                            <div class="col">
                                <div class="col-inner">
                                    <div class="product-small box">
                                        <div class="box-image">
                                            <a href="#" class="product-link" >
<%--                                                <img width="247" height="296" src="${product_list.image}" alt="${product_list.name}">--%>
                                            </a>
                                        </div>
                                        <div class="box-text text-center">
                                            <div class="title-wrapper">
                                                <p>
                                                    <a href="#" onclick="saveProductData('${productData}')">${product_list.id} - ${product_list.nameProduct}</a>
                                                </p>
                                            </div>
                                            <div class="price-wrapper">
                    <span class="price">
                        <span class="woocommerce-Price-amount amount">
                            <bdi style="font-weight: bold;">${product_list.price}</bdi>
                        </span>
                    </span>
                                            </div>
                                            <div class="add-to-cart-button">
                                                <a href="#" onclick="saveProductData('${productData}')">THÊM VÀO GIỎ</a>
                                            </div>
                                            <div class="product-description" style="display:none;">
                                                <span class="description-id">Mã: <span class="sku">${product_list.id}</span></span>
<%--                                                <span class="description-content">Mô tả: <br>${product_list.description}</span>--%>
                                            </div>
                                            <div class="size-wrapper" style="display:none;">
<%--                                                <p ><strong>Đường kính:</strong> ${product_list.diameter}</p> <!-- Hiển thị đường kính -->--%>
<%--                                                <p><strong>Chiều cao:</strong> ${product_list.height}</p> <!-- Hiển thị chiều cao -->--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>


                </div>
            </div>
        </div>
    </div>
</main>
<footer>
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
                <li><a href="pages/deliveryPolicy.html">Chính sách đổi, trả,hoàn tiền</a></li>
                <li><a href="/pages/chinh-sach-giao-dich-thanh-toan">Chính sách bảo mật</a></li>
                <li><a href="/pages/chinh-sach-doi-tra">Hướng dẫn thanh toán</a></li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="ft-copyright">
            Copyrights © 2024 by <a target="_blank" href="../pages/home.html" title="Đi tới Trang Chủ">IT Cake</a>.
            <!--blank chuyển trang ở tab mới-->
        </div>
    </div>
</footer>

<%--<script src="js/productcatalog.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    function loadProductByIdCate(idCate) {
        $.ajax({
            url: "LoadProductByIdCate",
            method: "GET",
            data: {
                cid: idCate
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },


        });

    }
    function searchProduct() {
        const searchQuery = document.getElementById('search-input').value.trim(); // Lấy giá trị từ ô tìm kiếm và loại bỏ khoảng trắng đầu/cuối
        if (searchQuery.length >= 1) {  // Chỉ tìm kiếm khi người dùng gõ ít nhất 3 ký tự
            $.ajax({
                url: "LoadProductByNameServlet",  // Địa chỉ của servlet xử lý tìm kiếm
                method: "GET",
                data: { name: searchQuery },  // Gửi tên sản phẩm để tìm kiếm
                success: function(response) {
                    // Cập nhật danh sách sản phẩm trong trang mà không cần tải lại toàn bộ
                    const productContainer = document.getElementById("content");
                    productContainer.innerHTML = response;
                },
                error: function() {
                    console.error('Có lỗi xảy ra khi tìm kiếm.');
                }
            });
        }
    }


</script>

</body>

</html>