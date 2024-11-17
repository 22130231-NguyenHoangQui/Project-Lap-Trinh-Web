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

// Dữ liệu sản phẩm mới
const newProducts = [
    {
        id: 'BHKT85',
        name: 'Bánh sinh nhật mẫu đơn hồng',
        price: '45.000₫',
        image: './2338.webp',
        link: '#'
    },
    {
        id: 'ABC123',
        name: 'Bánh su kem nhân chocolate',
        price: '60.000₫',
        image: './su-kem.webp',
        link: '#'
    },
    {
        id: 'DEF456',
        name: 'Bánh kem dâu tây',
        price: '70.000₫',
        image: './kem-dau-tay.webp',
        link: '#'
    },
    {
        id: 'XYZ789',
        name: 'Bánh mousse cà phê',
        price: '50.000₫',
        image: './mousse-cafe.webp',
        link: '#'
    }
];


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

// // Chèn các sản phẩm vào trong các ô `col`
// function loadProducts() {
//     const productContainer = document.querySelector('.products.row.row-small'); // Chọn container của sản phẩm

//     // Duyệt qua tất cả sản phẩm và thêm chúng vào
//     newProducts.forEach(product => {
//         productContainer.innerHTML += createProductHTML(product); // Thêm sản phẩm vào container
//     });
// }

// // Gọi hàm để tải sản phẩm vào trang
// loadProducts();


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

// is medium hiện đường dẫn của trang
document.addEventListener("DOMContentLoaded", function () {
    var isMediumDiv = document.querySelector('.is-medium');
    var path = window.location.pathname.split('/').filter(function (part) { return part !== ''; });

    var breadcrumbHtml = '<a href="/">Trang Chủ</a>';
    var urlPath = '/';

    path.forEach(function (part, index) {
        urlPath += part + '/';
        breadcrumbHtml += ' <span class="divider">/</span> <a href="' + urlPath + '">' + part.replace(/-/g, ' ') + '</a>';
    });

    isMediumDiv.innerHTML = breadcrumbHtml;
});



document.addEventListener('DOMContentLoaded', function () {
    const selectedCategory = localStorage.getItem('selectedCategory') || 'banh_an_nhe';
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
    'banh_an_nhe': [
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



