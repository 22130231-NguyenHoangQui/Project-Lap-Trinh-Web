/**
 * hàm check nếu khi đăng nhập qua mà trong local có biến là admin hay user thì hiện các 
 * dropdown item tương ứng
 */
document.addEventListener('DOMContentLoaded', () => {
    const dropdownMenu = document.querySelector('.account-dropdown-menu');

    const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
    const userRole = localStorage.getItem('userRole'); 

    if (isLoggedIn) {
        if (userRole === 'admin') {
            dropdownMenu.innerHTML = `
                <li><a class="dropdown-item" href="#"> Xin Chào: Admin</a></li>
                <li><a class="dropdown-item" href="ManageAdmin.html">Quản lý</a></li>
                <li><a class="dropdown-item" href="SignIn.html" id="logoutButton">Đăng Xuất</a></li>
            `;
        } else {
            dropdownMenu.innerHTML = `
                <li><a class="dropdown-item" href="#"> Xin Chào: Tài</a></li>
                <li><a class="dropdown-item" href="HistoryBuy.html">Lịch sử mua hàng</a></li>
                <li><a class="dropdown-item" href="changeInformation.html">Thay đổi thông tin</a></li>
                <li><a class="dropdown-item" href="changePassword.html">Đổi mật khẩu</a></li>
                <li><a class="dropdown-item" href="SignIn.html" id="logoutButton">Đăng Xuất</a></li>
            `;
        }

        const logoutButton = document.getElementById('logoutButton');
        logoutButton.addEventListener('click', () => {
            localStorage.removeItem('isLoggedIn');
            localStorage.removeItem('userRole');
            location.reload();
        });
    }
});

/**
 * hàm fix cho vấn đề hiện dropdown danh mục bị click vô đăng nhập hoặc đăng ký
 */
document.querySelectorAll('.dropdown-menu a').forEach(function (categoryLink) {
    categoryLink.addEventListener('click', function (event) {
        if (categoryLink.getAttribute('href') !== 'SignIn.html' && categoryLink.getAttribute('href') !== 'SignUp.html') {


            const categoryData = categoryLink.getAttribute('data-category');

            localStorage.setItem('selectedCategory', categoryData);


            window.location.href = 'ProductCatalog.html';
        }
    });
});

/**
 * hàm show dropdownitem
 */
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



