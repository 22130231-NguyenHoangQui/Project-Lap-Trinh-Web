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
const discount = document.getElementById('discountLink');


// click để hiện thị tương ứng
dashboardLink.addEventListener('click', function (e) {
    e.preventDefault();
    changeContent('Tổng Quan', null);
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

discount.addEventListener('click', function (e) {
    e.preventDefault();
    displayDiscount(1);
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
// Đoạn HTML bạn muốn chèn vào
var htmlContent = `
  <div class="container mt-5" style="width: auto;">
    <div class="row text-center mb-4">
  <div class="col-md-3">
    <div class="card shadow-sm">
      <div class="card-body">
        <h5 class="card-title">Đơn hàng hôm nay</h5>
        <p id="orders-today" class="card-text text-primary fs-4">0</p>
      </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="card shadow-sm">
      <div class="card-body">
        <h5 class="card-title">Doanh thu hôm nay</h5>
        <p id="revenue-today" class="card-text text-success fs-4">0 VND</p>
      </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="card shadow-sm">
      <div class="card-body">
        <h5 class="card-title">Sản phẩm bán được</h5>
        <p id="products-sold" class="card-text text-info fs-4">0</p>
      </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="card shadow-sm">
      <div class="card-body">
        <h5 class="card-title">Tổng doanh thu tháng</h5>
        <p id="monthly-revenue" class="card-text text-warning fs-4">0 VND</p>
      </div>
    </div>
  </div>
</div>


   <div class="row">
  <div class="col-md-12">
    <div class="card shadow">
      <div class="card-header bg-primary text-white text-center">
        <h5>Khách hàng có lượng mua cao nhất</h5>
      </div>
      <div class="card-body">
        <!-- Bảng hiển thị khách hàng -->
        <table class="table table-striped table-bordered">
          <thead>
            <tr>
              <th>STT</th>
              <th>Họ và Tên</th>
              <th>Email</th>
              <th>Số điện thoại</th>
              <th>Lượng mua (sản phẩm)</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>Nguyễn Văn A</td>
              <td>nguyenvana@example.com</td>
              <td>0901234567</td>
              <td>50</td>
            </tr>
            <tr>
              <td>2</td>
              <td>Trần Thị B</td>
              <td>tranthib@example.com</td>
              <td>0902345678</td>
              <td>45</td>
            </tr>
            <tr>
              <td>3</td>
              <td>Phan Quang C</td>
              <td>phanquangc@example.com</td>
              <td>0903456789</td>
              <td>40</td>
            </tr>
            <tr>
              <td>4</td>
              <td>Lê Minh D</td>
              <td>leminhd@example.com</td>
              <td>0904567890</td>
              <td>30</td>
            </tr>
            <tr>
              <td>5</td>
              <td>Vũ Đức E</td>
              <td>vuduce@example.com</td>
              <td>0905678901</td>
              <td>25</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</div>
`;

// Tải nội dung HTML vào div với id="myChart"
document.getElementById("myChart").innerHTML = htmlContent;



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
                    <th>Status</th>
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
                <td>${order.status}</td>
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
                <button class="icon-button" onclick="openFormCustomerSetting(this)">
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
        { icon: 'fa-solid fa-gear', action: openFormAddCustomer }
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

function displayDiscount(page) {
    const discountsPerPage = 10; // Số lượng giảm giá mỗi trang
    const startIndex = (page - 1) * discountsPerPage;
    const endIndex = page * discountsPerPage;
    const paginatedDiscounts = discounts.slice(startIndex, endIndex); // Giả sử 'discounts' là danh sách các giảm giá

    let tableHTML = `
        <table class="table tableDiscount">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>SẢN PHẨM</th>
                    <th>GIẢM GIÁ</th>
                    <th>CHI TIẾT</th>
                    <th>TRẠNG THÁI</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
    `;

    paginatedDiscounts.forEach(discount => {
        tableHTML += `
            <tr>
                <td class="dis">${discount.id}</td>
                <td class="dis">
                    <img src="${discount.productImage}" alt="Product Image" style="width: 50px; height: 50px; object-fit: cover; margin-right: 10px;">
                    <span class="product-name">${discount.productName}</span>
                </td>
                <td class="dis">${discount.discountPrice}%</td>
                <td class="dis">${discount.detail}</td>
                <td id="status-${discount.id}">${discount.status}</td>
                <td>
                    <button class="icon-button" onclick="deleteRowDiscount(this)">
                        <i class="fa-solid fa-trash"></i>
                    </button>
                    <button class="icon-button" onclick="openEditDiscountForm(this)">
                        <i class="fa-solid fa-pen"></i>
                    </button>
                </td>
            </tr>
        `;
    });

    tableHTML += `</tbody></table>`;

    let paginationHTML = '<nav><ul class="pagination justify-content-center">';

    const totalPages = Math.ceil(discounts.length / discountsPerPage);
    for (let i = 1; i <= totalPages; i++) {
        paginationHTML += `
            <li class="page-item ${i === page ? 'active' : ''}">
                <a class="page-link" href="#" onclick="changePageDiscounts(${i})">${i}</a>
            </li>
        `;
    }

    paginationHTML += '</ul></nav>';

    // Giả sử changeContent() sẽ thay thế nội dung trong trang với bảng và phân trang.
    changeContent('Giảm giá sản phẩm', tableHTML + paginationHTML, [
        { icon: 'fa-solid fa-gear', action: openEditFormCate }
    ]);
}



/**
// CÁC SỰ KIỆN TRONG  QUẢN LÝ TÀI KHOẢN 
 * thêm khách hàng
 * đóng form thêm khách hàng
 * thay đổi thông tin
 * đóng form thay đổi thông tin
 * lưu thay đổi vô cột
 * khóa hoặc mở tài khoản với icon  
 */
function openFormAddCustomer() {
    const formContainer = document.getElementById('formContainer');
    const overlay = document.getElementById('overlay');

    formContainer.style.display = 'block';
    overlay.style.display = 'block';

    overlay.addEventListener('click', closeFormAddCustomer);
}


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
/**
// thêm sản phẩm( icon nằm cùng dòng với tiêu đề khi click ) 
 * đóng form sản phẩm , khi click ngẫu nhiên vô overlay thì cũng đóng form
* chỉnh sửa sản phẩm khi click vô icon nằm ở table
khóa sản phẩm ,xóa sản phẩm
 */
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
function openEditFormProduct(button) {
    const row = button.closest("tr");
    const columns = row.querySelectorAll(".pro");


    const name = columns[1].textContent.trim();
    const price = columns[2].textContent;
    const detail = columns[3].textContent;
    const imageElement = columns[1].querySelector("img");
    const imageSrc = imageElement ? imageElement.src : "";


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
function closeFormProductEdit() {
    document.getElementById("editFormProduct").style.display = "none";
    document.getElementById("overlay").style.display = "none";
}
function deleteRow(button) {
    const row = button.closest("tr");

    const confirmDelete = confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?");
    if (confirmDelete) {
        row.remove();
        alert("Sản phẩm đã được xóa thành công.");
    }
}
/**
 * hàm ở dưới được gọi khi hiện display product ở trên nằm trong click icon
 * row và statuscell sẽ duyệt tới dòng để lấy id của dòng cùng với status
 * khi click thì sẽ duyệt tới icon để thay đổi class làm thay đổi icon
 */
function toggleStatusProduct(button) {
    const row = button.closest('tr');
    const statusCell = row.querySelector('td[id^="status-"]');
    if (statusCell.textContent === "Đang bán") {
        statusCell.textContent = "KHÔNG BÁN";
    } else {
        statusCell.textContent = "Đang bán";
    }

    const icon = button.querySelector('i');
    if (statusCell.textContent === "Đang bán") {
        icon.classList.remove('fa-lock');
        icon.classList.add('fa-unlock');
    } else {
        icon.classList.remove('fa-unlock');
        icon.classList.add('fa-lock');
    }
}


// CÁC SỰ KIỆN TRONG DANH MỤC
/**
 * form thêm danh mục
 * đóng form danh mục
 * xóa dòng danh mục
 * mở form chỉnh sửa danh mục
 * lưu chỉnh sửa danh mục
 */
function openFormCate() {
    const formProduct = document.getElementById('addFormCate');
    const overlay = document.getElementById('overlay');

    formProduct.style.display = 'block'
    overlay.style.display = 'block'

    overlay.addEventListener('click', closeFormCate);
}
function closeFormCate() {
    const formProduct = document.getElementById('addFormCate');
    formProduct.style.display = 'none';
    overlay.style.display = 'none';
}

function deleteRowCate(button) {
    const row = button.closest("tr");

    const confirmDelete = confirm("Bạn có chắc chắn muốn xóa danh mục này không?");
    if (confirmDelete) {
        row.remove();
        alert("Danh mục đã được xóa thành công.");
    }
}

function openEditFormCate(button) {
    const row = button.closest("tr");
    const columns = row.querySelectorAll(".cate1");


    const name = columns[2].textContent.trim();



    document.getElementById("editCateName1").value = name;


    document.getElementById("saveButtonCate1").onclick = function () {
        console.log(123);

        saveChangesCate(row);
    };

    document.getElementById("editFormCate").style.display = "block";
    document.getElementById("overlay").style.display = "block";

}

function saveChangesCate(row) {
    const name = document.getElementById("editCateName1").value;
    console.log(name);


    row.querySelector("td.cate1:nth-child(3)").textContent = name;

    console.log(213);

    closeFormEditCate();

}
function closeFormEditCate() {
    document.getElementById("editFormCate").style.display = "none";
    document.getElementById("overlay").style.display = "none";
}

/**
 * Quản lý giảm giá
 */
function openEditDiscountForm(button) {
    const row = button.closest("tr");
    const columns = row.querySelectorAll(".dis");


    const name = columns[1].textContent.trim();
    const price = columns[2].textContent;
    const detail = columns[3].textContent;
    const imageElement = columns[1].querySelector("img");
    const imageSrc = imageElement ? imageElement.src : "";



    document.getElementById("editDiscountName").value = name;
    document.getElementById("editOriginalPrice").value = price;
    document.getElementById("editDiscountPrice").value = detail;



    document.getElementById("saveButtonDiscount").onclick = function () {
        console.log(123);

        saveChangesDiscount(row);
    };

    document.getElementById("editDiscount").style.display = "block";
    document.getElementById("overlay").style.display = "block";
}

function saveChangesDiscount(row) {
   
    closeFormEditDiscount();

}

function closeFormEditDiscount() {
    document.getElementById("editDiscount").style.display = "none";
    document.getElementById("overlay").style.display="none";
}



function deleteRowDiscount(button) {
    const row = button.closest("tr");

    const confirmDelete = confirm("Bạn có chắc chắn muốn xóa danh mục này không?");
    if (confirmDelete) {
        row.remove();
        alert("Danh mục đã được xóa thành công.");
    }
}

/**
 * click ngẫu nhiên vô overlay thì ẩn các form
 */

document.getElementById("overlay").addEventListener("click", closeForm);
document.getElementById("overlay").addEventListener("click", closeFormEditCate);
document.getElementById("overlay").addEventListener("click", closeFormProductEdit);
document.getElementById("overlay").addEventListener("click", closeFormEditDiscount);



// Dữ liệu mẫu
const orders = [
    { id: 1, name: "Bánh sinh nhật vị socola", customer: "Alice", date: "2024-10-10", price: "$25", status: "Chờ xử lý" },
    { id: 2, name: "Bánh sinh nhật vị vani", customer: "Bob", date: "2024-10-12", price: "$20", status: "Hoàn thành" },
    { id: 3, name: "Bánh sinh nhật vị dâu", customer: "Charlie", date: "2024-10-13", price: "$30", status: "Đã hủy" },
    { id: 4, name: "Bánh sinh nhật Red Velvet", customer: "David", date: "2024-10-14", price: "$40", status: "Hoàn thành" },
    { id: 5, name: "Bánh sinh nhật vị chanh", customer: "Eva", date: "2024-10-15", price: "$22", status: "Chờ xử lý" },
    { id: 6, name: "Bánh sinh nhật vị cà rốt", customer: "Frank", date: "2024-10-16", price: "$28", status: "Hoàn thành" },
    { id: 7, name: "Bánh sinh nhật rừng đen", customer: "Grace", date: "2024-10-17", price: "$35", status: "Chờ xử lý" },
    { id: 8, name: "Bánh sinh nhật vị cà phê", customer: "Hank", date: "2024-10-18", price: "$27", status: "Đã hủy" },
    { id: 9, name: "Bánh sinh nhật vị chuối", customer: "Ivy", date: "2024-10-19", price: "$24", status: "Hoàn thành" },
    { id: 10, name: "Bánh sinh nhật Chiffon", customer: "Jack", date: "2024-10-20", price: "$26", status: "Chờ xử lý" },
    { id: 11, name: "Bánh sinh nhật vị xoài", customer: "Kate", date: "2024-10-21", price: "$33", status: "Hoàn thành" },
    { id: 12, name: "Bánh sinh nhật vị dừa", customer: "Liam", date: "2024-10-22", price: "$29", status: "Chờ xử lý" },
    { id: 13, name: "Bánh sinh nhật vị đào", customer: "Mona", date: "2024-10-23", price: "$32", status: "Hoàn thành" },
    { id: 14, name: "Bánh sinh nhật vị bí ngô", customer: "Nina", date: "2024-10-24", price: "$34", status: "Đã hủy" },
    { id: 15, name: "Bánh sinh nhật vị mâm xôi", customer: "Oscar", date: "2024-10-25", price: "$37", status: "Chờ xử lý" }
];

const discounts = [
    {
        id: 1,
        productName: 'Bánh Sinh Nhật Socola',
        productImage: 'path_to_image/socola.jpg',
        originalPrice: 500000,
        discountPrice: getRandomDiscount(), // Giảm giá ngẫu nhiên từ 0 đến 100
        detail: 'Giảm giá cho các đơn hàng từ 2 chiếc trở lên.',
        status: 'Đang áp dụng'
    },
    {
        id: 2,
        productName: 'Bánh Sinh Nhật Dâu Tây',
        productImage: 'path_to_image/dautay.jpg',
        originalPrice: 600000,
        discountPrice: getRandomDiscount(),
        detail: 'Giảm giá cho các đơn hàng thanh toán qua ví điện tử.',
        status: 'Đang áp dụng'
    },
    {
        id: 3,
        productName: 'Bánh Sinh Nhật Trái Cây',
        productImage: 'path_to_image/traicay.jpg',
        originalPrice: 550000,
        discountPrice: getRandomDiscount(),
        detail: 'Giảm giá cho khách hàng mua bánh sinh nhật trong tuần này.',
        status: 'Sắp hết hạn'
    },
    {
        id: 4,
        productName: 'Bánh Sinh Nhật Matcha',
        productImage: 'path_to_image/matcha.jpg',
        originalPrice: 650000,
        discountPrice: getRandomDiscount(),
        detail: 'Giảm giá cho đơn hàng từ 3 chiếc trở lên.',
        status: 'Đang áp dụng'
    },
    {
        id: 5,
        productName: 'Bánh Sinh Nhật Kem',
        productImage: 'path_to_image/kem.jpg',
        originalPrice: 450000,
        discountPrice: getRandomDiscount(),
        detail: 'Giảm giá cho khách hàng lần đầu mua.',
        status: 'Đang áp dụng'
    }
];

// Hàm sinh giá trị giảm giá ngẫu nhiên từ 0 đến 100
function getRandomDiscount() {
    return Math.floor(Math.random() * 101); // Trả về giá trị ngẫu nhiên từ 0 đến 100
}



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
