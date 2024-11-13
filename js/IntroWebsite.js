// Các phần tử liên quan đến chỉnh sửa chính sách
const policyButton = document.getElementById('editPolicy');
const policySaveButton = document.getElementById('savePolicy');
const policyTextDiv = document.getElementById('policyText');
const policyEditor = document.getElementById('policyEditor');
const policyInput = document.getElementById('policyInput');

// Sự kiện để mở trình chỉnh sửa chính sách
policyButton.addEventListener('click', () => {
    // Chuyển đổi HTML thành văn bản thuần túy cho `textarea`
    const plainText = policyTextDiv.innerHTML
        .replace(/<\/?(p|ul|li)>/g, '') // Loại bỏ thẻ <p>, <ul>, <li>
        .replace(/<br\s*\/?>/g, '\n') // Chuyển đổi <br> thành dòng mới
        .replace(/<\/?[^>]+(>|$)/g, ''); // Loại bỏ bất kỳ thẻ HTML nào khác

    policyInput.value = plainText.trim();
    policyEditor.style.display = 'block';
    policyButton.style.display = 'none';
});

// Sự kiện để lưu chính sách đã chỉnh sửa
policySaveButton.addEventListener('click', () => {
    // Lấy nội dung từ `textarea` và chuyển đổi thành HTML
    const formattedText = policyInput.value
        .split('\n').map(line => `<p>${line}</p>`).join(''); // Tạo các đoạn <p> từ mỗi dòng

    policyTextDiv.innerHTML = formattedText;
    policyEditor.style.display = 'none';
    policyButton.style.display = 'inline-block';
    alert('Cập nhật chính sách thành công!');
});

// Các phần tử liên quan đến chỉnh sửa thông tin liên hệ
const contactButton = document.getElementById('editContact');
const contactSaveButton = document.getElementById('saveContact');
const addressText = document.getElementById('addressText');
const emailText = document.getElementById('emailText');
const phoneText = document.getElementById('phoneText');
const contactEditor = document.getElementById('contactEditor');
const addressInput = document.getElementById('addressInput');
const emailInput = document.getElementById('emailInput');
const phoneInput = document.getElementById('phoneInput');

// Sự kiện để mở trình chỉnh sửa thông tin liên hệ
contactButton.addEventListener('click', () => {
    contactEditor.style.display = 'block';
    contactButton.style.display = 'none';
});

// Sự kiện để lưu thông tin liên hệ đã chỉnh sửa
contactSaveButton.addEventListener('click', () => {
    addressText.textContent = addressInput.value;
    emailText.textContent = emailInput.value;
    phoneText.textContent = phoneInput.value;

    contactEditor.style.display = 'none';
    contactButton.style.display = 'inline-block';
    alert('Cập nhật thông tin liên hệ thành công!');
});
