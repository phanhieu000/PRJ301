<%-- 
    Document   : login
    Created on : 05-10-2022, 14:48:47
    Author     : phanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="description" content="" >
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!--Meta Responsive tag-->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!--Bootstrap CSS-->
        <link rel="stylesheet" href="adminPugins/assets/css/bootstrap.min.css">
        <!--Custom style.css-->
        <link rel="stylesheet" href="adminPugins/assets/css/quicksand.css">
        <link rel="stylesheet" href="adminPugins/assets/css/style.css">
        <!--Font Awesome-->
        <link rel="stylesheet" href="adminPugins/assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="adminPugins/assets/css/fontawesome.css">

        <title>Sleek Admin</title>
    </head>

    <body class="login-body">

        <!--Login Wrapper-->

        <div class="container-fluid login-wrapper">
            <div class="login-box">
                <h1 class="text-center mb-5"><i class="fa fa-unlock-alt text-primary"></i> ADMIN Login</h1>    
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-12 login-box-info">
                        <h3 class="mb-4">Welcome</h3>
                        <p class="mb-4">Website Quản Lý Của Phan Hiếu</p>
                        <!-- <img src="images/logo/logo.jpg" alt="logo" class="rounded-circle" width="50%">  -->
                    </div>
                    <div class="col-md-6 col-sm-6 col-12 login-box-form p-4">
                        <h3 class="mb-2">Login</h3>
                        <small class="text-muted bc-description">Đăng Nhập Với Tài Khoản ADMIN của Bạn</small>
                        <form action="admin-login" method="post" class="needs-validation mt-2" novalidate>
                            <small style="color: red">${requestScope.error}</small>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control mt-0" name="userName" required placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                                <div class="invalid-feedback">Tài Khoản Không Được Để Trống </div>

                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fa fa-lock"></i></span>
                                </div>
                                <input type="password" class="form-control mt-0" name="password" required placeholder="Password" aria-label="Password" aria-describedby="basic-addon1">
                                <div class="invalid-feedback"> Mật Khẩu Không Được Để Trống</div>
                            </div>


                            <div class="form-group">
                                <button type="submit" class="btn btn-theme btn-block p-2 mb-1">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>    

        <!--Login Wrapper-->

        <!-- Page JavaScript Files-->
        <script src="adminPugins/assets/js/jquery.min.js"></script>
        <script src="adminPugins/assets/js/jquery-1.12.4.min.js"></script>
        <!--Popper JS-->
        <script src="adminPugins/assets/js/popper.min.js"></script>
        <!--Bootstrap-->
        <script src="adminPugins/assets/js/bootstrap.min.js"></script>

        <!--Custom Js Script-->
        <script src="adminPugins/assets/js/custom.js"></script>
        <!--Custom Js Script-->
    </body>
</html>
