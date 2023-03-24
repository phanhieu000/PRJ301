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

function showPassword() {
    var upass = document.getElementById('password');
    var toggleBtn = document.getElementById('show-btn');
    if (upass.type === "password") {
        upass.type = "text";
        toggleBtn.value = "Hide Password Characters";
    } else {
        upass.type = "password";
        toggleBtn.value = "Show Password Characters";
    }
}



function changeProfile(ojb) {
    var input = document.querySelector(ojb);
    input.removeAttribute('disabled');
}

function getCategoryChange() {
    var e = document.getElementById('categoryIDSelect');
    var value = e.options[e.selectedIndex].text;

    document.getElementById('categoryIDTake').value = value;
}


function  checkProducer() {
    getCategoryChange();
    var e = document.getElementById('categoryIDTake').value;
    var op = document.getElementById("producerMeta").getElementsByTagName("option");
    for (var i = 0; i < op.length; i++) {
        
        if(op[i] !== e){
            op[i].hidden = true;
        }
        var value = op[i].value.split(',');

        if (value[1] !== e) {
            op[i].hidden = true;

        } else {
            op[i].hidden = false;
//            op[i].value = value[0];
        }
    }
}


$(function () {
    $('#check-email').hide();
    $('#email').change(function () {
        $('#check-email').show();
        $('#pen-email').hide();
    });

    $('#check-firstName').hide();
    $('#firstName').change(function () {
        $('#check-firstName').show();
        $('#pen-firstName').hide();
    });

    $('#check-lastName').hide();
    $('#lastName').change(function () {
        $('#check-lastName').show();
        $('#pen-lastName').hide();
    });

    $('#check-phone').hide();
    $('#phone').change(function () {
        $('#check-phone').show();
        $('#pen-phone').hide();
    });

    $('#check-lastName').hide();
    $('#lastName').change(function () {
        $('#check-lastName').show();
        $('#pen-lastName').hide();
    });

    $('#check-birthDay').hide();
    $('#pen-birthDay').click(function () {
        $('#pen-birthDay').hide();
    });

    $('#birthDay').change(function () {
        $('#check-birthDay').show();
        $('#pen-birthDay').hide();
    });

    $('#check-address').hide();
    $('#address').change(function () {
        $('#check-address').show();
        $('#pen-address').hide();
    });


});




