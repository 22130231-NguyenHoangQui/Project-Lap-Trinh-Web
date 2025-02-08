document.addEventListener("DOMContentLoaded", function () {
    var isMediumDiv = document.querySelector('.is-medium .container');
    var path = window.location.pathname.split('/').filter(function (part) {
        return part !== '' && part !== 'pages';
    });

    var breadcrumbHtml = '<a href="../homepage.jsp">Trang Chủ</a>';
    var urlPath = '/';

    path.forEach(function (part, index) {
        urlPath += part + '/';
        if (index === path.length - 1 && part === 'Cart.jsp') {
            breadcrumbHtml += ' <span class="divider">/</span> <a href="' + urlPath + '">Giỏ hàng</a>';
        } else {
            breadcrumbHtml += ' <span class="divider">/</span> <a href="' + urlPath + '">' + part.replace(/-/g, ' ') + '</a>';
        }
    });

    isMediumDiv.innerHTML = breadcrumbHtml;
});

window.onload = function () {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const cartContainer = document.getElementById('cart-items');

    if (cart.length > 0) {
        cart.forEach(product => {
            const row = document.createElement('tr');
            row.classList.add('cart-item');
            row.innerHTML = `
                <td>
                    <img src="${product.image}" alt="${product.id}">
                    <span class="ms-2">${product.id}</span>
                </td>
                <td>Kích thước: ${product.diameter}</td>
                <td>${product.price.toLocaleString()}</td>
                <td>
                    <div class="d-flex align-items-center justify-content-center">
                        <button class="btn btn-outline-secondary btn-sm me-1" onclick="decrementQuantity(this)">
                            <i class="fas fa-minus"></i>
                        </button>
                        <input  class="form-control text-center w-25" value="1" onchange="updateSubtotal(this)">
                        <button class="btn btn-outline-secondary btn-sm ms-1" onclick="incrementQuantity(this)">
                            <i class="fas fa-plus"></i>
                        </button>
                    </div>
                </td>
                <td class="subtotal">${product.price.toLocaleString()}</td>
                <td>
                    <button class="btn btn-danger btn-sm" onclick="removeItem(this)">Xóa</button>
                </td>
            `;
            cartContainer.appendChild(row);
        });
    } else {
        cartContainer.innerHTML = '<tr><td colspan="6" class="text-center">Giỏ hàng của bạn hiện tại không có sản phẩm.</td></tr>';
    }
    updateTotal();
};

function updateSubtotal(input) {
    const row = input.closest('tr');
    const price = parseInt(row.children[2].innerText.replace(/[^\d]/g, ''));
    const quantity = parseInt(input.value);

    if (quantity < 1 || isNaN(quantity)) {
        input.value = 1; // Đặt số lượng mặc định là 1 nếu không hợp lệ
    }

    const validQuantity = parseInt(input.value);
    const subtotal = price * validQuantity;

    // Hiển thị lại subtotal với đúng định dạng
    row.querySelector('.subtotal').innerText = `${subtotal.toLocaleString()}₫`;
    updateTotal();
}

function incrementQuantity(button) {
    const input = button.previousElementSibling;
    input.value = parseInt(input.value) + 1;
    updateSubtotal(input);
}

function decrementQuantity(button) {
    const input = button.nextElementSibling;
    if (parseInt(input.value) > 1) {
        input.value = parseInt(input.value) - 1;
        updateSubtotal(input);
    }
}

function removeItem(button) {
    if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này?")) {
        const row = button.closest('tr');
        row.remove();
        updateTotal();

        if (document.querySelectorAll('.cart-item').length === 0) {
            const tbody = document.querySelector('tbody');
            tbody.innerHTML = '<tr><td colspan="6" class="text-center">Giỏ hàng của bạn trống!</td></tr>';
        }
    }
}

function updateTotal() {
    let total = 0;

    // Lấy tất cả giá trị "Thành tiền" và cộng lại
    document.querySelectorAll('.subtotal').forEach(subtotalCell => {
        total += parseInt(subtotalCell.innerText.replace(/[^\d]/g, ''));
    });

    // Hiển thị tổng cộng với đúng định dạng
    document.querySelector('.cart-total').innerText = `Tổng cộng: ${total.toLocaleString()}đ`;

    // Thông báo khuyến mãi
    const promoMessage = document.querySelector('.promo-message');
    if (total >= 450000) {
        promoMessage.innerText = 'Bạn đã đủ điều kiện miễn phí vận chuyển!';
        promoMessage.style.color = '#28a745';
    } else {
        promoMessage.innerText = `Mua thêm ${(450000 - total).toLocaleString()}₫ để được miễn phí vận chuyển.`;
        promoMessage.style.color = '#dc3545';
    }
}


function calculateTotalPrice(productId, unitPrice, quantityInput) {
    // Lấy giá trị số lượng từ input
    const quantity = parseInt(quantityInput.value, 10);
    if (isNaN(quantity) || quantity < 1) {
        alert("Số lượng không hợp lệ!");
        return;
    }

    // Tính tổng giá
    const totalPrice = unitPrice * quantity;

    // Hiển thị tổng giá trong cột "total-price"
    const totalPriceElement = document.querySelector(`.total-price[data-id='${productId}']`);
    if (totalPriceElement) {
        totalPriceElement.textContent = totalPrice.toLocaleString("vi-VN", {
            style: "currency",
            currency: "VND"
        });
    }
}
