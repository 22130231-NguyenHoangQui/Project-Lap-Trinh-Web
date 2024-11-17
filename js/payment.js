function editCustomerInfo() {
    // Hiển thị form chỉnh sửa thông tin khách hàng
    document.getElementById("edit-customer-form").classList.remove("d-none");
}

function saveCustomerInfo() {
    // Lấy giá trị từ form
    const name = document.getElementById("customer-name").value;
    const phone = document.getElementById("customer-phone").value;
    const email = document.getElementById("customer-email").value;

    // Cập nhật hiển thị
    document.getElementById("customer-name-display").innerText = name;
    document.getElementById("customer-phone-display").innerText = phone;
    document.getElementById("customer-email-display").innerText = email;

    // Ẩn form
    document.getElementById("edit-customer-form").classList.add("d-none");
}

function editShippingAddress() {
    // Hiển thị form chỉnh sửa địa chỉ nhận hàng
    document.getElementById("edit-address-form").classList.remove("d-none");
}

function saveShippingAddress() {
    // Lấy giá trị từ form
    const address = document.getElementById("shipping-address").value;

    // Cập nhật hiển thị
    document.getElementById("shipping-address-display").innerText = address;

    // Ẩn form
    document.getElementById("edit-address-form").classList.add("d-none");
}

function updateSubtotal(input) {
    const row = input.closest('tr');
    const price = parseInt(row.children[3].innerText.replace(/₫|,/g, ''));
    const quantity = parseInt(input.value);
    row.querySelector('.subtotal').innerText = `${(price * quantity).toLocaleString()}₫`;
    updateTotal();
}

function updateTotal() {
    let total = 0;
    document.querySelectorAll('.subtotal').forEach(subtotalCell => {
        total += parseInt(subtotalCell.innerText.replace(/₫|,/g, ''));
    });
    document.getElementById('total-price').innerText = `${total.toLocaleString()}₫`;
    document.getElementById('final-price').innerText = `${total.toLocaleString()}₫`;
}

function applyDiscount() {
    const code = document.getElementById('discount-code').value.trim();
    const total = parseInt(document.getElementById('total-price').innerText.replace(/₫|,/g, ''));
    if (code === "DISCOUNT10") {
        const discount = total * 0.1;
        const finalPrice = total - discount;
        document.getElementById('final-price').innerText = `${finalPrice.toLocaleString()}₫`;
        alert("Áp dụng mã giảm giá thành công!");
    } else {
        alert("Mã giảm giá không hợp lệ!");
    }
}

function confirmOrder() {
    alert("Đơn hàng đã được đặt thành công! Cảm ơn bạn đã mua sắm.");
}
