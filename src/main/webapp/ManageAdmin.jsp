<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.edu.hcmuaf.fit.model.*" %>
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
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    NumberFormat nF = NumberFormat.getCurrencyInstance();
%>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<div class="is-medium">
    <div class="container"></div>
</div>
<%--<%--%>
<%--    Object obj = session.getAttribute("account");--%>
<%--    if (obj == null) {--%>

<%--        return;--%>
<%--    }--%>

<%--    Account account = (Account) obj;--%>
<%--    if (account.getRole() == 0) {--%>
<%--%>--%>
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


            </ul>
        </div>
        <div class="container col-md-9 ms-sm-auto col-lg-10 px-md-4 boder-right" style="width: max-content;">
            <div class="container   d-flex justify-content-between align-items-center  border-bottom mt-3"
                 style="width: max-width;">

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
                                        <p id="orders-today" class="card-text text-primary fs-4"><%=request.getAttribute("getDT")%></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card shadow-sm">
                                    <div class="card-body">
                                        <h5 class="card-title">Doanh thu hôm nay</h5>
                                        <p id="revenue-today" class="card-text text-success fs-4"><%=request.getAttribute("getTotalForToday")%></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card shadow-sm">
                                    <div class="card-body">
                                        <h5 class="card-title">Sản phẩm bán được</h5>
                                        <p id="products-sold" class="card-text text-info fs-4"><%= request.getAttribute("productbd")%></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card shadow-sm">
                                    <div class="card-body">
                                        <h5 class="card-title">Tổng doanh thu tháng</h5>
                                        <p id="monthly-revenue" class="card-text text-warning fs-4"><%=request.getAttribute("monthdt")%></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card shadow">
                                    <div class="card-header bg-primary text-white text-center">
                                        <h5>Khách hàng có lượt mua cao nhất</h5>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-striped table-bordered">
                                            <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Họ và Tên</th>
                                                <th>Email</th>
                                                <th>Số điện thoại</th>
                                                <th>Lượng mua sản phẩm</th>

                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                                ArrayList<OrderDetail> listCusMax = (ArrayList<OrderDetail>) request.getAttribute("cusMax");
                                                if (!listCusMax.isEmpty() || listCusMax != null) {
                                                    int sttA = 1;
                                                    for (OrderDetail a : listCusMax) {
                                            %>
                                            <tr>
                                                <td><%=a.getAccount().getId()%></td>
                                                <td><%=a.getAccount().getUserName()%></td>
                                                <td><%=a.getAccount().getEmail()%></td>
                                                <td><%=a.getAccount().getPhoneNumber()%></td>
                                                <td><%=a.getQuantity()%></td>
                                            </tr>
                                            <%
                                                    sttA++;
                                                    }}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="mngAccount" class="d-none" style="margin: 0">
                        <div class="container   d-flex justify-content-between align-items-center  border-bottom mt-3"
                             style="width: max-width;">
                            <h2>Quản lý tài khoản</h2>
<%--                                                                                        <%if(account.getRole() == 0) {%>--%>
                            <button class="btn btn-sm btn-outline-secondary" id="btnAddAccount" data-bs-toggle="modal"
                                    data-bs-target="#addUserModal">
                                <i class="fa-solid fa-gear" aria-hidden="true" title="Thêm tài khoản"></i>
                            </button>
<%--                                                                                        <%}%>--%>
                        </div>

                        <table class="table" id="tableaccount">
                            <thead>
                            <tr>
                                <th class="w40">STT</th>
                                <th>TÊN NGƯỜI DÙNG</th>
                                <th>SĐT</th>
                                <th>EMAIL</th>
                                <th>CHỨC VỤ</th>
                                <th>XÁC THỰC</th>
                                <th>TRẠNG THÁI</th>
                                <%--                                <th>NGÀY TẠO</th>--%>
                                <%--                                <th>NGÀY CẬT NHẬT</th>--%>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody id="innerAccount">
                            <!-- Dữ liệu bảng sẽ được thêm vào đây -->
                            <%
                                ArrayList<Account> listAllAcount = (ArrayList<Account>) request.getAttribute("listAllAccount");
                                if (!listAllAcount.isEmpty() || listAllAcount != null) {
                                    int sttA = 1;
                                    for (Account a : listAllAcount) {

                            %>
                            <tr data-bs-toggle="modal" data-bs-target="#detailAccount"
                                onclick="detailAccount('<%=a.getId()%>')">
                                <td class="w40"><%=sttA%>
                                </td>
                                <td><%=a.getName()%>
                                </td>
                                <td><%=a.getPhoneNumber()%>
                                </td>
                                <td><%=a.getEmail()%>
                                </td>
                                <%if (a.getRole() == 0) {%>
                                <td>Admin</td>
                                <% } else if (a.getRole() == 1) {%>
                                <td>User</td>
                                <%}%>
                                <%
                                    if (a.getVerifyAccount() != null && a.getVerifyAccount().isStateVerify()) {
                                %>
                                <td>Đã xác thực</td>
                                <%
                                } else {
                                %>
                                <td>Chưa xác thực</td>
                                <%
                                    }
                                %>

                                <%if (a.isStatus()) {%>
                                <td>Hoạt động</td>
                                <% } else {%>
                                <td>Đã khóa</td>
                                <%}%>

                                <%--                                <td><%=a.getCreated_at()%></td>--%>
                                <%--                                <td><%=a.getUpdated_at()%></td>--%>
                                <td>
                                    <% if (a.getRole() == 0) {%>
                                    <button class="icon-button" data-bs-toggle="modal"
                                            data-bs-target="#editCustomerModal">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                    <button class="icon-button" data-bs-toggle="modal"
                                            data-bs-target="#" onclick="banAccount(<%=a.getId()%>)">
                                        <i class="fa-solid fa-lock"></i>
                                    </button>



                                    <%}%>
                                </td>
                            </tr>
                            <% sttA++;
                            }
                            }
                            %>
                            <!-- Các dòng khác cũng tương tự -->
                            </tbody>
                        </table>
                    </div>
                    <%--                    form thêm người dùng--%>
                    <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Header -->
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addUserModalLabel">Thêm Người Dùng</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <!-- Body -->
                                <form class="p-0" action="">
                                    <div class="modal-body col-md-12">
                                        <form id="addUserForm" class="d-flex flex-column">
                                            <div class="mb-3">
                                                <label for="username" class="form-label">Tên Đăng Nhập<span
                                                        class="text-danger">*</span></label><span class="text-danger"
                                                                                                  id="errUser"></span>
                                                <input type="text" id="userName" name="username"
                                                       placeholder="Nhập tên đăng nhập" class="form-control" required
                                                       value="">
                                            </div>
                                            <div class="form-group mt-3">
                                                <label class="form=label">Mật Khẩu<span
                                                        class="text-danger">*</span></label>

                                                <input type="password" id="password" name="password"
                                                       placeholder="Nhập mật khẩu" class="form-control" required
                                                       value="">
                                            </div>
                                            <div class="form-group mt-3">
                                                <label class="form=label">Mật Khẩu<span
                                                        class="text-danger">*</span></label>

                                                <input type="password" id="rePassword" name="password"
                                                       placeholder="Nhập mật khẩu" class="form-control" required
                                                       value="">
                                            </div>
                                            <div class="form-group mt-3">
                                                <label class="form=label">Nhập Email<span
                                                        class="text-danger">*</span></label><span class="text-danger"
                                                                                                  id="errEmail"></span>
                                                <input type="email" id="email" name="emailNguoiDung"
                                                       placeholder="Nhập Email" class="form-control" required value="">
                                            </div>


                                        </form>
                                    </div>
                                    <!-- Footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy
                                        </button>
                                        <button type="button" class="save" onclick="addAccount()"
                                                class="btn btn-primary">Lưu
                                        </button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                    <%--                form chi tiết người dùng--%>
                    <div class="modal fade" id="detailAccount" tabindex="-1" aria-labelledby="detailAccountModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="row p-4">
                                        <div class=" text-end">
                                            <button type="button" class="btn-close " data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <h5 class="text-center title">CHI TIẾT TÀI KHOẢN</h5>
                                        <hr>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label"> Mã tài khoản </label>
                                                <input type="text" class="form-control" id="idAccountDetail"
                                                       name="idAccountDetail" readonly>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label"> Họ và tên </label>
                                                <input type="text" class="form-control" id="nameAccountDetail"
                                                       name="nameAccountDetail" readonly>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Số điện thoại</label>
                                                <input type="text" class="form-control" id="phoneAccountDetail"
                                                       name="phoneAccountDetail" readonly>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Email</label>
                                                <input type="text" class="form-control" id="EmailAccountDetail"
                                                       name="EmailAccountDetail">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Giới tính</label>
                                                <input type="text" class="form-control" id="genderAccountDetail"
                                                       name="genderAccountDetail" readonly>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Ngày sinh</label>
                                                <input type="text" class="form-control" id="dateAccountDetail"
                                                       name="dateAccountDetail" readonly>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Địa chỉ</label>
                                                <input type="text" class="form-control" id="addressAccountDetail"
                                                       name="addressAccountDetail" readonly>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Địa chỉ nhận hàng</label>
                                                <input type="text" class="form-control" id="addressReAccountDetail"
                                                       name="addressReAccountDetail" readonly>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--form chỉnh sửa người dùng--%>
                    <div class="modal fade" id="editCustomerModal" tabindex="-1"
                         aria-labelledby="editCustomerModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editCustomerModalLabel">Thay Đổi Thông Tin</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div id="verification"></div>
                                    <form id="editForm">
                                        <div class="mb-3">
                                            <label for="changeName" class="form-label required">Tên Đăng Nhập</label>
                                            <input type="text" class="form-control" id="changeName" name="ho_ten"
                                                   placeholder="Nhập tên đăng nhập" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="changeEmail" class="form-label required">Email</label>
                                            <input type="email" class="form-control" id="changeEmail" name="email"
                                                   placeholder="Nhập email" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="changeSDT" class="form-label required">Số điện thoại</label>
                                            <input type="text" class="form-control" id="changeSDT" name="so_dien_thoai"
                                                   placeholder="Nhập số điện thoại" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="chagePassword" class="form-label required">Mật khẩu</label>
                                            <input type="password" class="form-control" id="chagePassword"
                                                   name="password" placeholder="Nhập password" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Chức vụ</label>
                                            <div>
                                                <label><input type="radio" name="role" value="USER" checked>
                                                    User</label>
                                                <label><input type="radio" name="role" value="ADMIN"> Admin</label>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Đóng
                                            </button>
                                            <button type="button" class="btn btn-primary" onclick="editAccount()">LƯU
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--QUẢN LÝ SẢN PHẨM--%>
                    <div class="container mt-5 d-none" style="width: auto;" id="mngProduct">
                        <!-- Modal Bootstrap -->
                        <div class="container   d-flex justify-content-between align-items-center  border-bottom mt-3">
                        <h5>Quản lý sản phẩm</h5>

                        <%--                                <%if(account.getRole() == 0) {%>--%>
                        <!-- Nút mở modal -->
                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                data-bs-target="#addProductModal">
                            Thêm sản phẩm
                        </button>
                        <%--                                <%}%>--%>
                    </div>


                    <table class="table table1"  id="tableproduct">
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
                        <tbody id="innerProduct">

                        <%
                            ArrayList<Product> listAllProduct = (ArrayList<Product>) request.getAttribute("listAllProduct");
                            int sttP = 1;
                            if (!listAllProduct.isEmpty() || listAllProduct != null) {
                                for (Product p : listAllProduct) {
//                                    System.out.println(p);
                        %>

                        <tr>
                            <input type="hidden" class="idProduct" value="<%=p.getId()%>">
                            <td class="pro"><%=sttP%>
                            </td>
                            <td class="pro">
                                <img src="<%=url%>/Products/<%=(p.getProductImages().isEmpty())?"":p.getProductImages().get(0).getUrl()%>"
                                     alt="Product Image"
                                     style="width: 50px; height: 50px; object-fit: cover; margin-right: 10px;">
                                <span class="product-name"><%=p.getNameProduct()%></span>
                            </td>
                            <td class="pro">
                                <%= (p.getSizePrices() != null && !p.getSizePrices().isEmpty()) ? p.getSizePrices().get(0).getPrice() : "Không có giá" %>
                            </td>

                            <td class="pro"><%=p.getQuantity()%>
                            </td>
                            <td class="pro"><%=p.getCreated_at()%>
                            </td>
                            <td class="pro"><%=p.getUpdated_at()%>
                            </td>
                            <td>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#editProductModal" onclick="innerEditProduct('<%=p.getId()%>')">
                                    <i class="fa-solid fa-pen"></i> Sửa
                                </button>
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                        data-bs-target="#deleteModal" onclick="deleteProduct('<%=p.getId()%>')">
                                    <i class="fa-solid fa-trash"></i> Xóa
                                </button>

                            </td>
                        </tr>

                        <%
                                    sttP++;
                                }
                            }
                        %>

                        <!-- Các sản phẩm tiếp theo -->
                        </tbody>
                    </table>

                </div>
                <!-- Modal Bootstrap -->
                <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <!-- Header -->
                            <div class="modal-header">
                                <h5 class="modal-title" id="addProductModalLabel">Thêm sản phẩm</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <!-- Body -->
                            <div class="modal-body">
                                <!-- Form chỉnh sửa sản phẩm -->
                                <form method="post" id="add-product" enctype="multipart/form-data">
                                    <!-- Tên sản phẩm -->
                                    <div class="form-group">
                                        <label class="form-label">Tên sản phẩm</label>
                                        <input type="text" class="form-control" id="nameProduct"
                                               name="nameProduct"
                                               placeholder="Nhập tên sản phẩm" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Giá bán</label>
                                        <input type="number" class="form-control" id="priceProductAdd"
                                               name="priceProductAdd"
                                               placeholder="Nhập giá bán"
                                               required>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Thể loại</label>
                                        <select class="form-controll" name="editCate" id="editCate">
                                            <option value="Bánh sinh nhật">Bánh sinh nhật</option>
                                            <option value="Bánh sinh nhật ngày lễ">Bánh sinh nhật ngày lễ</option>
                                            <option value="Bánh sinh nhật bạn trai">Bánh sinh nhật bạn trai</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Chiều cao (cm)</label>
                                        <input type="number" class="form-control" id="height" name="height"
                                               placeholder="Nhập chiều cao"
                                               required>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Đường kính (cm)</label>
                                        <input type="number" class="form-control" id="diameter"
                                               name="diameter"
                                               placeholder="Nhập đường kính" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="editDetail11" class="form-label">Mô tả sản phẩm</label>
                                        <textarea class="form-control" id="editDetail11" name="detail"
                                                  placeholder="Nhập mô tả sản phẩm"
                                                  rows="2" required></textarea>
                                    </div>

                                    <!-- Hình ảnh -->


                                    <div class="form-group">
                                        <label class="form-label">Hình ảnh hiện tại:</label>
                                        <div class="d-flex align-items-center">
                                            <!-- Hình ảnh hiển thị -->
                                            <img id="editImagePreview" src="" alt="Preview"
                                                 class="img-thumbnail me-2"
                                                 style="width: 100px; height: 100px; object-fit: cover;">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="editImage123" class="form-label">Hình ảnh mới:</label>
                                        <!-- Input để chọn file -->
                                        <input type="file" class="form-control" id="editImage123" name="image"
                                               accept="image/*" onchange="updateImagePreview(this)">
                                    </div>


                                    <div class="form-group justify-content-between">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                            Hủy
                                        </button>
                                        <button type="button" class="btn btn-primary" onclick="addProduct()">Lưu
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Bạn có chắc chắn muốn xóa mục này không?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <button type="button" class="btn btn-danger" onclick="confirmDelete()">Xóa</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editProductModalLabel">Chỉnh sửa sản phẩm</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="edit-Product" action="" method="post">
                                    <div class="form-group mb-3">
                                        <label class="required">Tên sản phẩm</label>
                                        <input type="text" class="form-control" id="nameProductEdit"
                                               name="nameProductEdit" placeholder="Nhập tên sản phẩm" required>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label class="required">Giá bán</label>
                                        <input type="number" class="form-control" id="priceProductEdit"
                                               name="priceProductEdit" placeholder="Nhập giá bán" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Thể loại</label>
                                        <select class="form-control" name="idCate" id="idCate">
                                            <option value="Bánh sinh nhật">Bánh sinh nhật</option>
                                            <option value="Bánh sinh nhật ngày lễ">Bánh sinh nhật ngày lễ</option>
                                            <option value="Bánh sinh nhật bạn trai">Bánh sinh nhật bạn trai</option>
                                        </select>
                                    </div>

                                    <!-- Chọn chiều cao cố định -->
                                    <div class="form-group mb-3">
                                        <label class="required">Chiều cao (cm)</label>
                                        <select class="form-control" id="heightEdit" name="heightEdit" required>
                                            <option value="10">10 cm</option>
                                            <option value="15">15 cm</option>
                                            <option value="20">20 cm</option>
                                            <option value="25">25 cm</option>
                                        </select>
                                    </div>

                                    <!-- Chọn đường kính cố định -->
                                    <div class="form-group mb-3">
                                        <label class="required">Đường kính (cm)</label>
                                        <select class="form-control" id="diameterEdit" name="diameterEdit" required>
                                            <option value="15">15 cm</option>
                                            <option value="20">20 cm</option>
                                            <option value="25">25 cm</option>
                                            <option value="30">30 cm</option>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="required">Số lượng</label>
                                        <input type="number" class="form-control" id="quantityEdit" name="quantityEdit"
                                               placeholder="Nhập số lượng" required>
                                    </div>

                                    <!-- Mô tả sản phẩm -->
                                    <div class="form-group mb-3">
                                        <label class="required">Mô tả sản phẩm</label>
                                        <textarea class="form-control" id="desEdit" name="desEdit"
                                                  placeholder="Nhập mô tả sản phẩm" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Hình ảnh hiện tại:</label>
                                        <div class="d-flex align-items-center">
                                            <!-- Hình ảnh hiển thị -->
                                            <img id="editImagePreview1" src="" alt="Preview"
                                                 class="img-thumbnail me-2" name="imageAvai"
                                                 style="width: 100px; height: 100px; object-fit: cover;">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="editImage123" class="form-label">Hình ảnh mới:</label>
                                        <!-- Input để chọn file -->
                                        <input type="file" class="form-control" id="editImage" name="image"
                                               accept="image/*" onchange="updateImagePreview1(this)">
                                    </div>

                                    <!-- Nút hành động -->
                                    <div class="d-flex justify-content-end">
                                        <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal">
                                            Hủy
                                        </button>
                                        <button id="saveButton1" type="button" class="btn btn-primary"
                                                onclick="editProduct()">LƯU
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container mt-5 d-none" style="width: auto;" id="mngCate">
                    <div class="container   d-flex justify-content-between align-items-center  border-bottom mt-3">
                        <h2>Quản lý danh mục</h2>

                        <%--                                <%if(account.getRole() == 0) {%>--%>
                        <!-- Nút mở modal -->
                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                data-bs-target="#addCate">
                            Thêm danh mục
                        </button>
                        <%--                                <%}%>--%>
                    </div>

                    <table class="table table2"  id="tablecate">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>TÊN</th>
                            <th>HÌNH ẢNH</th>
                        </tr>
                        </thead>
                        <tbody id="innerCategory">
                        <%
                            ArrayList<Category> listCate = (ArrayList<Category>) request.getAttribute("listCategory");
                            int sttC =1;
                            for (Category list : listCate) {
                        %>
                        <tr>
                            <input type="hidden" class="id" id="categoryIdEdit" value="<%= list.getId()%>">
                            <td class="cate1"><%=list.getId()%></td>
                            <td class="cate1"><%=list.getName()%></td>
                            <td class="cate1"><%=list.getImageUrl()%></td>
                            <td>
                                <button class="icon-button" onclick="deleteCategory('<%=list.getId()%>')">
                                    <i class="fa-solid fa-trash"></i>
                                </button>
                                <button class="editCate btnAdd bgcolor bd-full" title="Chỉnh sửa danh mục" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#editCate" onclick="innerEditCategory('<%=list.getId()%>')"><i class="fa fa-pencil text-color"></i></button>                                </div>

                    </td>
                        </tr>
                        <%
                            sttC++;
                            }
                        %>
                        </tbody>
                    </table>
                </div> </div>

<%--                    <nav>--%>
<%--                        <ul class="pagination justify-content-center">--%>
<%--                            <li class="page-item active">--%>
<%--                                <a class="page-link" href="#" onclick="changePage(1)">1</a>--%>
<%--                            </li>--%>
<%--                            <li class="page-item">--%>
<%--                                <a class="page-link" href="#" onclick="changePage(2)">2</a>--%>
<%--                            </li>--%>
<%--                            <!-- Các trang tiếp theo -->--%>
<%--                        </ul>--%>
<%--                    </nav>--%>

                </div>
                    <div class="modal fade" id="addCate" tabindex="-1" aria-labelledby="addCateLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addCateLabel">Thêm Danh Mục</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Form thêm danh mục -->
                                    <form id="add-cate" action="/addCategory" method="post">
                                        <div class="mb-3">
                                            <label class="form-label">Tên Danh Mục</label>
                                            <input type="text" class="form-control" name="nameCateAdd" id="nameCateAdd" placeholder="Nhập tên danh mục" required>

                                        </div>
                                        <div class="mb-3">
                                            <label for="imageCateAdd" class="form-label">Chọn Ảnh</label>
                                            <input type="file" class="form-control" name="image" id="imageCateAdd" accept="image/*">
                                        </div>
                                        <button type="button" class="btn btn-primary" onclick="addCate()">Thêm</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal chỉnh sửa danh mục -->
                    <div class="modal fade" id="editCateModal" tabindex="-1" aria-labelledby="editCateModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editCateModalLabel">Chỉnh Sửa Danh Mục</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Form chỉnh sửa danh mục -->
                                    <form id="edit-cate-form">
                                        <input type="hidden" id="editCateId">
                                        <div class="mb-3">
                                            <label for="editCateName" class="form-label">Tên Danh Mục</label>
                                            <input type="text" class="form-control" id="editCateName" name="editCateName" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="editCateImage" class="form-label">Cập Nhật Ảnh</label>
                                            <input type="file" class="form-control" id="editCateImage" name="editCateImage" accept="image/*">
                                        </div>
                                        <button type="button" class="btn btn-primary" onclick="updateCategory()">Lưu Thay Đổi</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
        <div class="container mt-5 d-none" style="width: auto;" id="mngInvoice">
            <div class="container d-flex justify-content-between align-items-center border-bottom mt-3" style="width: max-width;">
                <h2>Quản lý hóa đơn</h2>
            </div>

            <table class="table"  id="tableorder">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>ID</th>
                    <th>Customer</th>
                    <th>Order Date</th>
                    <th>Price</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ArrayList<Order> listOrder = (ArrayList<Order>) request.getAttribute("listAllInvoice");
                    if (listOrder != null && !listOrder.isEmpty()) {
                        int stt = 1; // Đặt biến STT ngoài vòng lặp
                        for (Order or : listOrder) {
                %>
                <tr data-bs-toggle="modal" data-bs-target="#detailInvoice" onclick="detailInvoice(<%=or.getId()%>)">
                    <td><%= stt %></td>
                    <td><%= or.getId() %></td>
                    <td><%= or.getIdAccount() %></td>
                    <td><%= or.getCreatedAt() %></td>
                    <td><%= or.getTotalInvoice() %></td>
                    <td>
                        <% if (or.getStatusOrder() == 0) { %>
                        Chờ xác nhận
                        <% } else if (or.getStatusOrder() == 1) { %>
                        Đã xác nhận
                        <% } else { %>
                        Đã hủy
                        <% } %>
                    </td>
                    <td>
                        <% if (or.getStatusOrder() == 0) { %>
                        <button class="btnAdd bgcolor bd-full" onclick="acceptInvoice(<%=or.getId()%>)">
                            <i class="fa fa-check text-color" title="Xác nhận đơn hàng" aria-hidden="true"></i>
                        </button>
                        <button class="btnAdd bgcolor bd-full" onclick="cancelInvoice(<%=or.getId()%>)">
                            <i class="fa fa-times text-color" title="Hủy đơn hàng" aria-hidden="true"></i>
                        </button>
                        <% } else { %>
                        <button class="btnAdd bgcolor bd-full" onclick="delInvoice(<%=or.getId()%>)">
                            <i class="fa fa-trash-o text-color" title="Xóa" aria-hidden="true"></i>
                        </button>
                        <% } %>
                    </td>
                </tr>
                <%
                        stt++; // Tăng giá trị STT
                    }
                } else {
                %>
                <tr>
                    <td colspan="7" class="text-center">Không có hóa đơn nào để hiển thị.</td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>

        <!-- Modal for Invoice Details -->
        <div class="modal fade" id="detailInvoice" tabindex="-1" aria-labelledby="detailInvoiceLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailInvoiceLabel">Invoice Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Details will be populated here via JavaScript -->
                        <p><strong>ID Invoice:</strong> <span id="invoiceId"></span></p>
                        <p><strong>Order Name:</strong> <span id="orderName"></span></p>
                        <p><strong>Customer:</strong> <span id="customerName"></span></p>
                        <p><strong>Order Date:</strong> <span id="orderDate"></span></p>
                        <p><strong>Price:</strong> <span id="price"></span></p>
                        <p><strong>Status:</strong> <span id="status"></span></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

    </div>

        </div>
    </div>
    </div>
</main>

<%--<%}--%>
<%--    else {%>--%>
<%--<div class="container p-0 mgt text-center fw-bold">Bạn không có quyền quản lý! <a href = <%=url%>/homepage.jsp>Quay lại</a></div>--%>
<%--<%}%>--%>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.2/dist/chart.umd.js"
        integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp"
        crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

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
                $('#mngDas').addClass('d-none');
            } else if (selectedType === "Quản lý danh mục") {
                $('#mngDas').addClass('d-none');
                $('#mngProduct').addClass('d-none');
                $('#mngAccount').addClass('d-none');
                $('#mngCate').removeClass('d-none');
                $('#mngInvoice').addClass('d-none');
                $('#mngDiscount').addClass('d-none');



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
<script>
    var idAccount = "";

    function addAccount() {
        var condition = true;
        var user = $('#userName').val();
        var password = $('#password').val();
        var rePW = $('#rePassword').val();
        var email = $('#email').val();
        console.log(user);
        console.log(password);
        console.log(rePW);
        console.log(email);
        var passwordRegex = /^(?=.*[A-Z])(?=.*[!@#$%^&*()-+])(?=.*[0-9]).{8,}$/;
        var emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var specialCharacters = /[!@#$%^&*(),.?":{}|<>' -]/;
        if (user === "") {
            $("#errUser").text('Vui lòng nhập tên đăng nhập!');
            $('#errUser').attr('style', 'color:red');
            condition = false;
        } else if (specialCharacters.test(user)) {
            $("#errUser").text('Tên đăng nhập không chứa kí tự đặc biệt!');
            $('#errUser').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errUser").text('');
        }
        if (password === "") {
            $("#errPW").text('Vui lòng nhập mật khẩu!');
            $('#errPW').attr('style', 'color:red');
            condition = false;
        } else if (password.length < 6 || password.length > 50) {
            $("#errPW").text('Mật khẩu dài từ 6 đến 50 ký tự!');
            $('#errPW').attr('style', 'color:red');
            condition = false;
        } else if (!password.match(passwordRegex)) {
            $("#errPW").text('Mật khẩu có ít nhất 1 chữ hoa, 1 ký tự đặc biệt và 1 số!');
            $('#errPW').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errPW").text('');
        }
        if (rePW === "") {
            $("#errRePW").text('Vui lòng xác nhận lại mật khẩu!');
            $('#errRePW').attr('style', 'color:red');
            condition = false;
        } else if (rePW !== password) {
            $("#errRePW").text('Mật khẩu xác nhận không đúng!');
            $('#errRePW').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errRePW").text('');
        }
        if (email === "") {
            $("#errEmail").text('Vui lòng nhập Email!');
            $('#errEmail').attr('style', 'color:red');
            condition = false;
        } else if (!email.match(emailReg)) {
            $("#errEmail").text('Email không hợp lệ!');
            $('#errEmail').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errEmail").text('');
        }
        if (condition) {
            $.ajax({
                url: 'AddAccount',
                type: 'POST',
                data: {
                    userName: user,
                    password: password,
                    rePW: rePW,
                    email: email,
                },
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    var errUser = jsonData.errUser;
                    var errEmail = jsonData.errEmail;
                    var userName = jsonData.user;
                    var emaill = jsonData.email;
                    if (errUser !== "") {
                        $("#errUser").text(errUser);
                        user.val(userName);
                    }
                    if (errEmail !== "") {
                        $("#errEmail").text(errEmail);
                        email.val(emaill);
                    }
                    if (res !== "") {
                        alert(res);
                    }
                    console.log(123)
                    var row = document.getElementById("innerAccount");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var a = htmlData[i];
                        row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailAccount\" onclick=\"detailAccount('" + a.id + "')\">\n" +
                            "                                    <td class=\"w40\">" + (i + 1) + "</td>\n" +
                            "                                    <td>" + a.name + "</td>\n" +
                            "                                    <td>" + a.email + "</td>\n" +
                            "                                    <td>" + a.role + "</td>\n" +
                            "                                    <td>" + a.vrf + "</td>\n" +
                            "                                    <td class = \"status\">" + a.status + "</td>\n" +
                            "                                    <td>\n" +
                            "                                        <div class=\"d-flex w-100 justify-content-center\">\n" +
                            "                                            <button class=\"editAccount btnAdd bgcolor bd-full mx-1\" title=\"Chỉnh sửa thông tin\" aria-hidden=\"true\" data-bs-toggle=\"modal\" data-bs-target=\"#editAccount\" onclick=\"innerAccount('" + a.id + "')\"><i class=\"fa fa-pencil text-color\" ></i></button>\n" +
                            "                                            <button class=\"block btnAdd bgcolor bd-full \" data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"banAccount('" + a.id + "')\"><i class=\"fa fa-lock text-color\" title=\"Khóa\" aria-hidden=\"true\" ></i></button>\n" +
                            "                                        </div>\n" +
                            "                                    </td>\n" +
                            "                                </tr>";
                    }
                },
                error: function (error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
    }

    function detailAccount(id) {
        $.ajax({
            type: "GET",
            url: "loadDetailAccount",
            data: {
                id: id
            },
            success: function (data) {
                // Cập nhật nội dung modal với dữ liệu JSON nhận được
                var a = data.account;
                $('#idAccountDetail').val(a.id);
                $('#nameAccountDetail').val(a.name);
                $('#phoneAccountDetail').val(a.phoneNumber);
                $('#genderAccountDetail').val(a.gender);
                $('#EmailAccountDetail').val(a.email);
                $('#dateAccountDetail').val(a.birthDay);
                $('#addressAccountDetail').val(a.address);
                $('#addressReAccountDetail').val(a.addressRecei);
            },
            error: function () {
                console.error("Không thể tải chi tiết tài khoản");
            }
        });
    }

    function banAccount(id) {
        var confirmation = confirm("Bạn có chắc với lựa chọn này ?");
        if (confirmation) {
            $.ajax({
                type: "POST",
                url: "updateStatusAccount",
                data: {id: id},
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerAccount");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var a = htmlData[i];
                        row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailAccount\" onclick=\"detailAccount('" + a.id + "')\">\n" +
                            "                                    <td class=\"w40\">" + (i + 1) + "</td>\n" +
                            "                                    <td>" + a.name + "</td>\n" +
                            "                                    <td>" + a.email + "</td>\n" +
                            "                                    <td>" + a.role + "</td>\n" +
                            "                                    <td>" + a.vrf + "</td>\n" +
                            "                                    <td class = \"status\">" + a.status + "</td>\n" +
                            "                                    <td>\n" +
                            "                                        <div class=\"d-flex w-100 justify-content-center\">\n" +
                            "                                            <button class=\"editAccount btnAdd bgcolor bd-full mx-1\" title=\"Chỉnh sửa quyền truy cập\" aria-hidden=\"true\" data-bs-toggle=\"modal\" data-bs-target=\"#editAccount\" onclick=\"innerAccount('" + a.id + "')\"><i class=\"fa fa-pencil text-color\" ></i></button>\n" +
                            "                                            <button class=\"block btnAdd bgcolor bd-full \" data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"banAccount('" + a.id + "')\"><i class=\"fa fa-lock text-color\" title=\"Khóa\" aria-hidden=\"true\" ></i></button>\n" +
                            "                                        </div>\n" +
                            "                                    </td>\n" +
                            "                                </tr>";
                    }
                },
                error: function (error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
    }


    function editAccount() {
        var flag = true;
        var tenElement = document.getElementById("HienThiTen");
        var gmailElement = document.getElementById("HienThiGmail");
        var pwElement = document.getElementById("HienThiPw");
        var sdtElement = document.getElementById("HienThiSDT");
        var dcElement = document.getElementById("HienThiDC");
        var dcReElement = document.getElementById("HienThiDCReice");
        var nsElement = document.getElementById("HienThiNS");
        var error = document.getElementById("error");
        var gmailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var phoneReg = /^\d{10}/;
        var passwordRegex = /^(?=.*[A-Z])(?=.*[!@#$%^&*()-+])(?=.*[0-9]).{8,}$/;
        if (tenElement.value == "") {
            error.innerHTML = "Vui lòng nhập họ và tên!";
            flag = false;
        } else if (gmailElement.value == "") {
            error.innerHTML = "Vui lòng nhập Email!";
            flag = false;
        } else if (!gmailElement.value.match(gmailReg)) {
            error.innerHTML = "Email không hợp lệ!";
            flag = false;
        } else if (pwElement.value === "") {
            error.innerHTML = 'Vui lòng nhập mật khẩu!';
            flag = false;
        } else if (pwElement.value.length < 6 || pwElement.value.length > 50) {
            error.innerHTML = 'Mật khẩu dài từ 6 đến 50 ký tự!';
            flag = false;
        } else if (!pwElement.value.match(passwordRegex)) {
            error.innerHTML = 'Mật khẩu có ít nhất 1 chữ hoa, 1 ký tự đặc biệt và 1 số!';
            flag = false;
        } else if (sdtElement.value == "") {
            error.innerHTML = "Vui lòng nhập số điện thoại!";
            flag = false;
        } else if (!sdtElement.value.match(phoneReg)) {
            error.innerHTML = "Số điện thoại không hợp lệ!";
            flag = false;
        } else if (dcElement.value == "") {
            error.innerHTML = "Vui lòng nhập địa chỉ!";
            flag = false;
        } else if (dcReElement.value == "") {
            error.innerHTML = "Vui lòng nhập địa chỉ nhận hàng!";
            flag = false;
        } else if (nsElement.value == "") {
            error.innerHTML = "Vui lòng chọn ngày sinh!";
            flag = false;
        } else {
            error.innerHTML = "";
        }
        if (flag) {
            var gender = $('input[type="radio"][name="gender"]:checked');
            var role = $('input[type="radio"][name="role"]:checked');
            $.ajax({
                url: 'editAccount',
                type: 'POST',
                data: {
                    name: tenElement.value,
                    email: gmailElement.value,
                    password: pwElement.value,
                    phoneNumber: sdtElement.value,
                    address: dcElement.value,
                    gender: gender.val(),
                    addressRecei: dcReElement.value,
                    birthDay: nsElement.value,
                    role: role.val(),
                    id: idAccount
                },
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerAccount");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var a = htmlData[i];
                        row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailAccount\" onclick=\"detailAccount('" + a.id + "')\">\n" +
                            "                                    <td class=\"w40\">" + (i + 1) + "</td>\n" +
                            "                                    <td>" + a.name + "</td>\n" +
                            "                                    <td>" + a.email + "</td>\n" +
                            "                                    <td>" + a.role + "</td>\n" +
                            "                                    <td>" + a.vrf + "</td>\n" +
                            "                                    <td class = \"status\">" + a.status + "</td>\n" +
                            "                                    <td>\n" +
                            "                                        <div class=\"d-flex w-100 justify-content-center\">\n" +
                            "                                            <button class=\"editAccount btnAdd bgcolor bd-full mx-1\" title=\"Chỉnh sửa thông tin\" aria-hidden=\"true\" data-bs-toggle=\"modal\" data-bs-target=\"#editAccount\" onclick=\"innerAccount('" + a.id + "')\"><i class=\"fa fa-pencil text-color\" ></i></button>\n" +
                            "                                            <button class=\"block btnAdd bgcolor bd-full \" data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"banAccount('" + a.id + "')\"><i class=\"fa fa-lock text-color\" title=\"Khóa\" aria-hidden=\"true\" ></i></button>\n" +
                            "                                        </div>\n" +
                            "                                    </td>\n" +
                            "                                </tr>";
                    }
                },
                error: function (error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
    }

    function addProduct() {
        var flag = true;

        // Các trường input từ HTML
        var nameP = document.getElementById("nameProduct");
        console.log(nameP)
        var price = document.getElementById("priceProductAdd");
        var cate = document.getElementById("idCate");
        var height = document.getElementById("height");
        var diameter = document.getElementById("diameter");
        var detail = document.getElementById("editDetail11");
        var images = document.getElementsByName("image");
        var priceReg = /^\d+$/;

        // Các thông báo lỗi
        var errNameP = document.getElementById("errNameP");
        var errPriceAdd = document.getElementById("errPriceAdd");
        var errDetail = document.getElementById("errDetail");
        var errImg1 = document.getElementById("errImg1");
        //
        // // Kiểm tra tên sản phẩm
        // if (nameP.value === "") {
        //     errNameP.innerHTML = "Vui lòng nhập tên sản phẩm";
        //     flag = false;
        // } else {
        //     errNameP.innerHTML = "";
        // }
        //
        // // Kiểm tra giá bán
        // if (price.value === "") {
        //     errPriceAdd.innerHTML = "Vui lòng nhập giá bán!";
        //     flag = false;
        // } else if (!price.value.match(priceReg)) {
        //     errPriceAdd.innerHTML = "Giá tiền không hợp lệ!";
        //     flag = false;
        // } else {
        //     errPriceAdd.innerHTML = "";
        // }
        //
        // // Kiểm tra mô tả
        // if (detail.value === "") {
        //     errDetail.innerHTML = "Vui lòng nhập mô tả sản phẩm!";
        //     flag = false;
        // } else {
        //     errDetail.innerHTML = "";
        // }
        //
        // // Kiểm tra hình ảnh
        // for (var i = 0; i < images.length; i++) {
        //     if (images[i].value === "") {
        //         errImg1.innerHTML = "Vui lòng nhập đường dẫn hình ảnh";
        //         flag = false;
        //     } else {
        //         errImg1.innerHTML = "";
        //     }
        // }
        //
        // // Kiểm tra chiều cao
        // if (height.value === "") {
        //     height.style.borderColor = "red";
        //     flag = false;
        // } else {
        //     height.style.borderColor = "#dee2e6";
        // }
        //
        // // Kiểm tra đường kính
        // if (diameter.value === "") {
        //     diameter.style.borderColor = "red";
        //     flag = false;
        // } else {
        //     diameter.style.borderColor = "#dee2e6";
        // }

        if (flag) {
            var formData = new FormData();
            var fileInputs = document.getElementsByName("image");

            // Thêm hình ảnh
            for (var i = 0; i < fileInputs.length; i++) {
                var fileInput = fileInputs[i];
                formData.append("image", fileInput.files[0]);
            }

            // Thêm các trường còn lại
            formData.append("nameProduct", nameP.value);
            formData.append("priceProductAdd", price.value);
            formData.append("idCate", cate.value);
            formData.append("height", height.value);
            formData.append("diameter", diameter.value);
            formData.append("detail", detail.value);

            // AJAX request
            $.ajax({
                url: "addProduct",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);

                    var row = document.getElementById("innerProduct");
                    row.innerHTML = ""; // Xóa nội dung hiện tại
                    for (var i = 0; i < htmlData.length; i++) {
                        var p = htmlData[i];
                        row.innerHTML +=
                            '<tr data-bs-toggle="modal" data-bs-target="#detailProduct" onclick="detailProduct(\'' +
                            p.idProduct +
                            "')\">" +
                            '<input type="hidden" class="idProduct" value="' +
                            p.idProduct +
                            '">' +
                            "<td class=\"w40\">" +
                            (i + 1) +
                            "</td>" +
                            "<td class=\"w260\">" +
                            '<div class="item d-flex justify-content-center">' +
                            '<div class="item_img">' +
                            '<img src="' +
                            p.imageUrl +
                            '" class="card-img-top img_p_cart" alt="..."/>' +
                            "</div>" +
                            '<span class="item_text">' +
                            p.name +
                            "</span>" +
                            "</div>" +
                            "</td>" +
                            "<td>" +
                            p.price +
                            "</td>" +
                            "<td>" +
                            p.color +
                            "</td>" +
                            "<td>" +
                            p.quantity +
                            "</td>" +
                            "<td>" +
                            p.status +
                            "</td>" +
                            '<td>' +
                            '<div class="d-flex justify-content-center">' +
                            '<button class="delete btnAdd bgcolor bd-full" title="Xóa" aria-hidden="true" onclick="deleteProduct(\'' +
                            p.idProduct +
                            "')\" data-bs-toggle=\"modal\" data-bs-target=\"\">" +
                            '<i class="fa fa-trash-o text-color"></i></button>' +
                            '<button class="editProduct btnAdd bgcolor bd-full mx-1" data-bs-toggle="modal" data-bs-target="#editProduct" onclick="innerEditProduct(\'' +
                            p.idProduct +
                            "')\"><i class=\"fa fa-pencil text-color\" title=\"Chỉnh sửa\" aria-hidden=\"true\"></i></button>" +
                            '<button class="hideProduct btnAdd bgcolor bd-full" title="Ẩn/hiện sản phẩm" aria-hidden="true" onclick="hideProduct(\'' +
                            p.idProduct +
                            "')\" data-bs-toggle=\"modal\" data-bs-target=\"\">" +
                            '<i class="fa fa-lock text-color"></i></button>' +
                            "</div>" +
                            "</td>" +
                            "</tr>";
                    }
                },
                error: function (error) {
                    console.error("Xảy ra lỗi:", error);
                },
            });
        }
    }

    function updateImagePreview(input) {
        // Lấy thẻ <img> hiển thị hình ảnh
        const previewImage = document.getElementById('editImagePreview');

        // Kiểm tra xem người dùng đã chọn tệp chưa
        if (input.files && input.files[0]) {
            const file = input.files[0];
            const reader = new FileReader();

            // Khi đọc file hoàn tất, cập nhật src của <img>
            reader.onload = function (e) {
                previewImage.src = e.target.result;
            };

            // Đọc file dưới dạng Data URL (Base64)
            reader.readAsDataURL(file);
        } else {
            // Nếu không có tệp, đặt lại src của <img>
            previewImage.src = '';
        }
    }

    function updateImagePreview1(input) {
        // Lấy thẻ <img> hiển thị hình ảnh
        const previewImage = document.getElementById('editImagePreview1');

        // Kiểm tra xem người dùng đã chọn tệp chưa
        if (input.files && input.files[0]) {
            const file = input.files[0];
            const reader = new FileReader();

            // Khi đọc file hoàn tất, cập nhật src của <img>
            reader.onload = function (e) {
                previewImage.src = e.target.result;
            };

            // Đọc file dưới dạng Data URL (Base64)
            reader.readAsDataURL(file);
        } else {
            // Nếu không có tệp, đặt lại src của <img>
            previewImage.src = '';
        }
    }

    function editProduct() {
        var flag = true;
        var nameP = document.getElementById("nameProductEdit");
        var price = document.getElementById("priceProductEdit");
        var price = price.value.replace(/[^\d]/g, '');
        var des = document.getElementById("desEdit");
        var diameter = document.getElementById("diameterEdit");
        var height = document.getElementById("heightEdit");
        var cate = document.getElementById("idCate");
        var quantity = document.getElementById("quantityEdit");
        var priceReg = /^\d+$/;
        var errNameP = document.getElementById("errNamePEdit");
        var errImpPriceAdd = document.getElementById("errImpPriceEdit");
        var errPriceAdd = document.getElementById("errPriceEdit");
        var errDes = document.getElementById("errDesEdit");
        var errImg1 = document.getElementById("errImg1Edit");


        // if (nameP.value === "") {
        //     errNameP.innerHTML = 'Vui lòng nhập tên sản phẩm';
        //     flag = false;
        // } else {
        //     errNameP.innerHTML = '';
        // }
        // //giá nhập
        // if (priceImp === "") {
        //     errImpPriceAdd.innerHTML = 'Vui lòng nhập giá sản phẩm!';
        //     flag = false;
        // } else if (!priceImp.match(priceReg)) {
        //     errImpPriceAdd.innerHTML = 'Giá tiền không hợp lệ!';
        //     flag = false;
        // } else {
        //     errImpPriceAdd.innerHTML = '';
        // }
        // //giá bán
        // if (price === "") {
        //     errPriceAdd.innerHTML = 'Vui lòng nhập giá bán!';
        //     flag = false;
        // } else if (!price.match(priceReg)) {
        //     errPriceAdd.innerHTML = 'Giá tiền không hợp lệ!';
        //     flag = false;
        // } else {
        //     errPriceAdd.innerHTML = '';
        // }
        // //mô tả
        // if (des.value === "") {
        //     errDes.innerHTML = 'Vui lòng nhập mô tả sản phẩm!';
        //     flag = false;
        // } else {
        //     errDes.innerHTML = ''
        // }
        // //length
        // if (length.value === "") {
        //     length.style.borderColor = 'red';
        //     flag = false;
        // } else {
        //     length.style.borderColor = '#dee2e6';
        // }
        // //width
        // if (width.value === "") {
        //     width.style.borderColor = 'red';
        //     flag = false;
        // } else {
        //     width.style.borderColor = '#dee2e6';
        // }
        // //height
        // if (height.value === "") {
        //     height.style.borderColor = 'red';
        //     flag = false;
        // } else {
        //     height.style.borderColor = '#dee2e6';
        // }
        // //material
        // if (material.value === "") {
        //     material.style.borderColor = 'red';
        //     flag = false;
        // } else {
        //     material.style.borderColor = '#dee2e6';
        // }
        // //color
        // if (color.value === "") {
        //     color.style.borderColor = 'red';
        //     flag = false;
        // } else {
        //     color.style.borderColor = '#dee2e6';
        // }
        // //amount
        // if (quantity.value === "") {
        //     quantity.style.borderColor = 'red';
        //     flag = false;
        // } else {
        //     quantity.style.borderColor = '#dee2e6';
        // }
        if (flag) {
            var formData = new FormData();
            var fileInputs = document.getElementsByName('image');
            for (var i = 0; i < fileInputs.length; i++) {
                var fileInput = fileInputs[i];
                formData.append('image', fileInput.files[0]);
            }
            var imgAvai = document.getElementsByName("imageAvai");
            for (var i = 0; i < imgAvai.length; i++) {
                formData.append('imageAvai', imgAvai[i].value);
            }
            formData.append('nameProductEdit', nameP.value);
            formData.append('priceProductEdit', price);
            formData.append('idCate', cate.value);
            formData.append('diameterEdit', diameter.value);
            formData.append('heightEdit', height.value);
            formData.append('quantityEdit', quantity.value);
            formData.append('desEdit', des.value);
            formData.append("id", id);

            $.ajax({
                url: 'editProduct',
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerProduct");
                    row.innerHTML = "";
                    for (var i = 0; i < htmlData.length; i++) {
                        var p = htmlData[i];
                        row.innerHTML += "  <tr  data-bs-toggle =\"modal\" data-bs-target=\"#detailProduct\" onclick=\"detailProduct('" + p.idProduct + "')\">\n" +
                            "<input type=\"hidden\" className =\"idProduct\" value=\"" + p.idProduct + "\">" +
                            "                                <td class=\"w40\">" + (i + 1) + "</td>\n" +
                            "                                <td class=\"w260\">\n" +
                            "                                    <div class=\"item d-flex justify-content-center\">\n" +
                            "                                        <div class=\"item_img\">\n" +
                            "                                            <img src=\"" + p.imageUrl + "\"\n" +
                            "                                                 class=\"card-img-top img_p_cart\" alt=\"...\"/>\n" +
                            "                                        </div>\n" +
                            "<span class=\"item_text\">" + p.name + "</span>\n" +
                            "                                    </div>\n" +
                            "                                </td>\n" +
                            "                                <td>" + p.price + "</td>\n" +
                            "                                <td>" + p.color + "</td>\n" +
                            "                                <td>" + p.quantity + "\n" +
                            "                                <td>" + p.status + "</td>\n" +
                            "                                <td>\n" +
                            "                                    <div class=\"d-flex justify-content-center\">\n" +
                            "                                        <button class=\"delete btnAdd bgcolor bd-full\" title=\"Xóa\" aria-hidden=\"true\" onclick=\"deleteProduct('" + p.idProduct + "')\" data-bs-toggle=\"modal\" data-bs-target=\"\"><i class=\"fa fa-trash-o text-color\"></i></button>" +
                            "                                        <button class=\"editProduct btnAdd bgcolor bd-full mx-1\" data-bs-toggle=\"modal\" data-bs-target=\"#editProduct\" onclick=\"innerEditProduct('" + p.idProduct + "')\"><i class=\"fa fa-pencil text-color\" title=\"Chỉnh sửa\" aria-hidden=\"true\"></i></button>\n" +
                            "                                        <button class=\"hideProduct btnAdd bgcolor bd-full\" title=\"Ẩn/hiện sản phẩm\" aria-hidden=\"true\" onclick=\"hideProduct('" + p.idProduct + "')\" data-bs-toggle=\"modal\" data-bs-target=\"\"><i class=\"fa fa-lock text-color\"></i></button>" +
                            "                                    </div>\n" +
                            "                                </td>\n" +
                            "                            </tr>";
                    }
                },
                error: function (error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
    }

    // Ví dụ: Gọi hàm này khi một dòng sản phẩm được nhấp vào
    function innerEditProduct(productId) {
        id = productId;
        $.ajax({
            type: "GET",
            url: "loadDetailProduct",
            data: {
                idProduct: productId
            },
            success: function (data) {
                var p = data.product;
                //Cập nhật các phần tử HTML với chi tiết sản phẩm
                $("#nameProductEdit").val(p.name);
                $("#priceImpProductEdit").val(p.priceImport);
                $("#priceProductEdit").val(p.price);
                $("#lengthEdit").val(p.length);
                $("#widthEdit").val(p.width);
                $("#heightEdit").val(p.height);
                $("#materialEdit").val(p.material);
                $("#cateTypeEdit").val(p.typeCate)
                $("#colorEdit").val(p.color);
                $("#quantityEdit").val(p.quantityAvailable);
                $("#desEdit").val(p.description);
                var container = document.getElementById('imageEdit');
                container.innerHTML = "";
                for (var img of p.imageDetail) {
                    var newInput = document.createElement('div');
                    newInput.className = 'mb-3 d-flex align-items-center';
                    newInput.innerHTML = `<img src="Products/${img.url}"" class="card-img-top img_p_cart me-2" alt="..."/> <input type="text" class="form-control " name="imageAvai" value="Products/${img.url}" style ="height:40px"> <button type="button" class="btnAdd bgcolor bd-full ms-2  remove" style ="height:40px" onclick="removeInputEdit(this)"><i class="fa fa-minus-circle text-color" aria-hidden="true" title="Xóa hình ảnh"></i></button>`;
                    container.appendChild(newInput);
                }
            },
            error: function () {
                console.error("Không thể tải chi tiết sản phẩm");
            }
        });
    };

    // Ví dụ: Gọi hàm này khi một dòng sản phẩm được nhấp vào
    function detailProduct(productId) {
        $.ajax({
            type: "GET",
            url: "loadDetailProduct",
            data: {
                idProduct: productId
            },
            success: function (data) {
                var p = data.product;
                //Cập nhật các phần tử HTML với chi tiết sản phẩm
                $("#idProductdetail").val(p.idProduct);
                $("#nameProductdetail").val(p.name);
                // $("#priceImpProductdetail").val(p.priceImport);
                $("#priceProductDetail").val(p.price);
                $("#lengthdetail").val(p.length);
                $("#widthdetail").val(p.width);
                $("#heightdetail").val(p.height);
                // $("#materialdetail").val(p.material);
                // $("#cateTypedetail").val(p.typeCate)
                // $("#colordetail").val(p.color);
                $("#quantitydetail").val(p.quantity);
                $("#desdetail").val(p.description);
                // cập nhật ảnh chính
                $('#img_center').attr('src', p.imageCenter);
                $('.owl-carousel').owlCarousel('destroy'); // Khởi tạo lại Owl Carousel
                // Cập nhật carousel ảnh chi tiết
                $(".owl-carousel").empty();
                for (var img of p.imageDetail) {
                    $(".owl-carousel").append(`<div class="pe-2"><img src="Products/${img.url}" alt="" class="img_p_detail" onmouseover="changeImg('Products/${img.url}')"></div>`);
                }
                $('.owl-carousel').owlCarousel()
                $('.owl-carousel').removeClass("owl-hidden");
            },
            error: function () {
                console.error("Không thể tải chi tiết sản phẩm");
            }
        });
    };
    var id = "";

    function deleteProduct(productId) {
        id = productId;
    }

    // Xác nhận với người dùng
    function confirmDelete(productId) {


        $.ajax({
                type: "POST",
                url: "delProduct",
                data: {id: id},
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;

                    alert(res); // Thông báo kết quả xóa sản phẩm

                    // Lấy phần tử tbody với id="innerProduct"
                    var row = document.getElementById("innerProduct");
                    row.innerHTML = ""; // Xóa tất cả nội dung cũ

                    // Thêm lại các dòng sản phẩm mới vào bảng
                    for (var i = 0; i < htmlData.length; i++) {
                        var p = htmlData[i];
                        row.innerHTML += "<tr>" +
                            "<input type='hidden' class='idProduct' value='" + p.idProduct + "'>" +
                            "<td class='pro'>" + (i + 1) + "</td>" +
                            "<td class='pro'>" +
                            "<img src='" + p.imageUrl + "' alt='Product Image' style='width: 50px; height: 50px; object-fit: cover; margin-right: 10px;'>" +
                            "<span class='product-name'>" + p.name + "</span>" +
                            "</td>" +
                            "<td class='pro'>" + p.price + "</td>" +
                            "<td class='pro'>" + p.quantity + "</td>" +
                            "<td class='pro'>" + p.created_at + "</td>" +
                            "<td class='pro'>" + p.updated_at + "</td>" +
                            "<td>" +
                            "<button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#editProductModal' onclick='innerEditProduct(\"" + p.idProduct + "\")'>" +
                            "<i class='fa-solid fa-pen'></i> Sửa" +
                            "</button>" +
                            "<button type='button' class='btn btn-danger' data-bs-toggle='modal' data-bs-target='#deleteModal' onclick='deleteProduct(\"" + p.idProduct + "\")'>" +
                            "<i class='fa-solid fa-trash'></i> Xóa" +
                            "</button>" +
                            "</td>" +
                            "</tr>";
                    }
                }
            }
        );

    }


    var categoryId = "";
    function addCate() {
        const nameInput = document.getElementById("nameCateAdd").value.trim();
        const image = document.getElementById("imageCateAdd").files[0];

        if (!nameInput || !image) {
            alert("Vui lòng nhập đầy đủ thông tin!");
            return;
        }

        const formData1 = new FormData();
        formData1.append("name", nameInput);
        formData1.append("image", image);

        fetch("/addCategory", {
            method: "POST",
            body: formData1,
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert("Thêm danh mục thành công!");
                    // Thêm danh mục vào bảng mà không tải lại trang
                    const tbody = document.getElementById("innerCate");
                    const newRow = document.createElement("tr");

                    newRow.innerHTML = `
                    <td class="cate1">${data.category.id}</td>
                    <td class="cate1">${data.category.name}</td>
                    <td class="cate1"><img src="${data.category.imageUrl}" alt="Hình ảnh" style="width: 50px;"></td>
                    <td>
                        <button class="icon-button" onclick="deleteRowCate(this)">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                        <button class="icon-button" onclick="openEditFormCate(this)">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                    </td>
                `;
                    tbody.appendChild(newRow);

                    // Đóng modal
                    const modal = bootstrap.Modal.getInstance(document.getElementById("addCate"));
                    modal.hide();
                } else {
                    alert("Thêm danh mục thất bại!");
                }
            })
            .catch(error => {
                console.error("Lỗi:", error);
                alert("Đã xảy ra lỗi khi thêm danh mục.");
            });
    }


    function deleteCategory(categoryId) {
        var confirmation = confirm("Bạn có chắc muốn xóa ?");
        if (confirmation) {
            $.ajax({
                type: "POST",
                url: "delCategory",
                data: { id: categoryId },
                success: function(data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerCategory");
                    row.innerHTML = "";
                    for (var i = 0; i < htmlData.length; i++) {
                        var c = htmlData[i];
                        row.innerHTML += "<tr>" +
                            "<input type='hidden' class='id' value='" + c.id + "'>" +
                            "<td>" + (i + 1) + "</td>" +
                            "<td>" + c.id + "</td>" +
                            "<td>" + c.name + "</td>" +
                            "<td>" +
                            "<div class='d-flex w-100 justify-content-center'>" +
                            "<button class='delete btnAdd bgcolor bd-full me-1' title='Xóa' aria-hidden='true' onclick='deleteCategory(\"" + c.id + "\")' data-bs-toggle='modal' data-bs-target=''><i class='fa fa-trash-o text-color'></i></button>" +
                            "<button class='editCate btnAdd bgcolor bd-full' title='Chỉnh sửa danh mục' aria-hidden='true' data-bs-toggle='modal' data-bs-target='#editCate' onclick='innerEditCategory(\"" + c.id + "\")'><i class='fa fa-pencil text-color'></i></button>" +
                            "</div>" +
                            "</td>" +
                            "</tr>";
                    }
                },
            });
        }
    }
    function innerEditCategory(cateId) {
        categoryId = cateId;
        console.log(categoryId)
        $.ajax({
            type: "GET",
            url: "loadDetailCategory",
            data: {
                id: categoryId
            },
            success: function (data) {
                var c = data.category;
                $("#nameCateEdit").val(c.name);
            },
            error: function () {
                console.error("Không thể tải chi tiết sản phẩm");
            }
        });
    }
    function editCate() {
        var flag = true;
        var nameCate = document.getElementById("nameCateEdit");
        var errNameCate = document.getElementById("errNameCate");
        if (nameCate.value === "") {
            errNameCate.innerHTML = 'Vui lòng nhập tên danh mục';
            flag = false;
        } else {
            errNameCate.innerHTML = '';
        }
        if (flag) {
            $.ajax({
                url: 'editCategory',
                type: 'POST',
                data: {
                    nameCateEdit: nameCate.value,
                    categoryId: categoryId,},
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerCategory");
                    row.innerHTML = "";
                    for (var i = 0; i < htmlData.length; i++) {
                        var c = htmlData[i];
                        row.innerHTML += "<tr>" +
                            "<input type='hidden' class='id' value='" + c.id + "'>" +
                            "<td>" + (i + 1) + "</td>" +
                            "<td>" + c.id + "</td>" +
                            "<td>" + c.name + "</td>" +
                            "<td>" +
                            "<div class='d-flex w-100 justify-content-center'>" +
                            "<button class='delete btnAdd bgcolor bd-full me-1' title='Xóa' aria-hidden='true' onclick='deleteCategory(\"" + c.id + "\")' data-bs-toggle='modal' data-bs-target=''><i class='fa fa-trash-o text-color'></i></button>" +
                            "<button class='editCate btnAdd bgcolor bd-full' title='Chỉnh sửa danh mục' aria-hidden='true' data-bs-toggle='modal' data-bs-target='#editCate' onclick='innerEditCategory(\"" + c.id + "\")'><i class='fa fa-pencil text-color'></i></button>" +
                            "</div>" +
                            "</td>" +
                            "</tr>";
                    }
                },
            });
        }
    }

    function detailInvoice(idInvoice) {
        $.ajax({
            type: "GET",
            url: "loadDetailInvoice",
            data: {
                id: idInvoice,
            },
            success: function (data) {
                // Cập nhật nội dung modal với dữ liệu JSON nhận được
                console.log(data)
                var htmlData = data.htmlData;
                var i = data.invoice;
                var total = data.total;
                $('#nameCus').text(i.name);
                $('#phoneCus').text(i.phoneNumber);
                $('#emailCus').text(i.email);
                $('#addressCus').text(i.address);
                $('#idInvoice').text(i.idInvoice);
                $('#transFee').text(i.transFee);
                $('#payMethod').text(i.payMethod);
                var row = document.getElementById("innerDetailInvoice");
                row.innerHTML = "";
                for (var i = 0; i < htmlData.length; i++) {
                    var p = htmlData[i];
                    row.innerHTML += "<tr>\n" +
                        "    <td class=\"w40\">" + (i + 1) + "</td>\n" +
                        "    <td>" + p.idProduct + "</td>\n" +
                        "    <td class=\"w300\">\n" +
                        "        <div class=\"item d-flex justify-content-center\">\n" +
                        "            <div class=\"item_img\">\n" +
                        "                <img src=\"" + p.image + "\" class=\"card-img-top img_p_cart\" alt=\"...\"/>\n" +
                        "            </div>\n" +
                        "            <span class=\"item_text\">" + p.nameProduct + "</span>\n" +
                        "        </div>\n" +
                        "    </td>\n" +
                        "    <td class=\"w110\">" + p.color + "</td>\n" +
                        "    <td class=\"w110\">" + p.quantity + "</td>\n" +
                        "    <td class=\"w110\">" + p.price + "</td>\n" +
                        "    <td>" + p.totalPrice + "</td>\n" +
                        "</tr>\n";

                }
                row.innerHTML += "<tr>" +
                    "<td class=\"fw-bold\">TỔNG TIỀN</td>" +
                    "<td class=\"fw-bold\" colspan=\"6\">" + total + "</td>" +
                    "</tr>";
            },
            error: function () {
                console.error("Không thể tải chi tiết tài khoản");
            }
        });
    }
    function acceptInvoice(id) {
        var confirmation = confirm("Bạn có chắc muốn xác nhận đơn hàng ?");
        if (confirmation) {
            $.ajax({
                type: "POST",
                url: "acceptInvoice",
                data: {id: id},
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerInvoice");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var ivc = htmlData[i];
                        if (ivc.status === "Chờ xác nhận") {
                            row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailInvoice\" onclick=\"detailInvoice(" + ivc.id + ")\">\n" +
                                "                                    <td class=\"w40\">" + (i + 1) + "</td>\n" +
                                "                                    <td>" + ivc.id + "</td>\n" +
                                "                                    <td>" + ivc.idAccount + "</td>\n" +
                                "                                    <td>" + ivc.startDate + "</td>\n" +
                                "                                     <td>" + ivc.status + "</td>\n" +
                                "                                    <td>\n" +
                                "                                        <button class=\"btnAdd bgcolor bd-full\"  data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"acceptInvoice(" + ivc.id + ")\"><i class=\"fa fa-check text-color\"  title=\"Xác nhận đơn hàng\" aria-hidden=\"true\"></i></button>\n" +
                                "                                        <button class=\"btnAdd bgcolor bd-full\"  data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"cancelInvoice(" + ivc.id + ")\"><i class=\"fa fa-times text-color\"  title=\"Hủy đơn hàng\" aria-hidden=\"true\"></i></button>\n" +
                                "                                    </td>\n" +
                                "                                </tr>";
                        } else {
                            row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailInvoice\" onclick=\"detailInvoice(" + ivc.id + ")\">\n" +
                                "  <td class=\"w40\">" + (i + 1) + "</td>\n" +
                                "  <td>" + ivc.id + "</td>\n" +
                                "  <td>" + ivc.idAccount + "</td>\n" +
                                "  <td>" + ivc.startDate + "</td>\n" +
                                "  <td>" + ivc.status + "</td>\n" +
                                "                                    <td>\n" +
                                "                                        <button class=\"btnAdd bgcolor bd-full\"  data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"delInvoice(" + ivc.id + ")\"><i class=\"fa fa-trash-o text-color\"  title=\"Xóa\" aria-hidden=\"true\"></i></button>\n" +
                                "                                    </td>\n" +
                                "                                </tr>";
                        }
                    }
                },
                error: function (error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
    }
    function cancelInvoice(id) {
        var confirmation = confirm("Bạn có chắc muốn hủy đơn hàng ?");
        if (confirmation) {
            $.ajax({
                type: "POST",
                url: "cancelInvoice",
                data: {id: id},
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerInvoice");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var ivc = htmlData[i];
                        if (ivc.status === "Chờ xác nhận") {
                            row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailInvoice\" onclick=\"detailInvoice(" + ivc.id + ")\">\n" +
                                "                                    <td class=\"w40\">" + (i + 1) + "</td>\n" +
                                "                                    <td>" + ivc.id + "</td>\n" +
                                "                                    <td>" + ivc.idAccount + "</td>\n" +
                                "                                    <td>" + ivc.startDate + "</td>\n" +
                                "                                     <td>" + ivc.status + "</td>\n" +
                                "                                    <td>\n" +
                                "                                        <button class=\"btnAdd bgcolor bd-full\"  data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"acceptInvoice(" + ivc.id + ")\"><i class=\"fa fa-check text-color\"  title=\"Xác nhận đơn hàng\" aria-hidden=\"true\"></i></button>\n" +
                                "                                        <button class=\"btnAdd bgcolor bd-full\"  data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"cancelInvoice(" + ivc.id + ")\"><i class=\"fa fa-times text-color\"  title=\"Hủy đơn hàng\" aria-hidden=\"true\"></i></button>\n" +
                                "                                    </td>\n" +
                                "                                </tr>";
                        } else {
                            row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailInvoice\" onclick=\"detailInvoice(" + ivc.id + ")\">\n" +
                                "  <td class=\"w40\">" + (i + 1) + "</td>\n" +
                                "  <td>" + ivc.id + "</td>\n" +
                                "  <td>" + ivc.idAccount + "</td>\n" +
                                "  <td>" + ivc.startDate + "</td>\n" +
                                "  <td>" + ivc.status + "</td>\n" +
                                "                                    <td>\n" +
                                "                                        <button class=\"btnAdd bgcolor bd-full\"  data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"delInvoice(" + ivc.id + ")\"><i class=\"fa fa-trash-o text-color\"  title=\"Xóa\" aria-hidden=\"true\"></i></button>\n" +
                                "                                    </td>\n" +
                                "                                </tr>";
                        }
                    }
                },
                error: function (error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
    }

    function delInvoice(id) {
        var confirmation = confirm("Bạn có chắc muốn xóa đơn hàng này ?");
        if (confirmation) {
            $.ajax({
                type: "POST",
                url: "delInvoice",
                data: {id: id},
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerInvoice");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var ivc = htmlData[i];
                        if (ivc.status === "Chờ xác nhận") {
                            row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailInvoice\" onclick=\"detailInvoice(" + ivc.id + ")\">\n" +
                                "                                    <td class=\"w40\">" + (i + 1) + "</td>\n" +
                                "                                    <td>" + ivc.id + "</td>\n" +
                                "                                    <td>" + ivc.idAccount + "</td>\n" +
                                "                                    <td>" + ivc.startDate + "</td>\n" +
                                "                                     <td>" + ivc.status + "</td>\n" +
                                "                                    <td>\n" +
                                "                                        <button class=\"btnAdd bgcolor bd-full\"  data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"acceptInvoice(" + ivc.id + ")\"><i class=\"fa fa-check text-color\"  title=\"Xác nhận đơn hàng\" aria-hidden=\"true\"></i></button>\n" +
                                "                                        <button class=\"btnAdd bgcolor bd-full\"  data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"cancelInvoice(" + ivc.id + ")\"><i class=\"fa fa-times text-color\"  title=\"Hủy đơn hàng\" aria-hidden=\"true\"></i></button>\n" +
                                "                                    </td>\n" +
                                "                                </tr>";
                        } else {
                            row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailInvoice\" onclick=\"detailInvoice(" + ivc.id + ")\">\n" +
                                "  <td class=\"w40\">" + (i + 1) + "</td>\n" +
                                "  <td>" + ivc.id + "</td>\n" +
                                "  <td>" + ivc.idAccount + "</td>\n" +
                                "  <td>" + ivc.startDate + "</td>\n" +
                                "  <td>" + ivc.status + "</td>\n" +
                                "                                    <td>\n" +
                                "                                        <button class=\"btnAdd bgcolor bd-full\"  data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"delInvoice(" + ivc.id + ")\"><i class=\"fa fa-trash-o text-color\"  title=\"Xóa\" aria-hidden=\"true\"></i></button>\n" +
                                "                                    </td>\n" +
                                "                                </tr>";
                        }
                    }
                },
                error: function (error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
    }




</script>
<script>
    $(document).ready(function() {
        $('#tableaccount').DataTable({
            "paging": true,
            "lengthMenu": [5, 10, 15],  // Giới hạn số dòng hiển thị mỗi trang
            "searching": true,
            "ordering": true,
            "info": true,
            "language": {
                "lengthMenu": "Hiển thị _MENU_ bản ghi mỗi trang",
                "search": "Tìm kiếm:",
                "zeroRecords": "Không tìm thấy kết quả",
                "info": "Đang xem trang _PAGE_ của _PAGES_",
                "infoEmpty": "Không có bản ghi nào",
                "infoFiltered": "(lọc từ _MAX_ tổng số bản ghi)"
            }
        });
        $('#tableproduct').DataTable({
            "paging": true,
            "lengthMenu": [5, 10, 15],  // Giới hạn số dòng hiển thị mỗi trang
            "searching": true,
            "ordering": true,
            "info": true,
            "language": {
                "lengthMenu": "Hiển thị _MENU_ bản ghi mỗi trang",
                "search": "Tìm kiếm:",
                "zeroRecords": "Không tìm thấy kết quả",
                "info": "Đang xem trang _PAGE_ của _PAGES_",
                "infoEmpty": "Không có bản ghi nào",
                "infoFiltered": "(lọc từ _MAX_ tổng số bản ghi)"
            }
        });
        $('#tableorder').DataTable({
            "paging": true,
            "lengthMenu": [5, 10, 15],  // Giới hạn số dòng hiển thị mỗi trang
            "searching": true,
            "ordering": true,
            "info": true,
            "language": {
                "lengthMenu": "Hiển thị _MENU_ bản ghi mỗi trang",
                "search": "Tìm kiếm:",
                "zeroRecords": "Không tìm thấy kết quả",
                "info": "Đang xem trang _PAGE_ của _PAGES_",
                "infoEmpty": "Không có bản ghi nào",
                "infoFiltered": "(lọc từ _MAX_ tổng số bản ghi)"
            }
        });
        $('#tablecate').DataTable({
            "paging": true,
            "lengthMenu": [5, 10, 15],  // Giới hạn số dòng hiển thị mỗi trang
            "searching": true,
            "ordering": true,
            "info": true,
            "language": {
                "lengthMenu": "Hiển thị _MENU_ bản ghi mỗi trang",
                "search": "Tìm kiếm:",
                "zeroRecords": "Không tìm thấy kết quả",
                "info": "Đang xem trang _PAGE_ của _PAGES_",
                "infoEmpty": "Không có bản ghi nào",
                "infoFiltered": "(lọc từ _MAX_ tổng số bản ghi)"
            }
        });
    });

</script>
</body>

</html>