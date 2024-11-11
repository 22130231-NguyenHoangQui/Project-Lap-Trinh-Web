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
document.addEventListener("DOMContentLoaded", function () {
  const categoryLink = document.getElementById("category-click");
  const categoryMenu = document.getElementById("category-menu");
  const toggleIcon = document.getElementById("toggle-icon");

  // Sự kiện di chuột vào chữ "DANH MỤC" để hiển thị danh mục
  categoryLink.addEventListener("mouseover", function () {
    categoryMenu.style.display = "block";
  });

  // Sự kiện di chuột ra khỏi danh mục để ẩn menu
  categoryMenu.addEventListener("mouseleave", function () {
    categoryMenu.style.display = "none";
  });

  // Sự kiện click vào icon tam giác để ẩn/hiện danh mục
  toggleIcon.addEventListener("click", function (event) {
    event.preventDefault(); // Ngăn chặn chuyển hướng khi nhấn vào icon
    const isExpanded = categoryLink.getAttribute("aria-expanded") === "true";

    // Toggle trạng thái hiển thị menu
    categoryMenu.style.display = isExpanded ? "none" : "block";
    categoryLink.setAttribute("aria-expanded", isExpanded ? "false" : "true");

    // Đổi icon tam giác 
    toggleIcon.classList.toggle("bi-caret-down-fill");
    toggleIcon.classList.toggle("bi-caret-up-fill");
  });

  // Ẩn menu nếu nhấp ra ngoài
  document.addEventListener("click", function (event) {
    if (
      !categoryLink.contains(event.target) &&
      !toggleIcon.contains(event.target) &&
      !categoryMenu.contains(event.target)
    ) {
      categoryMenu.style.display = "none";
      categoryLink.setAttribute("aria-expanded", "false");
    }
  });
});
