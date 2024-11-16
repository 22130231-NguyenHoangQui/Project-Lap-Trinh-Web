// Hàm để tạo hiệu ứng sticky header khi lăn chuột
function stickyHeader() {
  const header = document.querySelector(".header");
  const headerStuck = document.querySelector(".header-container");
  const stickyClass = "is-sticky"; // Thêm class để áp dụng hiệu ứng sticky

  window.onscroll = function () {
    if (window.scrollY > 0) {
      headerStuck.classList.add(stickyClass); // Thêm class khi cuộn xuống
    } else {
      headerStuck.classList.remove(stickyClass); // Loại bỏ class khi cuộn lên đầu
    }
  };
}
function setMainMarginTop() {
  const headerContainer = document.querySelector(".header-container");
  const main = document.querySelector(".main");

  // Kiểm tra nếu phần tử tồn tại
  if (headerContainer && main) {
    // Lấy chiều cao của header-container
    const headerHeight = headerContainer.offsetHeight;

    // Áp dụng chiều cao vào margin-top của main
    main.style.marginTop = headerHeight + "px";
  }
}

// Lắng nghe sự kiện DOMContentLoaded để đảm bảo mọi phần tử đã được tải
document.addEventListener("DOMContentLoaded", setMainMarginTop);
