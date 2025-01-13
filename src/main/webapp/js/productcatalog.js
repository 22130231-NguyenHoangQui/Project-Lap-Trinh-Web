/**
 * Hàm hiện thị đường dẫn của trang đang ở hiện tại
 */
document.addEventListener("DOMContentLoaded", function () {
    var isMediumDiv = document.querySelector('.is-medium .container');
    var path = window.location.pathname.split('/').filter(function (part) { return part !== ''&& part !== 'pages'; });

    var breadcrumbHtml = '<a href="../homepage.jsp">Trang Chủ</a>';
    var urlPath = '/';

    path.forEach(function (part, index) {
        urlPath += part + '/';
        if (index === path.length - 1 && part === 'ProductCatalog.jsp') {
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
// document.querySelectorAll('.dropdown-menu a').forEach(function (categoryLink) {
//     categoryLink.addEventListener('click', function (event) {
//         if (categoryLink.getAttribute('href') !== 'SignIn.html' && categoryLink.getAttribute('href') !== 'SignUp.html') {
//
//
//             const categoryData = categoryLink.getAttribute('data-category');
//
//             localStorage.setItem('selectedCategory', categoryData);
//
//
//             window.location.href = 'ProductCatalog.jsp';
//         }
//     });
// });

/**
 *
 */
// document.querySelectorAll('.product-categories li').forEach(function (categoryItem) {
//     categoryItem.addEventListener('click', function (event) {
//         event.preventDefault();
//         const categoryData = categoryItem.getAttribute('data-category');
//         localStorage.setItem('selectedCategory', categoryData);
//         loadProducts(categoryData);
//     });
// });




// Function to load products based on the selected category
// function loadProducts(category) {
//     const imageList = imagesByCategory[category] || [];
//     const productContainer = document.querySelector('.products.row.row-small');
//     productContainer.innerHTML = '';  // Clear previous products
//     imageList.forEach((product) => {
//         productContainer.innerHTML += createProductHTML(product);
//     });
//     // Mark the active category
//     const categoryItems = document.querySelectorAll('.product-categories li');
//     categoryItems.forEach((item) => {
//         const link = item.querySelector('a');
//         if (link && link.textContent.trim() === getCategoryName(category)) {
//             item.classList.add('active');
//         } else {
//             item.classList.remove('active');
//         }
//     });
// }

/**
 * hàm lấy tên ra để cho hover  
 */
function getCategoryName(category) {
    const categoryMapping = {
        banh_an_nhe: 'Bánh Sinh Nhật Ăn Nhẹ',
        banh_cac_ngay_le: 'Bánh Sinh Nhật Các Ngày Lễ',
        banh_chai_ruou: 'Bánh Sinh Nhật Sang Trọng',
        banh_hoa: 'Bánh Sinh Nhật Hoa',
        banh_man: 'Bánh Sinh Nhật Mặn',
        banh_hien_dai: 'Bánh Hiện Đại',
        banh_mau_trai: 'Bánh Sinh Nhật Mẫu Bé Trai',
        banh_mau_gai:'Bánh Sinh Nhật Cho Bé Gái',
        banh_mau:'Bánh Sinh Nhật Mẫu In 3D'
    };
    return categoryMapping[category] || category;
}
/**
 * hàm thay đổi giá giúp khi kéo thay thì sẽ thay đổi giá tương ứng
 */
document.addEventListener('DOMContentLoaded', function () {
    const leftHandle = document.getElementById('handle-left');
    const rightHandle = document.getElementById('handle-right');
    const priceRange = document.querySelector('.price_slider_range');
    const fromLabel = document.querySelector('.price_label .from');
    const toLabel = document.querySelector('.price_label .to');

    const minValue = '${lowestPrice}';
    const maxValue = '${highestPrice}';
    const step = 100;


    let leftValue = minValue;
    let rightValue = maxValue;
    console.log(leftValue);
    console.log(rightValue);

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
// function createProductHTML(product) {
//     const productData = encodeURIComponent(JSON.stringify(product));
//     return `
// <div class="col">
//     <div class="col-inner">
//         <div class="product-small box">
//             <div class="box-image">
//                 <a href="#" class="product-link" onclick="saveProductData('${productData}')">
//                     <img width="247" height="296" src="${product.image}" alt="${product.name}">
//                 </a>
//             </div>
//             <div class="box-text text-center">
//                 <div class="title-wrapper">
//                     <p>
//                         <a href="#" onclick="saveProductData('${productData}')">${product.id} - ${product.name}</a>
//                     </p>
//                 </div>
//                 <div class="price-wrapper">
//                     <span class="price">
//                         <span class="woocommerce-Price-amount amount">
//                             <bdi style="font-weight: bold;">${product.price}</bdi>
//                         </span>
//                     </span>
//                 </div>
//                 <div class="add-to-cart-button">
//                     <a href="#" onclick="saveProductData('${productData}')">THÊM VÀO GIỎ</a>
//                 </div>
//                 <div class="product-description" style="display:none;">
//                     <span class="description-id">Mã: <span class="sku">${product.id}</span></span>
//                     <span class="description-content">Mô tả: <br>${product.description}</span>
//                 </div>
//                  <div class="size-wrapper" style="display:none;">
//                     <p ><strong>Đường kính:</strong> ${product.diameter}</p> <!-- Hiển thị đường kính -->
//                     <p><strong>Chiều cao:</strong> ${product.height}</p> <!-- Hiển thị chiều cao -->
//                 </div>
//             </div>
//         </div>
//     </div>
// </div>
// `;
// }


/**
 * hàm hiện thị sản phẩm tương ứng và mặc định khi vào trang
 */
// document.addEventListener('DOMContentLoaded', function () {
//     const selectedCategory = localStorage.getItem('selectedCategory') || 'banh_an_nhe';
//     const selectedOtherData = localStorage.getItem('selectedOtherData') || [];
//
//     const imageList = imagesByCategory[selectedCategory] || [];
//     const productContainer = document.querySelector('.products.row.row-small');
//
//     productContainer.innerHTML = '';
//
//     imageList.forEach((product) => {
//         productContainer.innerHTML += createProductHTML(product);
//     });
//
//     const categoryItems = document.querySelectorAll('.product-categories li');
//     categoryItems.forEach((item) => {
//         const link = item.querySelector('a');
//         if (link && link.textContent.trim() === getCategoryName(selectedCategory)) {
//             item.classList.add('active');
//         } else {
//             item.classList.remove('active');
//         }
//     });
//
//     localStorage.removeItem('selectedCategory');
//     localStorage.removeItem('selectedOtherData');
// });
//





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
    window.location.href = 'detailProduct.jsp';
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
        { image: '../image/imghomepage/product/product_danhmuc/1.webp', id: 'DU311', name: 'Panna cotta', price: '55.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/8.webp', id: 'GC703', name: 'Gato cup Matcha', price: '55.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/9.webp', id: 'TO1502', name: 'Matchamisu', price: '55.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/10.webp', id: 'VB103', name: 'Mousse Việt Quất Sữa Chua', price: '55.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/3.webp', id: 'SH612', name: 'Su dẻo Phô mai', price: '65.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/4.webp', id: 'VB104', name: 'Mousse Dâu Sữa Chua', price: '55.000₫', link: '#' },
    

    ],
'banh_cac_ngay_le': [
    { image: '../image/imghomepage/product/product_danhmuc/1.webp', id: 'A1B23', name: 'Bánh Lễ Tình Nhân', price: '350.000₫', link: '#' },
    { image: '../image/imghomepage/product/product_danhmuc/2.webp', id: 'X2Y10', name: 'Bánh Giáng Sinh', price: '450.000₫', link: '#' },
    { image: '../image/imghomepage/product/product_danhmuc/4.webp', id: 'Z7K41', name: 'Bánh Tết Nguyên Đán', price: '600.000₫', link: '#' },
    { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_bento/BBT01.png', id: 'M9J56', name: 'Lễ Phục Sinh', price: '500.000₫', link: '#' },
    { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_bento/BBT02.png', id: 'Q2W78', name: 'Lễ Tạ Ơn', price: '550.000₫', link: '#' },
    { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_bento/BBT03.png', id: 'J3K74', name: 'Ngày Quốc Khánh', price: '480.000₫', link: '#' },
    { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_bento/BBT04.png', id: 'B9L83', name: 'Bánh Sinh Nhật Ngày Phụ Nữ Việt Nam', price: '400.000₫', link: '#' },
    { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_bento/BBT05.png', id: 'E6P39', name: 'Bánh Sinh Nhật Lễ Quốc Tế Phụ Nữ', price: '450.000₫', link: '#' },
    { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_bento/BBT06.png', id: 'N8C29', name: 'Bánh Sinh Nhật Ngày Halloween', price: '700.000₫', link: '#' },
    { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_bento/BBT07.png', id: 'L1M68', name: 'Bánh Sinh Nhật Ngày Phụ Nữ Quốc Tế', price: '650.000₫', link: '#' },
    { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_bento/BBT08.png', id: 'V4F27', name: 'Bánh Sinh Nhật Tết Trung Thu', price: '380.000₫', link: '#' },
    { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_bento/BBT09.png', id: 'S5Z38', name: 'Bánh Sinh Nhật Ngày Sinh Nhật', price: '800.000₫', link: '#' }
],

    'banh_chai_ruou': [
        { image: '../image/imghomepage/khachhang3.jpg', id: 'Mousse', name: 'Bánh Mousse', price: '80.000₫', link: '#' },
        { image: '../image/imghomepage/khachhang4.jpg', id: 'Socola', name: 'Bánh Socola', price: '90.000₫', link: '#' }

    ],
    'banh_mau': [
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_in_3D/BI01.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_in_3D/BI02.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_in_3D/BI03.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_in_3D/BI04.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_in_3D/BI05.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_in_3D/BI06.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_in_3D/BI07.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_in_3D/BI08.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_in_3D/BI09.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_in_3D/BI10.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
    ],
    'banh_mau_trai': [
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_trai/BT01.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_trai/BT02.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_trai/BT03.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_trai/BT04.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_trai/BT05.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_trai/BT06.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_trai/BT07.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_trai/BT08.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_trai/BT09.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_trai/BT10.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
    ],
    'banh_mau_gai': [
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_gai/BG01.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_gai/BG02.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_gai/BG03.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_gai/BG04.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_gai/BG05.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_gai/BG06.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_gai/BG07.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_gai/BG08.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_gai/BG09.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/mau_be_gai/BG10.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
     ],
    'banh_hien_dai': [
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/hien_dai_sang_trong/HD01.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/hien_dai_sang_trong/HD02.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/hien_dai_sang_trong/HD03.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/hien_dai_sang_trong/HD04.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/hien_dai_sang_trong/HD05.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/hien_dai_sang_trong/HD06.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/hien_dai_sang_trong/HD07.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/hien_dai_sang_trong/HD08.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/hien_dai_sang_trong/HD09.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/hien_dai_sang_trong/HD10.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
 
    ],
    'banh_man': [
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_man/BM01.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_man/BM02.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_man/BM08.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_man/BM04.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_man/BM05.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_man/BM06.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_man/BM07.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_man/BM08.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_man/BM09.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_man/BM10.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
 
    ],
    'banh_hoa': [
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH01.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH02.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH03.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH04.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH05.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH06.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH07.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH08.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH09.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH10.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH11.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH12.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH13.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH14.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH15.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH16.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH17.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH18.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH19.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },
        { image: '../image/imghomepage/product/product_danhmuc/theo_danh_muc/banh_hoa/BH20.png', id: 'BTL12', name: 'Bánh sinh nhật Su Sing Hoa Quả sz14', price: '1.180.000₫', link: '#' },


    ]
};

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


