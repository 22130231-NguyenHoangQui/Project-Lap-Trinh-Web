document.querySelectorAll('.dropdown-menu a').forEach(function (categoryLink) {
    categoryLink.addEventListener('click', function (event) {
        if (categoryLink.getAttribute('href') !== 'SignIn.html' && categoryLink.getAttribute('href') !== 'SignUp.html') {


            const categoryData = categoryLink.getAttribute('data-category');

            localStorage.setItem('selectedCategory', categoryData);


            window.location.href = 'ProductCatalog.html';
        }
    });
});






function toggleSearchDropdown() {
    var dropdown = document.getElementById("search-dropdown");

    if (dropdown.classList.contains("show")) {
        dropdown.classList.remove("show");
    } else {
        dropdown.classList.add("show");
    }
}

document.addEventListener("click", function (event) {
    var icon = document.getElementById("search-icon");
    var dropdown = document.getElementById("search-dropdown");

    if (!icon.contains(event.target) && !dropdown.contains(event.target)) {
        dropdown.classList.remove("show");
    }
});


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


document.addEventListener('DOMContentLoaded', () => {
    const cartButton = document.getElementById('cart-button');
    const cartIframe = document.getElementById('cart-iframe');
    const cartModal = document.getElementById('cart-modal');
    const continueShoppingLink = document.getElementById('continue-shopping');
    const checkoutLink = document.getElementById('checkout');

    cartButton.addEventListener('click', () => {
        cartIframe.src = 'shoppingCart.html';
        cartModal.style.display = 'flex';
        cartModal.classList.add('show');
    });

    window.closeCartModal = function () {
        cartModal.style.display = 'none';
        cartModal.classList.remove('show');
        cartIframe.src = '';
    };

    window.addEventListener('click', (e) => {
        if (e.target === cartModal) {
            closeCartModal();
        }
    });
   

    
    checkoutLink.addEventListener('click', (event) => {
        closeCartModal(); 
        console.log(document.getElementById('checkout')); // Kiểm tra phần tử có tồn tại
        setTimeout(() => {
            window.top.location.href = '../pages/payment.html'; 
        }, 200);
    });
});


document.addEventListener('DOMContentLoaded', () => {
    const dropdownMenu = document.querySelector('.account-dropdown-menu');

    const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';

    if (isLoggedIn) {
        dropdownMenu.innerHTML = `
            <li><a class="dropdown-item" href="#"> Xin Chào: Tài</a></li>
            <li><a class="dropdown-item" href="HistoryBuy.html">Lịch sử mua hàng</a></li>
            <li><a class="dropdown-item" href="changeInformation.html">Thay đổi thông tin</a></li>
            <li><a class="dropdown-item" href="changePassword.html">Đổi mật khẩu</a></li>
            <li><a class="dropdown-item" href="SignIn.html" id="logoutButton">Đăng Xuất</a></li>
        `;

        const logoutButton = document.getElementById('logoutButton');
        logoutButton.addEventListener('click', () => {
            localStorage.removeItem('isLoggedIn');
            location.reload();
        });
    }
});
