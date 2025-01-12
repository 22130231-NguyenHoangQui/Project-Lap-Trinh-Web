<%@ page import="java.util.ArrayList" %>
<%@ page import="com.edu.hcmuaf.fit.model.Account" %>
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
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
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
    <% String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>
</header>
<div class="is-medium">
    <div class="container"></div>
</div>
<%
    Object obj = session.getAttribute("account");
    Account account = (Account) obj;
    if(account.getRole() ==0 ) {
%>
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
                    <a href="#" class="nav-link ">
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
                    <a href="#" class="nav-link ">
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
            <div class="container   d-flex justify-content-between align-items-center  border-bottom mt-3" style="max-width: 100%;">

            </div>

            <%--                <div class="contentDate container" id="contentDiv" style="display: none;">--%>

            <div class="container">
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
                            <h5>Quản lý tài khoản</h5>
                        </div>
                        <div class="col-lg-6 text-end display">
                                                            <%if(account.getRole() == 0) {%>
                            <button class="btn btn-sm btn-outline-secondary" id="btnAddAccount" data-bs-toggle="modal"
                                    data-bs-target="#addUserModal">
                                <i class="fa-solid fa-gear" aria-hidden="true" title="Thêm tài khoản"></i>
                            </button>
                                                            <%}%>
                        </div>
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="w40">STT</th>
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
                            <%
                                ArrayList<Account> listAllAcount = (ArrayList<Account>) request.getAttribute("listAllProduct");
                                if(!listAllAcount.isEmpty() || listAllAcount != null) {
                                    int sttA =1;
                                    for(Account a : listAllAcount) {

                            %>
                            <tr>
                                <td class="w40"><%=sttA%></td>
                                <td><%=a.getName()%></td>
                                <td><%=a.getPhoneNumber()%></td>
                                <td><%=a.getEmail()%></td>
                                <%if (a.getRole() == 0) {%>
                                <td>Admin</td>
                                <% } else if (a.getRole() == 1) {%>
                                <td>User</td>
                                <%}%>
                                <%if (a.getVerifyAccount().isStateVerify()) {%>
                                <td>Đã xác thực</td>
                                <%} else {
                                %>
                                <td>Chưa xác thực</td>
                                <%}%>
                                <%if (a.isStatus()) {%>
                                <td>Hoạt động</td>
                                <% }else {%>
                                <td>Đã khóa</td>
                        <%}%>

                                <td><%=a.getCreated_at()%></td>
                                <td><%=a.getUpdated_at()%></td>
                                <td>
                                <% if(a.getRole() == 0) {%>
                                    <button class="icon-button" data-bs-toggle="modal"
                                            data-bs-target="#editCustomerModal">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>

                                    <button class="icon-button" data-bs-toggle="modal"
                                            data-bs-target="#deleteCustomerModal">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                    <%}%>
                                </td>
                            </tr>
                            <% sttA++;
                            }}
                            %>
                            <!-- Các dòng khác cũng tương tự -->
                            </tbody>
                        </table>
                    </div>
                    <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Header -->
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addUserModalLabel">Thêm Người Dùng</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <!-- Body -->
                                <div class="modal-body">
                                    <form id="addUserForm" class="d-flex flex-column">
                                        <div class="form-group mt-3">
                                            <label for="idnguoidung" class="required">ID Người dùng</label>
                                            <input type="text" id="idnguoidung" name="idnguoidung" placeholder="Nhập ID Người dùng" class="form-control" required>
                                        </div>
                                        <div class="form-group mt-3">
                                            <label for="username" class="required">Tên Đăng Nhập</label>
                                            <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" class="form-control" required>
                                        </div>
                                        <div class="form-group mt-3">
                                            <label for="password1" class="required">Mật Khẩu</label>
                                            <input type="password" id="password1" name="password" placeholder="Nhập mật khẩu" class="form-control" required>
                                        </div>
                                        <div class="form-group mt-3">
                                            <label for="emailNguoiDung" class="required">Nhập Email</label>
                                            <input type="email" id="emailNguoiDung" name="emailNguoiDung" placeholder="Nhập Email" class="form-control" required>
                                        </div>
                                        <div class="form-group mt-3">
                                            <label for="sdtNguoiDung" class="required">Nhập Số Điện Thoại</label>
                                            <input type="tel" id="sdtNguoiDung" name="sdtNguoiDung" placeholder="Nhập Số Điện Thoại" class="form-control" required>
                                        </div>
                                        <div class="form-group mt-3">
                                            <label for="role" class="required">Chọn Vai Trò</label>
                                            <select id="role" name="role" class="form-control" required>
                                                <option value="" disabled selected>-- Chọn vai trò --</option>
                                                <option value="user">USER</option>
                                                <option value="admin">ADMIN</option>
                                            </select>
                                        </div>
                                    </form>
                                </div>
                                <!-- Footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <button type="submit" form="addUserForm" id="saveButton123" class="btn btn-primary">Lưu</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="container mt-5 d-none" style="width: auto;" id="mngProduct">
                        <!-- Modal Bootstrap -->
                        <div class="col-lg-6">
                            <h5>Quản lý sản phẩm</h5>
                        </div>
                        <div class="col-lg-6 text-end display">
                            <%--                                <%if(account.getRole() == 0) {%>--%>
                                <!-- Nút mở modal -->
                                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addProductModal">
                                    Thêm sản phẩm
                                </button>
                            <%--                                <%}%>--%>
                        </div>


                        <table class="table table1">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>SẢN PHẨM</th>
                                <th>GIÁ BÁN</th>
                                <th>CHI TIẾT</th>
                                <th>NGÀY TẠO</th>
                                <th>NGÀY CẬT NHẬT</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="pro">1</td>
                                <td class="pro">
                                    <img src="product1.jpg" alt="Product Image"
                                         style="width: 50px; height: 50px; object-fit: cover; margin-right: 10px;">
                                    <span class="product-name">Product Name 1</span>
                                </td>
                                <td class="pro">100.000đ</td>
                                <td class="pro">Chi tiết sản phẩm 1</td>
                                <td class="pro">01/01/2025</td>
                                <td class="pro">01/01/2025</td>
                                <td>
                                    <button class="icon-button" onclick="deleteRow(this)">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                    <button class="icon-button" onclick="openEditFormProduct(this)">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td class="pro">2</td>
                                <td class="pro">
                                    <img src="product2.jpg" alt="Product Image"
                                         style="width: 50px; height: 50px; object-fit: cover; margin-right: 10px;">
                                    <span class="product-name">Product Name 2</span>
                                </td>
                                <td class="pro">150.000đ</td>
                                <td class="pro">Chi tiết sản phẩm 2</td>
                                <td class="pro">01/01/2025</td>
                                <td class="pro">01/01/2025</td>
                                <td>
                                    <button class="icon-button" onclick="deleteRow(this)">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                    <button class="icon-button" onclick="openEditFormProduct(this)">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                </td>
                            </tr>
                            <!-- Các sản phẩm tiếp theo -->
                            </tbody>
                        </table>

                        <nav>
                            <ul class="pagination justify-content-center">
                                <li class="page-item active">
                                    <a class="page-link" href="#" onclick="changePageProducts(1)">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#" onclick="changePageProducts(2)">2</a>
                                </li>
                                <!-- Các trang tiếp theo -->
                            </ul>
                        </nav>
                    </div>
                    <!-- Modal Bootstrap -->
                    <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <!-- Header -->
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addProductModalLabel">Thêm sản phẩm</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <!-- Body -->
                                <div class="modal-body">
                                    <!-- Form chỉnh sửa sản phẩm -->
                                    <form id="editFormProduct123" class="row g-3">
                                        <!-- Tên sản phẩm -->
                                        <div class="form-group">
                                            <label for="editProductName123" class="form-label">Tên sản phẩm</label>
                                            <input type="text" class="form-control" id="editProductName123" name="productName"
                                                   placeholder="Nhập tên sản phẩm" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="editPrice123" class="form-label">Giá bán</label>
                                            <input type="number" class="form-control" id="editPrice123" name="price" placeholder="Nhập giá bán"
                                                   required>
                                        </div>

                                        <div class="form-group">
                                            <label for="editCategory1" class="form-label">Thể loại</label>
                                            <input type="text" class="form-control" id="editCategory1" name="category" placeholder="Nhập thể loại"
                                                   required>
                                        </div>

                                        <div class="form-group">
                                            <label for="editHeight123" class="form-label">Chiều cao (cm)</label>
                                            <input type="number" class="form-control" id="editHeight123" name="height" placeholder="Nhập chiều cao"
                                                   required>
                                        </div>

                                        <div class="form-group">
                                            <label for="editDiameter123" class="form-label">Đường kính (cm)</label>
                                            <input type="number" class="form-control" id="editDiameter123" name="diameter"
                                                   placeholder="Nhập đường kính" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="editDetail11" class="form-label">Mô tả sản phẩm</label>
                                            <textarea class="form-control" id="editDetail11" name="detail" placeholder="Nhập mô tả sản phẩm"
                                                      rows="2" required></textarea>
                                        </div>

                                        <!-- Hình ảnh -->
                                        <div class="form-group">
                                            <label class="form-label">Hình ảnh hiện tại:</label>
                                            <div class="d-flex align-items-center">
                                                <img id="editImagePreview" src="" alt="Preview" class="img-thumbnail me-2"
                                                     style="width: 100px; height: 100px; object-fit: cover;">
                                                <img id="editImagePreview1" src="" alt="Preview" class="img-thumbnail"
                                                     style="width: 100px; height: 100px; object-fit: cover;">
                                                <button type="button" class="btn btn-danger ms-3" onclick="removeCurrentImages()">Xóa hình ảnh</button>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="editImage123" class="form-label">Thay đổi hình ảnh</label>
                                            <input type="file" class="form-control" id="editImage123" name="image" accept="image/*">
                                        </div>

                                        <div class="form-group justify-content-between">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                            <button type="submit" class="btn btn-primary" onclick="saveProduct()">Lưu</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="container mt-5 d-none" style="width: auto;" id="mngCate">
                        <table class="table table2">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>ID</th>
                                <th>TÊN</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="cate1">1</td>
                                <td class="cate1">101</td>
                                <td class="cate1">Danh mục 1</td>
                                <td>
                                    <button class="icon-button" onclick="deleteRowCate(this)">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                    <button class="icon-button" onclick="openEditFormCate(this)">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td class="cate1">2</td>
                                <td class="cate1">102</td>
                                <td class="cate1">Danh mục 2</td>
                                <td>
                                    <button class="icon-button" onclick="deleteRowCate(this)">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                    <button class="icon-button" onclick="openEditFormCate(this)">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                </td>
                            </tr>
                            <!-- Các danh mục tiếp theo -->
                            </tbody>
                        </table>

                        <nav>
                            <ul class="pagination justify-content-center">
                                <li class="page-item active">
                                    <a class="page-link" href="#" onclick="changePage(1)">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#" onclick="changePage(2)">2</a>
                                </li>
                                <!-- Các trang tiếp theo -->
                            </ul>
                        </nav>

                    </div>
                    <div class="container mt-5 d-none" style="width: auto;" id="mngInvoice">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Order Name</th>
                                <th>Customer</th>
                                <th>Order Date</th>
                                <th>Price</th>
                                <th>Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>Order 1</td>
                                <td>Customer A</td>
                                <td>2025-01-01</td>
                                <td>$100</td>
                                <td>Completed</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Order 2</td>
                                <td>Customer B</td>
                                <td>2025-01-02</td>
                                <td>$200</td>
                                <td>Pending</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Order 3</td>
                                <td>Customer C</td>
                                <td>2025-01-03</td>
                                <td>$150</td>
                                <td>Shipped</td>
                            </tr>
                            <!-- Các đơn hàng khác -->
                            </tbody>
                        </table>

                        <nav>
                            <ul class="pagination justify-content-center">
                                <li class="page-item active">
                                    <a class="page-link" href="#" onclick="changePage(1)">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#" onclick="changePage(2)">2</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#" onclick="changePage(3)">3</a>
                                </li>
                                <!-- Các trang khác -->
                            </ul>
                        </nav>
                    </div>
                    <div class="container mt-5 d-none" style="width: auto;" id="mngDiscount">
                        <table class="table tableDiscount">
                            <thead>
                            <tr>
                                <th>MÃ GIẢM GIÁ</th>
                                <th>GIẢM GIÁ</th>
                                <th>CHI TIẾT</th>
                                <th>NGÀY BẮT ĐẦU</th>
                                <th>SỐ NGÀY KHUYẾN MÃI</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="dis">DISCOUNT1</td>
                                <td class="dis">10%</td>
                                <td class="dis">Áp dụng cho tất cả sản phẩm</td>
                                <td class="dis">2025-01-01</td>
                                <td class="dis">7</td>
                                <td>
                                    <button class="icon-button" onclick="deleteRowDiscount(this)">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                    <button class="icon-button" onclick="openEditDiscountForm(this)">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td class="dis">DISCOUNT2</td>
                                <td class="dis">20%</td>
                                <td class="dis">Dành cho khách hàng VIP</td>
                                <td class="dis">2025-02-01</td>
                                <td class="dis">14</td>
                                <td>
                                    <button class="icon-button" onclick="deleteRowDiscount(this)">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                    <button class="icon-button" onclick="openEditDiscountForm(this)">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                </td>
                            </tr>
                            <!-- Các giảm giá khác -->
                            </tbody>
                        </table>

                        <nav>
                            <ul class="pagination justify-content-center">
                                <li class="page-item active">
                                    <a class="page-link" href="#" onclick="changePageDiscounts(1)">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#" onclick="changePageDiscounts(2)">2</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#" onclick="changePageDiscounts(3)">3</a>
                                </li>
                                <!-- Các trang khác -->
                            </ul>
                        </nav>
                    </div>



                </div>

            </div>
        </div>
    </div>
</main>

<%} else {%>
<div class="container p-0 mgt text-center fw-bold">Bạn không có quyền quản lý! <a href = <%=url%>/homePage>Quay lại</a></div>
<%}%>


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
                $('#mngProduct').addClass('d-none');
                $('#mngInvoice').addClass('d-none');
                $('#mngCate').addClass('d-none');
                $('#mngDiscount').addClass('d-none');
            } else if (selectedType === "Quản lý sản phẩm") {
                $('#mngAccount').addClass('d-none');
                $('#mngInvoice').addClass('d-none');
                $('#mngDas').addClass('d-none');
                $('#mngProduct').removeClass('d-none');
                $('#mngCate').addClass('d-none');
                $('#mngDiscount').addClass('d-none');
            } else if (selectedType === "Quản lý hóa đơn") {
                $('#mngProduct').addClass('d-none');
                $('#mngAccount').addClass('d-none');
                $('#mngInvoice').removeClass('d-none');
                $('#mngCate').addClass('d-none');
                $('#mngDiscount').addClass('d-none');

            } else if (selectedType === "Quản lý danh mục") {
                $('#mngDas').addClass('d-none');
                $('#mngProduct').addClass('d-none');
                $('#mngAccount').addClass('d-none');
                $('#mngCate').removeClass('d-none');
                $('#mngInvoice').addClass('d-none');
                $('#mngDiscount').addClass('d-none');
            } else if (selectedType === 'Quản lý giảm giá') {
                $('#mngDas').addClass('d-none');
                $('#mngProduct').addClass('d-none');
                $('#mngAccount').addClass('d-none');
                $('#mngDiscount').removeClass('d-none');
                $('#mngInvoice').addClass('d-none');
                $('#mngCate').addClass('d-none');


            } else if (selectedType === 'Tổng quan') {
                $('#mngDas').removeClass('d-none');
                $('#mngProduct').addClass('d-none');
                $('#mngAccount').addClass('d-none');
                $('#mngDiscount').addClass('d-none');
                $('#mngInvoice').addClass('d-none');
                $('#mngCate').addClass('d-none');
            }


        })
    });

</script>
<script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

</body>

</html>