
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chào mừng đến với IT Cakes</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- File CSS -->
    <link rel="stylesheet" href="css/introWebsite.css">
    <link rel="stylesheet" href="css/fotter.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
    <header>
        <jsp:include page="Products/header.jsp"></jsp:include>
    </header>
    <%  String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>
    <!-- Thanh điều hướng -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <div class="d-flex justify-content-center my-4">
                <ul class="nav nav-tabs" id="navbarNav" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link active" id="about-tab" data-bs-toggle="tab" href="#about" role="tab">Giới thiệu</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a class="nav-link" id="policy-tab" href="<%=url%>/deliveryPolicy" role="tab">Chính sách </a>
                    </li>
                   
                </ul>
            </div>
        </div>
    </nav>

    <!-- Nội dung các tab -->
    <div class="tab-content main">
        <!-- Phần giới thiệu -->
        <div class="tab-pane fade show active" id="about" role="tabpanel" aria-labelledby="about-tab">
            <header class="hero py-5 text-center bg-light">
                <div class="container">
                    <h1 class="display-4 fw-bold text-primary">
                        <i class="fas fa-birthday-cake"></i> Hãy ăn mừng khoảnh khắc với những chiếc bánh của chúng tôi
                    </h1>
                    <p class="lead text-secondary">
                        Ngon miệng, đẹp mắt và làm từ tâm, bánh của chúng tôi là lựa chọn hoàn hảo cho mọi dịp đặc biệt!
                    </p>
                </div>
            </header>
            <section class="py-5 bg-white">
                <div class="container text-center">
                    <h2 class="fw-bold mb-4 text-success">
                        <i class="fas fa-info-circle"></i> Về chúng tôi
                    </h2>
                    <p class="text-muted fs-5">
                        Tại <span class="fw-bold text-primary">IT Cakes</span>, chúng tôi chuyên tạo ra những chiếc bánh tuyệt đẹp cho các bữa tiệc sinh nhật, 
                        đám cưới và các sự kiện đặc biệt. Mỗi chiếc bánh được làm từ nguyên liệu cao cấp và thiết kế để tạo nên những kỷ niệm khó quên.
                    </p>
                </div>
            </section>
        </div>       

    </div>

    <!-- Chân trang -->
    <footer>
        <jsp:include page="./Footer.jsp"></jsp:include>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/homepage.js"></script>
</body>
</html>
