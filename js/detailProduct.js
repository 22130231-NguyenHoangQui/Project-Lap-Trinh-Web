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

function initializeRatingSystem(starSelector, ratingSelector) {
  // Lấy tất cả các ngôi sao
  const stars = document.querySelectorAll(starSelector);
  const ratingSelect = document.querySelector(ratingSelector);

  // Lặp qua từng ngôi sao và gắn sự kiện click
  stars.forEach((star, index) => {
    star.addEventListener("click", (e) => {
      e.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>

      // Loại bỏ trạng thái "active" khỏi tất cả các ngôi sao
      stars.forEach((s) => (s.querySelector("i").style.color = "#ccc")); // Màu mặc định

      // Gắn màu vàng cho các ngôi sao từ trái đến ngôi sao được chọn
      for (let i = 0; i <= index; i++) {
        stars[i].querySelector("i").style.color = "#f39c12"; // Màu vàng
      }

      // Cập nhật giá trị của <select> ẩn
      if (ratingSelect) {
        ratingSelect.value = index + 1; // Gán giá trị xếp hạng (1 -> 5)
      }
    });
  });
}

// Khởi tạo hệ thống đánh giá
initializeRatingSystem(".stars a", "#rating");
