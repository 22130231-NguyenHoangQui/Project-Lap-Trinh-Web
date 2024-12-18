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
      window.location.href = "../pages/VerifyAccount.html";
    });
  }
}
checkVerification(userId);

document
  .getElementById("changeInfoForm")
  .addEventListener("submit", function (event) {
    event.preventDefault(); // Ngăn hành vi gửi form mặc định

    // Lấy giá trị từ các ô input
    const fname = document.getElementById("fname").value.trim();
    const sdt = document.getElementById("sdt").value.trim();
    const email = document.getElementById("email").value.trim();
    const date = document.getElementById("date").value.trim();
    const address = document.getElementById("address").value.trim();
    const receive = document.getElementById("receive").value.trim();

    // Lấy các thẻ hiển thị lỗi
    const errorFname = document.getElementById("error-fname");
    const errorSdt = document.getElementById("error-sdt");
    const errorEmail = document.getElementById("error-email");
    const errorDate = document.getElementById("error-date");
    const errorAddress = document.getElementById("error-address");
    const errorReceive = document.getElementById("error-receive");

    // Reset thông báo lỗi
    errorFname.textContent = "";
    errorSdt.textContent = "";
    errorEmail.textContent = "";
    errorDate.textContent = "";
    errorAddress.textContent = "";
    errorReceive.textContent = "";

    let isValid = true;

    // Kiểm tra từng ô input
    if (fname === "") {
      errorFname.textContent = "Vui lòng nhập họ và tên.";
      isValid = false;
    }

    const phoneRegex = /^[0-9]{10}$/; 
    if (sdt === "") {
        errorSdt.textContent = "Vui lòng nhập số điện thoại.";
        isValid = false;
    } else if (!phoneRegex.test(sdt)) {
        errorSdt.textContent = "Số điện thoại phải là chuỗi số 10 ký tự.";
        isValid = false;
    }

    if (email === "") {
      errorEmail.textContent = "Vui lòng nhập email.";
      isValid = false;
    }

    if (date === "") {
      errorDate.textContent = "Vui lòng chọn ngày sinh.";
      isValid = false;
    }

    if (address === "") {
      errorAddress.textContent = "Vui lòng nhập địa chỉ.";
      isValid = false;
    }

    if (receive === "") {
      errorReceive.textContent = "Vui lòng nhập địa chỉ nhận hàng.";
      isValid = false;
    }

    // Nếu tất cả các ô hợp lệ
    if (isValid) {
      alert("Thay đổi thông tin thành công!");
      window.location.href = "../homepage.jsp";
    }
  });
