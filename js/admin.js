
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



const dashboardLink = document.getElementById('dashboardLink');
const ordersLink = document.getElementById('ordersLink');
const productsLink = document.getElementById('productsLink');
const customersLink = document.getElementById('customersLink');

const contentDiv = document.getElementById('content');

function changeContent(title, content) {
    contentTitle.style.display = 'block';
    contentTitle.innerHTML = title;
    contentDiv.innerHTML = content;
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

function changePage(page) {
    displayOrders(page);
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
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
                </tr>
            </thead>
            <tbody>
    `;

    paginatedCustomers.forEach(customer => {
        tableHTML += `
            <tr>
                <td>${customer.id}</td>
                <td>${customer.name}</td>
                <td>${customer.email}</td>
                <td>${customer.phone}</td>
                <td>${customer.address}</td>
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

    changeContent('Customers', tableHTML + paginationHTML);
}

function changePageCustomers(page) {
    displayCustomers(page);
}

function displayProducts(page) {
    const productsPerPage = 10;
    const startIndex = (page - 1) * productsPerPage;
    const endIndex = page * productsPerPage;
    const paginatedProducts = products.slice(startIndex, endIndex);

    let tableHTML = `
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
    `;

    paginatedProducts.forEach(product => {
        tableHTML += `
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.category}</td>
                <td>${product.price}</td>
                <td>${product.description}</td>
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

    changeContent('Products', tableHTML + paginationHTML);
}

function changePageProducts(page) {
    displayProducts(page);
}


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
    { id: 1, name: "Alice", email: "alice@example.com", phone: "123-456-7890", address: "123 Cherry Lane" },
    { id: 2, name: "Bob", email: "bob@example.com", phone: "234-567-8901", address: "456 Maple Street" },
    { id: 3, name: "Charlie", email: "charlie@example.com", phone: "345-678-9012", address: "789 Oak Road" },
    { id: 4, name: "David", email: "david@example.com", phone: "456-789-0123", address: "101 Pine Avenue" },
    { id: 5, name: "Eva", email: "eva@example.com", phone: "567-890-1234", address: "202 Birch Boulevard" },
    { id: 6, name: "Frank", email: "frank@example.com", phone: "678-901-2345", address: "303 Cedar Crescent" }
];

const products = [
    { id: 1, name: "Bánh Chocolate", category: "Bánh", price: 25, description: "Bánh chocolate ngọt ngào với lớp kem phủ." },
    { id: 2, name: "Bánh Vanilla", category: "Bánh", price: 20, description: "Bánh bông lan vanilla nhẹ nhàng." },
    { id: 3, name: "Bánh Dâu Tây", category: "Bánh", price: 30, description: "Bánh dâu tây tươi ngon với những trái dâu chín." },
    { id: 4, name: "Bánh Red Velvet", category: "Bánh", price: 40, description: "Bánh Red Velvet mềm mịn, phủ kem phô mai." },
    { id: 5, name: "Bánh Chanh", category: "Bánh", price: 22, description: "Bánh chanh tươi mát với lớp glaze ngọt ngào." },
    { id: 6, name: "Bánh Carrot", category: "Bánh", price: 28, description: "Bánh cà rốt với hạt óc chó và lớp kem phô mai." }
];
