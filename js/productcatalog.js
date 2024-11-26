// lưu dữ liệu vào JSON
// document.addEventListener('DOMContentLoaded', function () {
//     const productData = JSON.parse(localStorage.getItem("selectedProductData"));

//     if (productData) {
//         const productLink = document.getElementById('productLink');
//         const priceDisplay = document.getElementById('priceDisplay');
//         const imageDisplay = document.getElementById('imageDisplay');
//         const titleDisplay = document.getElementById('titleDisplay');

//         // Hiển thị thông tin sản phẩm
//         titleDisplay.textContent = productData.title;
//         priceDisplay.innerHTML = `<span class="woocommerce-Price-amount amount"><bdi style="font-weight: bold;">${productData.price}<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span>`;
//         imageDisplay.src = productData.image;
//     }

//     // Xóa dữ liệu sau khi hiển thị
//     localStorage.removeItem('selectedProductData');
// });





// document.addEventListener("DOMContentLoaded", function () {
//     const productLinks = document.querySelectorAll(".product-link");

//     productLinks.forEach(link => {
//         link.addEventListener("click", function (event) {
//             event.preventDefault();

//             const productData = {
//                 id: link.getAttribute("data-id"),
//                 title: link.getAttribute("data-title"),
//                 price: link.getAttribute("data-price"),
//                 image: link.getAttribute("data-image")
//             };

//             localStorage.setItem("selectedProduct", JSON.stringify(productData));

//             window.location.href = "DetailProduct.html";
//         });
//     });
// });




document.querySelectorAll('.dropdown-menu a').forEach(function (categoryLink) {
    categoryLink.addEventListener('click', function (event) {
        if (categoryLink.getAttribute('href') !== 'SignIn.html' && categoryLink.getAttribute('href') !== 'SignUp.html') {


            const categoryData = categoryLink.getAttribute('data-category');

            localStorage.setItem('selectedCategory', categoryData);


            window.location.href = 'ProductCatalog.html';
        }
    });
});



function createProductHTML(product) {
    return `
<div class="col">
    <div class="col-inner">
        <div class="product-small box">
            <div class="box-image">
                <a href="${product.link}" class="product-link">
                    <img width="247" height="296" src="${product.image}" alt="${product.name}">
                </a>
            </div>
            <div class="box-text text-center">
                <div class="title-wrapper">
                    <p>
                        <a href="${product.link}">${product.id} - ${product.name}</a>
                    </p>
                </div>
                <div class="price-wrapper">
                    <span class="price">
                        <span class="woocommerce-Price-amount amount">
                            <bdi style="font-weight: bold;">${product.price}</bdi>
                        </span>
                    </span>
                </div>
                <div class="add-to-cart-button">
                    <a href="${product.link}">THÊM VÀO GIỎ</a>
                </div>
            </div>
        </div>
    </div>
</div>
`;
}




document.addEventListener('DOMContentLoaded', function () {
    const leftHandle = document.getElementById('handle-left');
    const rightHandle = document.getElementById('handle-right');
    const priceRange = document.querySelector('.price_slider_range');
    const fromLabel = document.querySelector('.price_label .from');
    const toLabel = document.querySelector('.price_label .to');

    const minValue = 0;
    const maxValue = 1350000;
    const step = 10000;

    let leftValue = minValue;
    let rightValue = maxValue;

    function updateSlider() {
        const rangeWidth = document.querySelector('.price_slider').offsetWidth;
        const leftPercent = ((leftValue - minValue) / (maxValue - minValue)) * 100;
        const rightPercent = ((rightValue - minValue) / (maxValue - minValue)) * 100;

        priceRange.style.left = `${leftPercent}%`;
        priceRange.style.width = `${rightPercent - leftPercent}%`;

        leftHandle.style.left = `${leftPercent}%`;
        rightHandle.style.left = `calc(${rightPercent}% - 20px)`;


        fromLabel.textContent = formatCurrency(leftValue);
        toLabel.textContent = formatCurrency(rightValue);
    }

    function formatCurrency(value) {
        return value.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
    }

    let isLeftDragging = false;
    let isRightDragging = false;

    leftHandle.addEventListener('mousedown', function () {
        isLeftDragging = true;
    });

    rightHandle.addEventListener('mousedown', function () {
        isRightDragging = true;
    });

    document.addEventListener('mousemove', function (e) {
        if (isLeftDragging || isRightDragging) {
            const sliderRect = document.querySelector('.price_slider').getBoundingClientRect();
            const mouseX = e.clientX - sliderRect.left;
            const sliderWidth = sliderRect.width;
            let newValue = ((mouseX / sliderWidth) * (maxValue - minValue)) + minValue;

            if (isLeftDragging) {
                if (newValue < rightValue) {
                    leftValue = Math.max(minValue, Math.min(newValue, rightValue - step));
                    updateSlider();
                }
            }

            if (isRightDragging) {
                if (newValue > leftValue) {
                    rightValue = Math.min(maxValue, Math.max(newValue, leftValue + step));
                    updateSlider();
                }
            }
        }
    });

    document.addEventListener('mouseup', function () {
        isLeftDragging = false;
        isRightDragging = false;
    });

    updateSlider();
});

document.querySelectorAll('.product-categories li').forEach(function (categoryItem) {
    categoryItem.addEventListener('click', function (event) {
        event.preventDefault(); // Prevent default link behavior
        const categoryData = categoryItem.getAttribute('data-category');

        // Store the selected category in localStorage
        localStorage.setItem('selectedCategory', categoryData);

        // Reload the products based on selected category
        loadProducts(categoryData);
    });
});

// Function to load products based on the selected category
function loadProducts(category) {
    const imageList = imagesByCategory[category] || [];
    const productContainer = document.querySelector('.products.row.row-small');

    productContainer.innerHTML = '';  // Clear previous products

    imageList.forEach((product) => {
        productContainer.innerHTML += createProductHTML(product);
    });

    // Mark the active category
    const categoryItems = document.querySelectorAll('.product-categories li');
    categoryItems.forEach((item) => {
        const link = item.querySelector('a');
        if (link && link.textContent.trim() === getCategoryName(category)) {
            item.classList.add('active');
        } else {
            item.classList.remove('active');
        }
    });
}

// Helper function to get category name from the mapping
function getCategoryName(category) {
    const categoryMapping = {
        'banh_an_nhe': 'Bánh Ăn Nhẹ',
        'banh_cac_ngay_le': 'Bánh Các Ngày Lễ',
        'banh_chai_ruou': 'Bánh Chai Rượu Và Ly Bia Sang Trọng',
    };
    return categoryMapping[category] || category;
}


// document.addEventListener('DOMContentLoaded', () => {
//     const cartButton = document.getElementById('cart-button');
//     const cartIframe = document.getElementById('cart-iframe');
//     const cartModal = document.getElementById('cart-modal');
//     const modalOverlay = document.getElementById('modal-overlay');


//     function updateCartTotal() {
//         const iframeDoc = cartIframe.contentDocument || cartIframe.contentWindow.document;
    
//         if (!iframeDoc) {
//             console.error('Không thể truy cập nội dung của iframe.');
//             return;
//         }
    
//         let total = 0;
//         const subtotals = iframeDoc.querySelectorAll('td.subtotal'); // Lấy các ô chứa tổng tiền từ iframe
    
//         subtotals.forEach(subtotal => {
//             const amount = parseInt(
//                 subtotal.textContent.replace(/\D/g, '') // Loại bỏ ký tự không phải số (như "₫")
//             );
//             total += amount;
//         });
    
//         // Cập nhật nút GIỎ HÀNG với tổng tiền
//         cartButton.innerHTML = `GIỎ HÀNG/${total.toLocaleString()}₫`;
//     }
    

//     cartIframe.addEventListener('load', () => {
//         updateCartTotal(); // Gọi hàm sau khi nội dung iframe đã tải xong
//     });
//     cartButton.addEventListener('click', () => {
//         cartIframe.src = 'shoppingCart.html';
//         cartModal.style.display = 'flex';
//         modalOverlay.style.display = 'block';
//         cartModal.classList.add('show');
//     });

//     window.closeCartModal = function () {
//         cartModal.style.display = 'none';
//         modalOverlay.style.display = 'none';
//         cartModal.classList.remove('show')  ;
//         cartIframe.src = '';
//     };

//     window.addEventListener('click', (e) => {
//         if (e.target === cartModal) {
//             closeCartModal();
//         }
//     });
    
// });

// is medium hiện đường dẫn của trang
document.addEventListener("DOMContentLoaded", function () {
    var isMediumDiv = document.querySelector('.is-medium .container');
    var path = window.location.pathname.split('/').filter(function (part) { return part !== ''&& part !== 'pages'; });

    var breadcrumbHtml = '<a href="../pages/homepage.html">Trang Chủ</a>';
    var urlPath = '/';

    path.forEach(function (part, index) {
        urlPath += part + '/';
        if (index === path.length - 1 && part === 'ProductCatalog.html') {
            breadcrumbHtml += ' <span class="divider">/</span> <a href="' + urlPath + '">Danh mục sản phẩm</a>';
        } else {
            breadcrumbHtml += ' <span class="divider">/</span> <a href="' + urlPath + '">' + part.replace(/-/g, ' ') + '</a>';
        }    
    });

    isMediumDiv.innerHTML = breadcrumbHtml;
});



document.addEventListener('DOMContentLoaded', function () {
    const selectedCategory = localStorage.getItem('selectedCategory') || '2';
    const selectedOtherData = localStorage.getItem('selectedOtherData') || [];

    const imageList = imagesByCategory[selectedCategory] || [];
    const productContainer = document.querySelector('.products.row.row-small');

    productContainer.innerHTML = '';

    imageList.forEach((product) => {
        productContainer.innerHTML += createProductHTML(product);
    });

    const categoryItems = document.querySelectorAll('.product-categories li');
    categoryItems.forEach((item) => {
        const link = item.querySelector('a');
        if (link && link.textContent.trim() === getCategoryName(selectedCategory)) {
            item.classList.add('active');
        } else {
            item.classList.remove('active');
        }
    });

    localStorage.removeItem('selectedCategory');
    localStorage.removeItem('selectedOtherData');
});

function getCategoryName(category) {
    const categoryMapping = {
        banh_an_nhe: 'Bánh Ăn Nhẹ',
        banh_cac_ngay_le: 'Bánh Các Ngày Lễ',
        banh_chai_ruou: 'Bánh Chai Rượu Và Ly Bia Sang Trọng',
    };
    return categoryMapping[category] || category;
}

const imagesByCategory = {
    '2':[ { image: '../image/imghomepage/product/product_danhmuc/1.webp', id: 'TRMS4', name: 'Tiramisu Dâu Tây', price: '120.000₫', link: '#' }
    ]
    
    ,'banh_an_nhe': [
        { image: '../image/imghomepage/product/product_danhmuc/1.webp', id: 'TRMS4', name: 'Tiramisu Dâu Tây', price: '120.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/2.webp', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/3.webp', id: 'SH612', name: 'Su dẻo Phô mai', price: '65.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/4.webp', id: 'VB104', name: 'Mousse Dâu Sữa Chua', price: '55.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/5.webp', id: 'O1506', name: 'Nama choco cream', price: '55.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/6.webp', id: 'BM215', name: 'Bông lan trứng muối phomai', price: '55.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/7.webp', id: 'DU311', name: 'Panna cotta', price: '55.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/8.webp', id: 'GC703', name: 'Gato cup Matcha', price: '55.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/9.webp', id: 'TO1502', name: 'Matchamisu', price: '55.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/10.webp', id: 'VB103', name: 'Mousse Việt Quất Sữa Chua', price: '55.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/9.webp', id: 'TO1502', name: 'Matchamisu', price: '55.000₫', link: '#' },

        { image: '../image/imghomepage/product/product_danhmuc/9.webp', id: 'TO1502', name: 'Matchamisu', price: '55.000₫', link: '#' },

    ],
    'banh_cac_ngay_le': [
        { image: '../image/imghomepage/product/product_danhmuc/1.webp', id: 'TRMS4', name: 'Tiramisu Dâu Tây', price: '120.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/2.webp', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/khachhang4.jpg', id: 'Socola', name: 'Bánh Socola', price: '90.000₫', link: '#' }
    ],
    'banh_chai_ruou': [
        { image: '../image/imghomepage/khachhang3.jpg', id: 'Mousse', name: 'Bánh Mousse', price: '80.000₫', link: '#' },
        { image: '../image/imghomepage/khachhang4.jpg', id: 'Socola', name: 'Bánh Socola', price: '90.000₫', link: '#' }

    ],
    'banh_chu_nhat': [
        { image: '../image/imghomepage/khachhang3.jpg', id: 'Mousse', name: 'Bánh Mousse', price: '80.000₫', link: '#' },
        { image: '../image/imghomepage/khachhang4.jpg', id: 'Socola', name: 'Bánh Socola', price: '90.000₫', link: '#' }
    ],
    'banh_cong_chua': [
        { image: '../image/imghomepage/khachhang3.jpg', id: 'Mousse', name: 'Bánh Mousse', price: '80.000₫', link: '#' },
        { image: '../image/imghomepage/khachhang4.jpg', id: 'Socola', name: 'Bánh Socola', price: '90.000₫', link: '#' }
    ],
    'banh_giang_sinh': [
        { image: '../image/imghomepage/khachhang3.jpg', id: 'Mousse', name: 'Bánh Mousse', price: '80.000₫', link: '#' },
        { image: '../image/imghomepage/khachhang4.jpg', id: 'Socola', name: 'Bánh Socola', price: '90.000₫', link: '#' }
    ],
    'banh_ki_niem_ngay': [
        { image: '../image/imghomepage/khachhang3.jpg', id: 'Mousse', name: 'Bánh Mousse', price: '80.000₫', link: '#' },
        { image: '../image/imghomepage/khachhang4.jpg', id: 'Socola', name: 'Bánh Socola', price: '90.000₫', link: '#' }
    ],
    'banh_lich': [
        { image: '../image/imghomepage/khachhang3.jpg', id: 'Mousse', name: 'Bánh Mousse', price: '80.000₫', link: '#' },
        { image: '../image/imghomepage/khachhang4.jpg', id: 'Socola', name: 'Bánh Socola', price: '90.000₫', link: '#' }
    ],
    'banh_mousse': [
        { image: '../image/imghomepage/khachhang3.jpg', id: 'Mousse', name: 'Bánh Mousse', price: '80.000₫', link: '#' },
        { image: '../image/imghomepage/khachhang4.jpg', id: 'Socola', name: 'Bánh Socola', price: '90.000₫', link: '#' }
    ]
};



