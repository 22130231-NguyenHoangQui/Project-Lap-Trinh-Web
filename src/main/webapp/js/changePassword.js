document.querySelector("form").addEventListener("submit", function (event) {
  event.preventDefault(); // Ngăn gửi form mặc định

  // Lấy giá trị từ các ô input
  const currentPassword = document.getElementById("currentpw").value.trim();
  const newPassword = document.getElementById("newpw").value.trim();
  const reEnterPassword = document.getElementById("re-enterpw").value.trim();

  // Kiểm tra và xử lý lỗi
  const isValid = validateForm(currentPassword, newPassword, reEnterPassword);

  // Nếu không có lỗi, hiển thị thông báo thành công và chuyển hướng
  if (isValid) {
    handleSuccess();
  }
});

// Hàm kiểm tra và xử lý lỗi form
function validateForm(currentPassword, newPassword, reEnterPassword) {
  // Lấy các thẻ span để hiển thị lỗi
  const errCurrentPW = document.getElementById("errPW");
  const errNewPW = document.getElementById("errNPW");
  const errReNewPW = document.getElementById("errReNPW");

  // Reset thông báo lỗi
  resetErrors(errCurrentPW, errNewPW, errReNewPW);

  let isValid = true;

  // Kiểm tra trường "Mật khẩu hiện tại"
  if (currentPassword === "") {
    showError(errCurrentPW, "Vui lòng nhập mật khẩu hiện tại.");
    isValid = false;
  }

  // Kiểm tra trường "Mật khẩu mới"
  if (newPassword === "") {
    showError(errNewPW, "Vui lòng nhập mật khẩu mới.");
    isValid = false;
  }

  // Kiểm tra trường "Xác nhận mật khẩu"
  if (reEnterPassword === "") {
    showError(errReNewPW, "Vui lòng nhập lại mật khẩu mới.");
    isValid = false;
  } else if (newPassword !== reEnterPassword) {
    showError(errReNewPW, "Mật khẩu mới và xác nhận mật khẩu không khớp.");
    isValid = false;
  }

  return isValid;
}

//Hàm hiển thị lỗi
function showError(element, message) {
  element.textContent = message;
  element.classList.add("error");
}

//Hàm reset thông báo lỗi
function resetErrors(...elements) {
  elements.forEach((element) => {
    element.textContent = "";
    element.classList.remove("error");
  });
}

// Hàm xử lý khi đổi mật khẩu thành công
function handleSuccess() {
  alert("Đổi mật khẩu thành công!");
  window.location.href = "../homepage.jsp"; // Chuyển hướng trang
}
