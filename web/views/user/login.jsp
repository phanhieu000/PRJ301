<%-- 
    Document   : LoginController
    Created on : 17-09-2022, 13:44:58
    Author     : phanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Login</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="userPugins/images/menu/logo/logo.jpg">
        <!-- Material Design Iconic Font-V2.2.0 -->
        <link rel="stylesheet" href="userPugins/css/material-design-iconic-font.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="userPugins/css/font-awesome.min.css">
        <!-- Font Awesome Stars-->
        <link rel="stylesheet" href="userPugins/css/fontawesome-stars.css">
        <!-- Meanmenu CSS -->
        <link rel="stylesheet" href="userPugins/css/meanmenu.css">
        <!-- owl carousel CSS -->
        <link rel="stylesheet" href="userPugins/css/owl.carousel.min.css">
        <!-- Slick Carousel CSS -->
        <link rel="stylesheet" href="userPugins/css/slick.css">
        <!-- Animate CSS -->
        <link rel="stylesheet" href="userPugins/css/animate.css">
        <!-- Jquery-ui CSS -->
        <link rel="stylesheet" href="userPugins/css/jquery-ui.min.css">
        <!-- Venobox CSS -->
        <link rel="stylesheet" href="userPugins/css/venobox.css">
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="userPugins/css/nice-select.css">
        <!-- Magnific Popup CSS -->
        <link rel="stylesheet" href="userPugins/css/magnific-popup.css">
        <!-- Bootstrap V4.1.3 Fremwork CSS -->
        <link rel="stylesheet" href="userPugins/css/bootstrap.min.css">
        <!-- Helper CSS -->
        <link rel="stylesheet" href="userPugins/css/helper.css">
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="userPugins/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="userPugins/css/responsive.css">
        <!-- Modernizr js -->
        <script src="userPugins/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body class="text-capitalize">
        <!-- Begin Body Wrapper -->
        <jsp:useBean id="pd" class="com.mywebsite.DAO.product.ProductDAO"/>
        <jsp:useBean id="cd" class="com.mywebsite.DAO.product.CategoryDAO"/>
        <jsp:useBean id="prd" class="com.mywebsite.DAO.product.ProducerDAO"/>
        <div class="body-wrapper">
            <!-- Begin Header Area -->
            <header>
                <!-- Begin Header Top Area -->
                <div class="header-top">
                    <div class="container">
                        <div class="row">
                            <!-- Begin Header Top Left Area -->
                            <div class="col-lg-3 col-md-4">
                                <div class="header-top-left">
                                    <ul class="phone-wrap">
                                        <li><span>Liên Hệ:</span><a href="https://www.facebook.com/phanhieu000">Phan Hiếu</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Header Top Left Area End Here -->
                            <!-- Begin Header Top Right Area -->
                            <div class="col-lg-9 col-md-8">
                                <div class="header-top-right">
                                    <ul class="ht-menu">
                                        <!-- Begin Setting Area -->
                                        <li>
                                            <div class="ht-setting-trigger">
                                                <c:if test="${account == null}">
                                                    <span>Account</span></div>
                                                <div class="setting ht-setting">
                                                    <ul class="ht-setting-list">
                                                        <li><a href="login">Login</a></li>
                                                        <li><a href="register">Register</a></li>
                                                        <li><a href="forgot">Forgot Pass?</a></li>
                                                    </ul>
                                                </div>
                                            </c:if>

                                            <c:if test="${account != null}">
                                                <span >Hello: ${account.information.fullName}</span></div>
                                                <div class="setting ht-setting">
                                                    <ul class="ht-setting-list">
                                                        <li><a href="profile">My Profile</a></li>
                                                        <li><a href="order">Order</a></li>
                                                        <li><a href="checkout">Checkout</a></li>
                                                        <li><a href="logout">Logout</a></li>
                                                    </ul>
                                                </div>
                                            </c:if>
                                        </li>
                                        <!-- Setting Area End Here -->
                                    </ul>
                                </div>
                            </div>
                            <!-- Header Top Right Area End Here -->
                        </div>
                    </div>
                </div>
                <!-- Header Top Area End Here -->
                <!-- Begin Header Middle Area -->
                <div class="header-middle pl-sm-0 pr-sm-0 pl-xs-0 pr-xs-0">
                    <div class="container">
                        <div class="row">
                            <!-- Begin Header Logo Area -->
                            <div class="col-lg-3">
                                <div class="logo pb-sm-30 pb-xs-30">
                                    <a href="home">
                                        <img style="max-width: 20%;"  src="userPugins/images/menu/logo/logo.jpg" alt="logo">
                                    </a>
                                </div>
                            </div>
                            <!-- Header Logo Area End Here -->

                            <!-- Begin Header Middle Right Area -->
                            <div class="col-lg-9">
                                <!-- Begin Header Middle Searchbox Area -->
                                <form action="shop" class="hm-searchbox" method="get">
                                    <select class="nice-select select-search-category" name='cid'>
                                        <option value="0">All</option>
                                        <c:forEach items="${cd.all}" var="c">
                                            <option value="${c.categoryID}">${c.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                    <input type="text" placeholder="search" name="search" value="">
                                    <button class="li-btn" type="submit"><i class="fa fa-search"></i></button>
                                </form>
                                <!-- Header Middle Searchbox Area End Here -->
                                <!-- Begin Header Middle Right Area -->
                                <div class="header-middle-right">
                                    <ul class="hm-menu">
                                        <!-- Begin Header Middle Wishlist Area -->
                                        <li class="hm-wishlist">
                                            <a href="wishlist">
                                                <span class="cart-item-count wishlist-item-count">+</span>
                                                <i class="fa fa-heart-o"></i>
                                            </a>
                                        </li>
                                        <!-- Header Middle Wishlist Area End Here -->
                                        <!-- Begin Header Mini Cart Area -->
                                        <li class="hm-minicart">
                                            <div class="hm-minicart-trigger">
                                                <span class="item-icon"></span>
                                                <span class="item-text">Cart Mini
                                                    <span class="cart-item-count">${size}</span>
                                                </span>
                                            </div>
                                            <span></span>
                                            <div class="minicart">
                                                <c:if test="${size == 0}">
                                                    <span>Chưa Có Sản Phẩm Trong Giỏ Hàng</span>
                                                </c:if>

                                                <c:if test="${size > 0}">
                                                    <ul class="minicart-product-list">
                                                        <c:forEach  items="${cart.items}" var="i">
                                                            <form action="" method="post">
                                                                <li>
                                                                    <a href="productview?id=${i.product.productID}" class="minicart-product-image">
                                                                        <img width="50px" src="${i.product.image.imageFirst}" alt="cart products">
                                                                    </a>
                                                                    <div class="minicart-product-details">
                                                                        <h6><a href="productview?id=${i.product.productID}">${i.product.productName}</a></h6>
                                                                        <span>${i.product.lastPriceFormat} đ x ${i.quantity}</span>
                                                                    </div>
                                                                    <button class="close">
                                                                        <i class="fa fa-close" onclick="this.form.submit()"></i>
                                                                        <input type="text" name="id" value="${i.product.productID}" hidden>
                                                                    </button>
                                                                </li>
                                                            </form>
                                                        </c:forEach>
                                                    </ul>
                                                    <p class="minicart-total">SUBTOTAL: <span>${totalMoneyFormat} Đ</span></p>
                                                    <div class="minicart-button">
                                                        <a href="cart" class="li-button li-button-dark li-button-fullwidth li-button-sm">
                                                            <span>Đến Giỏ Hàng</span>
                                                        </a>
                                                        <a href="checkout" class="li-button li-button-dark li-button-fullwidth li-button-sm">
                                                            <span>Thanh Toán</span>
                                                        </a>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </li>
                                        <!-- Header Mini Cart Area End Here -->
                                    </ul>
                                </div>
                                <!-- Header Middle Right Area End Here -->
                            </div>
                            <!-- Header Middle Right Area End Here -->
                        </div>
                    </div>
                </div>
                <!-- Header Middle Area End Here -->
                <!-- Begin Header Bottom Area -->
                <div class="header-bottom header-sticky stick d-none d-lg-block d-xl-block">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <!-- Begin Header Bottom Menu Area -->
                                <div class="hb-menu hb-menu-2">
                                    <nav>  
                                        <ul>
                                            <li class=""><a href="home">Home</a></li>
                                                <c:forEach items="${cd.all}" var="c">
                                                    <c:if test="${c.categoryName eq 'Laptop'}">
                                                    <li class="megamenu-holder"><a href="shop?cid=${c.categoryID}">${c.categoryName}</a>
                                                        <ul class="megamenu hb-megamenu">
                                                            <li><p class="text-dark">Hãng Sản Xuất</p>
                                                                <ul>
                                                                    <c:forEach items="${prd.getProducerByACategoryID(c.categoryID)}" var="pl">
                                                                        <li><a href="shop?cid=${c.categoryID}&pid=${pl.producerID}">${pl.producerName}</a></li>
                                                                        </c:forEach>
                                                                </ul>
                                                            </li>
                                                            <li><p class="text-dark">Phần Mềm</p>
                                                                <ul>
                                                                    <li><a href="#">Diệt Virus</a></li>
                                                                    <li><a href="#">Microsoft Office</a></li>
                                                                    <li><a href="#">Windown</a></li>
                                                                    <li><a href="#">Phần Mềm Khác</a></li>
                                                                </ul>
                                                            </li>
                                                            <li><p class="text-dark">Giá</p>
                                                                <ul>
                                                                    <li><a href="shop?cid=${c.categoryID}&price=5000000">Dưới 5 Triệu VND</a></li>
                                                                    <li><a href="shop?cid=${c.categoryID}price=10000000">Dưới 10 Triệu VND</a></li>
                                                                    <li><a href="shop?cid=${c.categoryID}price=20000000">Dưới 20 Triệu VND</a></li>
                                                                    <li><a href="shop?cid=${c.categoryID}price=200000000">Trên 20 Triệu</a></li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </c:if>

                                                <c:if test="${c.categoryName eq 'SmartPhone'}">
                                                    <li class="dropdown-holder"><a href="shop?cid=${c.categoryID}">${c.categoryName}</a>
                                                        <ul class="hb-dropdown">
                                                            <c:forEach items="${prd.getProducerByACategoryID(c.categoryID)}" var="ps">
                                                                <li class="sub-dropdown-holder"><a href="shop?cid=${c.categoryID}&pid=${ps.producerID}">${ps.producerName}</a>
                                                                    <ul class="hb-dropdown hb-sub-dropdown">
                                                                        <c:if test="${pd.getTop5ProductSellerByProducer(ps.producerID, c.categoryID).size() == 0}">
                                                                            <li><a href="#">Hiện Chưa Có Sản Phẩm</a></li>
                                                                            </c:if>
                                                                            <c:forEach items="${pd.getTop5ProductSellerByProducer(ps.producerID, c.categoryID)}" var="p">
                                                                            <li><a href="productview?id=${p.productID}">${p.productName}</a></li>
                                                                            </c:forEach>
                                                                    </ul>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </li>
                                                </c:if>

                                                <c:if test="${c.categoryName eq 'Tablet'}">
                                                    <li class="megamenu-holder"><a href="shop?cid=${c.categoryID}">${c.categoryName}</a>
                                                        <ul class="megamenu hb-megamenu">
                                                            <li><p class="text-dark">Hãng Sản Xuất</p>
                                                                <ul>
                                                                    <c:forEach items="${prd.getProducerByACategoryID(c.categoryID)}" var="pt">
                                                                        <li class=""><a href="shop?cid=${c.categoryID}&pid=${pt.producerID}">${pt.producerName}</a></li>
                                                                        </c:forEach>
                                                                </ul>
                                                            </li>
                                                            <li><p class="text-dark">Giá</p>
                                                                <ul>
                                                                    <li><a href="shop?cid=${c.categoryID}&price=5000000">Dưới 5 Triệu VND</a></li>
                                                                    <li><a href="shop?cid=${c.categoryID}&price=10000000">Dưới 10 Triệu VND</a></li>
                                                                    <li><a href="shop?cid=${c.categoryID}&price=20000000">Dưới 20 Triệu VND</a></li>
                                                                    <li><a href="shop?cid=${c.categoryID}&price=200000000"> Trên 20 Triệu</a></li>
                                                                </ul>
                                                            </li>

                                                            <li><p class="text-dark">Bán Chạy Nhất</p>
                                                                <ul>
                                                                    <c:forEach items="${pd.getTop5ProductSellerByProducer(0, c.categoryID)}" var="p">
                                                                        <li><a href="productview?id=${p.productID}">${p.productName}</a></li>
                                                                        </c:forEach>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </c:if>

                                                <c:if test="${c.categoryName eq 'Apple'}">
                                                    <li class="megamenu-holder"><a href="shop?cid=${c.categoryID}">${c.categoryName}</a>
                                                        <ul class="megamenu hb-megamenu">
                                                            <li><p class="text-dark">Các Sản Phẩm Của ${c.categoryName}</p>
                                                                <ul>
                                                                    <c:forEach items="${cd.getSubcategoryApple(c.categoryName)}" var="saa">
                                                                        <li class=""><a href="shop?cid=${saa.categoryID}">${saa.categoryName}</a></li>
                                                                        </c:forEach>
                                                                </ul>
                                                            </li>

                                                            <li><p class="text-dark">Bán Chạy Nhất</p>
                                                                <ul>
                                                                    <c:forEach begin="1" end="5">
                                                                        <li><a href="#">Chờ Thêm DataBase</a></li>
                                                                        </c:forEach>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </c:if>    

                                                <c:if test="${c.categoryName eq 'Accessories'}">
                                                    <li class="megamenu-static-holder"><a href="shop?cid=${c.categoryID}">${c.categoryName}</a>
                                                        <ul class="megamenu hb-megamenu">
                                                            <li><p class="text-dark">Laptop Accessories</p>
                                                                <ul>
                                                                    <c:forEach begin="1" end="6">
                                                                        <li><a href="#">Chờ Thêm DataBase</a></li>
                                                                        </c:forEach>
                                                                </ul>
                                                            </li>
                                                            <li><p class="text-dark">Phone Accessories</p>
                                                                <ul>
                                                                    <c:forEach begin="1" end="4">
                                                                        <li><a href="#">Chờ Thêm DataBase</a></li>
                                                                        </c:forEach>
                                                                </ul>
                                                            </li>
                                                            <li><p class="text-dark">Webcam</p>
                                                                <ul>
                                                                    <c:forEach begin="1" end="8">
                                                                        <li><a href="#">Chờ Thêm DataBase</a></li>
                                                                        </c:forEach>
                                                                </ul>
                                                            </li>
                                                            <li><p class="text-dark">Other</p>
                                                                <ul>
                                                                    <c:forEach begin="1" end="3">
                                                                        <li><a href="#">Chờ Thêm DataBase</a></li>
                                                                        </c:forEach>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </c:if>
                                                <c:if test="${c.categoryName ne 'Accessories' && c.categoryName ne 'Tablet' && c.categoryName ne 'Apple' && c.categoryName ne 'SmartPhone' && c.categoryName ne 'Laptop'}">
                                                    <li><a href="shop?cid=${c.categoryID}">${c.categoryName}</a></li>
                                                    </c:if>    
                                                </li>
                                            </c:forEach>

                                            <li class=""><a href="shop">Others</a></li>
                                            <!-- Begin Header Bottom Menu Information Area -->
                                            <li class="hb-info f-right p-0 d-sm-none d-lg-block">
                                                <span>Thạch Hòa, Thạch Thất - Hà Nội</span>
                                            </li>
                                            <!-- Header Bottom Menu Information Area End Here -->
                                        </ul>
                                    </nav>
                                </div>
                                <!-- Header Bottom Menu Area End Here -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Header Bottom Area End Here -->
                <!-- Begin Mobile Menu Area -->
                <div class="mobile-menu-area d-lg-none d-xl-none col-12">
                    <div class="container"> 
                        <div class="row">
                            <div class="mobile-menu">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Mobile Menu Area End Here -->
            </header>
            <!-- Header Area End Here -->
            <!-- Begin Li's Breadcrumb Area -->
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="home">Home</a></li>
                            <li class="active">Login</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- Begin Login Content Area -->
            <div class="page-section mb-60">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-xs-12 col-lg-8 mb-30">
                            <!-- Login Form s-->
                            <form action="login" method="post">
                                <div class="login-form">
                                    <h4 class="login-title">Login</h4>
                                    <c:if test="${requestScope.loginError != null}">
                                        <h6 class="mb-20 text-center" style="color: red">${requestScope.loginError}</h6>
                                    </c:if>
                                    <div class="row">
                                        <div class="col-md-12 col-12 mb-20">
                                            <label>UserName:</label>
                                            <input class="mb-0" type="text" placeholder="Nhập Tài Khoản Của Bạn" name="userName">
                                        </div>
                                        <div class="col-12 mb-20">
                                            <label>Password:</label>
                                            <input class="mb-0" type="password" placeholder="Nhập Mật Khẩu Của Bạn" name="password">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="check-box d-inline-block ml-0 ml-md-2 mt-10">
                                                <input type="checkbox" id="remember_me" name="remember">
                                                <label for="remember_me">Remember me</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4 mt-10 mb-20 text-left text-md-right">
                                            <a href="#"> Forgotten pasward?</a>
                                        </div>
                                        <div class="col-md-12">
                                            <button class="register-button mt-0" type="submit" onclick="myFunction()">Login</button>
                                            <button class="register-button mt-0 ml-20" type=""><a class="text-light" href="register">Đăng Ký</a></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-4 col-xs-12">
                            <img style="width: 120%; height: 94%;" src="userPugins/images/login.png" alt="fpt">
                        </div>
                    </div>
                </div>
            </div>
            <!-- Login Content Area End Here -->
            <!-- Begin Footer Area -->
            <div class="footer">
                <!-- Begin Footer Static Top Area -->
                <div class="footer-static-top footer-static-top-3 pt-xs-50 pb-xs-10">
                    <div class="container">
                        <!-- Begin Footer Shipping Area -->
                        <div class="footer-shipping pb-xs-0">
                            <div class="row">
                                <!-- Begin Li's Shipping Inner Box Area -->
                                <div class="col-lg-3 col-md-3 col-sm-6 pb-xs-45">
                                    <div class="li-shipping-inner-box">
                                        <div class="shipping-icon">
                                            <img src="userPugins/images/shipping-icon/1.png" alt="Shipping Icon">
                                        </div>
                                        <div class="shipping-text">
                                            <h2>Giao Hàng Miễn Phí</h2>
                                            <p>An Toàn - Nhanh Gọn</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Li's Shipping Inner Box Area End Here -->
                                <!-- Begin Li's Shipping Inner Box Area -->
                                <div class="col-lg-3 col-md-3 col-sm-6 pb-xs-45">
                                    <div class="li-shipping-inner-box">
                                        <div class="shipping-icon">
                                            <img src="userPugins/images/shipping-icon/2.png" alt="Shipping Icon">
                                        </div>
                                        <div class="shipping-text">
                                            <h2>Thanh Toán Nhanh</h2>
                                            <p>Tiết Kiệm Thời Gian</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Li's Shipping Inner Box Area End Here -->
                                <!-- Begin Li's Shipping Inner Box Area -->
                                <div class="col-lg-3 col-md-3 col-sm-6 pb-xs-45">
                                    <div class="li-shipping-inner-box">
                                        <div class="shipping-icon">
                                            <img src="userPugins/images/shipping-icon/3.png" alt="Shipping Icon">
                                        </div>
                                        <div class="shipping-text">
                                            <h2>Bảo Hành 24 tháng</h2>
                                            <p>Đổi Trả Sản Phẩm trong 7 ngày</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Li's Shipping Inner Box Area End Here -->
                                <!-- Begin Li's Shipping Inner Box Area -->
                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="li-shipping-inner-box last-child">
                                        <div class="shipping-icon">
                                            <img src="userPugins/images/shipping-icon/4.png" alt="Shipping Icon">
                                        </div>
                                        <div class="shipping-text">
                                            <h2>Hệ Thống Hỗ Trợ 24h</h2>
                                            <p>Liên Hệ Để Được Hỗ Trợ Sớm Nhất</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Li's Shipping Inner Box Area End Here -->
                            </div>
                        </div>
                        <!-- Footer Shipping Area End Here -->
                    </div>
                </div>
                <!-- Footer Static Top Area End Here -->
                <!-- Begin Footer Static Middle Area -->
                <div class="footer-static-middle">
                    <div class="container">
                        <div class="footer-logo-wrap pt-50 pb-35">
                            <div class="row">
                                <!-- Begin Footer Logo Area -->
                                <div class="col-lg-4 col-md-6">
                                    <div class="footer-logo">
                                        <img style="max-width: 20%;" src="userPugins/images/menu/logo/logo.jpg" alt="Footer Logo">
                                        <p class="info">
                                            Made By Phan Hiếu -> www.facebook.com/phanhieu000
                                        </p>
                                    </div>
                                    <ul class="des">
                                        <li>
                                            <span>Address: </span>
                                            Hòa Lạc, Thạch Thất - Hà Nội
                                        </li>
                                        <li>
                                            <span>Phone: </span>
                                            <a href="#">(+84) 0838456798</a>
                                        </li>
                                        <li>
                                            <span>Email: </span>
                                            <a href="mailto://info@yourdomain.com">hieupmhe163385@fpt.edu.vn</a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- Footer Logo Area End Here -->
                                <!-- Begin Footer Block Area -->
                                <div class="col-lg-2 col-md-3 col-sm-6">
                                    <div class="footer-block">
                                        <h3 class="footer-block-title">Sản Phẩm</h3>
                                        <ul>
                                            <li><a href="#">Laptops</a></li>
                                            <li><a href="#">Tivi</a></li>
                                            <li><a href="#">Smartphone</a></li>
                                            <li><a href="#">Accessories</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- Footer Block Area End Here -->
                                <!-- Begin Footer Block Area -->
                                <div class="col-lg-2 col-md-3 col-sm-6">
                                    <div class="footer-block">
                                        <h3 class="footer-block-title">Our company</h3>
                                        <ul>
                                            <li><a href="#">Phan Hiếu</a></li>
                                            <li><a href="#">Phan Hiếu</a></li>
                                            <li><a href="#">Phan Hiếu</a></li>
                                            <li><a href="#">Phan Hiếu</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- Footer Block Area End Here -->
                                <!-- Begin Footer Block Area -->
                                <div class="col-lg-4">
                                    <div class="footer-block">
                                        <h3 class="footer-block-title">Follow Us</h3>
                                        <ul class="social-link">
                                            <!-- <li class="twitter">
                                                <a href="https://twitter.com/" data-toggle="tooltip" target="_blank" title="Twitter">
                                                    <i class="fa fa-twitter"></i>
                                                </a>
                                            </li> -->
                                            <!-- <li class="rss">
                                                <a href="https://rss.com/" data-toggle="tooltip" target="_blank" title="RSS">
                                                    <i class="fa fa-rss"></i>
                                                </a>
                                            </li> -->
                                            <li class="facebook">
                                                <a href="https://www.facebook.com/phanhieu000" data-toggle="tooltip" target="_blank" title="Facebook">
                                                    <i class="fa fa-facebook"></i>
                                                </a>
                                            </li>
                                            <li class="google-plus">
                                                <a href="#" data-toggle="tooltip" target="_blank" title="Google">
                                                    <i class="fa fa-google-plus"></i>
                                                </a>
                                            </li>

                                            <li class="youtube">
                                                <a href="https://www.youtube.com/" data-toggle="tooltip" target="_blank" title="Youtube">
                                                    <i class="fa fa-youtube"></i>
                                                </a>
                                            </li>
                                            <li class="instagram">
                                                <a href="https://www.instagram.com/" data-toggle="tooltip" target="_blank" title="Instagram">
                                                    <i class="fa fa-instagram"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- Begin Footer newsletter Area -->
                                    <div class="footer-newsletter">
                                        <h4>Đăng Ký Nhận Thông Tin Sản Phẩm Mới</h4>
                                        <form action="#" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="footer-subscribe-form validate" target="_blank" novalidate>
                                            <div id="mc_embed_signup_scroll">
                                                <div id="mc-form" class="mc-form subscribe-form form-group" >
                                                    <input id="mc-email" type="email" autocomplete="off" placeholder="Điền Gmail Của Bạn" />
                                                    <button  class="btn" id="mc-submit">SEND</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- Footer newsletter Area End Here -->
                                </div>
                                <!-- Footer Block Area End Here -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer Static Middle Area End Here -->
                <!-- Begin Footer Static Bottom Area -->
                <div class="footer-static-bottom">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <!-- Begin Footer Links Area -->
                                <div class="footer-links">

                                </div>
                                <!-- Footer Links Area End Here -->
                                <!-- Begin Footer Payment Area -->
                                <div class="payment text-center">
                                    <a href="#">
                                        <img src="images/payment/1.png" alt="">
                                    </a>
                                </div>
                                <!-- Footer Payment Area End Here -->
                                <!-- Begin Copyright Area -->
                                <div class="copyright text-center pt-30 pb-50">
                                    <span><a target="_blank" href="">Made By Phan Hiếu: www.facebook.com/phanhieu000</a></span>
                                </div>
                                <!-- Copyright Area End Here -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer Static Bottom Area End Here -->
            </div>
            <!-- Footer Area End Here -->
        </div>
        <!-- Body Wrapper End Here -->
        <!-- jQuery-V1.12.4 -->
        <script src="userPugins/js/vendor/jquery-1.12.4.min.js"></script>
        <!-- Popper js -->
        <script src="userPugins/js/vendor/popper.min.js"></script>
        <!-- Bootstrap V4.1.3 Fremwork js -->
        <script src="userPugins/js/bootstrap.min.js"></script>
        <!-- Ajax Mail js -->
        <script src="userPugins/js/ajax-mail.js"></script>
        <!-- Meanmenu js -->
        <script src="userPugins/js/jquery.meanmenu.min.js"></script>
        <!-- Wow.min js -->
        <script src="userPugins/js/wow.min.js"></script>
        <!-- Slick Carousel js -->
        <script src="userPugins/js/slick.min.js"></script>
        <!-- Owl Carousel-2 js -->
        <script src="userPugins/js/owl.carousel.min.js"></script>
        <!-- Magnific popup js -->
        <script src="userPugins/js/jquery.magnific-popup.min.js"></script>
        <!-- Isotope js -->
        <script src="userPugins/js/isotope.pkgd.min.js"></script>
        <!-- Imagesloaded js -->
        <script src="userPugins/js/imagesloaded.pkgd.min.js"></script>
        <!-- Mixitup js -->
        <script src="userPugins/js/jquery.mixitup.min.js"></script>
        <!-- Countdown -->
        <script src="userPugins/js/jquery.countdown.min.js"></script>
        <!-- Counterup -->
        <script src="userPugins/js/jquery.counterup.min.js"></script>
        <!-- Waypoints -->
        <script src="userPugins/js/waypoints.min.js"></script>
        <!-- Barrating -->
        <script src="userPugins/js/jquery.barrating.min.js"></script>
        <!-- Jquery-ui -->
        <script src="userPugins/js/jquery-ui.min.js"></script>
        <!-- Venobox -->
        <script src="userPugins/js/venobox.min.js"></script>
        <!-- Nice Select js -->
        <script src="userPugins/js/jquery.nice-select.min.js"></script>
        <!-- ScrollUp js -->
        <script src="userPugins/js/scrollUp.min.js"></script>
        <!-- Main/Activator js -->
        <script src="userPugins/js/main.js"></script>
    </body>

    <!-- login-register31:27-->
</html>

