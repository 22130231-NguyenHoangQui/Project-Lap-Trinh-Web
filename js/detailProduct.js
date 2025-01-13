document.addEventListener("DOMContentLoaded", function () {
  var isMediumDiv = document.querySelector('.is-medium .container');
  var path = window.location.pathname.split('/').filter(function (part) {
    return part !== '' && part !== 'pages';
  });

  // Lấy tiêu đề sản phẩm từ thẻ h1
  var productTitleElement = document.querySelector('.product-title');
  var productTitle = productTitleElement ? productTitleElement.textContent.trim() : '';
  var productSlug = productTitle.toLowerCase()
    .replace(/[^a-z0-9\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-');

  var breadcrumbHtml = '<a href="../pages/homepage.html">Trang Chủ</a>';
  var urlPath = '/';

  path.forEach(function (part, index) {
    urlPath += part + '/';
    if (index === path.length - 1 && part === 'detailProduct.jsp') {
      breadcrumbHtml += ' <span class="divider">/</span> <a href="' + urlPath + productSlug + '">' + 'Danh Mục Sản Phẩm / ' + productTitle + '</a>';
    } else {
      breadcrumbHtml += ' <span class="divider">/</span> <a href="' + urlPath + '">' + part.replace(/-/g, ' ') + '</a>';
    }
  });

  isMediumDiv.innerHTML = breadcrumbHtml;
});



// Lấy dữ liệu sản phẩm từ LocalStorage
// hàm lấy dữ liệu từ catalog và render ra
const product = JSON.parse(localStorage.getItem('selectedProduct'));

// Kiểm tra xem có sản phẩm hay không trước khi tiếp tục
if (product) {
  document.getElementById('product-img').src = product.image;
  document.getElementById('product-title').textContent = `${product.id} - ${product.name}`;

  document.getElementById('product-price').textContent = `${product.price}
    
    `;

  const descriptionElement = document.getElementById('product-description');
  if (descriptionElement) {
    console.log("abc");

    descriptionElement.style.display = 'block'; // Hiển thị mô tả khi cần
    descriptionElement.querySelector('.sku').innerHTML = product.name;
    descriptionElement.querySelector('.description-content').innerHTML = product.description;
    descriptionElement.querySelector('.product-diameter').innerHTML = product.diameter;
    descriptionElement.querySelector('.product-height').innerHTML = product.height;

  }

  localStorage.removeItem('selectedProduct');
} else {
  console.log("Không tìm thấy sản phẩm trong LocalStorage.");
}
// thêm vào giỏ hàng
function addToCart() {
  // Mảng lưu các sản phẩm
  const productsInCart = JSON.parse(localStorage.getItem('cart')) || [];

  // Lấy thông tin sản phẩm (ví dụ lấy từ các phần tử có class 'product-id', 'product-image', 'product-height')
  const productId = document.querySelector('.product-title').textContent.trim();
  const productImage = document.querySelector('.product-image').src;
  const productDiameter = document.querySelector('.product-diameter').textContent.trim();
  const productPrice = document.querySelector('.price').textContent.trim();
  // Tạo đối tượng sản phẩm
  const product = {
      id: productId,
      image: productImage,
      diameter: productDiameter,
      price: productPrice
  };

  // Thêm sản phẩm vào giỏ hàng (kiểm tra nếu sản phẩm chưa có trong giỏ)
  productsInCart.push(product);

  // Lưu lại giỏ hàng vào localStorage
  localStorage.setItem('cart', JSON.stringify(productsInCart));

  // Chuyển hướng tới trang giỏ hàng
  window.location.href = '../pages/shoppingCart.html';
}
function ToPayment(){  
  window.location.href = "../pages/payment.html"; 
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



document.addEventListener("DOMContentLoaded", function () {
  const unitPrice = 250000; // Giá mỗi sản phẩm
  const priceElement = document.querySelector("#product-price"); // Thẻ hiển thị giá
  const quantityInput = document.querySelector("#quantity-1"); // Input số lượng

  // Hàm cập nhật giá
  function updatePrice() {
    const quantity = parseInt(quantityInput.value) || 1;
    const totalPrice = unitPrice * quantity;
    priceElement.textContent = totalPrice.toLocaleString("vi-VN") + "₫";
  }

  // Hàm xử lý tăng/giảm số lượng
  function handleQuantityChange(buttonSelector) {
    const buttons = document.querySelectorAll(buttonSelector);

    buttons.forEach((button) => {
      button.addEventListener("click", function () {
        const step = parseInt(quantityInput.getAttribute("step")) || 1;
        const min = parseInt(quantityInput.getAttribute("min")) || 1;
        let currentValue = parseInt(quantityInput.value) || 1;

        if (button.classList.contains("input-reduce")) {
          // Đảm bảo giá trị không nhỏ hơn min
          currentValue = Math.max(min, currentValue - step);
        } else if (button.classList.contains("input-increase")) {
          currentValue += step; // Tăng giá trị
        }

        quantityInput.value = currentValue;
        updatePrice(); // Cập nhật giá sau khi thay đổi số lượng
      });
    });
  }

  // Lắng nghe sự kiện thay đổi số lượng trực tiếp từ input
  quantityInput.addEventListener("input", function () {
    const currentValue = parseInt(quantityInput.value) || 1;
    quantityInput.value = Math.max(1, currentValue); // Đảm bảo giá trị không nhỏ hơn 1
    updatePrice();
  });

  // Kích hoạt hàm tăng/giảm
  handleQuantityChange(".is-form");

  // Cập nhật giá ban đầu (nếu cần)
  updatePrice();
});


/**
 * hàm để click button thì chuyến
 * sang trang shoppingcart
 */
document.addEventListener("DOMContentLoaded", function () {
  const cartButton = document.getElementById("cart-button");

  cartButton.addEventListener("click", function () {
      window.location.href = "Cart.jsp";
  });
});


// Sử dụng hàm để khởi tạo
initializeImageModal(
  "image-modal",        // ID của modal
  "modal-img",          // ID của ảnh trong modal
  ".close",             // Selector của nút đóng
  ".pr-image a"         // Selector của liên kết ảnh
);
