document.addEventListener('DOMContentLoaded', function () {
    // Select only the nav links within the main content area
    const mainSection = document.querySelector('.main');
    const navLinks = mainSection.querySelectorAll('.nav-link'); // Scoped to only .main
    const footerLinks = document.querySelectorAll('.footer-link'); // Footer links
    const contentArea = document.getElementById('content-area');

    // Content data for each section
    const contentData = {
        "chinh-sach-doi-tra": `
            <h4>CHÍNH SÁCH ĐỔI, TRẢ, HOÀN TIỀN</h4>
            <p>Kính thưa quí khách hàng,</p>
            <p>Để chiếc bánh mà chúng tôi cung cấp đến tận tay khách hàng đẹp nhất, ngon nhất, cần có đủ thông tin về cách sử dụng trước, trong, sau bán hàng...</p>
            <h4>1. Chính sách đổi bánh</h4>
            <ul>
                <li>Tất cả những mẫu bánh, những yêu cầu sau khi đã được lên đơn và được sự đồng ý của khách hàng đều được thực hiện 100%...</li>
                <li>Sau khi có thông tin phản hồi từ khách hàng, chúng tôi sẽ tiến hành đổi ngay...</li>
                <li>Khách hàng cần kiểm tra bánh kỹ trước khi nhận để không làm mất thời gian của hai bên...</li>
            </ul>
            <h4>2. Chính sách trả bánh và hoàn tiền</h4>
            <h4>2.1 Lỗi từ chúng tôi:</h4>
            <ul>
                <li>Sau khi đặt bánh, nếu khách hàng nhận bánh không đúng như mẫu bánh đã đặt, khách hàng có quyền trả lại bánh...</li>
                <li>Nếu tiếp tục mua bánh, chúng tôi sẽ làm bánh theo đúng yêu cầu...</li>
                <li>Nếu khách không tiếp tục mua bánh, khách đã đặt tiền thì chúng tôi sẽ trả lại 100% số tiền khách đã đặt.</li>
            </ul>
            <h4>2.2 Lỗi từ khách hàng:</h4>
            <ul>
                <li>a. Nếu khách hàng đã chuyển khoản mà chúng tôi chưa làm bánh, chúng tôi sẽ hoàn lại 100% số tiền khách hàng đã chuyển khoản.</li>
                <li>b. Nếu khách hàng đã chuyển khoản mà chúng tôi đã làm bánh, thì coi như khách hàng đã đồng ý...</li>
            </ul>
            <p>Để có được chiếc bánh ngon, bánh đẹp đến tận tay khách hàng, cần qua nhiều qui trình như tư vấn, lên đơn, sản xuất, đóng gói, ship bánh...</p>
        `,
        "chinh-sach-bao-mat": `
            <h4>CHÍNH SÁCH BẢO MẬT THÔNG TIN KHÁCH HÀNG</h4>
            <p>Bạn hoàn toàn có thể yên tâm về các thông tin của mình trên ITCAKE.vn bởi chúng tôi ưu tiên hàng đầu trong việc bán hàng và cung cấp dịch vụ bánh sinh nhật...</p>
            <h4>1. THU THẬP THÔNG TIN CÁ NHÂN</h4>
            <p>Để truy cập và sử dụng một số dịch vụ tại ITCAKE.vn, bạn có thể sẽ được yêu cầu đăng ký với chúng tôi thông tin cá nhân...</p>
            <h4>2. CAM KẾT BẢO VỆ CÁC THÔNG TIN RIÊNG TƯ</h4>
            <p>Thông tin của khách hàng thông qua hệ thống bảo mật của website, không sử dụng nó vì mục đích thương mại hay bất cứ mục đích nào khác...</p>
            <h4>3. CAM KẾT CHỈ SỬ DỤNG THÔNG TIN ĐỂ NHẰM TẠO MÔI TRƯỜNG MUA SẮM AN TOÀN</h4>
            <p>Chúng tôi sử dụng những thông tin thu thập qua website để tạo môi trường mua sắm an toàn, tiện lợi, chuyên nghiệp và nâng cao chất lượng dịch vụ chăm sóc khách hàng...</p>
        `,
        "huong-dan-thanh-toan": `
            <h4>HƯỚNG DẪN THANH TOÁN</h4>
            <p>Để thuận tiện cho khách hàng khi mua sắm tại ITCAKE.vn, chúng tôi hiện đang hỗ trợ các phương thức thanh toán sau:</p>
            <h4>1. THANH TOÁN QUA NGÂN HÀNG</h4>
            <p>Khách hàng có thể thanh toán qua chuyển khoản ngân hàng, tài khoản của chúng tôi là:</p>
            <ul>
                <li>Ngân hàng ACB: 123456789 (Tài khoản cá nhân)</li>
                <li>Ngân hàng Vietcombank: 987654321 (Tài khoản cá nhân)</li>
            </ul>
            <p>Vui lòng ghi rõ thông tin người nhận và nội dung thanh toán để dễ dàng xác nhận giao dịch...</p>
            <h4>2. THANH TOÁN KHI NHẬN HÀNG (COD)</h4>
            <p>Khách hàng có thể chọn thanh toán khi nhận hàng (COD) nếu sản phẩm được giao tận nơi.</p>
        `
    };

    // Event listeners for nav links inside the main content area
    navLinks.forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault(); // Prevent default behavior (navigation)
            const contentKey = this.getAttribute('data-content');
            if (contentData[contentKey]) {
                contentArea.innerHTML = contentData[contentKey]; // Load corresponding content
            } else {
                contentArea.innerHTML = "<p>Không tìm thấy nội dung.</p>"; // Fallback message
            }
        });
    });

    // Event listeners for footer links
    footerLinks.forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault(); // Prevent default behavior (navigation)
            const contentKey = this.getAttribute('data-content');
            if (contentData[contentKey]) {
                contentArea.innerHTML = contentData[contentKey]; // Load corresponding content
            } else {
                contentArea.innerHTML = "<p>Không tìm thấy nội dung.</p>"; // Fallback message
            }
        });
    });
});
