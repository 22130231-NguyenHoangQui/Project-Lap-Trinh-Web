// is medium hiện đường dẫn của trang
document.addEventListener("DOMContentLoaded", function () {
    var isMediumDiv = document.querySelector('.is-medium .container');
    var path = window.location.pathname.split('/').filter(function (part) { return part !== ''&& part !== 'pages'; });

    var breadcrumbHtml = '<a href="../pages/homepage.html">Trang Chủ</a>';
    var urlPath = '/';

    path.forEach(function (part, index) {
        urlPath += part + '/';
        if (index === path.length - 1 && part === 'shoppingCart.html') {
            breadcrumbHtml += ' <span class="divider">/</span> <a href="' + urlPath + '">Giỏ hàng</a>';
        } else {
            breadcrumbHtml += ' <span class="divider">/</span> <a href="' + urlPath + '">' + part.replace(/-/g, ' ') + '</a>';
        }    
    });

    isMediumDiv.innerHTML = breadcrumbHtml;
});


/**
 * hàm để cật nhật thông tin sản phẩm vào giỏ hàng click thêm vào giỏ hàng ở trang 
 * chi tiết sản phẩm
 */
window.onload = function() {
    // Lấy giỏ hàng từ localStorage
    const cart = JSON.parse(localStorage.getItem('cart')) || [];    
    // Kiểm tra nếu giỏ hàng có sản phẩm
    if (cart.length > 0) {
        const cartContainer = document.getElementById('cart-items');
  
        // Duyệt qua từng sản phẩm trong giỏ hàng
        cart.forEach(product => {
            // Tạo một hàng mới cho mỗi sản phẩm
            const row = document.createElement('tr');
            row.classList.add('cart-item');
  
            // Cập nhật thông tin cho từng cột trong hàng
            row.innerHTML = `
                <td>
                    <img src="${product.image}" alt="${product.id}">
                    <span class="ms-2">${product.id}</span>
                </td>
                <td>Kích thước: ${product.diameter}</td>
                <td>${product.price}
                </td>

                <td>
                    <div class="d-flex align-items-center">
                        <button class="btn btn-outline-secondary btn-sm me-1" onclick="decrementQuantity(this)"><i class="fas fa-minus"></i></button>
                        <input type="number" class="form-control text-center w-25" value="1" onchange="updateSubtotal(this)">
                        <button class="btn btn-outline-secondary btn-sm ms-1" onclick="incrementQuantity(this)"><i class="fas fa-plus"></i></button>
                    </div>
                </td>
                <td class="subtotal">${product.price}</td>
                <td>
                    <button class="btn btn-danger btn-sm" onclick="removeItem(this)">Xóa</button>
                </td>
            `;
            
            cartContainer.appendChild(row);
        });
    } else {
        const cartContainer = document.getElementById('cart-items');
        cartContainer.innerHTML = '<tr><td colspan="6" class="text-center">Giỏ hàng của bạn hiện tại không có sản phẩm.</td></tr>';
    }
    updateTotal();
  };
  

/**
 * dùng các hàm để lọc đ,',',...
 * và tổng cộng lại giá của các sản phẩm
 *  
 */
function updateSubtotal(input) {
    const row = input.closest('tr');
    
    const price = parseInt(row.children[2].innerText.replace(/₫|,/g, '').trim());
    const quantity = parseInt(input.value);

    if (quantity < 1 || isNaN(quantity)) { 
        input.value = 1; // Đặt lại số lượng về 1 nếu không hợp lệ
    }

    const validQuantity = parseInt(input.value); 
    row.querySelector('.subtotal').innerText = `${(price * validQuantity).toLocaleString()}₫`;
    updateTotal();
}

/**
 * hàm tăng giảm số lượng thì sẽ cật nhật lại giá
 * hàm xóa item khỏi giỏ hàng 
 */
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

        // Kiểm tra nếu giỏ hàng trống
        if (document.querySelectorAll('.cart-item').length === 0) {
            const tbody = document.querySelector('tbody');
            tbody.innerHTML = '<tr><td colspan="6" class="text-center">Giỏ hàng của bạn trống!</td></tr>';
        }
    }
}

/**
 * hàm tính xem đã đủ điều kiện miễn phí vẫn chuyển chưa
 */
function updateTotal() {
    let total = 0;
    document.querySelectorAll('.subtotal').forEach(subtotalCell => {
        total += parseInt(subtotalCell.innerText.replace(/₫|,/g, ''));
    });

    document.querySelector('.cart-total').innerText = `Tổng cộng: ${total.toLocaleString()}₫`;

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




