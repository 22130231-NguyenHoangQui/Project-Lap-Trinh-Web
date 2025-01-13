// Mở form chỉnh sửa thông tin khách hàng
function editCustomerInfo() {
    document.getElementById("edit-customer-form").classList.remove("d-none");
}

// Lưu thông tin khách hàng sau khi chỉnh sửa
function saveCustomerInfo() {
    const name = document.getElementById("customer-name").value;
    const phone = document.getElementById("customer-phone").value;
    const email = document.getElementById("customer-email").value;
    const address = document.getElementById("shipping-address").value;

    // Cập nhật hiển thị
    document.getElementById("customer-name-display").innerText = name;
    document.getElementById("customer-phone-display").innerText = phone;
    document.getElementById("customer-email-display").innerText = email;
    document.getElementById("shipping-address-display").innerText = address;

    closeCustomerForm(); // Đóng form
}

// Đóng form chỉnh sửa thông tin
function closeCustomerForm() {
    document.getElementById("edit-customer-form").classList.add("d-none");
}

// Đóng modal khi click ngoài vùng modal
document.addEventListener("click", function (e) {
    const editForm = document.getElementById("edit-customer-form");
    if (editForm && e.target === editForm) {
        closeCustomerForm();
    }

    const discountModal = document.getElementById("discount-modal");
    if (discountModal && e.target === discountModal) {
        closeDiscountModal();
    }
});

// Xử lý lời nhắn cho shop
document.getElementById('shopMessage').addEventListener('input', function () {
    const message = this.value;
    localStorage.setItem('shopMessage', message);
});

// Hiển thị lời nhắn khi tải lại trang
window.onload = function () {
    const savedMessage = localStorage.getItem('shopMessage') || '';
    document.getElementById('shopMessage').value = savedMessage;
};

// Kiểm tra thời hạn mã giảm giá
function checkDiscountValidity(expiryDate) {
    const currentDate = new Date();
    const expiry = new Date(expiryDate);
    return expiry >= currentDate;
}

// Áp dụng mã giảm giá
function applyDiscount() {
    const code = document.getElementById('discount-code').value.trim();
    const total = parseInt(document.getElementById('total-price').innerText.replace(/₫|,/g, ''));

    const discounts = {
        "DISCOUNT10": { expiry: "2024-12-31", discount: 0.1 },
        "FREESHIP": { expiry: "2025-01-15", discount: 0 }
    };

    if (code in discounts) {
        const { expiry, discount } = discounts[code];
        if (checkDiscountValidity(expiry)) {
            const discountAmount = total * discount;
            const finalPrice = Math.max(0, total - discountAmount); // Đảm bảo không bị âm
            document.getElementById('final-price').innerText = `${finalPrice.toLocaleString()}.000₫`;
            alert("Áp dụng mã giảm giá thành công!");
        } else {
            alert("Mã giảm giá đã hết hạn!");
        }
    } else {
        alert("Mã giảm giá không hợp lệ!");
    }
}

// Xử lý chuyển trang đến giỏ hàng
document.addEventListener("DOMContentLoaded", function () {
    const cartButton = document.getElementById("cart-button");
    cartButton.addEventListener("click", function () {
        window.location.href = "Cart.jsp";
    });
});

// Mở modal mã giảm giá
document.getElementById("view-discounts-btn").addEventListener("click", function () {
    document.getElementById("discount-modal").classList.remove("d-none");
});

// Đóng modal mã giảm giá
function closeDiscountModal() {
    document.getElementById("discount-modal").classList.add("d-none");
};

// Xử lý click vào danh sách mã giảm giá
document.querySelectorAll('.discount-item').forEach(item => {
    item.addEventListener('click', function () {
        const discountCode = this.getAttribute('data-code');
        document.getElementById('discount-code').value = discountCode; // Điền mã vào ô nhập
        closeDiscountModal(); // Đóng modal mã giảm giá
    });
});
