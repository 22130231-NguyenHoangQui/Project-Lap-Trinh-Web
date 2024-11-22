function updateSubtotal(input) {
    const row = input.closest('tr');
    const price = parseInt(row.children[2].innerText.replace(/₫|,/g, ''));
    const quantity = parseInt(input.value);

    if (quantity < 1 || isNaN(quantity)) { 
        input.value = 1; // Đặt lại số lượng về 1 nếu không hợp lệ
    }

    const validQuantity = parseInt(input.value); 
    row.querySelector('.subtotal').innerText = `${(price * validQuantity).toLocaleString()}₫`;
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

        // Kiểm tra nếu giỏ hàng trống
        if (document.querySelectorAll('.cart-item').length === 0) {
            const tbody = document.querySelector('tbody');
            tbody.innerHTML = '<tr><td colspan="6" class="text-center">Giỏ hàng của bạn trống!</td></tr>';
        }
    }
}

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



