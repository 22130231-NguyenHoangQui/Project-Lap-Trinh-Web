
<%@ page import="com.edu.hcmuaf.fit.model.Cart" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- External CSS -->
    <link rel="stylesheet" href="css/shoppingCart.css">
    <link rel="stylesheet" href="css/fotter.css">
    <link rel="stylesheet" href="css/header.css">
</head>

<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
    <header>
            <jsp:include page="header.jsp"></jsp:include>
    </header>
<a href="<%=url%>/homePage" class="color-gray lbhv text-decoration-none">Trang chủ  <i class="fa fa-angle-right color-gray" aria-hidden="true"></i>  </a> <span class="text-color">Giỏ hàng</span>

<% Cart cart = (Cart) session.getAttribute("Cart");
        if (cart != null && !cart.list().isEmpty()) {%>
    <div class="container my-5">
        <h2 class="text-center mb-4">Giỏ hàng của bạn</h2>
        <div class="table-responsive">
            <table class="table table-bordered align-middle">
                <thead class="table">

                    <tr>
                        <th>Sản phẩm</th>
                        <th>Chi tiết</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody id="cart-items">
                <%
                    NumberFormat nf = NumberFormat.getCurrencyInstance(); // Định dạng tiền tệ
                    Iterator<Product> it = cart.list().iterator(); // Duyệt qua danh sách sản phẩm trong giỏ hàng
                    while (it.hasNext()) {
                        Product p = it.next();
                %>
                <tr>
                    <!-- Cột: Sản phẩm -->
                    <td>
                        <img src="<%= p.getProductImages().get(0).getUrl() %>" alt="<%= p.getNameProduct() %>" class="img-thumbnail" style="width: 100px; height: auto;">
                    </td>
                    <!-- Cột: Chi tiết -->
                    <td>
                        <strong><%= p.getNameProduct() %></strong>
                        <p class="text-muted"><%= p.getDescription() %></p>
                    </td>
                    <td>
                        <% if (p.getSizePrices() != null && !p.getSizePrices().isEmpty()) { %>
                        <%= nf.format(p.getSizePrices().get(0).getPrice()) %>
                        <% } else { %>
                        No Price Available
                        <% } %>
                    </td>

                    <td>
                        <input type="number" name="quantity_<%= p.getId() %>" value="<%= p.getQuantity() %>" class="form-control" min="1" onchange="updateCart('<%= p.getId() %>', this.value)">
                    </td>
                    <td>
                        <% if (p.getSizePrices() != null && !p.getSizePrices().isEmpty()) { %>
                        <%= nf.format(p.getSizePrices().get(0).getPrice()) %>
                        <% } else { %>
                        No Price Available
                        <% } %>
                    </td>

                    <td>
                        <button class="btn btn-danger" onclick="removeFromCart('<%= p.getId() %>')">Xóa</button>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>


                </tbody>
            </table>
        </div>
        <div class="d-flex justify-content-between align-items-center mt-3">
            <span class="cart-total">Tổng cộng:0 đ</span>
            <div>
                <a id="continue-shopping" href="homepage.jsp" class="btn btn-continue">Tiếp tục mua hàng</a>
                <a id="checkout" href="pages/payment.html" class="btn btn-custom">Thanh toán</a>

            </div>
        </div>
        <p class="text-muted mt-2 promo-message">* Miễn phí vận chuyển cho đơn hàng trên 450,000₫</p>
    </div>

    <%} else {%>
    <div class="text-center mt-4 mb-3 fs-2 color-gray ">Giỏ hàng gì mà trống vậy nè >.<<a href="<%=url%>/product" class="text-color text-decoration-none fs-5"> Lấp đầy ở đây nè ^.^</a></div>
    <div class="text-center mb-4">
        <img src="image/cart-empty.png" alt="" class="imgbg">
    </div>

    <%}%>
    <!-- Chân trang -->
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
    <!-- External JS -->
<%--    <script src="js/cart.js"></script>--%>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>