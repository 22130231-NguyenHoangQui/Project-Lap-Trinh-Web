$(document).ready(function () {
    $('#signup-form').submit(function (event) {
        var user = $('#userName').val();
        var password = $('#password').val();
        var rePW = $('#rePassword').val();
        var name = $('#name').val();
        var tell = $('#phoneNumber').val();
        var email = $('#email').val();
        var date = $('#birthDay').val();
        var address = $('#address').val();
        var addressReceive = $('#addressRecei').val();
        var condition = true;
        var passwordRegex = /^(?=.*[A-Z])(?=.*[!@#$%^&*()-+])(?=.*[0-9]).{8,}$/;
        var emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var tellReg = /^\d{10}$/;
        var specialCharacters = /[!@#$%^&*(),.?":{}|<>' -]/;

        // Kiểm tra tên người dùng
        if (user === "") {
            $("#errUser").text('Vui lòng nhập tên đăng nhập!');
            $('#errUser').attr('style', 'color:red');
            condition = false;
        } else if (user.match(specialCharacters)) {
            $("#errUser").text('Tên đăng nhập không được chứa kí tự đặc biệt!');
            $('#errUser').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errUser").text('');
        }

        // Kiểm tra mật khẩu
        if(password===""){
            $("#errPW").text('Vui lòng nhập mật khẩu!');
            $('#errPW').attr('style', 'color:red');
            condition = false;
        } else if(password.length < 6 || password.length > 50){
            $("#errPW").text('Mật khẩu dài từ 6 đến 50 ký tự!');
            $('#errPW').attr('style', 'color:red');
            condition = false;
        } else if(!password.match(passwordRegex)){
            $("#errPW").text('Mật khẩu có ít nhất 1 chữ hoa, 1 ký tự đặc biệt và 1 số!');
            $('#errPW').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errPW").text('');
        }

        // Kiểm tra mật khẩu nhập lại
        if(rePW === ""){
            $("#errRePW").text('Vui lòng nhập lại mật khẩu!');
            $('#errRePW').attr('style', 'color:red');
            condition = false;
        } else if(rePW !==password){
            $("#errRePW").text('Mật khẩu nhập lại không đúng!');
            $('#errRePW').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errRePW").text('');
        }

        // Kiểm tra tên
        if(name==="") {
            $("#errName").text('Vui lòng nhập tên!');
            $('#errName').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errName").text('');
        }

        // Kiểm tra số điện thoại
        if(tell===""){
            $("#errTell").text('Vui lòng nhập số điện thoại!');
            $('#errTell').attr('style', 'color:red');
            condition = false;
        } else if(!tell.match(tellReg)){
            $("#errTell").text('Số điện thoại không hợp lệ!');
            $('#errTell').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errTell").text('');
        }

        // Kiểm tra email
        if(email===""){
            $("#errEmail").text('Vui lòng nhập Email!');
            $('#errEmail').attr('style', 'color:red');
            condition = false;
        } else if(!email.match(emailReg)){
            $("#errEmail").text('Email không hợp lệ!');
            $('#errEmail').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errEmail").text('');
        }

        // Kiểm tra ngày sinh
        if(date===""){
            $("#errDate").text('Vui lòng nhập ngày sinh!');
            $('#errDate').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errDate").text('');
            // Kiểm tra độ tuổi từ ngày sinh (ví dụ, tuổi phải từ 18 trở lên)
            var birthDate = new Date(date);
            var age = new Date().getFullYear() - birthDate.getFullYear();
            if(age < 18) {
                $("#errDate").text('Bạn phải ít nhất 18 tuổi!');
                $('#errDate').attr('style', 'color:red');
                condition = false;
            }
        }

        // Kiểm tra địa chỉ
        if(address===""){
            $("#errAd").text('Vui lòng nhập địa chỉ!');
            $('#errAd').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errAd").text('');
        }

        // Kiểm tra địa chỉ nhận hàng
        if(addressReceive===""){
            $("#errAdRecei").text('Vui lòng nhập địa chỉ nhận hàng!');
            $('#errAdRecei').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errAdRecei").text('');
        }

        // Kiểm tra chấp nhận điều khoản
        var acp = $("#acp");
        if (!acp.is(":checked")) {
            $("#errAcp").text('Bạn phải chấp nhận điều khoản!');
            $('#errAcp').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errAcp").text('');
        }

        
        // Nếu tất cả hợp lệ, chuyển hướng trang
        if (condition) {
            // Chuyển đến trang home
            window.location.href = "..//pages/home.html";
        } else {
            // Ngăn không cho gửi form nếu không hợp lệ
            event.preventDefault();
        }
    });
    // Hiển thị nút xác nhận khi tick vào checkbox điều khoản
    $("#acp").change(function () {
        var cf = document.getElementById("confirm");
        if(this.checked) {
            cf.style.display = 'block';
        } else {
            cf.style.display = 'none';
        }
    });
});
