// Danh sách dữ liệu mẫu
const orders = [
    { id: 11, date: "2024-01-18", total: "3.960.000 ₫", status: "pending", items: ["Bánh sinh nhật vị chocolate"] },
    { id: 12, date: "2024-01-15", total: "5.200.000 ₫", status: "confirmed", items: ["Bánh sinh nhật vị dâu tây"] },
    { id: 13, date: "2024-01-10", total: "1.500.000 ₫", status: "cancelled", items: ["Bánh quy hạnh nhân"] }
];

// Hàm hiển thị danh sách đơn hàng
function renderOrders(filterStatus = null) {
    const tbody = document.getElementById("orders");
    tbody.innerHTML = "";

    // Lọc đơn hàng theo trạng thái (nếu có)
    const filteredOrders = filterStatus
        ? orders.filter(order => order.status === filterStatus)
        : orders;

    // Nếu không có đơn hàng phù hợp
    if (filteredOrders.length === 0) {
        tbody.innerHTML = `<tr><td colspan="6" class="text-center">Không có đơn hàng phù hợp.</td></tr>`;
        return;
    }

    // Hiển thị danh sách đơn hàng
    filteredOrders.forEach((order, index) => {
        tbody.innerHTML += `
            <tr class="order ${order.status}">
                <td>${index + 1}</td>
                <td>${order.id}</td>
                <td>${order.date}</td>
                <td>${order.total}</td>
                <td class="order-status ${order.status}">${getStatusText(order.status)}</td>
                <td class="action-buttons">
                    <button class="btn btn-info btn-sm" onclick="viewDetails(${order.id})" aria-label="Xem chi tiết hóa đơn ${order.id}">
                        <i class="fa fa-eye"></i> Xem
                    </button>
                    ${order.status === "pending" ? `
                        <button class="btn btn-danger btn-sm" onclick="cancelOrder(${order.id})">
                            <i class="fa fa-times"></i> Hủy
                        </button>` : ""}

                     ${order.status === "cancelled" ? `
                        <button class="btn btn-danger btn-sm" onclick="deleteOrder(${order.id})">
                            <i class="fa fa-trash"></i> Xóa
                        </button>` : ""}
                </td>
            </tr>
        `;
    });
}

// Hàm chuyển trạng thái thành văn bản
function getStatusText(status) {
    switch (status) {
        case "pending":
            return "Chờ xác nhận";
        case "confirmed":
            return "Đã xác nhận";
        case "cancelled":
            return "Đã hủy";
        default:
            return "";
    }
}

// Hàm lọc đơn hàng theo trạng thái
function filterOrders(status) {
    renderOrders(status);
    // Cập nhật trạng thái nút nhấn
    updateActiveButton(status);
}

// Hàm cập nhật nút đang được chọn
function updateActiveButton(activeStatus) {
    const buttons = document.querySelectorAll(".status-buttons .btn");
    buttons.forEach(button => {
        // Kiểm tra nội dung của nút để xác định nút phù hợp với trạng thái
        const buttonText = button.textContent.trim();
        const isActive = buttonText === getStatusText(activeStatus);
        button.classList.toggle("active", isActive);
    });
}

// Hàm hiển thị chi tiết đơn hàng
function viewDetails(orderId) {
    const order = orders.find(o => o.id === orderId);
    if (order) {
        document.getElementById("orderId").textContent = order.id;
        document.getElementById("orderDate").textContent = order.date;
        document.getElementById("orderTotal").textContent = order.total;
        document.getElementById("orderItems").innerHTML = order.items.map(item => `<li>${item}</li>`).join("");
            
        document.getElementById("orderDetails").style.display = "block";
    }
}

// Hàm hủy đơn hàng
function cancelOrder(orderId) {
    const order = orders.find(o => o.id === orderId);
    if (order && confirm("Bạn có chắc chắn muốn hủy đơn hàng này?")) {
        order.status = "cancelled";
        renderOrders("pending"); // Sau khi hủy, chỉ hiển thị đơn hàng "Chờ xác nhận"
        updateActiveButton("pending");
    }
}

// Hiển thị danh sách đơn hàng "Chờ xác nhận" khi khởi chạy
renderOrders("pending");
updateActiveButton("pending");
