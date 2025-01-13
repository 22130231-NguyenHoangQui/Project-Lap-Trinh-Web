
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.edu.hcmuaf.fit.model.Cart" %>
<%@ page import="com.edu.hcmuaf.fit.model.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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


                                    <img class="product-image" id="product-img"
                                         src="..\image\imghomepage\product\product_danhmuc\theo_danh_muc\banh_bento\BBT03.png"
                                         alt="Bánh 1" style="width: 100%; height: 80%;">



                                </div>
                                <div class="thumbnail-images d-flex">
                                    <span class="arrow-left">&#8592;</span>
                                    <img class="thumbnail"
                                         src="image/image_demo.jpg"
                                         alt="Bánh 1">
                                    <img class="thumbnail"
                                         src="image/image_demo1.jpg"
                                         alt="Bánh 2">
                                    <img class="thumbnail"
                                         src="image/image_demo2.jpg"
                                         alt="Bánh 3">
                                    <img class="thumbnail"
                                         src="image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_bento/BBT04.png"
                                         alt="Bánh 4">
                                    <img class="thumbnail"
                                         src="image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_bento/BBT04.png"
                                         alt="Bánh 4">
                                    <img class="thumbnail"
                                         src="image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_bento/BBT04.png"
                                         alt="Bánh 4">
                                    <img class="thumbnail"
                                         src="image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_bento/BBT04.png"
                                         alt="Bánh 4">
                                    <span class="arrow-right">&#8594;</span>
                                </div>
                            </div>
                        </div>
                        <div class="pr-right-contai col">
                            <h1 class="product-title" id="product-title">BHQ156 - Bánh Xoài Chanh Leo</h1>
                            <div class="is-divider"></div>
                            <div class="price-wrapper">
                                <p class="product-page-price ">
                                        <span class="price-amount"><bdi>250.000<span
                                                class="price-symbol">₫</span></bdi></span> – <span
                                        class="price-amount"><bdi>500.000<span
                                        class="price-symbol">₫</span></bdi></span>
                                </p>
                            </div>
                            <form class="variations-form" action="#">
                                <table class="variations" cellspacing="0" role="presentation">
                                    <tbody>
                                    <tr>
                                        <th class="label">
                                            <label for="size-banh-1">Size bánh:</label>
                                        </th>
                                        <td class="value">
                                            <select class name="attribute-size-banh" id="size-banh-1">
                                                <option value>Chọn một tùy chọn</option>
                                                <option class="attached" value="14" selected="selected">14 cm
                                                </option>
                                                <option class="attached" value="16">16 cm</option>
                                                <option class="attached" value="18">18 cm</option>
                                                <option class="attached" value="20">20 cm</option>
                                                <option class="attached" value="22">22 cm</option>
                                                <option class="attached" value="24">24 cm</option>
                                            </select>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="single-variation">
                                    <div class="price-contai">
                                            <span class="price" id="product-price">
                                                250.000₫
                                            </span>
                                    </div>
                                    <div class="add-quantity">
                                        <div class="btn-quatity">
                                            <input class="input-reduce is-form" type="button" value="-"
                                                   data-target="#quantity-1">
                                            <input class="input-qt" id="quantity-1" name="quantity" value="1"
                                                   size="4" min="1" max step="1" placeholder inputmode="numeric"
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
                                            <a href="<%=url%>/cartController?id=<%=product.getId()%>&quantity=<%=quantity%>">

                                            <button class="btn-add cart" type="button"  style="border-radius: 10px;">
                                                THÊM VÀO GIỎ HÀNG
                                            </button>
                                            </a>

                                            <button class="btn-add payment" type="button" onclick="ToPayment()"style="border-radius: 10px;">
                                                <a href="payment.jsp">MUA NGAY</a>
                                            </button>
                                            <input type="hidden" name="gtm4wp_id" value="29736">
                                            <input type="hidden" name="gtm4wp_internal_id" value="29736">
                                            <input type="hidden" name="gtm4wp_name"
                                                   value="BHQ156 - Bánh sinh nhật Dâu tươi sáng">
                                            <input type="hidden" name="gtm4wp_sku" value="BHQ156">
                                            <input type="hidden" name="gtm4wp_category"
                                                   value="Danh muc 1 - danhmuc">
                                            <input type="hidden" name="gtm4wp_price" value="250000">
                                            <input type="hidden" name="gtm4wp_stocklevel" value="">
                                            <input type="hidden" name="add-to-cart" value="29736">
                                            <input type="hidden" name="add-to-cart" value="29736">
                                            <input type="hidden" name="variation_id" class="variation_id"
                                                   value="29739">
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div class="product-description" id="product-description" style="display: block;">
                                    <span class="description-id">
                                        <p><strong> Mã: TRMS4</strong>
                                            <span class="sku"></span>
                                    </span> </p>
                                <p>
                                    <strong>Đường kính: </strong>
                                    <span class="product-diameter"></span></p>
                                <p>
                                    <strong>Chiều cao: </strong>
                                    <span class="product-height"></span></p>
                                <p><strong>Danh mục: </strong>
                                    <a href=""> Bánh Sinh Nhật - Bánh Kem - Bánh Gâto, Bento Cake</a>
                                </p>
                                <span class="description-content"></span>

                            </div>


                        </div>
                    </div>
                    <div class="container mt-3"
                         style="padding-top: 30px; border: 1px solid #e5e5e5;  width: auto;">
                        <ul class="d-flex nav nav-mtdg" >
                            <li style="margin-right: 0;"><a href="#" class="tab-link active" data-tab="description">Mô Tả</a></li>
                            <li style="margin-right: 0;"><a href="#" class="tab-link" data-tab="review">Đánh Giá</a></li>
                        </ul>
                        <div id="description" class="content active">


                            <h1 style="text-align: center;"><strong>Bánh Tiramisu Dâu Tây</strong></h1>
                            <p>Bánh Tiramisu Dâu Tây vẽ hình bầu trời xanh với những đám mây trắng và cồng vồng sặc
                                sỡ.</p>
                            <p>Thông tin chi tiết ảnh mẫu:<br>- Bánh cốt vani, kem tươi, trang trí cầu vồng.<br></p>
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
                                    dán logo IT CAKE màu vàng</li>
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
                                                        tiên nhận xét “TRMS4  – Bánh Tiramisu Dâu Tây”
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

                <li><a href="../deliveryPolicy.jsp">Chính sách đổi, trả,hoàn tiền</a></li>
                <li><a href="/pages/chinh-sach-giao-dich-thanh-toan">Chính sách bảo mật</a></li>
                <li><a href="/pages/chinh-sach-doi-tra">Hướng dẫn thanh toán</a></li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="ft-copyright">

            Copyrights © 2024 by <a target="_blank" href="../pages/home.html" title="Đi tới Trang Chủ">IT Cake</a>.

        </div>
    </div>
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

</script>
</body>

</html>