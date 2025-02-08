<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chính sách</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/deliveryPolicy.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/fotter.css">
</head>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<body>
<header>
    <jsp:include page="Products/header.jsp"></jsp:include>
</header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <div class="d-flex justify-content-center my-4">
                <ul class="nav nav-tabs" id="navbarNav" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link" id="about-tab" href="<%=url%>/introWebsite" role="tab">Giới thiệu</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a class="nav-link active" id="policy-tab" href="<%=url%>/deliveryPolicy" role="tab">Chính sách</a>
                    </li>
                    
                </ul>
            </div>
        </div>
    </nav>
    

    <main class="main">
        <div class="container">
            <div class="row g-0">
                <div class="col-lg-3 d-flex border-bottom-box" style="flex-direction: column; border: #f1f1f1 1px solid; display: block; height: 100%;">
                    <div id="chinh-sach-doi-tra-id" class="py-3 px-3">
                        <a class="nav-link" href="" style="text-decoration: none;" data-content="chinh-sach-doi-tra">CHÍNH SÁCH ĐỔI, TRẢ, HOÀN TIỀN</a>
                    </div>
                    <div id="chinh-sach-bao-mat-id" class="py-3 px-3">
                        <a class="nav-link" href="" style="text-decoration: none;" data-content="chinh-sach-bao-mat">CHÍNH SÁCH BẢO MẬT</a>
                    </div>
                    <div id="huong-dan-thanh-toan-id" class="py-3 px-3">
                        <a class="nav-link" href="" style="text-decoration: none;" data-content="huong-dan-thanh-toan">HƯỚNG DẪN THANH TOÁN</a>
                    </div>
                </div>
                <div class="col-lg-9 d-flex">
                    <div id="content-area" class="container d-flex"
                        style="flex-direction: column; flex: 1; margin-left: 20px; gap: 10px;">
                        <h3>CHÍNH SÁCH QUI ĐỊNH CHUNG</h3>

                        <h4>1. CHẤP THUẬN CÁC ĐIỀU KIỆN SỬ DỤNG</h4>
                        <p>Khi sử dụng Website của chúng tôi, Quý khách đã mặc nhiên chấp thuận các điều khoản và
                            điều kiện sử dụng được quy định dưới đây. Để biết được các sửa đổi mới nhất, Quý khách nên
                            thường xuyên kiểm tra lại “Điều Kiện Sử Dụng”.


                        </p>
                        <P> CHúng tôi có quyền thay đổi, điều chỉnh, thêm hay bớt các nội dung của “Điều Kiện Sử
                            dụng” tại bất kỳ thời điểm nào. Nếu Quý khách vẫn tiếp tục sử dụng Website sau khi có các
                            thay đổi như vậy thì có nghĩa là Quý khách đã chấp thuận các thay đổi đó.</P>
                        <h4>2. TÍNH CHẤT CỦA THÔNG TIN HIỂN THỊ</h4>
                        <p>Các nội dung hiển thị trên Website nhằm mục đích cung cấp thông tin về bánh sinh nhật, thông
                            tin sản phẩm và dịch vụ mà mà chúng tôi đang cung cấp.

                            Các thông tin khác liên quan nhằm phục vụ nhu cầu tìm hiểu của khách hàng đều được ghi rõ
                            nguồn cung cấp.
                        </p>

                        <h4>3. LIÊN KẾT ĐẾN WEBSITE KHÁC</h4>
                        <p>Các nội dung hiển thị trên Website nhằm mục đích cung cấp thông tin về bánh sinh nhật, thông
                            tin sản phẩm và dịch vụ mà mà chúng tôi đang cung cấp.

                            Các thông tin khác liên quan nhằm phục vụ nhu cầu tìm hiểu của khách hàng đều được ghi rõ
                            nguồn cung cấp.
                        </p>


                        <h4>4. LIÊN KẾT TỪ WEBSITE KHÁC</h4>
                        <p>ITCAKE.VN không cho phép bất kỳ nhà cung cấp dịch vụ internet nào được phép “đặt
                            toàn bộ” hay “nhúng” bất kỳ thành tố nào của Website này sang một trang khác hoặc sử dụng
                            các kỹ thuật làm thay đổi giao diện / hiển thị mặc định của Website mà chưa có sự đồng ý của
                            website ITCAKE.


                        </p>


                        <h4>5. MIỄN TRỪ TRÁCH NHIỆM</h4>
                        <p>Khi truy cập vào website này, quý khách mặc nhiên đồng ý rằng ITCAKE.vn, các nhà cung
                            cấp khác cùng với đối tác liên kết, nhân viên của họ không chịu bất cứ trách nhiệm nào liên
                            quan đến thương tật, mất mát, khiếu kiện, thiệt hại trực tiếp hoặc gián tiếp do không lường
                            trước hoặc do hậu quả để lại dưới bất cứ hình thức nào phát sinh từ việc:
                        </p>
                        <p>ITCAKE.vn từ chối trách nhiệm hay đưa ra đảm bảo rằng website sẽ không có lỗi vận hành,
                            an toàn, không bị gián đoạn hay tính chính xác, đầy đủ và đúng hạn của các thông tin hiển
                            thị.</p>
                        <p> Thông tin hiển thị tại website này không đi kèm bất kỳ đảm bảo hay cam kết trách nhiệm từ
                            phía web ITCAKE.vn về sự phù hợp của sản phẩm, dịch vụ mà người mua đã lựa chọn:</p>
                        <ul>

                            <li>(1) Sử dụng các thông tin trên website này.</li>
                            <li>(2) các truy cập kết nối từ website này.</li>
                            <li>(3) Đăng ký thành viên, đăng ký nhận thư điện tử hay tham gia vào chương trình khách
                                hàng thường xuyên của ITCAKE.vn</li>
                        </ul>
                        <h4>6. QUYỀN SỞ HỮU TRÍ TUỆ</h4>
                        <p>Các nội dung hiển thị trên Website nhằm mục đích cung cấp thông tin về bánh sinh nhật, thông
                            tin sản phẩm và dịch vụ mà mà ITCAKE.vn đang cung cấp.

                            Các thông tin khác liên quan nhằm phục vụ nhu cầu tìm hiểu của khách hàng đều được ghi rõ
                            nguồn cung cấp.
                        </p>
                        <h4>7. ĐIỀU CHỈNH VÀ SỬA ĐỔI</h4>
                        <p>Các nội dung hiển thị trên Website nhằm mục đích cung cấp thông tin về bánh sinh nhật, thông
                            tin sản phẩm và dịch vụ mà mà ITCAKE.vn đang cung cấp.

                            Các thông tin khác liên quan nhằm phục vụ nhu cầu tìm hiểu của khách hàng đều được ghi rõ
                            nguồn cung cấp.
                        </p>



                    </div>
                </div>
            </div>
        </div>
    </main>
<footer>
    <jsp:include page="./Footer.jsp"></jsp:include>
</footer>
    <script src="./js/deliveryPolicy.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
     
</body>

</html>