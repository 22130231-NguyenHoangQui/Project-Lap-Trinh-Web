
const dashboardLink = document.getElementById('dashboardLink');
const ordersLink = document.getElementById('ordersLink');
const productsLink = document.getElementById('productsLink');
const customersLink = document.getElementById('customersLink');
const catalogsLink = document.getElementById('catalogsLink');
const contentDiv = document.getElementById('content');


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

catalogsLink.addEventListener('click',function (e) {
    e.preventDefault();
    displayCataLogs(1);
    document.getElementById('myChart').style.display = 'none';
});

// tổng quan dashboard
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
}

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

    paginatedCataLogs.forEach((catalog,index) => {
        tableHTML += `
            <tr>
                 <td>${startIndex + index + 1}</td>
                <td>${catalog.id}</td>
                <td>${catalog.name}</td>
                <td>
                  <button class="icon-button" onclick="openEditForm(this)">
               <i class="fa-solid fa-basket-shopping"></i>
            </button>
                 <button class="icon-button" onclick="openEditForm(this)">
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

    changeContent('Orders', tableHTML + paginationHTML, [
        { icon: 'fa-solid fa-gear', action: openFormSetting }
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

    changeContent('Orders', tableHTML + paginationHTML);
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
                <button class="icon-button" onclick="openEditForm(this)">
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
        { icon: 'fa-solid fa-gear', action: openFormSetting }
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
                    <th>SỐ LƯỢNG</th>
                    <th>TRẠNG THÁI</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
    `;

    paginatedProducts.forEach(product => {
        tableHTML += `
            <tr>
                <td>${product.id}</td>
                <td>
                <img src="${product.image}" alt="${product.name}" style="width: 50px; height: 50px; object-fit: cover; margin-right: 10px;">
                ${product.name}
                </td>
                <td>${product.price}</td>
                <td>${product.count}</td>
                <td>${product.status}</td>
                <td>

                <button class="icon-button" onclick="openEditForm(this)">
               <i class="fa-solid fa-basket-shopping"></i>
            </button>


                          <button class="icon-button" onclick="openEditForm(this)">
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

    const totalPages = Math.ceil(products.length / productsPerPage);
    for (let i = 1; i <= totalPages; i++) {
        paginationHTML += `
            <li class="page-item ${i === page ? 'active' : ''}">
                <a class="page-link" href="#" onclick="changePageProducts(${i})">${i}</a>
            </li>
        `;
    }

    paginationHTML += '</ul></nav>';

    changeContent('Products', tableHTML + paginationHTML, [
        { icon: 'fa-solid fa-gear', action: openFormSetting }
    ]);
}



// active 
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




// icon pen thay đổi dữ liệu
function openEditForm(button) {
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


function openFormSetting() {
    const formContainer = document.getElementById('formContainer');
    const overlay = document.getElementById('overlay');

    formContainer.style.display = 'block';
    overlay.style.display = 'block';

    overlay.addEventListener('click', closeFormSetting);
}

function closeFormSetting() {
    const formContainer = document.getElementById('formContainer');
    formContainer.style.display = 'none';
    overlay.style.display = 'none';
}



document.getElementById("overlay").addEventListener("click", closeForm);

function closeForm() {
    document.getElementById("editFormContainer").style.display = "none";
    document.getElementById("overlay").style.display = "none";
}




// Data
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
    { id: 1, name: "Bánh Chocolate", category: "Bánh", price: 25, status: "Bánh chocolate ngọt ngào với lớp kem phủ.", image: "path_to_image1.jpg" },
    { id: 2, name: "Bánh Vanilla", category: "Bánh", price: 20, status: "Bánh bông lan vanilla nhẹ nhàng.", image: "path_to_image2.jpg" },
    { id: 3, name: "Bánh Dâu Tây", category: "Bánh", price: 30, status: "Bánh dâu tây tươi ngon với những trái dâu chín.", image: "path_to_image3.jpg" },
    { id: 4, name: "Bánh Red Velvet", category: "Bánh", price: 40, status: "Bánh Red Velvet mềm mịn, phủ kem phô mai.", image: "path_to_image4.jpg" },
    { id: 5, name: "Bánh Chanh", category: "Bánh", price: 22, status: "Bánh chanh tươi mát với lớp glaze ngọt ngào.", image: "path_to_image5.jpg" },
    { id: 6, name: "Bánh Carrot", category: "Bánh", price: 28, status: "Bánh cà rốt với hạt óc chó và lớp kem phô mai.", image: "path_to_image6.jpg" }
];

const catalogs = [
    { id: 1, name: "Danh mục 1" },
    { id: 2, name: "Danh mục 2" },
    { id: 3, name: "Danh mục 3" },
    { id: 4, name: "Danh mục 4" },
    { id: 5, name: "Danh mục 5" },
    { id: 6, name: "Danh mục 6" },
    { id: 7, name: "Danh mục 7" },
    { id: 8, name: "Danh mục 8" },
    { id: 9, name: "Danh mục 9" },
    { id: 10, name: "Danh mục 10" },
    { id: 11, name: "Danh mục 11" },
    { id: 12, name: "Danh mục 12" },
    { id: 13, name: "Danh mục 13" },
    { id: 14, name: "Danh mục 14" },
    { id: 15, name: "Danh mục 15" }
];
