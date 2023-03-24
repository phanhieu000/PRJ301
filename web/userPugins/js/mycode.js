function addToCartSale(productID){
    document.f.action = "buy?id=" + productID + "&quantity=1&color=1";
    document.f.submit();
}

function addToCart1(productID){
    document.f1.action = "buy?id=" + productID + "&quantity=1&color=1";
    document.f1.submit();
}

function addToCart2(productID){
    document.f2.action = "buy?id=" + productID + "&quantity=1&color=1";
    document.f2.submit();
}

function validatePasswordThanhToan() {

    var passwordDatabase = document.hoadon.password_database.value;
    var password = document.hoadon.passwordThanhToan.value;

    if (passwordDatabase !== password) {
        document.getElementById("passwordThanhToan").style.borderColor = 'red';
        return false;
    } else {
        document.getElementById("passwordThanhToan").style.borderColor = 'green';
        return true;
    }

}

function changeProfiles() {
    document.getElementById('firstName').disabled = false;
    document.getElementById('lastName').disabled = false;
    document.getElementById('email').disabled = false;
    document.getElementById('phone').disabled = false;
    document.getElementById('country').disabled = false;
    document.getElementById('address').disabled = false;
    document.getElementById('change').hidden = true;
    document.getElementById('submit').hidden = false;

}

function validateOldPass() {

    var oldPasswordDatabase = document.formChangePassword.oldPassword_data.value;
    var oldPassword = document.formChangePassword.oldPassword.value;

    if (oldPasswordDatabase !== oldPassword) {
        document.getElementById("oldPassword").style.borderColor = 'red';
        return false;
    } else {
        document.getElementById("oldPassword").style.borderColor = 'green';
        return true;
    }

}

function validateNewPass() {
    var oldPassword = document.formChangePassword.oldPassword.value;
    var newPassword = document.formChangePassword.newPassword.value;

    if (oldPassword === newPassword) {
        document.getElementById("newPassword").style.borderColor = 'red';
        return false;
    } else if (newPassword === null || newPassword === '') {
//        document.getElementById("newPassword").style.borderColor = 'red';
        return false;
    } else {
        document.getElementById("newPassword").style.borderColor = 'green';
        return true;
    }
}

function validateReNewPass() {

    var newPassword = document.formChangePassword.newPassword.value;
    var re_newPassword = document.formChangePassword.re_newPassword.value;

    if (re_newPassword !== newPassword) {
        document.getElementById("re_newPassword").style.borderColor = 'red';
        return false;
    } else if (re_newPassword === null || re_newPassword === '') {

    } else {
        document.getElementById("re_newPassword").style.borderColor = 'green';
        return true;
    }
}

function checkValue() {
    var oldPasswordDatabase = document.formChangePassword.oldPassword_data.value;
    var oldPassword = document.formChangePassword.oldPassword.value;
    var newPassword = document.formChangePassword.newPassword.value;
    var re_newPassword = document.formChangePassword.re_newPassword.value;

    if (oldPasswordDatabase !== oldPassword) {
        alert('Mật Khẩu Hiện Tại Không Đúng');
        return false;
    }

    if (oldPassword === newPassword) {
        alert('Mật Khẩu Mới Không Được Giống Mật Khẩu Cũ');
        return false;
    }

    if (newPassword === null || newPassword === '') {
        alert('Mật Khẩu Mới Không Được Để Trông');
        return false;
    }

    if (re_newPassword !== newPassword) {
        alert('Mật Khẩu Mới Và Xác Nhận Mật Khẩu Phải Giống Nhau');
        return false;
    }

    return true;
}




