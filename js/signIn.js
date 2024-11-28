var valiUsername = "Qui";
var valiPassword = "123";
function handleLoginForm() {
  document
    .getElementById("login-form")
    .addEventListener("submit", function (event) {
      event.preventDefault();

      // Lấy giá trị từ các trường nhập liệu
      var username = document.getElementById("username").value;
      var password = document.getElementById("password").value;

      // Kiểm tra thông tin đăng nhập
      if (username === "Qui" || password === "123") {
        alert("Đăng nhập thành công!");
        localStorage.setItem('isLoggedIn', 'true');
        localStorage.setItem('userRole', 'user');
        window.location.href = "../pages/HomePage.html";
      } else if (username === "admin" && password === "admin") {
        // Tài khoản admin
        alert("Đăng nhập thành công (Admin)!");
        localStorage.setItem('isLoggedIn', 'true');
        localStorage.setItem('userRole', 'admin'); // Lưu vai trò
        window.location.href = "../pages/HomePage.html";
      } else {
        // Hiển thị thông báo lỗi nếu thông tin không chính xác
        document.getElementById("error-message").style.display = "block";
      }
    });
}
document.addEventListener("DOMContentLoaded", handleLoginForm);
