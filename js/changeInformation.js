const xac_thuc = false; // Biến xác thực
const userId = 123;
function checkVerification(userId) {
  //Thay thế đoạn này bằng truy vấn dữ liệu từ MySQL thông qua API(cuối kì)
  const messageElement = document.getElementById("verification");
  if (xac_thuc) {
    messageElement.innerHTML =
      ' Tài khoản đã được xác thực <i class="bi bi-check-circle-fill" style="color: green;"></i>';
  } else {
    messageElement.innerHTML =
      'Tài khoản của bạn chưa xác thực, <span class="verify-now" id="verify-now">xác thực ngay</span>';
  }

  const verifyNowElement = document.getElementById("verify-now");
  if (verifyNowElement) {
    verifyNowElement.addEventListener("click", function () {
      window.location.href = "../verification.html";
    });
  }
}
checkVerification(userId);
