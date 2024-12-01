/**
 * Hàm hiện thị đường dẫn của trang đang ở hiện tại
 */
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
/**
 * hàm fix cho vấn đề danh mục bị lỗi
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
 * hàm thay đổi giá giúp khi kéo thay thì sẽ thay đổi giá tương ứng
 */
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
/**
 * hàm mã hóa để loại bỏ ký tự đồng thời bảo mật
 *  tạo sản phẩm tương ứng với product tương ứng của danh mục đã click ( hàm hổ trợ cho hàm hiện thị sản phẩm ở dưới)
 */
function createProductHTML(product) {
    const productData = encodeURIComponent(JSON.stringify(product));
    return `
<div class="col">
    <div class="col-inner">
        <div class="product-small box">
            <div class="box-image">
                <a href="#" class="product-link" onclick="saveProductData('${productData}')">
                    <img width="247" height="296" src="${product.image}" alt="${product.name}">
                </a>
            </div>
            <div class="box-text text-center">
                <div class="title-wrapper">
                    <p>
                        <a href="#" onclick="saveProductData('${productData}')">${product.id} - ${product.name}</a>
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
                    <a href="#" onclick="saveProductData('${productData}')">THÊM VÀO GIỎ</a>
                </div>
                <div class="product-description" style="display:none;">
                    <span class="description-id">Mã: <span class="sku">${product.id}</span></span>
                    <span class="description-content">Mô tả: <br>${product.description}</span>
                </div>
                 <div class="size-wrapper" style="display:none;">
                    <p ><strong>Đường kính:</strong> ${product.diameter}</p> <!-- Hiển thị đường kính -->
                    <p><strong>Chiều cao:</strong> ${product.height}</p> <!-- Hiển thị chiều cao -->
                </div>
            </div>
        </div>
    </div>
</div>
`;
}


/**
 * hàm hiện thị sản phẩm tương ứng và mặc định khi vào trang
 */
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


/**
 * hàm lấy tên ra để cho hover  
 */
function getCategoryName(category) {
    const categoryMapping = {
        banh_an_nhe: 'Bánh Ăn Nhẹ',
        banh_cac_ngay_le: 'Bánh Các Ngày Lễ',
        banh_chai_ruou: 'Bánh Chai Rượu Và Ly Bia Sang Trọng',
    };
    return categoryMapping[category] || category;
}



/**
 * lưu data vô để hiện thị chi tiết sản phẩm tương ứng
 */
function saveProductData(encodedProduct) {
    // Giải mã và parse JSON từ chuỗi mã hóa
    const product = JSON.parse(decodeURIComponent(encodedProduct));

    // Lưu dữ liệu vào Local Storage
    localStorage.setItem('selectedProduct', JSON.stringify(product));

    // In ra console để kiểm tra
    console.log("Sản phẩm được lưu:", product);

    // Chuyển hướng sang trang chi tiết sản phẩm
    window.location.href = 'detailProduct.html';
}

const imagesByCategory = {
    '2':[ { image: '../image/imghomepage/product/product_danhmuc/7.webp', id: 'TRMS4', name: 'Tiramisu Dâu Tây', price: '120,000₫', link: '#' ,
        description: 'Tiramisu Dâu Tây mềm mại với lớp kem mịn và vị chua ngọt của dâu tây tươi, một sự kết hợp tuyệt vời cho những ai yêu thích vị ngọt nhẹ nhàng.',   diameter: '16cm',  
        height: '5cm' }
    ]
    
    ,'banh_an_nhe': [
        { image: '../image/imghomepage/product/product_danhmuc/7.webp', id: 'TRMS4', name: 'Tiramisu Dâu Tây', price: '300,000₫', link: '#' ,
            description: 'Tiramisu Dâu Tây mềm mại với lớp kem mịn và vị chua ngọt của dâu tây tươi, một sự kết hợp tuyệt vời cho những ai yêu thích vị ngọt nhẹ nhàng.', diameter: '22cm',  
            height: '6cm'},
        { image: '../image/imghomepage/product/product_danhmuc/2.webp', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1,180,000₫', link: '#' ,
             description: 'Bánh sinh nhật Su Sing Hoa Quả có lớp bánh xốp mềm, kem tươi mát lạnh và các loại trái cây tươi ngon, thích hợp cho mọi dịp lễ hội.', diameter: '22cm',  
        height: '6cm'



         },
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



