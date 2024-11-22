document.addEventListener("DOMContentLoaded", function () {
  var isMediumDiv = document.querySelector('.is-medium .container');
  var path = window.location.pathname.split('/').filter(function (part) {
      return part !== '' && part !== 'pages';
  });

  // Lấy tiêu đề sản phẩm từ thẻ h1
  var productTitleElement = document.querySelector('.product-title');
  var productTitle = productTitleElement ? productTitleElement.textContent.trim() : '';
  var productSlug = productTitle.toLowerCase()
      .replace(/[^a-z0-9\s-]/g, '') // Loại bỏ ký tự đặc biệt
      .replace(/\s+/g, '-')         // Thay khoảng trắng bằng dấu gạch ngang
      .replace(/-+/g, '-');         // Loại bỏ dấu gạch ngang thừa

  var breadcrumbHtml = '<a href="../pages/homepage.html">Trang Chủ</a>';
  var urlPath = '/';

  path.forEach(function (part, index) {
      urlPath += part + '/';
      if (index === path.length - 1 && part === 'detailProduct.html') {
          breadcrumbHtml += ' <span class="divider">/</span> <a href="' + urlPath + productSlug + '">' + 'Danh Mục Sản Phẩm / ' + productTitle + '</a>';
      } else {
          breadcrumbHtml += ' <span class="divider">/</span> <a href="' + urlPath + '">' + part.replace(/-/g, ' ') + '</a>';
      }
  });

  isMediumDiv.innerHTML = breadcrumbHtml;
});







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
initializeRatingSystem(".stars a", "#rating");

// Hàm xử lý tăng hoặc giảm giá trị
function handleQuantityChange(buttonSelector, inputSelector) {
  const buttons = document.querySelectorAll(buttonSelector);

  buttons.forEach((button) => {
    button.addEventListener("click", function () {
      const inputId = button.getAttribute("data-target");
      const input = document.querySelector(inputId);

      if (input) {
        let currentValue = parseInt(input.value) || 1;
        const step = parseInt(input.getAttribute("step")) || 1;
        const min = parseInt(input.getAttribute("min")) || 1;

        if (button.classList.contains("input-reduce")) {
          // Giảm giá trị
          currentValue = Math.max(min, currentValue - step);
        } else if (button.classList.contains("input-increase")) {
          // Tăng giá trị
          currentValue += step;
        }

        input.value = currentValue;
      }
    });
  });
}

document.addEventListener("DOMContentLoaded", function () {
  handleQuantityChange(".is-form", ".input-qt");
});


function initializeImageModal(modalId, modalImgId, closeBtnSelector, imageLinkSelector) {
  const modal = document.getElementById(modalId);
  const modalImg = document.getElementById(modalImgId);
  const closeBtn = document.querySelector(closeBtnSelector);

  // Hàm mở modal và hiển thị ảnh
  function openModal(imageSrc) {
      modal.style.display = "flex"; // Hiển thị modal
      modalImg.src = imageSrc; // Gán đường dẫn ảnh lớn vào modal
  }

  // Hàm đóng modal
  function closeModal() {
      modal.style.display = "none";
  }

  // Thêm sự kiện nhấp vào ảnh
  document.querySelectorAll(imageLinkSelector).forEach(link => {
      link.addEventListener("click", function (e) {
          e.preventDefault(); // Ngăn chuyển hướng liên kết
          openModal(this.href); // Gọi hàm mở modal với ảnh
      });
  });

  // Đóng modal khi nhấn "X"
  closeBtn.addEventListener("click", closeModal);

  // Đóng modal khi nhấp ra ngoài modal
  modal.addEventListener("click", function (e) {
      if (e.target === modal) {
          closeModal();
      }
  });
}

// Sử dụng hàm để khởi tạo
initializeImageModal(
  "image-modal",        // ID của modal
  "modal-img",          // ID của ảnh trong modal
  ".close",             // Selector của nút đóng
  ".pr-image a"         // Selector của liên kết ảnh
);
