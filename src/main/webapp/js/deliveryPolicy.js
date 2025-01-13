document.addEventListener('DOMContentLoaded', function () {
    // Select only the nav links within the main content area
    const mainSection = document.querySelector('.main');
    const navLinks = mainSection.querySelectorAll('.nav-link'); // Scoped to only .main
    const contentArea = document.getElementById('content-area');

    const contentData = {
        "chinh-sach-doi-tra": `
            <h4>CHÍNH SÁCH ĐỔI, TRẢ, HOÀN TIỀN</h4>
            <p>Kính thưa quí khách hàng,</p>
            <p>Để chiếc bánh mà chúng tôi cung cấp đến tận tay khách hàng đẹp nhất, ngon nhất, cần có đủ thông tin về cách sử dụng trước, trong, sau bán hàng. Vì lý do đó, chúng tôi công bố thêm chính sách đổi bánh, trả bánh, hoàn tiền để khách hàng biết và sử dụng.</p>
            <h4>1. Chính sách đổi bánh</h4>
            <ul>
                <li>Tất cả những mẫu bánh, những yêu cầu sau khi đã được lên đơn và được sự đồng ý của khách hàng đều được thực hiện 100%. Nếu không đúng 1 trong các yêu cầu, khách hàng có quyền đổi lại bánh và không phải mất thêm chi phí nào.</li>
                <li>Sau khi có thông tin phản hồi từ khách hàng, chúng tôi sẽ tiến hành đổi ngay để đảm bảo bánh ngon và kịp thời gian cho bữa tiệc là vui nhất, khách hàng không phải chi trả thêm chi phí nào.</li>
                <li>Khách hàng cần kiểm tra bánh kỹ trước khi nhận để không làm mất thời gian của hai bên và tiện ích hơn trong quá trình xử lý công việc, kịp thời và nhanh nhất.</li>
            </ul>
            <h4>2. Chính sách trả bánh và hoàn tiền</h4>
            <h4>2.1 Lỗi từ chúng tôi:</h4>
            <ul>
                <li>Sau khi đặt bánh, nếu khách hàng nhận bánh không đúng như mẫu bánh đã đặt, khách hàng có quyền trả lại bánh mà không mất thêm chi phí nào. Khách hàng cần kiểm tra ngay trước khi nhận bánh và thanh toán tiền.</li>
                <li>Nếu tiếp tục mua bánh, chúng tôi sẽ làm bánh theo đúng yêu cầu và tiếp tục giao đến địa chỉ khách yêu cầu.</li>
                <li>Nếu khách không tiếp tục mua bánh, khách đã đặt tiền thì chúng tôi sẽ trả lại 100% số tiền khách đã đặt.</li>
            </ul>
            <p><strong>Đặc biệt:</strong></p>
            <ul>
                <li>Tất cả những chi phí phát sinh từ lúc thực hiện đến lúc hoàn thành khách hàng không phải thêm bất kỳ chi phí nào. Khách hàng chỉ cần kiểm tra kỹ trước khi nhận bánh là đã giúp chúng tôi biết ơn khách hàng rồi ạ!</li>
            </ul>
            <h4>2.2 Lỗi từ khách hàng:</h4>
            <ul>
                <li>Sau khi đặt bánh, khách hàng có lý do đặc biệt nào đó mà không sử dụng được bánh ngay hoặc phải hủy đơn bánh, chúng tôi sẽ thực hiện vào từng trường hợp cụ thể để làm HÀI LÒNG khách hàng. Nếu:</li>
                <ul>
                    <li>a. Nếu khách hàng đã chuyển khoản mà chúng tôi chưa làm bánh, chúng tôi sẽ hoàn lại 100% số tiền khách hàng đã chuyển khoản.</li>
                    <li>b. Nếu khách hàng đã chuyển khoản mà chúng tôi đã làm bánh, thì coi như khách hàng đã đồng ý, vì bánh sau khi sản xuất theo yêu cầu của khách, chúng tôi không thể hoàn tiền lại được.</li>
                </ul>
            </ul>
            <p>Để có được chiếc bánh ngon, bánh đẹp đến tận tay khách hàng, cần qua nhiều qui trình như tư vấn, lên đơn, sản xuất, đóng gói, ship bánh. Vì thế sự hợp tác chân thành từ khách hàng sẽ giúp chúng tôi có được những sản phẩm và dịch vụ tốt nhất, chúng tôi xin chân thành cảm ơn!</p>
        `,
        "chinh-sach-bao-mat": `
            <h4>CHÍNH SÁCH BẢO MẬT THÔNG TIN KHÁCH HÀNG</h4>
            <p>Bạn hoàn toàn có thể yên tâm về các thông tin của mình trên ITCAKE.vn bởi chúng tôi ưu tiên hàng đầu trong việc bán hàng và cung cấp dịch vụ bánh sinh nhật tại website. Bạn vui lòng đọc bản “Chính sách bảo mật” dưới đây để hiểu hơn những cam kết mà chúng tôi thực hiện, nhằm tôn trọng và bảo vệ quyền lợi của người truy cập:</p>
            <h4>1. THU THẬP THÔNG TIN CÁ NHÂN</h4>
            <p>Để truy cập và sử dụng một số dịch vụ tại ITCAKE.vn, bạn có thể sẽ được yêu cầu đăng ký với chúng tôi thông tin cá nhân (Email, Họ tên, Số ĐT liên lạc…). Mọi thông tin khai báo phải đảm bảo tính chính xác và hợp pháp, chúng tôi không chịu mọi trách nhiệm liên quan đến pháp luật của thông tin khai báo, chúng tôi cũng có thể thu thập thông tin về số lần viếng thăm, bao gồm số trang bạn xem, số links (liên kết) bạn click và những thông tin khác liên quan đến việc kết nối đến ITCAKE.vn.</p>
            <p>Chúng tôi cũng thu thập các thông tin mà trình duyệt Web (Browser) bạn sử dụng mỗi khi truy cập vào ITCAKE.vn, bao gồm: địa chỉ IP, loại Browser, ngôn ngữ sử dụng, thời gian và những địa chỉ mà Browser truy xuất đến.</p>
            <h4>2. CAM KẾT BẢO VỆ CÁC THÔNG TIN RIÊNG TƯ</h4>
            <p>Thông tin của khách hàng thông qua hệ thống bảo mật của website, không sử dụng nó vì mục đích thương mại hay bất cứ mục đích nào khác. Chúng tôi sử dụng các biện pháp an ninh bảo mật thông tin để chống mất mát, nhầm lẫn hoặc thay đổi dữ liệu trong hệ thống.</p>
            <h4>3. CAM KẾT CHỈ SỬ DỤNG THÔNG TIN ĐỂ NHẰM TẠO MÔI TRƯỜNG MUA SẮM AN TOÀN</h4>
            <p>Chúng tôi sử dụng những thông tin thu thập qua website để tạo môi trường mua sắm an toàn, tiện lợi, chuyên nghiệp và nâng cao chất lượng dịch vụ chăm sóc khách hàng. Ngoài ra, những thông tin cũng chỉ được chúng tôi dùng trong việc giải quyết các vấn đề liên quan tới tranh chấp phát sinh trong việc mua bán, thanh toán qua website, và ngăn chặn những hoạt động vi phạm pháp luật Việt Nam.</p>
            <h4>4. CAM KẾT KHÔNG CHIA SẺ, BÁN HOẶC CHO THUÊ THÔNG TIN CÁ NHÂN CỦA KHÁCH HÀNG</h4>
            <p>Thông tin của quý khách gửi cho chúng tôi chỉ do nhân viên chúng tôi quản lý và sử dụng cho mục đích liên hệ hoặc gửi email để cung cấp thông tin cho quý khách.</p>
            <p>Chúng tôi sẽ gửi các thông tin cá nhân về quý khách cho các công ty hoặc các cá nhân khác trong trường hợp:</p>
            <ul>
                <li>Chúng tôi được quý khách đồng ý cho tiết lộ thông tin đó.</li>
                <li>Chúng tôi cần tiết lộ thông tin của quý khách để cung cấp các sản phẩm hoặc dịch vụ liên quan tới việc liên lạc với quý khách.</li>
                <li>Chúng tôi tuân theo các trát lệnh, lệnh tòa án hoặc thủ tục pháp lý.</li>
                <li>Chúng tôi thấy rằng các hành động của quý khách trên các trang web của chúng tôi là vi phạm các quy định hướng dẫn sử dụng của chúng tôi đối với các sản phẩm hoặc dịch vụ nhất định.</li>
            </ul>
            <h4>5. THAY ĐỔI VỀ CHÍNH SÁCH</h4>
            <p>Nội dung của “Chính sách bảo mật” này có thể thay đổi để phù hợp với các nhu cầu của web ITCAKE.vn cũng như nhu cầu và sự phản hồi từ khách hàng nếu có. Khi cập nhật nội dung chính sách này, chúng tôi sẽ chỉnh sửa lại thời gian “Cập nhật lần cuối” bên trên. Nội dung “Chính sách bảo mật” này chỉ áp dụng tại <a href="http://banhsinhnhatngon.vn" target="_blank">http://banhsinhnhatngon.vn</a>, không bao gồm hoặc liên quan đến các bên thứ ba đặt quảng cáo hay có links tại <a href="http://banhsinhnhatngon.vn" target="_blank">http://banhsinhnhatngon.vn</a>. Do đó, chúng tôi đề nghị bạn đọc kỹ nội dung chính sách bảo mật này.</p>
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
            <p>Vui lòng ghi rõ thông tin người nhận và nội dung thanh toán để dễ dàng xác nhận giao dịch. Sau khi hoàn thành chuyển khoản, vui lòng thông báo cho chúng tôi qua điện thoại hoặc email.</p>
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
});
/**
 * hàm để click button thì chuyến
 * sang trang shoppingcart
 */
document.addEventListener("DOMContentLoaded", function () {
    const cartButton = document.getElementById("cart-button");

    cartButton.addEventListener("click", function () {
        window.location.href = "Cart.jsp";
    });
});