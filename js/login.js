var valiUsername = "Qui";
var valiPassword = "123";
function handleLoginForm() {
  document
    .getElementById("login-form")
    .addEventListener("submit", function (event) {
      event.preventDefault(); // Ngăn không cho biểu mẫu được gửi

      // Lấy giá trị từ các trường nhập liệu
      var username = document.getElementById("username").value;
      var password = document.getElementById("password").value;

      // Kiểm tra thông tin đăng nhập
      if (username !== "Qui" || password !== "123") {
        // Hiển thị thông báo lỗi nếu thông tin không chính xác
        document.getElementById("error-message").style.display = "block";
      } else {
        // Thực hiện hành động đăng nhập thành công
        alert("Đăng nhập thành công!");
        window.location.href = "../index.html";
      }
    });
}
document.addEventListener("DOMContentLoaded", handleLoginForm);
