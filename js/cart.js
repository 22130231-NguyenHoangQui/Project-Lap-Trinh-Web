function updateSubtotal(input) {
    const row = input.closest('tr');
    const price = parseInt(row.children[2].innerText.replace(/₫|,/g, ''));
    const quantity = parseInt(input.value);
    row.querySelector('.subtotal').innerText = `${(price * quantity).toLocaleString()}₫`;
    updateTotal();
}

function incrementQuantity(button) {
    const input = button.previousElementSibling;
    input.value = parseInt(input.value) + 1;
    updateSubtotal(input);
}

function decrementQuantity(button) {
    const input = button.nextElementSibling;
    if (input.value > 1) {
        input.value = parseInt(input.value) - 1;
        updateSubtotal(input);
    }
}

function removeItem(button) {
    button.closest('tr').remove();
    updateTotal();
}

function updateTotal() {
    let total = 0;
    document.querySelectorAll('.subtotal').forEach(subtotalCell => {
        total += parseInt(subtotalCell.innerText.replace(/₫|,/g, ''));
    });
    document.querySelector('.cart-total').innerText = `Tổng cộng: ${total.toLocaleString()}₫`;
}
