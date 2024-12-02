function editCustomerInfo() {
    // Hiển thị form chỉnh sửa
    document.getElementById("edit-customer-form").classList.remove("d-none");
}

function saveCustomerInfo() {
    // Lấy giá trị từ form
    const name = document.getElementById("customer-name").value;
    const phone = document.getElementById("customer-phone").value;
    const email = document.getElementById("customer-email").value;
    const address = document.getElementById("shipping-address").value;

    // Cập nhật hiển thị
    document.getElementById("customer-name-display").innerText = name;
    document.getElementById("customer-phone-display").innerText = phone;
    document.getElementById("customer-email-display").innerText = email;
    document.getElementById("shipping-address-display").innerText = address;

    // Ẩn form
    closeCustomerForm();
}

function closeCustomerForm() {
    // Ẩn form chỉnh sửa
    document.getElementById("edit-customer-form").classList.add("d-none");
}

// Đóng form khi nhấn ngoài vùng modal
document.getElementById("edit-customer-form").addEventListener("click", function (e) {
    if (e.target === this) {
        closeCustomerForm();
    }
});
document.getElementById('shopMessage').addEventListener('input', function () {
    const message = this.value;
    localStorage.setItem('shopMessage', message);
});

// Hiển thị lời nhắn khi tải lại trang
window.onload = function () {
    const savedMessage = localStorage.getItem('shopMessage') || '';
    document.getElementById('shopMessage').value = savedMessage;

    // Các xử lý khác trong giỏ hàng...
};

/**
 * hàm để click button thì chuyến
 * sang trang shoppingcart
 */
document.addEventListener("DOMContentLoaded", function () {
    const cartButton = document.getElementById("cart-button");

    cartButton.addEventListener("click", function () {
        window.location.href = "shoppingCart.html"; 
    });
});
