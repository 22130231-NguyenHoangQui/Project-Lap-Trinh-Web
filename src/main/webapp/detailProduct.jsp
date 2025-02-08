<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.edu.hcmuaf.fit.model.Cart" %>
<%@ page import="com.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.edu.hcmuaf.fit.model.SizePrice" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>chi tiết sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/header.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/detailProduct.css">
    <style>
        .pr-contai-image {
            position: relative;
            /* Đảm bảo rằng các ảnh nhỏ có thể đè lên ảnh lớn */
            padding-bottom: 30px;
        }

        .thumbnail-images {
            position: absolute;
            bottom: 50px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .thumbnail {
            width: 120px;
            /* Chiều rộng của các ảnh nhỏ */
            height: 100px;
            /* Chiều cao của các ảnh nhỏ */
            object-fit: cover;
            /* Đảm bảo ảnh nhỏ không bị méo */
            border: 2px solid #fff;
            /* Đặt đường viền cho các ảnh nhỏ */
            cursor: pointer;
            transition: transform 0.3s ease;
            /* Hiệu ứng zoom khi hover */
        }

        .thumbnail:hover {
            transform: scale(1.1);
            /* Phóng to ảnh khi hover */
        }

        .arrow-left,
        .arrow-right {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            font-size: 30px;
            color: #fff; /* Thay đổi màu biểu tượng thành trắng để dễ nhìn hơn */
            cursor: pointer;
            user-select: none;
            border: 1px solid #e5e5e5;
            background-color: rgba(0, 0, 0, 0.3); /* Màu nền nhạt, có độ trong suốt */
            height: 50px;
            width: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%; /* Mũi tên sẽ có hình tròn */
            z-index: 10;
            padding-bottom: 5px;
        }

        .arrow-left {
            left: -15px;
        }

        .arrow-right {
            right: -15px;
        }

        /* Khi hover, màu nền của mũi tên sẽ sáng hơn */
        .arrow-left:hover,
        .arrow-right:hover {
            background-color: rgba(0, 0, 0, 0.5);
        }

    </style>
</head>

<body>
<header>

    <jsp:include page="header.jsp"></jsp:include>
</header>


<div class="is-medium">
    <div class="container"></div>
</div>
<main>
    <%
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
    %>
    <%

        NumberFormat nF = NumberFormat.getCurrencyInstance();
        Cart cart = (Cart) session.getAttribute("Cart");
        Product product = (Product) request.getAttribute("product");
        if (product != null) {
    %>
    <div class="container">
        <div class="product-main">
            <div class="pr-row row">
                <div class="pr-right col">
                    <div class="container row" style="padding-top: 30px; border: 1px solid #e5e5e5; width: auto; ">
                        <div class="pr-left-contai col">

                            <div class="pr-contai-image d-flex" data-columns="4"
                                 style="flex-direction: column; opacity: 1; justify-content: center; padding-bottom: 30px;">
                                <div class="pr-image d-flex"
                                     style=" justify-content: center; width: 100%; height: 100%; padding: 15px; border: 1px solid #e5e5e5; ">
                                    <c:if test="${not empty product.productImages}">
                                        <img class="product-image" id="product-img"
                                             src="${product.productImages[0].url}"
                                             alt="Ảnh sản phẩm" style="width: 100%; height: 80%;">
                                    </c:if>
                                </div>
                                <div class="thumbnail-images d-flex">
                                    <span class="arrow-left">&#8592;</span>
                                    <%
                                        // Lấy danh sách hình ảnh từ attribute "allProductImages"
                                        ArrayList<String> allProductImages = (ArrayList<String>) request.getAttribute("product.allProductImages");
                                        if (allProductImages != null) {
                                            for (String imageUrl : allProductImages) {
                                    %>
                                    <img class="thumbnail"  src="<%=url%>/Products/<%=(product.getProductImages().isEmpty())?"":product.getProductImages().get(0).getUrl()%>alt="Ảnh sản phẩm">
<%--                                    <img src="<%=url%>/Products/<%=(product_list.getProductImages().isEmpty())?"":product_list.getProductImages().get(0).getUrl()%>" class="card-img-top img_p" id = "img_center" alt="...">--%>

                                    <%
                                            }
                                        }
                                    %>
                                    <span class="arrow-right">&#8594;</span>
                                </div>
                            </div>
                        </div>
                        <div class="pr-right-contai col">
                            <h1 class="product-title" id="product-title"><%= product.getNameProduct() %>
                            </h1>
                            <div class="is-divider"></div>
                            <div class="price-wrapper">
                                <p class="product-page-price ">
                                    <span class="price-amount"><bdi>${minPrice}<span
                                            class="price-symbol">₫</span> - <bdi>${maxPrice}<span
                                            class="price-symbol">₫</span></bdi></span>
                                </p>
                            </div>
                            <form class="variations-form" action="#">
                                <table class="variations" cellspacing="0" role="presentation">
                                    <tbody>
                                    <tr>
                                        <th class="label">
                                            <label >Size bánh:</label>
                                        </th>
                                        <td class="value">
                                            <select name="attribute-size-banh" id="sizeSelect" onchange="updatePrice()">
                                                <option value="">Chọn một tùy chọn</option>
                                                <%
                                                    ArrayList<SizePrice> sizePriceList = (ArrayList<SizePrice>) request.getAttribute("priceSize");
                                                    SizePrice lowestSizePrice = (SizePrice) request.getAttribute("lowestSizePrice");

                                                    if (sizePriceList != null) {
                                                        for (SizePrice sp : sizePriceList) {
                                                            // Kiểm tra xem đây có phải là kích thước thấp nhất không
                                                            boolean isLowest = lowestSizePrice != null && sp.getDiameter() == lowestSizePrice.getDiameter();
                                                %>
                                                <option value="<%= sp.getDiameter() %>" data-price="<%= sp.getPrice() %>"
                                                        <%= isLowest ? "selected" : "" %>>
                                                    <%= sp.getDiameter() %> cm
                                                </option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </td>

                                    </tr>
                                    </tbody>
                                </table>
                                <div class="single-variation">
                                    <div class="price-contai">
   <span class="price" id="product-price">
    <%
         lowestSizePrice = (SizePrice) request.getAttribute("lowestSizePrice");
        if (lowestSizePrice != null) {
            out.print(new java.text.DecimalFormat("#,###₫").format(lowestSizePrice.getPrice()));
        } else {
            out.print("Chọn kích thước để xem giá");
        }
    %>
</span>

                                    </div>

                                    <div class="add-quantity">
                                        <div class="btn-quatity">
                                            <input class="input-reduce is-form" type="button" value="-"
                                                   data-target="#quantity-1">
                                            <input class="input-qt" id="quantity-1" name="quantity" value="1"
                                                   size="4" min="1" max="<%=product.getQuantity()%>" step="1" placeholder inputmode="numeric"
                                                   autocomplete="off">
                                            <input class="input-increase is-form" type="button" value="+"
                                                   data-target="#quantity-1">
                                        </div>
                                        <div class="btn-add-contai">
                                            <%
                                                int quantity = 1;
                                                if (cart != null) {
                                                    if (cart.get(product.getId()) != null) {
                                                        quantity = cart.get(product.getId()).getQuantity() + 1;
                                                    }
                                                } else {
                                                    quantity = product.getQuantity();
                                                }
                                            %>
                                            <a href="<%=url%>/cartController?id=<%=product.getId()%>&quantity=<%=quantity%>&size=" id="addToCartLink">

                                                <button class="btn-add cart" type="button" style="border-radius: 10px;">
                                                    THÊM VÀO GIỎ HÀNG
                                                </button>
                                            </a>

<%--                                            <button class="btn-add payment" type="button" onclick="ToPayment()"--%>
<%--                                                    style="border-radius: 10px;">--%>
                                                <a href ="<%=url%>/PaymentBuyNow?id=<%=product.getId()%>&quantity=1&size=" id="buy-now-link">
                                                    <button class="btn-add cart" type="button" style="border-radius: 10px">Mua ngay</button>
                                                </a>
<%--                                            </button>--%>

                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- Phần mô tả sản phẩm -->
                            <div class="product-description" id="product-description" style="display: block;">
    <span class="description-id">
        <p><strong>Mã: <%=product.getId()%></strong>
            <span class="sku"></span>
        </p>
    </span>
                                <p>
                                    <strong>Đường kính: </strong>
                                    <span class="product-diameter">
            <%= lowestSizePrice != null ? lowestSizePrice.getDiameter() + " cm" : "Chưa có thông tin" %>
        </span>
                                </p>
                                <p>
                                    <strong>Chiều cao: </strong>
                                    <span class="product-height">
            <%= lowestSizePrice != null ? lowestSizePrice.getHeight() + " cm" : "Chưa có thông tin" %>
        </span>
                                </p>
                                <p><strong>Danh mục: </strong>
                                    <a href=""> <%= request.getAttribute("cateName") %></a>
                                </p>
                                <span class="description-content"><%=product.getDescription()%></span>
                            </div>


                        </div>
                    </div>
                    <div class="container mt-3"
                         style="padding-top: 30px; border: 1px solid #e5e5e5;  width: auto;">
                        <ul class="d-flex nav nav-mtdg">
                            <li style="margin-right: 0;"><a href="#" class="tab-link active" data-tab="description">Mô
                                Tả</a></li>
                            <li style="margin-right: 0;"><a href="#" class="tab-link" data-tab="review">Đánh Giá</a>
                            </li>
                        </ul>
                        <div id="description" class="content active">


                            <h1 style="text-align: center;"><strong><%=product.getNameProduct()%>
                            </strong></h1>
                            <p><%=product.getDescription()%>
                            </p>
                            <h2>Các size bánh cơ bản tại IT CAKE:</h2>
                            <p>– Size_16 cao ~8cm (3 – 5 người ăn)<br>– Size_18 cao ~8cm (5 – 7 người ăn)<br>–
                                Size_20 cao ~8cm (7 – 9 người ăn)<br>– Size_22 cao ~8cm (9 – 11 người ăn)<br>–
                                Size_24 cao ~8cm (11 – 13 người ăn)</p>
                            <h2>Các loại bánh cao hiện đại:</h2>
                            <p>– Size_16 cao ~10 cm (5 – 7 người ăn)<br>– Size_18 cao ~10cm (7 – 9 người ăn)<br>–
                                Size_20 cao ~10cm (9 – 11 người ăn)</p>
                            <p><strong><br><em>– Các loại bánh tròn 1 tầng có giá dao động từ 200k – 500k tùy mẫu,
                                đồ trang trí và độ phức tạp của từng mẫu bánh.</em><br><em>– Bánh thông
                                thường gồm 3 lớp (cao 8cm).</em><br><em>Lựa chọn khác:</em><br><em>– Cốt
                                bánh: vị vani, vị socola, vị matcha, vị dâu</em><br><em>– Kem phủ bánh: vị
                                socola, vị matcha, vị café, vị sữa chua</em><br><em>– Nhân bánh: các loại
                                mứt theo mùa, các loại hoa quả tươi theo mùa (liên hệ
                                trước)</em><br></strong></p>
                            <p>&nbsp;</p>
                            <p>Bánh tại IT CAKE có độ ngọt vừa vặn, thanh mát và một chút ngọt nhẹ của kem
                                tươi.<br>Đặc biệt, bánh tại IT CAKE không dùng phụ gia, hương liệu, chất bảo
                                quản, bánh tươi 100% sản xuất theo quy trình đạt chuẩn VSATTP.<br>Các loại kem, bơ,
                                nguyên liệu, màu thực phẩm (nếu có) được nhập khẩu tại Úc, Newzealand, Singapore,
                                Mỹ…. nhằm mang đến cho khách hàng những trải nghiệm an toàn và ngon nhất với tiêu
                                chuẩn cao nhất.</p>
                            <p>IT CAKE nhận đặt các loại bánh kem theo yêu cầu cho các dịp sinh nhật, tiệc hội
                                nghị, liên hoan, các dịp kỷ niệm, ngày cưới…. Nhận đặt bánh lấy ngay sau 1h. Các
                                loại bánh phức tạp vui lòng liên hệ để có thêm thông tin chi tiết.</p>
                            <h4>&nbsp;</h4>
                            <h4><strong>Nhận diện bánh thương hiệu IT CAKE</strong></h4>
                            <ul>
                                <li>Bánh đi kèm hộp có tên, địa chỉ, sđt của công ty được in trên vỏ hộp, đế bánh có
                                    dán logo IT CAKE màu vàng
                                </li>
                                <li>Đồ tặng kèm theo bánh sinh nhật gồm: Dao cắt bánh + Nến sinh nhật + Thìa + Đĩa
                                </li>
                                <li>IT CAKE nhận chuyển bánh tận nhà, chi phí tính tùy theo độ xa gần</li>
                            </ul>
                            <h4>&nbsp;</h4>
                            <h4><strong>Chính sách trả lại hàng và hoàn tiền</strong></h4>
                            <h4>Khách hàng kiểm tra bánh trước khi thanh toán tiền. Khách có thể hoàn trả bánh trong
                                trường hợp:</h4>
                            <ul>
                                <li>Không đúng mẫu đã đặt</li>
                                <li>Bánh bị trầy xước, va đập</li>
                                <li>Bánh hỏng do vận chuyển</li>
                            </ul>
                            <h1 style="text-align: center;"></h1>
                            <p>&nbsp;</p>
                            <p><strong>IT CAKE</strong> <br>Địa chỉ: Đại Học Nông Lâm TP.Hồ Chí Minh, Phường Linh
                                Trung, Q.Thủ Đức, TP.Hồ Chí Minh
                                <br>Điện thoại: 012345678 <br>Website: <a
                                        href="https://hcmuaf.edu.vn/">https://hcmuaf.edu.vn/</a>
                                <br>Facebook:&nbsp;<a href="https://hcmuaf.edu.vn/">https://hcmuaf.edu.vn/</a>
                                <br> Instagram:&nbsp;<a href="https://hcmuaf.edu.vn/">https://hcmuaf.edu.vn/</a>
                            </p>
                            <h1 style="text-align: center;">

                            </h1>
                            <p>&nbsp;</p>
                            <p><strong>Các danh mục bánh sinh nhật:</strong> <br><a
                                    href="ProductCatalog.jsp">Danh mục bánh sinh nhật</a>
                                <br>
                                <a href="ProductCatalog.jsp" data-category="banh_mau_trai">
                                    Bánh sinh nhật cho bé trai</a>
                                <br><a href="ProductCatalog.jsp" data-category="banh_mau_gai">Bánh sinh
                                    nhật cho bé gái</a>
                            </p>
                        </div>


                        <div class="pr-footer-contai content" id="review">
                            <div class="panels" style="width: 100%;">
                                <div class="panel-reviews" id="tab-reviews" role="tabpanel"
                                     aria-labelledby="tab-title-reviews" style="width: 100%;">
                                    <div class="woocommerce-reviews" id="reviews">
                                        <div class="large-reveiw col" id="comments">
                                            <h3 class="reviews-title">
                                                ĐÁNH GIÁ</h3>
                                            <p class="woocommerce-noreviews">Chưa có đánh giá nào.</p>
                                        </div>
                                        <div class="large-reveiw col col-lg-12" id="review-form-wrapper">
                                            <div class="col-inner" id="review-form">
                                                <div class="comment-respond" id="respond">
                                                    <h3 class="comment-reply-title" id="reply-title">Hãy là người
                                                        đầu
                                                        tiên nhận xét “TRMS4 – Bánh Tiramisu Dâu Tây”
                                                        <small><a rel="nofollow" id="cancel-comment-reply-link"
                                                                  href="#" style="display:none;">Hủy</a>
                                                        </small>
                                                    </h3>
                                                    <form class="comment-form" action="#" method="post"
                                                          id="commentform" novalidate="">
                                                        <div class="comment-form-rating">
                                                            <label for="rating">Đánh giá
                                                                của bạn&nbsp;
                                                                <span class="required">*</span>
                                                            </label>
                                                            <p class="stars">
                                                                    <span>
                                                                        <a class="star-1" href="#">
                                                                            <i class="bi bi-star-fill">
                                                                                <span>1</span></i></a>
                                                                        <a class="star-2" href="#">
                                                                            <i class="bi bi-star-fill">
                                                                                <span>2</span></i></a>
                                                                        <a class="star-3" href="#">
                                                                            <i class="bi bi-star-fill">
                                                                                <span>3</span></i></a>
                                                                        <a class="star-4" href="#">
                                                                            <i class="bi bi-star-fill">
                                                                                <span>4</span></i></a>
                                                                        <a class="star-5" href="#">
                                                                            <i class="bi bi-star-fill">
                                                                                <span>5</span></i></a>
                                                                    </span>
                                                            </p>
                                                            <select name="rating" id="rating" required=""
                                                                    style="display: none;">
                                                                <option value="">Xếp hạng…</option>
                                                                <option value="5">Rất tốt</option>
                                                                <option value="4">Tốt</option>
                                                                <option value="3">Trung bình</option>
                                                                <option value="2">Không tệ</option>
                                                                <option value="1">Rất tệ</option>
                                                            </select>
                                                        </div>
                                                        <p class="comment-form-comment">
                                                            <label for="comment">
                                                                Nhận xét của bạn&nbsp;
                                                                <span class="required">*</span>
                                                            </label>
                                                            <textarea id="comment" name="comment" cols="45" rows="8"
                                                                      required=""></textarea>
                                                        </p>
                                                        <p class="comment-form-author">
                                                            <label for="author">Tên&nbsp;<span
                                                                    class="required">*</span>
                                                            </label>
                                                            <input id="author" name="author" type="text" value=""
                                                                   size="30" required="">
                                                        </p>
                                                        <p class="comment-form-cookies-consent">
                                                            <input id="wp-comment-cookies-consent"
                                                                   name="wp-comment-cookies-consent" type="checkbox"
                                                                   value="yes">
                                                            <label for="wp-comment-cookies-consent">Lưu tên của tôi,
                                                                email,
                                                                và trang web trong trình duyệt này cho lần bình luận
                                                                kế
                                                                tiếp
                                                                của tôi.</label>
                                                        </p>
                                                        <p class="form-submit">
                                                            <input class="submit" name="submit" type="submit"
                                                                   id="submit" value="Gửi đi">
                                                            <input type="hidden" name="comment_post_ID"
                                                                   value="29736" id="comment_post_ID">
                                                            <input type="hidden" name="comment_parent"
                                                                   id="comment_parent" value="0">
                                                        </p>
                                                        <p style="display: none;">
                                                            <input type="hidden" id="akismet_comment_nonce"
                                                                   name="akismet_comment_nonce" value="54d5e108e1">
                                                        </p>
                                                        <p style="display: none !important;"
                                                           class="akismet-fields-container" data-prefix="ak_">
                                                            <label>Δ
                                                                <textarea name="ak_hp_textarea" cols="45" rows="8"
                                                                          maxlength="100"></textarea>
                                                            </label>
                                                            <input type="hidden" id="ak_js_1" name="ak_js"
                                                                   value="1731449703881">
                                                        </p>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <%}%>
</main>
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="js/detailProduct.js"></script>
<script>
    // Lấy tất cả các tab và nội dung
    const tabs = document.querySelectorAll('.tab-link');
    const contents = document.querySelectorAll('.content');

    // Thêm sự kiện click cho từng tab
    tabs.forEach(tab => {
        tab.addEventListener('click', (event) => {
            event.preventDefault();

            // Xóa active khỏi tất cả các tab và nội dung
            tabs.forEach(t => t.classList.remove('active'));
            contents.forEach(c => c.classList.remove('active'));

            // Thêm active vào tab được click
            tab.classList.add('active');
            const target = document.getElementById(tab.dataset.tab);
            target.classList.add('active');
        });
    });


    document.addEventListener("DOMContentLoaded", function () {
        const thumbnails = document.querySelectorAll(".thumbnail");
        const thumbnailContainer = document.getElementById("thumbnail-container");
        const arrowLeft = document.querySelector(".arrow-left");
        const arrowRight = document.querySelector(".arrow-right");

        let currentIndex = 0; // Chỉ số của ảnh nhỏ hiện tại

        // Hàm hiển thị ảnh nhỏ
        function updateThumbnails() {
            thumbnails.forEach((thumbnail, index) => {
                // Ẩn các ảnh ngoài khoảng visible (3 ảnh)
                if (index < currentIndex || index >= currentIndex + 4) {
                    thumbnail.style.display = "none";
                } else {
                    thumbnail.style.display = "block";
                }
            });
        }

        // Di chuyển qua ảnh nhỏ
        arrowRight.addEventListener("click", function () {
            if (currentIndex + 4 < thumbnails.length) {
                currentIndex++;
                updateThumbnails();
            }
        });

        arrowLeft.addEventListener("click", function () {
            if (currentIndex > 0) {
                currentIndex--;
                updateThumbnails();
            }
        });

        // Cập nhật ban đầu (hiển thị 3 ảnh nhỏ)
        updateThumbnails();

    });

    function updatePrice() {
        const selectedOption = sizeSelect.options[sizeSelect.selectedIndex];
        const pricePerUnit = parseFloat(selectedOption.getAttribute("data-price")) || 0; // Giá của size
        const quantity = parseInt(quantityInput.value) || 1; // Lấy số lượng từ input

        // Tính tổng giá
        const totalPrice = pricePerUnit * quantity;

        // Cập nhật giá hiển thị
        priceElement.textContent = new Intl.NumberFormat("vi-VN", {
            style: "currency",
            currency: "VND",
        }).format(totalPrice);
    }

    document.addEventListener("DOMContentLoaded", function () {
        // Các phần tử cần thiết
        const priceElement = document.querySelector("#product-price"); // Thẻ hiển thị giá
        const quantityInput = document.querySelector("#quantity-1"); // Input số lượng
        const sizeSelect = document.getElementById("sizeSelect"); // Dropdown chọn kích thước

        // Hàm cập nhật giá
        function updatePrice() {
            const selectedOption = sizeSelect.options[sizeSelect.selectedIndex];
            const pricePerUnit = parseFloat(selectedOption.getAttribute("data-price")) || 0; // Giá của size
            const quantity = parseInt(quantityInput.value) || 1; // Lấy số lượng từ input

            // Tính tổng giá
            const totalPrice = pricePerUnit * quantity;

            // Cập nhật giá hiển thị
            priceElement.textContent = new Intl.NumberFormat("vi-VN", {
                style: "currency",
                currency: "VND",
            }).format(totalPrice);
        }

        // Hàm xử lý tăng/giảm số lượng
        function handleQuantityChange(buttonSelector) {
            const buttons = document.querySelectorAll(buttonSelector);

            buttons.forEach((button) => {
                button.addEventListener("click", function () {
                    const step = parseInt(quantityInput.getAttribute("step")) || 1; // Bước tăng
                    const min = parseInt(quantityInput.getAttribute("min")) || 1;  // Giá trị nhỏ nhất
                    let currentValue = parseInt(quantityInput.value); // Lấy giá trị hiện tại

                    // Kiểm tra nếu giá trị không phải là một số hợp lệ
                    if (isNaN(currentValue)) {
                        currentValue = 1; // Nếu không phải số hợp lệ, đặt lại thành 1
                    }

                    // Xử lý giảm số lượng
                    if (button.classList.contains("input-reduce")) {
                        // Giảm số lượng nhưng không nhỏ hơn min
                        currentValue = Math.max(min, currentValue - step);
                    }
                    // Xử lý tăng số lượng
                    else if (button.classList.contains("input-increase")) {
                        currentValue += step; // Tăng số lượng
                    }

                    // Cập nhật lại giá trị trong input
                    quantityInput.value = currentValue;

                    // Cập nhật giá sau khi thay đổi số lượng
                    updatePrice();
                });
            });
        }

        // Lắng nghe sự kiện thay đổi từ dropdown size
        sizeSelect.addEventListener("change", updatePrice);

        // Lắng nghe sự kiện thay đổi số lượng trực tiếp từ input
        quantityInput.addEventListener("input", function () {
            const currentValue = parseInt(quantityInput.value) || 1;
            quantityInput.value = Math.max(1, currentValue); // Đảm bảo giá trị không nhỏ hơn 1
            updatePrice();
        });

        // Kích hoạt hàm tăng/giảm
        handleQuantityChange(".is-form");

        // Cập nhật giá ban đầu (nếu cần)
        updatePrice();
    });





</script>
<script>
    document.getElementById('sizeSelect').addEventListener('change', function() {
        var size = this.value;
        var link = document.getElementById('addToCartLink');
        var url = link.getAttribute('href');
        var linkBuy = document.getElementById('buy-now-link');
        var url1 = linkBuy.getAttribute('href');
        linkBuy.setAttribute('href', url1.split('&size=')[0] + '&size=' + size);
        link.setAttribute('href', url.split('&size=')[0] + '&size=' + size);
    });

    $(document).ready(function () {
        var count = 1;
        var increase = $('#increase');
        var decrease = $('#decrease');
        var amount = $('#amount');
        var url = "<%= url %>";
        var productId = <%= product.getId() %>;
        var buynowlink = document.getElementById("buy-now-link");

        increase.click(function () {
            count++;
            amount.val(count);
            buynowlink.href = `${url}/PaymentBuyNow?id=${productId}&quantity=${count}`;
        });

        decrease.click(function () {
            if (count > 1) {
                count--;
            }
            amount.val(count);
            buynowlink.href = `${url}/PaymentBuyNow?id=${productId}&quantity=${count}`;
        });

        amount.change(function () {
            const inputValue = parseInt(amount.val());
            var quantityAvai = <%= product.getQuantity() %>;
            if (inputValue > quantityAvai) {
                alert("Số lượng trong kho không đủ!");
                amount.val(quantityAvai);
            } else if (inputValue < 1) {
                amount.val(1);
            } else {
                count = inputValue;
            }
            buynowlink.href = `${url}/PaymentBuyNow?id=${productId}&quantity=${count}`;
        });
    });
</script>

</body>

</html>