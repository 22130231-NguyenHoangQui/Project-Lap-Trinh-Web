<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.edu.hcmuaf.fit.model.Category" %>
<%@ page import="com.edu.hcmuaf.fit.model.Cart" %>
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
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<div class="is-medium">
    <div class="container"></div>
</div>
<%
    ArrayList<Product> listProduct = (ArrayList<Product>) request.getAttribute("listProductByName");
    ArrayList<Product> listProduct1;
    NumberFormat nF = NumberFormat.getCurrencyInstance();
    Cart cart = (Cart) session.getAttribute("Cart");

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
                                        Giá <span class="from">10000</span> — <span class="to">10000000</span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </form>

                    </aside>
                    <%
                        ArrayList<Category> listCateBanChay = (ArrayList<Category>) request.getAttribute("listCateOk");
                        for (Category c : listCateBanChay) {
                    %>
                    <aside id="custom_html-5" class="widget_text widget widget_custom_html">
                        <div class="textwidget custom-html-widget">
                            <p><a href="" style="text-decoration: none; color: inherit; font-weight: bold;"><%=c.getName()%></a></p>
                        </div>
                    </aside>
                    <%
                        }%>

                    <aside id="woocommerce_product_categories-15"
                           class="widget woocommerce widget_product_categories">


                        <ul class="product-categories">
                            <%
                                ArrayList<Category> listCate = (ArrayList<Category>) request.getAttribute("listCate");
                                for (Category listCate1 : listCate) {
                            %>
                            <li class="cat-item" data-category="banh_cac_ngay_le">
<%--                                <a href="#" >${listCate1.}</a>--%>
                                <a href="" onclick="loadProductByIdCate(<%=listCate1.getId()%>)"><%=listCate1.getName()%></a>

                            </li>

                            <% } %>

                        </ul>

                    </aside>

                </div>
            </div>

            <div class="col large-9">
                <div class="shop-container">
                    <div class="products row  row-small large-columns-4 medium-columns-3 small-columns padding-p"
                         id="content">
                        <%
                            ArrayList<Product> listProductRandom = (ArrayList<Product>) request.getAttribute("listProductRandom");
                            for (Product product_list : listProductRandom) {
                        %>
                        <div class="col">
                            <div class="col-inner">
                                <div class="product-small box">
                                    <div class="box-image">
                                        <a href="<%=url%>\DetailProduct?pid=<%=product_list.getId()%>&cid=<%=product_list.getIdCate()%>"  class="product-link">

                                            <img src="<%=url%>/Products/<%=(product_list.getProductImages().isEmpty())?"":product_list.getProductImages().get(0).getUrl()%>" class="card-img-top img_p" id = "img_center" alt="...">

<%--                                            <img src="<%=url%>/Products/<%=(product_list.getProductImages().isEmpty())?"":product_list.getProductImages().get(0).getUrl()%>" class="card-img-top img_p" id = "img_center" alt="...">--%>
                                        </a>
                                    </div>
                                    <div class="box-text text-center">
                                        <div class="title-wrapper">
                                            <p>
                                                <a href="#"
                                                   onclick="saveProductData('<%= product_list.getId() %>')">

                                                    <%= product_list.getId() %> - <%= product_list.getNameProduct() %>

                                                </a>
                                            </p>
                                        </div>
                                        <div class="price-wrapper">
                    <span class="price">
                        <span class="woocommerce-Price-amount amount">
                         <bdi style="font-weight: bold;">
    <%
        Double price = product_list.getSizePrices().get(0).getPrice();
        if (price != null && !price.isNaN()) {
            out.print(nF.format(price));
        } else {
            out.print("N/A"); // Giá trị mặc định nếu không có giá trị
        }
    %>
</bdi>


                        </span>
                    </span>
                                        </div>
                                        <%
                                            int quantity = 1;
                                            if (cart != null) {
                                                if (cart.get(product_list.getId()) != null) {
                                                    quantity = cart.get(product_list.getId()).getQuantity() + 1;
                                                }
                                            } else {
                                                quantity = product_list.getQuantity();
                                            }
                                        %>
                                        <div class="add-to-cart-button">
                                            <a href="#" onclick="saveProductData('<%= product_list.getId() %>')">THÊM VÀO GIỎ</a>
                                        </div>
                                        <div class="product-description" style="display:none;">
                                                <span class="description-id">Mã: <span
                                                        class="sku"><%= product_list.getId() %></span></span>
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
                        <% } %>
                    </div>



                </div>
            </div>

        </div>
    </div>
</main>
<footer>
   <jsp:include page="Footer.jsp"></jsp:include>
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
        var minPrice = document.querySelector('.price_label .from').innerText.replace(/[^0-9-]+/g, "");
        var maxPrice = document.querySelector('.price_label .to').innerText.replace(/[^0-9-]+/g, "");

        minPrice = parseFloat(minPrice);
        maxPrice = parseFloat(maxPrice);

        // Lọc lại sản phẩm trong content
        var products = document.querySelectorAll('.product-small'); // Lấy tất cả sản phẩm
        products.forEach(function(product) {
            var priceText = product.querySelector('.price bdi').innerText.replace(/[^0-9-]+/g, ""); // Lấy giá của sản phẩm
            var price = parseFloat(priceText);

            if (price >= minPrice && price <= maxPrice) {
                product.style.display = "block"; // Hiển thị sản phẩm nếu giá nằm trong phạm vi
            } else {
                product.style.display = "none"; // Ẩn sản phẩm nếu giá không nằm trong phạm vi
            }
        });
    }
    // Cập nhật thanh trượt
    document.addEventListener('DOMContentLoaded', function () {
        const leftHandle = document.getElementById('handle-left');
        const rightHandle = document.getElementById('handle-right');
        const priceRange = document.querySelector('.price_slider_range');
        const fromLabel = document.querySelector('.price_label .from');
        const toLabel = document.querySelector('.price_label .to');
        console.log(${lowestPrice});
        console.log(${highestPrice});
        const minValue = Math.round(parseFloat('${lowestPrice}'));
        const maxValue = Math.round(parseFloat('${highestPrice}'));
        const step = 10000;
        console.log("hai",minValue);
        console.log("ba",maxValue);
        let leftValue = minValue;
        let rightValue = maxValue;

        function updateSlider() {
            const rangeWidth = document.querySelector('.price_slider').offsetWidth;
            const leftPercent = ((leftValue - minValue) / (maxValue - minValue)) * 100;
            const rightPercent = ((rightValue - minValue) / (maxValue - minValue)) * 100;

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

    var idCateCurrent = 0;

    function loadProductByIdCate(categoryId) {
        $.ajax({
            url: 'LoadProductByIdCate', // URL không thay đổi
            method: 'GET',
            data: {
                cid: categoryId // Truyền categoryId trong phần data
            },
            success: function(response) {
                var productContainer = $('#content'); // Khu vực hiển thị sản phẩm
                productContainer.empty(); // Xóa sản phẩm hiện tại

                // Chèn trực tiếp HTML vào trong phần tử #content
                productContainer.append(response);
            },
            error: function() {
                alert("Không thể tải sản phẩm.");
            }
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
                url: "/LoadProductByName",
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
