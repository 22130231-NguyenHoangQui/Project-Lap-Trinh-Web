
/**
 * hàm fix cho vấn đề hiện dropdown danh mục bị click vô đăng nhập hoặc đăng ký
 */
document.querySelectorAll('.dropdown-menu a').forEach(function (categoryLink) {
    categoryLink.addEventListener('click', function (event) {
        if (categoryLink.getAttribute('href') !== 'SignIn.html' && categoryLink.getAttribute('href') !== 'SignUp.html') {


            const categoryData = categoryLink.getAttribute('data-category');

            localStorage.setItem('selectedCategory', categoryData);


            window.location.href = 'ProductCatalog.jsp';
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
        window.location.href = "Cart.jsp";
    });
});



