<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.edu.hcmuaf.fit.model.Product" %>
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
<%
    ArrayList<Product> listProduct = (ArrayList<Product>) request.getAttribute("listProductByName");
    System.out.println("Lowest Price: " + request.getAttribute("lowestPrice"));
    System.out.println("Highest Price: " + request.getAttribute("highestPrice"));
%>


<main id="main">

    <div class="container">
        <div class="row category-page-row">
            <div class="col-lg-3 large-3">
                <div id="shop-sidebar" class="sidebar-inner">
                    <aside class="widget widget_aws_widget">
                        <div>
                            <div class="aws-search-btn">
                                <form id="search-form">

                                    <div class="search-input-container">
                                        <input type="search" name="s" id="search-input" class="aws-search-field"
                                               placeholder="Tìm kiếm sản phẩm" autocomplete="off"
                                               style="width: 100%; padding-right: 10px;" onkeyup="searchProduct()">
                                        <input type="hidden" name="type_aws" value="true">
                                        <div class="aws-loader"></div>
                                        <input type="hidden" name="post_type" value="product">
                                    </div>
                                </form>
                                <span class="aws-search-btn_icon" aria-label="Tìm kiếm">
                <svg focusable="false" xmlns="http://www.w3.org/2000/svg"
                     viewBox="0 0 24 24" width="24">
                    <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                </svg>
            </span>
                            </div>
                        </div>


                    </aside>

                    <aside id="woocommerce_price_filter-15" class="widget woocommerce widget_price_filter">
                        <span class="widget-title shop-sidebar">Lọc theo giá</span>
                        <div class="is-divider small"></div>
                        <form >
                            <div class="price_slider_wrapper">
                                <div class="price_slider ">
                                    <div class="price_slider_range"></div>
                                    <div class="price_slider_handle" id="handle-left"></div>
                                    <div class="price_slider_handle" id="handle-right"></div>
                                </div>
                                <div class="price_slider_amount" data-step="10">
                                    <button type="submit" class="button button-loc">Lọc</button>
                                    <div class="price_label">
                                        Giá <span class="from">100000.00</span> — <span class="to">10000000381.00</span>
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
                            <%ArrayList<Product> product_list1  = (ArrayList<Product>) request.getAttribute("listProductRandom");
                            if(!product_list1.isEmpty() || product_list1 != null) {
                                for (Product product_list : product_list1) {
                            %>
                            <div class="col">
                                <div class="col-inner">
                                    <div class="product-small box">
                                        <div class="box-image">
                                            <a href="#" class="product-link">
                            <img width="247" height="296" src="<%=product_list.getProductImages().get(0).getImageId()%>" alt="<%=product_list.getNameProduct()%>">
                                            </a>
                                        </div>
                                        <div class="box-text text-center">
                                            <div class="title-wrapper">
                                                <p>
                                                    <a href="#"
                                                       onclick="saveProductData('${productData}')"><%=product_list.getId()%>
                                                        - <%=product_list.getNameProduct()%></a>
                                                </p>
                                            </div>
                                            <div class="price-wrapper">
                    <span class="price">
                        <span class="woocommerce-Price-amount amount">
                            <bdi style="font-weight: bold;"><%=product_list.getPrice()%></bdi>
                        </span>
                    </span>
                                            </div>
                                            <div class="add-to-cart-button">
                                                <a href="#" onclick="saveProductData('${productData}')">THÊM VÀO GIỎ</a>
                                            </div>
                                            <div class="product-description" style="display:none;">
                                                <span class="description-id">Mã: <span
                                                        class="sku"><%=product_list.getId()%></span></span>
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
                            <%
                                    }
                                }
                            %>

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
                <li><a href="deliveryPolicy.jsp">Chính sách đổi, trả,hoàn tiền</a></li>
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
<%--<script src="./js/productcatalog.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const filterForm = document.querySelector('#woocommerce_price_filter-15 form'); // Lấy form lọc theo giá
        if (filterForm) {
            const button = filterForm.querySelector('.button.button-loc'); // Lấy nút lọc
            if (button) {
                button.addEventListener('click', function (event) {
                    event.preventDefault(); // Ngừng hành động mặc định (reload trang)
                    filterByPrice(); // Gọi hàm lọc giá
                });
            } else {
                console.error("Nút lọc không tìm thấy trong form");
            }
        } else {
            console.error("Form lọc không tìm thấy");
        }
    });


    function filterByPrice() {
        var minPrice = document.querySelector('.price_label .from').innerText.replace(/[^0-9.-]+/g, "");
        var maxPrice = document.querySelector('.price_label .to').innerText.replace(/[^0-9.-]+/g, "");

        minPrice = parseFloat(minPrice);
        maxPrice = parseFloat(maxPrice);

        // Lọc lại sản phẩm trong content
        var products = document.querySelectorAll('.product-small'); // Lấy tất cả sản phẩm
        products.forEach(function(product) {
            var priceText = product.querySelector('.price bdi').innerText.replace(/[^0-9.-]+/g, ""); // Lấy giá của sản phẩm
            var price = parseFloat(priceText);

            if (price >= minPrice && price <= maxPrice) {
                product.style.display = "block"; // Hiển thị sản phẩm nếu giá nằm trong phạm vi
            } else {
                product.style.display = "none"; // Ẩn sản phẩm nếu giá không nằm trong phạm vi
            }
        });
    }

    document.addEventListener('DOMContentLoaded', function () {
        const leftHandle = document.getElementById('handle-left');
        const rightHandle = document.getElementById('handle-right');
        const priceRange = document.querySelector('.price_slider_range');
        const fromLabel = document.querySelector('.price_label .from');
        const toLabel = document.querySelector('.price_label .to');

        const minValue = Math.round(parseFloat('${lowestPrice}'));
        const maxValue = Math.round(parseFloat('${highestPrice}'));
        const step = 10000;

        let leftValue = minValue;
        let rightValue = maxValue;


        function updateSlider() {
            console.log('leftValue:', leftValue);
            console.log('rightValue:', rightValue);
            console.log('minValue:', minValue);
            console.log('maxValue:', maxValue);

            const rangeWidth = document.querySelector('.price_slider').offsetWidth;
            const leftPercent = ((leftValue - minValue) / (maxValue - minValue)) * 100;
            const rightPercent = ((rightValue - minValue) / (maxValue - minValue)) * 100;
            console.log('rangeWidth' ,rangeWidth);
            console.log('leftPercent:', leftPercent); // Log trực tiếp giá trị
            console.log('rightPercent:', rightPercent);


            if (priceRange) {
                priceRange.style.left = leftPercent + '%';  // Nối % vào giá trị của leftPercent
                priceRange.style.width = rightPercent - leftPercent + '%';

            }
            leftHandle.style.left = leftPercent + '%';
            rightHandle.style.left = 'calc(' + rightPercent + '% - 20px)';



            fromLabel.textContent = formatCurrency(leftValue);
            toLabel.textContent = formatCurrency(rightValue);
        }

        function formatCurrency(value) {
            return value.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
        }

        let isLeftDragging = false;
        let isRightDragging = false;

        leftHandle.addEventListener('mousedown', function () {
            console.log("Left handle mousedown");
            isLeftDragging = true;
        });

        rightHandle.addEventListener('mousedown', function () {
            console.log("Left handle mousedown");
            isRightDragging = true;

        });

        document.addEventListener('mousemove', function (e) {
            if (isLeftDragging || isRightDragging) {
                const sliderRect = document.querySelector('.price_slider').getBoundingClientRect();
                const mouseX = e.clientX - sliderRect.left;
                const sliderWidth = sliderRect.width;
                let newValue = ((mouseX / sliderWidth) * (maxValue - minValue)) + minValue;

                if (isLeftDragging) {
                    if (newValue < rightValue) {
                        leftValue = Math.max(minValue, Math.min(newValue, rightValue - step));
                        updateSlider();
                    }
                }

                if (isRightDragging) {
                    if (newValue > leftValue) {
                        rightValue = Math.min(maxValue, Math.max(newValue, leftValue + step));
                        updateSlider();
                    }
                }
            }
        });

        document.addEventListener('mouseup', function () {
            isLeftDragging = false;
            isRightDragging = false;
        });

        updateSlider();
    });

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

    function searchProduct(event) {
        if (event) {
            event.preventDefault();  // Ngừng hành động mặc định
        }
        const productContainer = document.getElementById("content");
        const searchQuery = document.getElementById('search-input').value.trim().toUpperCase();
        if (searchQuery === "") {
            const originalContent = document.getElementById("original-content").innerHTML;
            productContainer.innerHTML = originalContent;  // Đặt lại nội dung ban đầu
        } else if (searchQuery.length >= 2) {
            $.ajax({
                url: "/LoadProductByName-servlet",
                method: "GET",
                data: {s: searchQuery},
                success: function (response) {
                    console.log(productContainer);
                    productContainer.innerHTML = response;
                },
                error: function () {
                    console.error('Có lỗi xảy ra khi tìm kiếm.');
                }
            });
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        const productContainer = document.getElementById("content");
        const originalContent = productContainer.innerHTML;
        const hiddenDiv = document.createElement("div");
        hiddenDiv.id = "original-content";
        hiddenDiv.style.display = "none";  // Ẩn phần tử này
        hiddenDiv.innerHTML = originalContent;
        document.body.appendChild(hiddenDiv);  // Thêm vào body
    });
</script>

</body>

</html>
