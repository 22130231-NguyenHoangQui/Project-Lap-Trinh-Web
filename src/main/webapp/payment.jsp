<%@ page import="com.edu.hcmuaf.fit.model.Account" %>
<%@ page import="com.edu.hcmuaf.fit.model.Cart" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.edu.hcmuaf.fit.model.Product" %>
<%@ page import="com.edu.hcmuaf.fit.model.ProductSizes" %>
<%@ page import="java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- External CSS -->
    <link rel="stylesheet" href="css/payment.css">
    <link rel="stylesheet" href="css/fotter.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<!--page content-->
<%
    Account a =(Account) session.getAttribute("account");
    if (a == null) {
%>
<div class="container p-0 mgt text-center fw-bold">Bạn chưa đăng nhập! <a href = <%=url%>/signIn.jsp>Đăng nhập</a></div>
<%
        return;
    }
%>
<%
    Cart c =(Cart) session.getAttribute("Cart");
    double sumPay = 0;
    double shippingFee=0;
    if (!a.getVerifyAccount().isStateVerify()) {
%>
<div class="container p-0 mgt text-center fw-bold">Bạn chưa xác thực tài khoản <a href = <%=url%>/reVerifyCode>Xác thực ngay</a></div>
<%
}
//else if (a != null && c!=null ) {
%>
<div class="container my-5">
    <h2 class="text-center mb-4">Thanh toán</h2>
    <!-- Thông tin khách hàng và địa chỉ nhận hàng -->
    <div class="row mb-3">
        <div class="col-md-6">
            <div class="card p-4">
                <div class="d-flex justify-content-between align-items-center">
                    <h5>Địa chỉ nhận hàng</h5>
                    <button class="btn btn-link p-0" onclick="editCustomerInfo()">
                        <i class="fas fa-edit"></i>
                    </button>
                </div>
                <ul class="list-unstyled mb-0">
                    <li><strong>Họ tên:</strong> <span id="fullName"><%=a.getName()%></span></li>
                    <li><strong>Số điện thoại:</strong><span id="phoneNumber"><%=a.getPhoneNumber()%></span></li>
                    <li><strong>Email:</strong> <span id="email"><%=a.getEmail()%></span></li>
                    <li><strong>Địa chỉ nhận hàng:</strong><span id="address"><%=a.getAddressReceive()%></span> </li>
                </ul>
            </div>
        </div>
        <div class="col-lg-2 col-sm-2 mt-1 text-end">
            <button class="btnAdd bgcolor bd-full" id ="editInFor" data-bs-toggle="modal" data-bs-target="#changeInfor"><i class="fa fa-pencil text-color " title="Chỉnh sửa thông tin liên hệ" aria-hidden="true"></i></button>
        </div>
        <div class="modal fade" id="changeInfor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa thông tin liên hệ</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="changeNam" onsubmit="return check()" method="post" action="ChangeInforInPayment">
                            <%
                                String res = (String) request.getAttribute("res");
                                res = (res == null) ? "" : res;
                            %>
                            <table>
                                <thead>
                                <div class="text-end">
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <tr>
                                    <td colspan="4">
                                        <h5 class="pt-3 pb-1"> THAY ĐỔI THÔNG TIN </h5>
                                        <div class="text-danger text-center w-100" id="error"><%= res %></div>
                                    </td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="2">
                                        <%
                                            if (a.getVerifyAccount().isStateVerify()) { %>
                                        <label class="w-100">Tài khoản đã xác thực <i class="fa fa-check-circle text-success" aria-hidden="true"></i></label>
                                        <% } else { %>
                                        <label class="w-100">Tài khoản của bạn chưa xác thực, <a href="reVerifyCode">xác thực ngay</a></label>
                                        <% } %>
                                    </td>
                                </tr>
                                <tr id="changeName">
                                    <td>
                                        <label>Họ và tên</label>
                                    </td>
                                    <td class="w-50">
                                        <div id="InName">
                                            <input id="HienThiTen" name="TenHT" type="text" value="<%= a.getName() %>">
                                        </div>
                                    </td>
                                </tr>
                                <tr id="changeSDT">
                                    <td>
                                        <label>Số điện thoại</label>
                                    </td>
                                    <td>
                                        <div id="InSDT">
                                            <input id="HienThiSDT" name="SDTHT" type="text" value="<%= a.getPhoneNumber() %>">
                                        </div>
                                    </td>
                                </tr>
                                <tr id="changegGmail">
                                    <td>
                                        <label>Email</label>
                                    </td>
                                    <td>
                                        <div id="InGmail">
                                            <input id="HienThiGmail" name="GmailHT" type="text" value="<%= a.getEmail() %>">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Giới tính</label>
                                    </td>
                                    <td>
                                        <div class="gender">
                                            <label class="ms-0" for="male">Nam</label><input class="ms-2 me-3" type="radio" id="male" name="gender" value="Nam" <%= a.getGender().equals("Nam") ? "checked" : "" %> >
                                            <label for="female">Nữ</label> <input class="ms-2 me-3" type="radio" id="female" name="gender" value="Nữ" <%= a.getGender().equals("Nữ") ? "checked" : "" %>>
                                            <label for="other">Khác</label> <input class="ms-2 me-3" type="radio" id="other" name="gender" value="Khác" <%= a.getGender().equals("Khác") ? "checked" : "" %>>
                                        </div>
                                    </td>
                                </tr>
                                <tr id="changeNgaySinh">
                                    <td>
                                        <label>Ngày sinh</label>
                                    </td>
                                    <td>
                                        <div id="InNS">
                                            <input id="HienThiNS" name="HienThiNS" type="date" value="<%= a.getBirthDay() %>">
                                        </div>
                                    </td>
                                </tr>
                                <tr id="changeDC">
                                    <td>
                                        <label>Địa chỉ</label>
                                    </td>
                                    <td>
                                        <div id="InDiaChi">
                                            <input id="HienThiDC" name="DCHT" type="text" value="<%= a.getAddress() %>">
                                        </div>
                                    </td>
                                </tr>
                                <tr id="changeDCReceive">
                                    <td>
                                        <label>Địa chỉ nhận hàng</label>
                                    </td>
                                    <td>
                                        <div>
                                            <input id="HienThiDCReice" name="DCNHHT" type="text" value="<%= a.getAddressReceive() %>">
                                        </div>
                                    </td>
                                </tr>
                                <tr id="SubmitSB">
                                    <td colspan="2">
                                        <div><button id="submit" name="SB" style="color: white">LƯU</button></div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-md-6">
            <div class="card p-4">
                <div class="s14_gt">THỜI GIAN GIAO HÀNG:</div>
                <ul class="s14_gn">
                    <li>Khung giờ giao hàng: 08:00 - 19:00 thứ 2 - Chủ Nhật. </li>
                    <li>Thời gian giao hàng dự kiến có thể thay đổi tùy vào khu vực và đơn vị vận chuyển.</li>
                    <li>Miễn phí vận chuyển trong bán kính 3km cho các đơn hàng trên 450,000</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Bảng sản phẩm -->
    <table class="table table-bordered align-middle">
        <thead class="table-secondary">
        <tr>
            <th>STT</th>
            <th>Sản phẩm</th>
            <th>Đường kính</th>
            <th>Đơn giá</th>
            <th>Số lượng</th>
            <th>Thành tiền</th>
        </tr>
        </thead>
        <tbody >
        <%
            NumberFormat nF = NumberFormat.getCurrencyInstance();
            Iterator<Product> it = c.list().iterator();
            int stt = 1;
            Product p;

            while(it.hasNext()) {
                p = it.next();
        %>
        <!-- Sản phẩm mẫu -->
        <tr>
            <td><%=stt%></td>
            <td>
                <img src="<%=url%>/Products/<%=
    (p.getProductImages().isEmpty()) ? "" : p.getProductImages().get(0).getUrl()
%>" class="img-fluid rounded" style="max-width: 80px;">
                <span class="ms-2"><%= p.getNameProduct() %></span>
            </td>
            <td>
              <%=session.getAttribute("BuyNowPrice")%>
            </td>
            <td>
               <%= session.getAttribute("BuyNowPrice")%>
            </td>
            <td><%= p.getQuantity() %></td>


            <td class="subtotal">
                <%=
                    sumPay
                %>
            </td>

<%--        <%--%>
<%--                sumPay += p.getSizePrices().get(0).getPrice()*p.getQuantity();--%>
<%--                stt++;--%>
<%--            }--%>
<%--            session.setAttribute("Sum",sumPay);--%>
<%--        %>--%>
                <%
    if (p.getSizePrices() != null && !p.getSizePrices().isEmpty()) {
        double price = p.getSizePrices().get(0).getPrice();
        int quantity = p.getQuantity();
        sumPay += price * quantity;
    } else {
        // Nếu p.getSizePrices() là null hoặc rỗng, có thể xử lý trường hợp này như là 0 hoặc thông báo lỗi.
        // Ví dụ, bạn có thể cho sumPay = 0 trong trường hợp này
        sumPay += 0; // Hoặc xử lý theo cách khác
    }
%>

        </tbody>
    </table>

    <!-- Tổng thanh toán  -->
    <div class="card p-4">
        <h5>Thông tin thanh toán</h5>
        <div class="mb-3">
            <div class="message-to-shop mt-4">
                <label for="shopMessage" class="form-label">Lời nhắn:</label>
                <textarea id="shopMessage" class="form-control" rows="3" placeholder="Nhập lời nhắn cho shop tại đây..."></textarea>
            </div>
        </div>
        <p>Tổng tiền hàng: <span id="total-price"><%=nF.format(sumPay)%></span></p>
        <p>Phí vận chuyển: <span><%=nF.format(shippingFee)%></span></p>
        <p><strong>Tổng thanh toán: <span id="final-price"><%=nF.format(sumPay+shippingFee)%></span></strong></p>
    </div>
    <!-- Modal hiển thị mã giảm giá -->
    <div class="modal-form d-none" id="discount-modal">
        <div class="modal-content">
            <h5>Danh sách mã giảm giá</h5>
            <ul id="discount-list">
                <li data-code="DISCOUNT10" class="discount-item">
                    <div>
                        <strong>Mã: DISCOUNT10</strong> - Giảm 10%<br>
                        <span>Thời hạn đến: 31/12/2024</span>
                    </div>
                </li>
                <li data-code="FREESHIP" class="discount-item">
                    <div>
                        <strong>Mã: FREESHIP</strong> - Miễn phí vận chuyển<br>
                        <span>Thời hạn đến: 15/01/2025</span>
                    </div>
                </li>
            </ul>
            <button type="button" class="btn btn-success" onclick="closeDiscountModal()">Đóng</button>
        </div>
    </div>
    <div class="pay text-end mt-2">
        <a href="<%=url%>/Payment">
            <button id="btnPay" >Đặt hàng</button>
        </a>
    </div>
</div>
<%--<%--%>
<%--}else if((String)session.getAttribute("donePayment")!=null){--%>
<%--%>--%>
<div class="container p-0 mgt text-center fw-bold">Đơn hàng của bạn đã được đặt. Bạn có thể kiểm tra lại đơn hàng trên Email! <a href = <%=url%>/homepage>Mua hàng tiếp!</a></div>
<div class="text-center mb-4">
    <img src="image/comfirm.png" alt="" class="imgbg">
</div>
<%
    }
%>
<!-- Chân trang -->
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>
<script>
    function updateTotalMoney() {
        $('tr').each(function () {
            var amountText = $(this).find('td:eq(6) span').text();
            var priceText = $(this).find('td:eq(5) span').text();
            priceText = priceText.replace(/\./g, "");
            var amount = parseInt(amountText);
            var price = parseInt(priceText);
            var total = amount * price;
            total = total.toLocaleString('en-US');
            total = total.replace(/\,/g, ".")
            $(this).find('td:eq(7) span').text(total);
        })
    }
    updateTotalMoney(); //gọi hàm tính thành tiền sau khi load web
    function totalMoneyPay() {
        var total = 0;
        $('tr').each(function () {
            var moneyText = $(this).find('td:eq(7) span').text();
            moneyText = moneyText.replace(/\./g, "");
            var money = parseInt(moneyText);
            if (!isNaN(money)) {
                total += money;
            }
        })
        total = total.toLocaleString('en-US');
        total = total.replace(/\,/g, ".")
        $('#totalMoney').text(total);
        $('#totalPay').text(total);
    }
    totalMoneyPay();
</script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- External JS -->
</body>
</html>