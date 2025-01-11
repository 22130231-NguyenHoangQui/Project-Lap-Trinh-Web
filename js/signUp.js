document.getElementById("signup-form").addEventListener("submit", function(event) {
    event.preventDefault(); // Ngăn gửi form mặc định

    // Lấy giá trị từ các trường input
    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();
    const confirmPassword = document.getElementById("confirm-password").value.trim();
    const fname = document.getElementById("fname").value.trim();
    const sdt = document.getElementById("sdt").value.trim();
    const email = document.getElementById("email").value.trim();
    const date = document.getElementById("date").value.trim();
    const address = document.getElementById("address").value.trim();
    const receive = document.getElementById("receive").value.trim();
    const acp = document.getElementById("acp").checked;

    // Lấy các thẻ để hiển thị lỗi
    const errUser = document.getElementById("errUser");
    const errPW = document.getElementById("errPW");
    const errRePW = document.getElementById("errRePW");
    const errTell = document.getElementById("errTell");
    const errEmail = document.getElementById("errEmail");
    const errAcp = document.getElementById("errAcp");

    // Reset lỗi
    errUser.textContent = "";
    errPW.textContent = "";
    errRePW.textContent = "";
    errTell.textContent = "";
    errEmail.textContent = "";
    errAcp.textContent = "";

    let isValid = true;

    // Kiểm tra Mật khẩu và Xác nhận mật khẩu
    if (password === "") {
        errPW.textContent = "Mật khẩu không được để trống.";
        isValid = false;
    }
    if (confirmPassword === "") {
        errRePW.textContent = "Nhập lại mật khẩu không được để trống.";
        isValid = false;
    } else if (password !== confirmPassword) {
        errRePW.textContent = "Mật khẩu và Nhập lại mật khẩu không khớp.";
        isValid = false;
    }

    // Kiểm tra Số điện thoại
    const phoneRegex = /^[0-9]{10}$/;
    if (!phoneRegex.test(sdt)) {
        errTell.textContent = "Số điện thoại phải là chuỗi số 10 ký tự.";
        isValid = false;
    }

    // Kiểm tra các trường khác (email, tên, địa chỉ, etc.)
    if (email === "") {
        errEmail.textContent = "Email không được để trống.";
        isValid = false;
    }
    if (fname === "") {
        errUser.textContent = "Tên đăng nhập không được để trống.";
        isValid = false;
    }

    // Kiểm tra checkbox đồng ý điều khoản
    if (!acp) {
        errAcp.textContent = "Bạn phải đồng ý với các điều khoản.";
        isValid = false;
    }

    // Nếu không có lỗi, chuyển hướng đến trang chủ
    if (isValid) {
        alert("Đăng ký thành công!");
        window.location.href = "../pages/homepage.html"; // Đổi đường dẫn trang chủ tại đây
    }
});