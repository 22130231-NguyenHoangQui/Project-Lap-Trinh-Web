<%@ page import="com.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/settingAll.css">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/fotter.css">
    <link rel="stylesheet" href="./css/homepage.css">

</head>

<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<div style="height: 389.469px; touch-action: pan-y;">
    <img width="1020" height="388" src="../image/imghomepage/logo/banhsinhnhat-home-banner.jpg" alt=""
         style="width: 100%;">
</div>
<main id="main">
    <div class="container padding-all-top">
        <h4>Danh mục bán chạy nhất</h4>
        <div class="row " style="padding-bottom: 30px;">
            <c:forEach var="category" items="${listCategory}">
                <div class="  col-md-4 col-lg-3 box-hover">
                    <div class="col-inner" style="width: 100%;">
                        <div class="product-small box" style="border: 1px solid #e5e5e5; width: 100%;">
                            <a href="./DetailProduct.html">
                                <div class="box-image" style="width: 100%;">

                                    <img width="247" height="296" src="${category.imageUrl}" alt=""
                                         style="width: 100%;">
                                </div>
                                <div class="box-text text-center">
                                    <div class="title-wrapper">
                                        <p>
                                            <span class="s3_c">${category.name}</span>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>


        <div class="s s4 ">
            <div class="container" style="max-width: 1340px;">
                <a href="">
                    <img src="./image/imghomepage/logo/home-ads.jpg" alt="">
                </a>
            </div>

        </div>
    </div>
    <div class="container padding-all-top">
        <h4>Xu hướng</h4>
        <div class="row " style="padding-bottom: 30px;">
            <!-- Box 1 -->
                <%
                    ArrayList<Product> productBest = (ArrayList<Product>) request.getAttribute("listProductBestSelling");
                    if (!productBest.isEmpty() && productBest != null) {
                        for (Product p : productBest) {%>
                <div class="  col-md-4 col-lg-3 box-hover">

                    <div class="col-inner">
                        <div class="product-small box" style="border: 1px solid #e5e5e5;">
                            <a href="" style="margin-left: auto; margin-right: auto;">
                                <div class="box-image">
<%--                                    <img width="247" height="296"--%>
<%--                                         src="${productBest.productImages[0].imageId}"--%>
<%--                                         alt="" style="width: 100%;">--%>
    <a href="<%=url%>\DetailProduct?pid=<%=p.getId()%>&cid=<%=p.getIdCate()%>">
        <img src="<%=url%>\Products\<%=(p.getProductImages().isEmpty())?"":p.getProductImages().get(0).getUrl()%>" class="card-img-top img_p" alt="...">
    </a>
                                </div>
                                <div class="box-text text-center">
                                    <div class="title-wrapper">
                                        <p style="padding-top: 10px;">
                                            <span class="s3_c"><%=p.getNameProduct()%></span>
                                            <span class="s3_c text-fontweight"><%=p.getSizePrices().get(0).getPrice()%></span>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            <%
                    }
                }
            %>
        </div>
    </div>

    <div class="container padding-all-top">
        <h4>Bán chạy trong tháng</h4>
        <div class="row " style="padding-bottom: 30px;">
            <%
                ArrayList<Product> productMonth = (ArrayList<Product>) request.getAttribute("listProductMonth");
                if (!productBest.isEmpty() && productBest != null) {
                    for (Product p : productMonth) {%>

                <div class="  col-md-4 col-lg-3 box-hover">
                    <div class="col-inner">
                        <div class="product-small box" style="border: 1px solid #e5e5e5;">
                            <a href="" style="margin-left: auto; margin-right: auto;">
                                <div class="box-image">
                                    <a href="<%=url%>/DetailProduct?pid=<%=p.getId()%>&cid=<%=p.getIdCate()%>">
                                        <img src="<%=url%>\Products\<%=(p.getProductImages().isEmpty())?"":p.getProductImages().get(0).getUrl()%>" class="card-img-top img_p" alt="...">
                                    </a>
                                </div>
                                <div class="box-text text-center">
                                    <div class="title-wrapper">
                                        <p style="padding-top: 10px;">
                                            <span class="s3_c"><%=p.getNameProduct()%></span>
                                            <span class="s3_c text-fontweight"><%=p.getSizePrices().get(0).getPrice()%></span>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            <%
                    }
                }
            %>

        </div>
    </div>

    <div class="container padding-all-top">
        <h4>Cảm nhận khách hàng</h4>
        <div class="row ">
            <div class="s5_m">
                <div class="s5_i">
                    <div class="s5_iw">
                        <div class="s5_ih">
                            <div class="s5_a">

                                <img src="../image/imghomepage//danhmucbanchay/khachhang1.jpg" alt="Thu Hằng">

                            </div>
                            <div class="s6_iu">
                                <div class="s5_n">Thu Hằng</div>
                                <div class="s5_j">Nhân viên văn phòng</div>
                            </div>
                        </div>
                        <div class="s5_ib">
                            <div class="s5_f">Bánh ngon, trang trí đẹp và lên hình rất xinh luôn. Bánh xoài chanh
                                leo vị thơm cực kì. Bánh không bị ngọt vị hóa học. Lần đầu mua và rất hài lòng. Rất
                                cám ơn
                            </div>
                        </div>
                    </div>
                </div>
                <div class="s5_i">

                    <div class="s5_iw">
                        <div class="s5_ih">
                            <div class="s5_a">

                                <img src="../image/imghomepage/danhmucbanchay/kitty_cus.jpeg" alt="Thu Hằng">

                            </div>
                            <div class="s6_iu">
                                <div class="s5_n">Phương</div>
                                <div class="s5_j">Nhân viên văn phòng</div>
                            </div>
                        </div>
                        <div class="s5_ib">
                            <div class="s5_f">Địa chỉ mua hàng uy tín. Bánh đặt làm đúng mẫu, ship nhanh và cẩn
                                thận.
                                Vừa mở bánh ra đã thấy mùi thơm nhẹ của kem tươi rồi.
                                Mình đặt bánh về trước tiệc khá lâu nhưng lớp kem không bị chảy. Hình dáng bánh vẫn
                                rất đẹp.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container padding-all-top">
        <div style=" display: flex; justify-content: flex-start; align-items: center; padding: 0px;">
            <h4 style="padding-top: 25px; "> Bài viết mới nhất</h4>
            <button class="btn btn-primary" style="text-wrap: nowrap; ">Xem tất cả</button>
        </div>
        <div class="row" style="gap: 0px;">

            <div class="col-lg-3 box-hover">
                <div class="col-inner">
                    <div class="product-small box" style="border: 1px solid #e5e5e5;">
                        <a href="" style="margin-left: auto; margin-right: auto;">
                            <div class="box-image">
                                <img width="247" height="230"
                                     src="../image/imghomepage/CommentCustomer/baiviet1.jpg" alt=""
                                     style="width: 100%">

                            </div>
                            <div class="box-text1 text-center1">
                                <div class="title-wrapper">
                                    <p style="padding-top: 10px;">
                                        Đặt bánh sinh nhật in sinh nhật ảnh đẹp tại quận Thủ Đức
                                    </p>
                                    <div
                                            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100%; padding-bottom: 20px;">
                                        Bạn đã quá quen thuộc với các mẫu bánh kem truyền thống trang trí hoa hay
                                        phụ
                                        kiện rồi phải không? Và một chiếc bánh kem được in ảnh chipi
                                    </div>
                                    <a href="">Đọc tiếp</a>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 box-hover">
                <div class="col-inner">
                    <div class="product-small box" style="border: 1px solid #e5e5e5;">
                        <a href="" style="margin-left: auto; margin-right: auto;">
                            <div class="box-image">
                                <img width="247" height="230"
                                     src="../image/imghomepage/CommentCustomer/baiviet2.jpg" alt=""
                                     style="width: 100%">
                            </div>
                            <div class="box-text1 text-center1">
                                <div class="title-wrapper">
                                    <p style="padding-top: 10px;">
                                        Top những chiếc bánh sinh nhật công chúa được yêu thích
                                    </p>
                                    <div
                                            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100%; padding-bottom: 20px;">
                                        Siêu nhân, ô tô hay mô hình là món đồ chơi yêu thích của bé trai, thì các bé
                                        gái lại thích mê các nàng công chúa trong bộ phim hoạt hình Disney. Chính vì
                                        lý do đó mà các mẫu bánh kem công chúa được tạo hình với nhiều màu sắc, kiểu
                                        dáng đảm bảo sẽ khiến bé thích thú cho xem. Hãy tham khảo bài viết dưới đây
                                        để có lựa chọn tuyệt với cho bữa tiệc sắp tới.
                                    </div>

                                    <a href="">Đọc tiếp</a>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 box-hover">
                <div class="col-inner">
                    <div class="product-small box" style="border: 1px solid #e5e5e5;">
                        <a href="#">
                            <div class="box-image">
                                <img width="247" height="230"
                                     src="../image/imghomepage/CommentCustomer/baiviet3.jpg" alt=""
                                     style="width: 100%">
                            </div>
                            <div class="box-text1 text-center1">
                                <div class="title-wrapper">
                                    <p style="padding-top: 10px;">
                                        10 mẫu bánh sinh nhật được đánh giá cao tại shop
                                    </p>
                                    <div
                                            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100%; padding-bottom: 20px;">
                                        Hiện nay, xu hướng bánh kem tạo hình thú 3D đang được nhiều người ưa chuộng
                                        bởi sự nổi bật, ngộ nghĩnh và đáng yêu. Mẫu bánh kem tạo hình thú 3D luôn là
                                        điểm nhấn thu hút bất kỳ bữa tiệc nào bởi sự xinh xắn và độc đáo. Vậy nên
                                        đừng ngần ngại chọn một chiếc bánh kem tạo hình thú cho bữa tiệc của bạn.
                                        Bài viết này sẽ tổng hợp những mẫu bánh sinh nhật tạo hình thú độc đáo nhất
                                        dành cho bạn.
                                    </div>
                                    <a href="">Đọc tiếp</a>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 box-hover">
                <div class="col-inner">
                    <div class="product-small box" style="border: 1px solid #e5e5e5;">
                        <a href="" style="margin-left: auto; margin-right: auto;">
                            <div class="box-image">
                                <img width="247" height="230"
                                     src="../image/imghomepage/CommentCustomer/baiviet4.jpg" alt=""
                                     style="width: 100%">
                            </div>
                            <div class="box-text1 text-center1">
                                <div class="title-wrapper">
                                    <p style="padding-top: 10px;">
                                        Đặt bánh sinh nhật in sinh nhật ảnh đẹp tại quận Thủ Đức chỉ từ 90K
                                    </p>
                                    <div
                                            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100%; padding-bottom: 20px;">
                                        Hiện nay các mẫu bánh kem, bánh sinh nhật luôn được cập nhật mẫu mã liên
                                        tục,
                                        nhất là tại Hà Nội các mẫu bánh kem luôn đi đầu trào lưu được giới trẻ yêu
                                        thích
                                        đón nhận. Nếu bạn ở quận Đống Đa mà chưa biết đặt bánh sinh nhật ở đâu thì
                                        đừng
                                        bỏ qua bài viết này nhé. Hãy cùng banhsinhnhat.com tham khảo một vài mẫu
                                        bánh
                                        sinh nhật đẹp được nhiều người yêu thích.
                                    </div>
                                    <a href="">Đọc tiếp</a>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>


<script src="../js/homepage.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>

</html>