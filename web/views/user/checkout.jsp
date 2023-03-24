<%-- 
    Document   : checkout
    Created on : 12-10-2022, 19:09:08
    Author     : phanh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <!-- index-331:38-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

        <style>
            .checkout-form-list input[type="radio"] {
                display: inline-block;
                height: inherit;
                margin-right: 10px;
                position: relative;
                top: 2px;
                width: inherit;
            }
        </style>

    </head>

    <body class="text-capitalize">
        <!-- Begin Body Wrapper -->
        <jsp:useBean id="pd" class="com.mywebsite.DAO.product.ProductDAO"/>
        <jsp:useBean id="cd" class="com.mywebsite.DAO.product.CategoryDAO"/>
        <jsp:useBean id="prd" class="com.mywebsite.DAO.product.ProducerDAO"/>
        <jsp:useBean id="cpd" class="com.mywebsite.DAO.product.CompanyShipDAO"/>
        <jsp:useBean id="ctd" class="com.mywebsite.DAO.account.CountryDAO"/>

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
                            <li class="active">Thanh Toán</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!--Checkout Area Strat-->
            <form action="checkout" name="hoadon" method="post">
                <div class="checkout-area pt-60 pb-30">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="coupon-accordion">

                                    <!--Accordion Start-->
                                    <h3>Có Mã Giảm Giá? <span id="showcoupon">Click Here !</span></h3>
                                    <div id="checkout_coupon" class="coupon-checkout-content">
                                        <div class="coupon-info">
                                        </div>
                                    </div>
                                    <!--Accordion End-->
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6 col-12">

                                <div class="checkbox-form">
                                    <h3>Thông Tin Nhận Hàng</h3>
                                    <c:if test="${account == null}">
                                        <h5 style="margin-top: 200px; text-align: center">Đăng Nhập Để Thanh Toán. <small><a href="login"> Đăng Nhập ?</a></small></h5>
                                    </c:if>
                                    <c:if test="${account != null}">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="checkout-form-list">
                                                    <label>First Name <span class="required">*</span></label>
                                                    <input placeholder="First Name" name="fisrtName" type="text" value="${account.information.firstName}" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="checkout-form-list">
                                                    <label>Last Name <span class="required">*</span></label>
                                                    <input placeholder="LastName" name="lastName" type="text" value="${account.information.lastName}" required>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="country-select clearfix">
                                                    <label>Country <span class="required">*</span></label>
                                                    <select class="nice-select wide" name="companyShipID" required>
                                                        <c:forEach items="${cpd.all}" var="companyShip">
                                                            <option value="${companyShip.companyID}">${companyShip.companyName}</option>    
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="country-select clearfix">
                                                    <label>Country <span class="required">*</span></label>
                                                    <select class="nice-select wide" name="country" required>
                                                        <c:forEach items="${ctd.all}" var="country">
                                                            <option value="${country.countryID}" ${country.countryID == account.information.country.countryID ? 'selected' : ''}>${country.countryName}</option>    
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="checkout-form-list">
                                                    <label>Address <span class="required">*</span></label>
                                                    <input placeholder="Địa Chỉ Nhận Hàng" name="address" type="text" value="${account.information.address}" required>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="checkout-form-list">
                                                    <label>Email Address <span class="required">*</span></label>
                                                    <input placeholder="Email Liên Hệ" name="email" type="email" value="${account.email}" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="checkout-form-list">
                                                    <label>Phone  <span class="required">*</span></label>
                                                    <input placeholder="Số Điện Thoại Liên Hệ" name="phone" type="text" value="${account.information.phone}" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="different-address">
                                            <div class="ship-different-title">
                                                <h3>
                                                    <label>Đặt Hàng Với Thông Tin Khác?</label>
                                                    <input id="ship-box" type="checkbox" name="otherAddress">
                                                </h3>
                                            </div>
                                            <div id="ship-box-info" class="row">
                                                <div class="col-md-12">
                                                    <div class="country-select clearfix">
                                                        <label>Country <span class="required">*</span></label>
                                                        <select class="nice-select wide" name="country2" >
                                                            <option value="0">Chọn Quốc Gia Đặt Hàng</option>
                                                            <c:forEach items="${requestScope.listCountry}" var="country">
                                                                <option value="${country.countryID}">${country.countryName}</option>    
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="checkout-form-list">
                                                        <label>Address <span class="required">*</span></label>
                                                        <input placeholder="Địa Chỉ Nhận Hàng" name="address2" type="text" >
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="checkout-form-list">
                                                        <label>First Name <span class="required">*</span></label>
                                                        <input placeholder="Họ của Người Nhận Hàng" name="fisrtName2" type="text" >
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="checkout-form-list">
                                                        <label>Last Name <span class="required">*</span></label>
                                                        <input placeholder="Tên Của Người Nhận Hàng" name="lastName2" type="text" >
                                                    </div>
                                                </div>



                                                <div class="col-md-12">
                                                    <div class="checkout-form-list">
                                                        <label>Email Address <span class="required">*</span></label>
                                                        <input placeholder="Email Liên Hệ" name="email2" type="email" > 
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="checkout-form-list">
                                                        <label>Phone  <span class="required">*</span></label>
                                                        <input placeholder="Số Điện Thoại Liên Hệ" name="phone2" type="text" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="order-notes">
                                                <div class="checkout-form-list">
                                                    <label>Order Note</label>
                                                    <textarea name="note" id="checkout-mess" cols="30" rows="10" placeholder="Điền Lưu Ý Nếu Có"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>


                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="your-order">
                                    <h3>Đơn Hàng Của Bạn</h3>
                                    <div class="your-order-table table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="cart-product-name">Sản Phẩm</th>
                                                    <th class="cart-product-total">Giá Tiền</th>
                                                    <th class="cart-product-total">Màu</th>
                                                    <th class="cart-product-total">Thành Tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach  items="${cart.items}" var="orderLine">
                                                    <tr class="cart_item">
                                                        <td class="cart-product-name">${orderLine.product.productName}<strong class="product-quantity"> × ${orderLine.quantity}</strong></td>
                                                        <td class="cart-product-total"><span class="amount">${orderLine.product.lastPriceFormat}<strong class="product-quantity"> đ</strong></span></td>  
                                                        <td class="cart-product-total">
                                                            <span class="amount">
                                                                ${orderLine.color == 1 ? orderLine.product.color.colorFirst : ''}
                                                                ${orderLine.color == 2 ? orderLine.product.color.colorSecond : ''}
                                                                ${orderLine.color == 3 ? orderLine.product.color.colorThree : ''}
                                                                ${orderLine.color == 4 ? orderLine.product.color.colorFour : ''}
                                                                ${orderLine.color == 5 ? orderLine.product.color.colorFive : ''}
                                                            </span>
                                                        </td>
                                                        <td class="cart-product-total"><span class="amount">${orderLine.totalMoneyFormat}<strong class="product-quantity"> đ</strong></span></td>  
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr class="cart-subtotal">
                                                    <th>Thành Tiền:</th>
                                                    <td></td>
                                                    <td></td>
                                                    <td><span class="amount">${cart.totalMoneyFormat}<strong class="product-quantity"> đ</strong></span></td>
                                                </tr>
                                                <tr class="cart-subtotal">
                                                    <th>Thuế: </th>
                                                    <td>1%</td>
                                                    <td></td>
                                                    <td><span class="amount">${tax}<strong class="product-quantity"> đ</strong></span></td>

                                                </tr>
                                                <tr class="order-total">
                                                    <th>Tổng Đơn Hàng</th>
                                                    <td><strong><span class="amount">${requestScope.finalMoney} đ</span></strong></td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="payment-method">
                                        <div class="payment-accordion">
                                            <div id="accordion">
                                                <div class="checkout-form-list create-acc">
                                                    <input id="cbox" type="radio" value="1" name="payment" checked >
                                                    <label>Sử Dụng Số Dư Để Thanh Toán</label>
                                                </div>

                                                <div class="checkout-form-list create-acc">
                                                    <input  type="radio" value="2" name="payment">
                                                    <label>Thanh Toán Qua Ngân Hàng</label>
                                                </div>

                                                <div class="checkout-form-list create-acc">
                                                    <input " type="radio" value="3" name="payment">
                                                    <label>Thanh Toán Khi Nhận Hàng</label>
                                                </div>
                                            </div>
                                            <div id="" class="checkout-form-list" style="display: block">
                                                <p>Hãy Chắc Chắn Là Bạn Muốn Mua Chúng. Sau Khi Thanh Toán Muốn Trả Hàng Sẽ Mất 20% Giá Trị Sản Phẩm</p>
                                                <label>Số Dư: <span class="amount">${account.amountFormat} đ</span></label>
                                                <input type="text" name="password_database" id="password_database" value="${account.password}" hidden>
                                                <label>Vui Lòng Nhập Mật Khẩu: <span class="required">*</span></label>
                                                <input placeholder="Xác Nhận Mật Khẩu" name="passwordThanhToan" id="passwordThanhToan" type="password" >
                                            </div>
                                            <div class="order-button-payment">
                                                <input value="Place order" type="submit" onclick="return validatePasswordThanhToan()">
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!--Checkout Area End-->
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
        <script src="userPugins/js/mycode.js"></script>



        <!-- checkout31:27-->
</html>

