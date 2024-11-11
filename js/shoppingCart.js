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
