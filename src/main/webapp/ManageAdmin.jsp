<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/settingAll.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/fotter.css">
    <link rel="stylesheet" href="css/admin.css">

    <style>
        .d-none {
            display: none;
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
        <div class="row" style="margin-top: 30px; ">
            <div class="col-lg-2  boder-left">
                <div class="d-flex align-items-center gap-1" style="margin-top: 30px;" id="cate">
                    <i class="fa-solid fa-bars"></i>
                    <h4 style="margin: 0;">Danh mục quản lý</h4>

                </div>
                <ul class="nav nav-pills d-flex flex-column  my-3 gap-2" id="typeManage">
                    <li class="nav-item side-bar">

                        <a href="#" class="nav-link " id="dashboardLink">
                            <i class="bi bi-controller me-2"></i>
                            Tổng quan
                        </a>
                    </li>
                    <li class="nav-item side-bar">
                        <a href="#" class="nav-link " class="list-group-item list-group-item-action">
                            <i class="bi bi-person-circle me-2"></i>
    Quản lý tài khoản
                        </a>
                    </li>
                    <li class="nav-item side-bar">
                        <a href="#" class="nav-link " >
                            <i class="bi bi-grid me-2"></i>
                            Quản lý sản phẩm
                        </a>
                    </li>
                    <li class="nav-item side-bar">
                        <a href="#" class="nav-link ">
                            <i class="bi bi-grid me-2"></i>
                            Quản lý danh mục
                        </a>
                    </li>
                    <li class="nav-item side-bar">
                        <a href="#" class="nav-link " >
                            <i class="bi bi-table me-2"></i>
                            Quản lý hóa đơn
                        </a>
                    </li>
                    <li class="nav-item side-bar">
                        <a href="#" class="nav-link ">
                            <i class="bi bi-table me-2"></i>
                            Quản lý giảm giá
                        </a>
                    </li>

                </ul>
            </div>
            <div class="container col-md-9 ms-sm-auto col-lg-10 px-md-4 boder-right" style="width: max-content;">
                <div class="container   d-flex justify-content-between align-items-center  border-bottom mt-3" style="width: max-width;">

                </div>

<%--                <div class="contentDate container" id="contentDiv" style="display: none;">--%>

                </div>
                <div class="container" >
                    <div id="content" class="mt-5">

                        <div class="container mt-5" style="width: auto;" id="mngDas">
                            <div class="row text-center mb-4">
                                <div class="col-md-3">
                                    <div class="card shadow-sm">
                                        <div class="card-body">
                                            <h5 class="card-title">Đơn hàng hôm nay</h5>
                                            <p id="orders-today" class="card-text text-primary fs-4">0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card shadow-sm">
                                        <div class="card-body">
                                            <h5 class="card-title">Doanh thu hôm nay</h5>
                                            <p id="revenue-today" class="card-text text-success fs-4">0 VND</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card shadow-sm">
                                        <div class="card-body">
                                            <h5 class="card-title">Sản phẩm bán được</h5>
                                            <p id="products-sold" class="card-text text-info fs-4">0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card shadow-sm">
                                        <div class="card-body">
                                            <h5 class="card-title">Tổng doanh thu tháng</h5>
                                            <p id="monthly-revenue" class="card-text text-warning fs-4">0 VND</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card shadow">
                                        <div class="card-header bg-primary text-white text-center">
                                            <h5>Top Lượt Xem Gần Đây</h5>
                                        </div>
                                        <div class="card-body">
                                            <table class="table table-striped table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>Ngày</th>
                                                    <th>Mã sản phẩm</th>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Lượt xem</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>SP001</td>
                                                    <td>Bánh sinh nhật A</td>
                                                    <td>50</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>SP002</td>
                                                    <td>Bánh sinh nhật B</td>
                                                    <td>45</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>SP003</td>
                                                    <td>Bánh sinh nhật C</td>
                                                    <td>40</td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td>SP004</td>
                                                    <td>Bánh sinh nhật D</td>
                                                    <td>30</td>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <td>SP005</td>
                                                    <td>Bánh sinh nhật E</td>
                                                    <td>25</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="mngAccount" class="d-none" style="margin: 0">
                            <div class="col-lg-6">
                                <h5 >Quản lý tài khoản</h5>
                            </div>
                            <div class="col-lg-6 text-end">
<%--                                <%if(account.getRole() == 0) {%>--%>
                                <button class="btn btn-sm btn-outline-secondary" id ="btnAddAccount" data-bs-toggle="modal" data-bs-target="#addAccount" >
                                    <i class="fa-solid fa-gear" aria-hidden="true" title="Thêm tài khoản"></i>
                                </button>
<%--                                <%}%>--%>
                            </div>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>TÊN NGƯỜI DÙNG</th>
                                    <th>EMAIL</th>
                                    <th>SĐT</th>
                                    <th>MẬT KHẨU</th>
                                    <th>CHỨC VỤ</th>
                                    <th>NGÀY TẠO</th>
                                    <th>NGÀY CẬT NHẬT</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- Dữ liệu bảng sẽ được thêm vào đây -->
                                <tr>
                                    <td>1</td>
                                    <td>Nguyễn Văn A</td>
                                    <td>nguyenvana@example.com</td>
                                    <td>0901234567</td>
                                    <td>password123</td>
                                    <td>Admin</td>
                                    <td>01/01/2020</td>
                                    <td>01/01/2022</td>
                                    <td>
                                        <%--                                      <button class="icon-button" onclick="openFormCustomerSetting(this)">--%>
                                        <%--                                          <i class="fa-solid fa-pen"></i>--%>
                                        <%--                                      </button>--%>
                                        <%--                                      <button class="icon-button" onclick="deleteRowCustomer(this)">--%>
                                        <%--                                          <i class="fa-solid fa-trash"></i>--%>
                                        <%--                                      </button>--%>
                                    </td>
                                </tr>
                                <!-- Các dòng khác cũng tương tự -->
                                </tbody>
                            </table>
                        </div>

                    </div>
<%--                  <div id="myChart">--%>
<%--                    --%>


<%--                  </div>--%>
                </div>
            </div>
        </div>
    </main>


    <!-- overlay mờ khi hiện form  -->
    <div id="overlay" class="overlay"></div>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.2/dist/chart.umd.js"
        integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp"
        crossorigin="anonymous"></script>
<%--    <script src="js/admin.js"></script>--%>
    <script>
        $(document).ready(function () {
            $('#cate').click(function () {
                var typeManage = $('#typeManage');
                if (typeManage.css("display") === "none") {
                    typeManage.css("display", "block");
                } else {
                    typeManage.css("display", "none");
                }
            });

            // Chọn danh mục quản lý
            $('#typeManage li a ').click(function () {
                console.log(123)
                var selectedType = $(this).text().trim();
                console.log("selectedType:", selectedType);
                if (selectedType === "Quản lý tài khoản") {
                    $('#mngAccount').removeClass('d-none');
                    $('#mngDas').addClass('d-none');

                    // $('#mngProduct').addClass('d-none');
                    // $('#mngInvoice').addClass('d-none');
                    // $('#mngCate').addClass('d-none');
                    // $('#mngSup').addClass('d-none');
                }
                           // else if (selectedType === "Quản lý sản phẩm") {
                    // $('#mngAccount').addClass('d-none');
                    // $('#mngInvoice').addClass('d-none');
                    // $('#mngProduct').removeClass('d-none');
                    // $('#mngCate').addClass('d-none');
                    // $('#mngSup').addClass('d-none');
                // }else if (selectedType === "Quản lý hóa đơn") {
                //     $('#mngProduct').addClass('d-none');
                //     $('#mngAccount').addClass('d-none');
                //     $('#mngInvoice').removeClass('d-none');
                //     $('#mngCate').addClass('d-none');
                //     $('#mngSup').addClass('d-none');
                // }else if (selectedType === "Quản lý danh mục") {
                //     $('#mngProduct').addClass('d-none');
                //     $('#mngAccount').addClass('d-none');
                //     $('#mngInvoice').addClass('d-none');
                //     $('#mngCate').removeClass('d-none');
                //     $('#mngSup').addClass('d-none');
                // }
                // else if (selectedType === "Quản lý nhà cung cấp") {
                //     $('#mngProduct').addClass('d-none');
                //     $('#mngAccount').addClass('d-none');
                //     $('#mngInvoice').addClass('d-none');
                //     $('#mngCate').addClass('d-none');
                //     $('#mngSup').removeClass('d-none');
                // }
            })
            // $(".owl-carousel").owlCarousel();

        });

    </script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

</body>

</html>