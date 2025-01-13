
function decreaseQuantity() {
  let quantity = document.getElementById("quantity");
  if (quantity.value > 1) {
    quantity.value = parseInt(quantity.value) - 1;
    updateSubtotal();
  }
}

function increaseQuantity() {
  let quantity = document.getElementById("quantity");
  quantity.value = parseInt(quantity.value) + 1;
  updateSubtotal();
}

function updateSubtotal() {
  const price = 340000;
  const quantity = document.getElementById("quantity").value;
  const subtotal = document.querySelector(".subtotal");
  subtotal.textContent = (price * quantity).toLocaleString("vi-VN") + "₫";
  document.querySelector(".cart-summary p:nth-child(1)").textContent =
    "Tạm tính: " + subtotal.textContent;
  document.querySelector(".cart-summary p:nth-child(2)").textContent =
    "Tổng: " + subtotal.textContent;
}




function closeCartModal() {
  const cartModal = document.getElementById('cart-modal');
  const cartIframe = document.getElementById('cart-iframe');

  console.log("Đang thực hiện đóng modal..."); // Log kiểm tra

  // Ẩn modal
  cartModal.style.display = 'none';
  cartModal.classList.remove('show');
  console.log("Modal đã được ẩn."); // Log sau khi ẩn modal

  // Xóa nội dung của iframe
  cartIframe.src = '';
  console.log("Iframe đã được xóa nội dung."); // Log sau khi xóa src của iframe
}

continueShoppingLink.addEventListener('click', (event) => {
  event.preventDefault();
  console.log("Nút 'Tiếp tục mua hàng' được nhấn."); // Log kiểm tra
  closeCartModal();
});


checkoutLink.addEventListener('click', (event) => {
  closeCartModal(); 

  setTimeout(() => {
      window.top.location.href = '../payment.jsp';
  }, 200);
});