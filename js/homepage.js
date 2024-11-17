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

document.addEventListener('DOMContentLoaded', () => {
    const cartButton = document.getElementById('cart-button');
    const modalContainer = document.createElement('div');
    document.body.appendChild(modalContainer);

    function loadCartModal() {
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'Cart.html', true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                modalContainer.innerHTML = xhr.responseText;
                attachModalEvents();
            }
        };
        xhr.send();
    }

    function attachModalEvents() {
        const cartModal = document.getElementById('cart-modal');
        const closeCartModal = document.getElementById('close-cart-modal');
        const cartItems = document.getElementById('cart-items');

        const products = [
            { name: 'Sản phẩm 1', price: 100000 },
            { name: 'Sản phẩm 2', price: 200000 },
        ];

        function renderCartItems() {
            cartItems.innerHTML = '';
            products.forEach((product) => {
                const item = document.createElement('div');
                item.className = 'cart-item';
                item.innerHTML = `
                <p>${product.name}</p>
                <p>${product.price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })}</p>
            `;
                cartItems.appendChild(item);
            });
        }

        cartModal.style.display = 'flex';
        renderCartItems();

        closeCartModal.addEventListener('click', () => {
            cartModal.style.display = 'none';
        });

        window.addEventListener('click', (e) => {
            if (e.target === cartModal) {
                cartModal.style.display = 'none';
            }
        });
    }

    cartButton.addEventListener('click', () => {
        if (!modalContainer.innerHTML.trim()) {
            loadCartModal();
        } else {
            const cartModal = document.getElementById('cart-modal');
            cartModal.style.display = 'flex';
        }
    });
});
