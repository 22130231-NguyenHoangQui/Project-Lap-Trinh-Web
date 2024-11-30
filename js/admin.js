// đường dẫn hiện ở dưới header
document.addEventListener("DOMContentLoaded", function () {
    var isMediumDiv = document.querySelector('.is-medium .container');
    var path = window.location.pathname.split('/').filter(function (part) { return part !== '' && part !== 'pages'; });

    var breadcrumbHtml = '<a href="../pages/homepage.html">Trang Chủ</a>';
    var urlPath = '/';

    path.forEach(function (part, index) {
        urlPath += part + '/';
        if (index === path.length - 1 && part === 'ManageAdmin.html') {
            breadcrumbHtml += ' <span class="divider">/</span> <a href="' + urlPath + '">Quản Lý</a>';
        } else {
            breadcrumbHtml += ' <span class="divider">/</span> <a href="' + urlPath + '">' + part.replace(/-/g, ' ') + '</a>';
        }
    });

    isMediumDiv.innerHTML = breadcrumbHtml;
});

// khởi tạo các biến để click side bar
const dashboardLink = document.getElementById('dashboardLink');
const ordersLink = document.getElementById('ordersLink');
const productsLink = document.getElementById('productsLink');
const customersLink = document.getElementById('customersLink');
const catalogsLink = document.getElementById('catalogsLink');
const contentDiv = document.getElementById('content');


// click để hiện thị tương ứng
dashboardLink.addEventListener('click', function (e) {
    e.preventDefault();
    changeContent('Dashboard', null);
    document.getElementById('myChart').style.display = 'block';
});


ordersLink.addEventListener('click', function (e) {
    e.preventDefault();
    displayOrders(1);
    document.getElementById('myChart').style.display = 'none';
});

productsLink.addEventListener('click', function (e) {
    e.preventDefault();
    displayProducts(1);
    document.getElementById('myChart').style.display = 'none';

});

customersLink.addEventListener('click', function (e) {
    e.preventDefault();
    displayCustomers(1);
    document.getElementById('myChart').style.display = 'none';
});

catalogsLink.addEventListener('click', function (e) {
    e.preventDefault();
    displayCataLogs(1);
    document.getElementById('myChart').style.display = 'none';
});

// khi load trang thì sẽ hiện ra trang này
document.addEventListener('DOMContentLoaded', function () {
    const dashboardLink = document.getElementById('dashboardLink');
    dashboardLink.classList.add('active');

    const links = document.querySelectorAll('.nav-link');

    links.forEach(link => {
        link.addEventListener('click', function () {
            links.forEach(l => l.classList.remove('active'));

            this.classList.add('active');
        });
    });
});


// tải canvas và log ra để test xem có tải được không
window.addEventListener('DOMContentLoaded', (event) => {
    console.log("DOM đã tải xong!");

    const ctx = document.getElementById('myChart').getContext('2d');
    if (ctx) {
        console.log("Canvas đã được tìm thấy!");
    } else {
        console.error("Canvas không được tìm thấy!");
    }

    try {
        const myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                datasets: [{
                    label: '# of Votes',
                    data: [12, 19, 3, 5, 2, 3],
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        enabled: true
                    }
                }
            }
        });
        console.log("Biểu đồ đã được khởi tạo!");
    } catch (error) {
        console.error("Có lỗi khi tạo biểu đồ:", error);
    }
});


// thay đổi content
function changeContent(title, content, buttonConfigs = []) {
    contentTitle.style.display = 'block';
    contentTitle.innerHTML = title;

    contentDiv.innerHTML = content;

    const buttonContainer = document.querySelector('.btn-toolbar .me-2');
    buttonContainer.innerHTML = '';

    buttonConfigs.forEach(config => {
        const button = document.createElement('button');
        button.type = 'button';
        button.className = 'btn btn-sm btn-outline-secondary';
        button.innerHTML = `<i class="${config.icon}"></i>`;

        if (config.action) {
            button.addEventListener('click', config.action);
        }

        buttonContainer.appendChild(button);
    });
    const hiden = document.getElementById('contentDiv');
    hiden.style.display = 'none';

}

// hàm thay đổi content hóa đơn 
/* các biến để thay đổi  :
    tiêu đề : contentTitle
    thêm bộ lọc hóa đơn theo ngày : contentDiv
    nội dung với danh sách ở trong : content        
    icon để thêm sản phẩm, khách hàng ,..( có thể không thêm gì nếu đó là hóa đơn,
    ...)


    style.display: block để hiện lên các phần tử còn mặc định là none để ẩn
    innerHTML = [title,button,...]
        
        
        */
function changeContentOrders(title, content, buttonConfigs = []) {
    const contentTitle = document.getElementById('contentTitle');
    const contentDiv = document.getElementById('contentDiv');
    const contentContainer = document.getElementById('content');
    const buttonContainer = document.querySelector('.btn-toolbar .me-2');

    // Cập nhật tiêu đề , content , nút button 
    contentTitle.style.display = 'block';
    contentTitle.innerHTML = title;
    contentContainer.innerHTML = content;
    buttonContainer.innerHTML = '';

    buttonConfigs.forEach(config => {
        const button = document.createElement('button');
        button.type = 'button';
        button.className = 'btn btn-sm btn-outline-secondary';
        button.innerHTML = `<i class="${config.icon}"></i>`;

        if (config.action) {
            button.addEventListener('click', config.action);
        }

        buttonContainer.appendChild(button);
    });

    /*hàm filterDateDiv tạo ra để chứa bộ lọc của hóa đơn
        class là div class="filter-date mt-3" và bên trong là phần inner HTML ở dưới  */
    const filterDateDiv = document.createElement('div');
    filterDateDiv.className = 'filter-date mt-3';
    filterDateDiv.innerHTML = `
        <div class="row filter-date123" id="contentDATE">
          
            <div class="col-lg-6">
                <label for="statusFilter">Chọn trạng thái:</label>
                <select class="form-select" id="statusSelect">
                    <option value="">Chọn trạng thái</option>
                    <option value="pending">Chờ xử lý</option>
                    <option value="completed">Hoàn thành</option>
                    <option value="cancelled">Đã hủy</option>
                </select>
            </div>
              <div class="col-lg-6">
                <label for="dateFilter">Chọn ngày:</label>
                <div class="d-flex">
                <input type="date" id="dateFilter" class="form-control">
                <button type="button" class="btn btn-primary" id="filterButton" onclick="filterByDate()" style="margin-left: 5px;">Lọc</button>
            </div>

                </div>
        </div>
    `;

    contentDiv.innerHTML = '';
    const hiden = document.getElementById('contentDiv');
    hiden.style.display = 'block';
    contentDiv.appendChild(filterDateDiv);
}

/* các hàm hiện thị danh mục, khách hàng, sản phẩm,... khi click
display*(page) -> để hiện trang số mấy để hiện thì
// hiện thị danh mục
// hiện thị hóa đơn
// hiện thị người dùng
// hiện thị sản phẩm

*/
function displayCataLogs(page) {
    const catalogsPerPage = 10;
    const startIndex = (page - 1) * catalogsPerPage;
    const endIndex = page * catalogsPerPage;
    const paginatedCataLogs = catalogs.slice(startIndex, endIndex);
    console.log("123");

    let tableHTML = `
        <table class="table table2">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>ID</th>
                    <th>TÊN</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
    `;

    paginatedCataLogs.forEach((catalog, index) => {
        tableHTML += `
            <tr>
                 <td class="cate1">${startIndex + index + 1}</td>
                <td class="cate1">${catalog.id}</td>
                <td class="cate1">${catalog.name}</td>
                <td>
                  <button class="icon-button" onclick="deleteRowCate(this)">
                  <i class="fa-solid fa-trash"></i>
                </button>
                 <button class="icon-button" onclick="openEditFormCate(this)">
                    <i class="fa-solid fa-pen"></i>
                </button>
              
                </td>
            </tr>
        `;
    });

    tableHTML += `</tbody></table>`;

    let paginationHTML = '<nav><ul class="pagination justify-content-center">';

    const totalPages = Math.ceil(catalogs.length / catalogsPerPage);
    for (let i = 1; i <= totalPages; i++) {
        paginationHTML += `
            <li class="page-item ${i === page ? 'active' : ''}">
                <a class="page-link" href="#" onclick="changePage(${i})">${i}</a>
            </li>
        `;
    }

    paginationHTML += '</ul></nav>';

    changeContent('Danh mục', tableHTML + paginationHTML, [
        { icon: 'fa-solid fa-gear', action: openFormCate }
    ]);
}

function displayOrders(page) {
    const ordersPerPage = 10;
    const startIndex = (page - 1) * ordersPerPage;
    const endIndex = page * ordersPerPage;
    const paginatedOrders = orders.slice(startIndex, endIndex);

    let tableHTML = `
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Order Name</th>
                    <th>Customer</th>
                    <th>Order Date</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
    `;

    paginatedOrders.forEach(order => {
        tableHTML += `
            <tr>
                <td>${order.id}</td>
                <td>${order.name}</td>
                <td>${order.customer}</td>
                <td>${order.date}</td>
                <td>${order.price}</td>
            </tr>
        `;
    });

    tableHTML += `</tbody></table>`;

    let paginationHTML = '<nav><ul class="pagination justify-content-center">';

    const totalPages = Math.ceil(orders.length / ordersPerPage);
    for (let i = 1; i <= totalPages; i++) {
        paginationHTML += `
            <li class="page-item ${i === page ? 'active' : ''}">
                <a class="page-link" href="#" onclick="changePage(${i})">${i}</a>
            </li>
        `;
    }

    paginationHTML += '</ul></nav>';

    changeContentOrders('Hóa đơn', tableHTML + paginationHTML, [
    ]);


}


function displayCustomers(page) {
    const customersPerPage = 10;
    const startIndex = (page - 1) * customersPerPage;
    const endIndex = page * customersPerPage;
    const paginatedCustomers = customers.slice(startIndex, endIndex);

    let tableHTML = `
        <table class="table">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>HỌ TÊN</th>
                    <th>SĐT</th>
                    <th>EMAIL</th>
                    <th>CHỨC VỤ</th>
                    <th>XÁC THỰC</th>
                    <th>TRẠNG THÁI</th>
                    <th>
                        
                    </th>
                </tr>
            </thead>
            <tbody>
    `;

    paginatedCustomers.forEach(customer => {
        tableHTML += `
            <tr>
                <td>${customer.id}</td>
                <td>${customer.name}</td>
                <td>${customer.phone}</td>
                <td>${customer.email}</td>
                <td>${customer.position}</td>
                <td>${customer.isVerified}</td>
                <td id="status-${customer.id}">${customer.status}</td>
              <td>
                <button class="icon-button" onclick="openFormAddCustomer(this)">
                    <i class="fa-solid fa-pen"></i>
                </button>
                <button class="icon-button" onclick="toggleStatus(this)">
                    <i class="fa-solid fa-lock"></i>
                </button>
            </td>


            </tr>
        `;
    });

    tableHTML += `</tbody></table>`;

    let paginationHTML = '<nav><ul class="pagination justify-content-center">';

    const totalPages = Math.ceil(customers.length / customersPerPage);
    for (let i = 1; i <= totalPages; i++) {
        paginationHTML += `
            <li class="page-item ${i === page ? 'active' : ''}">
                <a class="page-link" href="#" onclick="changePageCustomers(${i})">${i}</a>
            </li>
        `;
    }

    paginationHTML += '</ul></nav>';

    changeContent('Quản lý tài khoản', tableHTML + paginationHTML, [
        { icon: 'fa-solid fa-gear', action: openFormCustomerSetting }
    ]);

}

function displayProducts(page) {
    const productsPerPage = 10;
    const startIndex = (page - 1) * productsPerPage;
    const endIndex = page * productsPerPage;
    const paginatedProducts = products.slice(startIndex, endIndex);

    let tableHTML = `
        <table class="table table1">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>SẢN PHẨM</th>
                    <th>GIÁ BÁN</th>
                    <th>CHI TIẾT</th>
                    <th>TRẠNG THÁI</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
    `;

    paginatedProducts.forEach(product => {
        tableHTML += `
            <tr>
                <td class="pro">${product.id}</td>
              <td class="pro">
                    <img src="${product.image}" alt="Product Image" style="width: 50px; height: 50px; object-fit: cover; margin-right: 10px;">
                    <span class="product-name">${product.name}</span>
                </td>

                <td class="pro">${product.price}</td>
                <td class="pro">${product.detail}</td>
                <td  id="status-${product.id}">${product.status}</td>
                <td>

                <button class="icon-button" onclick="deleteRow(this)">
                  <i class="fa-solid fa-trash"></i>
                </button>


                 <button class="icon-button" onclick="openEditFormProduct(this)">
                    <i class="fa-solid fa-pen"></i>
                </button>
                <button class="icon-button" onclick="toggleStatusProduct(this)">
                    <i class="fa-solid fa-lock"></i>
                </button>   
                </td>
                </tr>
        `;
        console.log(product);
    });


    tableHTML += `</tbody></table>`;

    let paginationHTML = '<nav><ul class="pagination justify-content-center">';

    const totalPages = Math.ceil(products.length / productsPerPage);
    for (let i = 1; i <= totalPages; i++) {
        paginationHTML += `
            <li class="page-item ${i === page ? 'active' : ''}">
                <a class="page-link" href="#" onclick="changePageProducts(${i})">${i}</a>
            </li>
        `;
    }

    paginationHTML += '</ul></nav>';

    changeContent('Sản phẩm', tableHTML + paginationHTML, [
        { icon: 'fa-solid fa-gear', action: openFormAddProduct }
    ]);
}


/**
// CÁC SỰ KIỆN TRONG  QUẢN LÝ TÀI KHOẢN 
 * thêm khách hàng  
 * 
 */
function openFormAddCustomer() {
    const formContainer = document.getElementById('formContainer');
    const overlay = document.getElementById('overlay');

    formContainer.style.display = 'block';
    overlay.style.display = 'block';

    overlay.addEventListener('click', closeFormAddCustomer);
}

// thay đổi thông tin

function closeFormAddCustomer() {
    const formContainer = document.getElementById('formContainer');
    formContainer.style.display = 'none';
    overlay.style.display = 'none';
}

function openFormCustomerSetting(button) {
    const row = button.closest("tr");
    const columns = row.querySelectorAll("td");


    const stt = columns[0].textContent;
    const name = columns[1].textContent;
    const phone = columns[2].textContent;
    const email = columns[3].textContent;
    const address = columns[4].textContent;
    const password = columns[4].textContent;



    document.getElementById("fname").value = name;
    document.getElementById("email").value = email;
    document.getElementById("sdt").value = phone;

    document.getElementById("saveButton").onclick = function () {
        saveChanges(row);
    };


    document.getElementById("editFormContainer").style.display = "block";
    document.getElementById("overlay").style.display = "block";
}
function closeForm() {
    document.getElementById("editFormContainer").style.display = "none";
    document.getElementById("overlay").style.display = "none";
}

function saveChanges(row) {
    const name = document.getElementById("fname").value;
    const email = document.getElementById("email").value;
    const phone = document.getElementById("sdt").value;
    const address = document.getElementById("address").value;

    row.querySelector("td:nth-child(2)").textContent = name;
    row.querySelector("td:nth-child(3)").textContent = phone;
    row.querySelector("td:nth-child(4)").textContent = email;
    row.querySelector("td:nth-child(5)").textContent = address;


    closeForm();
}



// khóa hoặc mở tài khoản
function toggleStatus(button) {
    // Lấy dòng của customer từ button
    const row = button.closest('tr'); // Tìm đến hàng chứa button
    const statusCell = row.querySelector('td[id^="status-"]'); // Lấy cột status (dựa trên id)

    // Kiểm tra và thay đổi nội dung status
    if (statusCell.textContent === "Active") {
        statusCell.textContent = "Inactive";
    } else {
        statusCell.textContent = "Active";
    }

    // Thay đổi icon trong nút
    const icon = button.querySelector('i');
    if (statusCell.textContent === "Active") {
        icon.classList.remove('fa-lock');
        icon.classList.add('fa-unlock');
    } else {
        icon.classList.remove('fa-unlock');
        icon.classList.add('fa-lock');
    }
}


// CÁC SỰ KIỆN TRONG QUẢN LÝ SẢN PHẨM
function openFormAddProduct() {
    const formProduct = document.getElementById('formProduct');
    const overlay = document.getElementById('overlay');

    formProduct.style.display = 'block'
    overlay.style.display = 'block'
    console.log(123);

    overlay.addEventListener('click', closeFormAddProduct);
    console.log(123);

}

function closeFormAddProduct() {
    const formProduct = document.getElementById('formProduct');
    console.log(123);

    formProduct.style.display = 'none';
    overlay.style.display = 'none';
    console.log(123);

}

function toggleStatusProduct(button) {
    // Lấy dòng của customer từ button
    const row = button.closest('tr'); // Tìm đến hàng chứa button
    const statusCell = row.querySelector('td[id^="status-"]'); // Lấy cột status (dựa trên id)

    // Kiểm tra và thay đổi nội dung status
    if (statusCell.textContent === "Đang bán") {
        statusCell.textContent = "KHÔNG BÁN";
    } else {
        statusCell.textContent = "Đang bán";
    }

    // Thay đổi icon trong nút
    const icon = button.querySelector('i');
    if (statusCell.textContent === "Đang bán") {
        icon.classList.remove('fa-lock');
        icon.classList.add('fa-unlock');
    } else {
        icon.classList.remove('fa-unlock');
        icon.classList.add('fa-lock');
    }
}

function openEditFormProduct(button) {
    const row = button.closest("tr");
    const columns = row.querySelectorAll(".pro");


    const name = columns[1].textContent.trim();
    const price = columns[2].textContent;
    const detail = columns[3].textContent;
    const imageElement = columns[1].querySelector("img"); // Tìm thẻ <img> trong cột thứ 2
    const imageSrc = imageElement ? imageElement.src : ""; // Đường dẫn ảnh (src)


    document.getElementById("editProductName").value = name;
    document.getElementById("editPrice").value = price;
    document.getElementById("editDetail").value = detail;
    const previewImage = document.getElementById("editImagePreview");
    const previewImage1 = document.getElementById("editImagePreview1");

    if (previewImage) {
        previewImage.src = imageSrc;
        previewImage1.src = "../image/imghomepage/product/product_danhmuc/1.webp";
    }
    document.getElementById("saveButton1").onclick = function () {
        saveChangesProduct(row);
    };

    document.getElementById("editFormProduct").style.display = "block";
    document.getElementById("overlay").style.display = "block";

}
function saveChangesProduct(row) {
    const name = document.getElementById("editProductName").value;

    const detail = document.getElementById("editDetail").value;
    const price = document.getElementById("editPrice").value;
    // const previewImage = document.getElementById("editImagePreview");

    row.querySelector("td.pro:nth-child(2) .product-name").textContent = name;
    row.querySelector("td.pro:nth-child(3)").textContent = price;
    row.querySelector("td.pro:nth-child(4)").textContent = detail;

    closeFormProductEdit();

}
function deleteRow(button) {
    const row = button.closest("tr");

    // Xác nhận trước khi xóa
    const confirmDelete = confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?");
    if (confirmDelete) {
        // Xóa hàng khỏi bảng
        row.remove();
        alert("Sản phẩm đã được xóa thành công.");
    }
}
// CÁC SỰ KIỆN TRONG DANH MỤC


function openFormCate() {
    const formProduct = document.getElementById('editFormCate');
    const overlay = document.getElementById('overlay');

    formProduct.style.display = 'block'
    overlay.style.display = 'block'

    overlay.addEventListener('click', closeFormCate);
}



document.getElementById("overlay").addEventListener("click", closeForm);


function closeFormCate() {
    const formProduct = document.getElementById('editFormCate');
    formProduct.style.display = 'none';
    overlay.style.display = 'none';
}

function deleteRowCate(button) {
    const row = button.closest("tr");

    // Xác nhận trước khi xóa
    const confirmDelete = confirm("Bạn có chắc chắn muốn xóa danh mục này không?");
    if (confirmDelete) {
        // Xóa hàng khỏi bảng
        row.remove();
        alert("Danh mục đã được xóa thành công.");
    }
}

function openEditFormCate(button) {
    const row = button.closest("tr");
    const columns = row.querySelectorAll(".cate1");


    const name = columns[2].textContent.trim();



    document.getElementById("editCateName1").value = name;


    document.getElementById("saveButtonCate").onclick = function () {
        saveChangesCate(row);
    };

    document.getElementById("editFormCate").style.display = "block";
    document.getElementById("overlay").style.display = "block";

}

function saveChangesCate(row) {
    const name = document.getElementById("editCateName1").value;


    row.querySelector("td.pro:nth-child(2) .cate-name").textContent = name;

    console.log(213);
    
    closeFormCate();

}


// Dữ liệu mẫu
const orders = [
    { id: 1, name: "Chocolate Cake", customer: "Alice", date: "2024-10-10", price: "$25" },
    { id: 2, name: "Vanilla Cake", customer: "Bob", date: "2024-10-12", price: "$20" },
    { id: 3, name: "Strawberry Cake", customer: "Charlie", date: "2024-10-13", price: "$30" },
    { id: 4, name: "Red Velvet Cake", customer: "David", date: "2024-10-14", price: "$40" },
    { id: 5, name: "Lemon Cake", customer: "Eva", date: "2024-10-15", price: "$22" },
    { id: 6, name: "Carrot Cake", customer: "Frank", date: "2024-10-16", price: "$28" },
    { id: 7, name: "Black Forest Cake", customer: "Grace", date: "2024-10-17", price: "$35" },
    { id: 8, name: "Coffee Cake", customer: "Hank", date: "2024-10-18", price: "$27" },
    { id: 9, name: "Banana Cake", customer: "Ivy", date: "2024-10-19", price: "$24" },
    { id: 10, name: "Chiffon Cake", customer: "Jack", date: "2024-10-20", price: "$26" },
    { id: 11, name: "Mango Cake", customer: "Kate", date: "2024-10-21", price: "$33" },
    { id: 12, name: "Coconut Cake", customer: "Liam", date: "2024-10-22", price: "$29" },
    { id: 13, name: "Peach Cake", customer: "Mona", date: "2024-10-23", price: "$32" },
    { id: 14, name: "Pumpkin Cake", customer: "Nina", date: "2024-10-24", price: "$34" },
    { id: 15, name: "Raspberry Cake", customer: "Oscar", date: "2024-10-25", price: "$37" }
];
const customers = [
    {
        id: 1,
        name: "Alice",
        email: "alice@example.com",
        phone: "123-456-7890",
        address: "123 Cherry Lane",
        position: "Admin",
        isVerified: true,
        isActive: true,
        status: "Active"
    },
    {
        id: 2,
        name: "Bob",
        email: "bob@example.com",
        phone: "234-567-8901",
        address: "456 Maple Street",
        position: "User",
        isVerified: true,
        isActive: false,
        status: "Inactive"
    },
    {
        id: 3,
        name: "Charlie",
        email: "charlie@example.com",
        phone: "345-678-9012",
        address: "789 Oak Road",
        position: "Moderator",
        isVerified: false,
        isActive: true,
        status: "Active"
    },
    {
        id: 4,
        name: "David",
        email: "david@example.com",
        phone: "456-789-0123",
        address: "101 Pine Avenue",
        position: "User",
        isVerified: true,
        isActive: true,
        status: "Active"
    },
    {
        id: 5,
        name: "Eva",
        email: "eva@example.com",
        phone: "567-890-1234",
        address: "202 Birch Boulevard",
        position: "Admin",
        isVerified: true,
        isActive: false,
        status: "Inactive"
    },
    {
        id: 6,
        name: "Frank",
        email: "frank@example.com",
        phone: "678-901-2345",
        address: "303 Cedar Crescent",
        position: "User",
        isVerified: false,
        isActive: true,
        status: "Active"
    }
];

const products = [
    {
        id: 1,
        image: "../image/imghomepage/product/product_danhmuc/3.webp",
        name: "Bánh Chocolate",
        category: "Bánh",
        price: 25,
        detail: "Bánh chocolate ngọt ngào với lớp kem phủ.",
        status: "Đang bán"
    },
    {
        id: 2,
        image: "../image/imghomepage/product/product_danhmuc/1.webp",
        name: "Bánh Vanilla",
        category: "Bánh",
        price: 20,
        detail: "Bánh bông lan vanilla nhẹ nhàng.",
        status: "Đang bán"
    },
    {
        id: 3,
        image: "../image/imghomepage/product/product_danhmuc/2.webp",
        name: "Bánh Dâu Tây",
        category: "Bánh",
        price: 30,
        detail: "Bánh dâu tây tươi ngon với những trái dâu chín.",
        status: "Đang bán"
    },
    {
        id: 4,
        image: "../image/imghomepage/product/product_danhmuc/4.webp",
        name: "Bánh Red Velvet",
        category: "Bánh",
        price: 40,
        detail: "Bánh Red Velvet mềm mịn, phủ kem phô mai.",
        status: "Đang bán"
    },
    {
        id: 5,
        image: "../image/imghomepage/product/product_danhmuc/5.webp",
        name: "Bánh Chanh",
        category: "Bánh",
        price: 22,
        detail: "Bánh chanh tươi mát với lớp glaze ngọt ngào.",
        status: "Đang bán"
    },
    {
        id: 6,
        image: "../image/imghomepage/product/product_danhmuc/6.webp",
        name: "Bánh Carrot",
        category: "Bánh",
        price: 28,
        detail: "Bánh cà rốt với hạt óc chó và lớp kem phô mai.",
        status: "Đang bán"
    },
    {
        id: 7,
        image: "../image/imghomepage/product/product_danhmuc/7.webp",
        name: "Bánh Chanh",
        category: "Bánh",
        price: 22,
        detail: "Bánh chanh tươi mát với lớp glaze ngọt ngào.",
        status: "Đang bán"
    },
    {
        id: 8,
        image: "../image/imghomepage/product/product_danhmuc/8.webp",
        name: "Bánh Chanh",
        category: "Bánh",
        price: 22,
        detail: "Bánh chanh tươi mát với lớp glaze ngọt ngào.",
        status: "Đang bán"
    },
    {
        id: 9,
        image: "../image/imghomepage/product/product_danhmuc/9.webp",
        name: "Bánh Chanh",
        category: "Bánh",
        price: 22,
        detail: "Bánh chanh tươi mát với lớp glaze ngọt ngào.",
        status: "Đang bán"
    },
    {
        id: 10,
        image: "../image/imghomepage/product/product_danhmuc/10.webp",
        name: "Bánh Chanh",
        category: "Bánh",
        price: 22,
        detail: "Bánh chanh tươi mát với lớp glaze ngọt ngào.",
        status: "Đang bán"
    }
];

const catalogs = [
    { id: 1, name: "Bánh Sinh Nhật Truyền Thống" },
    { id: 2, name: "Bánh Sinh Nhật Dâu Tây" },
    { id: 3, name: "Bánh Sinh Nhật Socola" },
    { id: 4, name: "Bánh Sinh Nhật Phô Mai" },
    { id: 5, name: "Bánh Sinh Nhật Trái Cây" },
    { id: 6, name: "Bánh Sinh Nhật Kèm Kem" },
    { id: 7, name: "Bánh Sinh Nhật Caramel" },
    { id: 8, name: "Bánh Sinh Nhật Red Velvet" },
    { id: 9, name: "Bánh Sinh Nhật Matcha" },
    { id: 10, name: "Bánh Sinh Nhật Hoa Quả" },
    { id: 11, name: "Bánh Sinh Nhật Bơ Sữa" },
    { id: 12, name: "Bánh Sinh Nhật Chocolate" },
    { id: 13, name: "Bánh Sinh Nhật Mousse" },
    { id: 14, name: "Bánh Sinh Nhật Gelato" },
    { id: 15, name: "Bánh Sinh Nhật Hồng Sâm" }
];
