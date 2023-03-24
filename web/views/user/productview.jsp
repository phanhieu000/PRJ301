<%-- 
    Document   : productview
    Created on : 09-10-2022, 03:20:07
    Author     : phanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

    <!-- single-product-tab-style-top31:50-->
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
            <c:set var="p" value="${requestScope.product}"/>
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul class="">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li><a href="shop?cid=${p.category.categoryID}">${p.category.categoryName}</a></li>
                            <li class="active">${p.productName}</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- content-wraper start -->
            <div class="content-wraper">
                <div class="container">
                    <div class="row single-product-area">
                        <div class="col-lg-5 col-md-6">
                            <!-- Product Details Left -->
                            <div class="product-details-left pt-60">
                                <div class="product-details-thumbs slider-thumbs-1 mb-4">
                                    <c:if test="${p.image.imageFirst != null && p.image.imageFirst != ''}">
                                        <div class="sm-image"><img  src="${p.image.imageFirst}" alt="product image 1"></div>
                                        </c:if>
                                        <c:if test="${p.image.imageSecond != null && p.image.imageSecond != ''}">
                                        <div class="sm-image"><img  src="${p.image.imageSecond}" alt="product image 2"></div>
                                        </c:if>
                                        <c:if test="${p.image.imageThree != null && p.image.imageThree != ''}">
                                        <div class="sm-image"><img  src="${p.image.imageThree}" alt="product image 3"></div>
                                        </c:if>
                                        <c:if test="${p.image.imageFour != null && p.image.imageFour != ''}">
                                        <div class="sm-image"><img  src="${p.image.imageFour}" alt="product image 4"></div>
                                        </c:if>
                                        <c:if test="${p.image.imageFive != null && p.image.imageFive != ''}">
                                        <div class="sm-image"><img  src="${p.image.imageFive}" alt="product image 5"></div>
                                        </c:if>
                                </div>
                                <div class="product-details-images slider-navigation-1 mt-4">
                                    <c:if test="${p.image.imageFirst != null && p.image.imageFirst != ''}">
                                        <div class="lg-image">
                                            <a class="popup-img venobox vbox-item" href="${p.image.imageFirst}" data-gall="myGallery">
                                                <img  src="${p.image.imageFirst}" alt="product image">
                                            </a>
                                        </div>
                                    </c:if>
                                    <c:if test="${p.image.imageSecond != null && p.image.imageSecond != ''}">
                                        <div class="lg-image">
                                            <a class="popup-img venobox vbox-item" href="${p.image.imageSecond}" data-gall="myGallery">
                                                <img  src="${p.image.imageSecond}" alt="product image 2">
                                            </a>
                                        </div>
                                    </c:if>
                                    <c:if test="${p.image.imageThree != null && p.image.imageThree != ''}">
                                        <div class="lg-image">
                                            <a class="popup-img venobox vbox-item" href="${p.image.imageThree}" data-gall="myGallery">
                                                <img   src="${p.image.imageThree}" alt="product image 3">
                                            </a>
                                        </div>
                                    </c:if>
                                    <c:if test="${p.image.imageFour != null && p.image.imageFour != ''}">
                                        <div class="lg-image">
                                            <img  src="${p.image.imageFour}" alt="product image 4">
                                        </div>
                                    </c:if>
                                    <c:if test="${p.image.imageFive != null && p.image.imageFive != ''}">
                                        <div class="lg-image">
                                            <img  src="${p.image.imageFive}" alt="product image 5">
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <!--// Product Details Left -->
                        </div>

                        <div class="col-lg-7 col-md-6">
                            <div class="product-details-view-content pt-60">
                                <div class="product-info">
                                    <h2>${p.productName}</h2>
                                    <span class="product-details-ref">Category: ${p.category.categoryName}</span>
                                    <div class="rating-box pt-20">
                                        <ul class="rating rating-with-review-item">
                                            <c:set var="count" value="1"/>
                                            <c:forEach begin="1" end="${p.rate}" >
                                                <li><i class="fa fa-star-o"></i></li>
                                                    <c:set var="count" value="${count + 1}"/>
                                                </c:forEach>
                                                <c:if test="${count <= 5}">
                                                    <c:forEach begin="${count}" end="5" >
                                                    <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                    </c:forEach>
                                                </c:if>
                                            <li class="ml-1"><small>${requestScope.sizeReview} review</small></li>
                                        </ul>

                                    </div>

                                    <c:if test="${p.discount != 0}">
                                        <div class="price-box">
                                            <span class="new-price new-price-2">${p.lastPriceFormat} đ</span>
                                            <span class="old-price ml-4">${p.priceFormat} đ</span>
                                            <span class="discount-percentage ml-2">  - ${p.discountPercent} </span>
                                        </div>

                                    </c:if>

                                    <c:if test="${p.discount == 0}">
                                        <div class="price-box">
                                            <span class="new-price">${p.lastPriceFormat}</span>
                                        </div>
                                    </c:if>

                                    <div class="product-desc">
                                        <p>
                                            <span>${p.summary}
                                            </span>
                                        </p>
                                    </div>

                                    <div class="product-variants" style="margin-top: 0">
                                        <div class="produt-variants-size">
                                            <form action="" class="cart-quantity" method="post">

                                                <label>Color</label>
                                                <c:set var="color" value="${requestScope.product.color}"/>
                                                <c:if test="${color.colorFirst != null && color.colorFirst != ''}">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input type="radio" class="custom-control-input" id="${color.colorFirst}" name="color" value="1" checked>
                                                        <label class="custom-control-label" for="${color.colorFirst}">${color.colorFirst}</label>
                                                    </div>
                                                </c:if>
                                                <c:if test="${color.colorSecond != null && color.colorSecond != ''}">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input type="radio" class="custom-control-input" id="${color.colorSecond}" name="color" value="2">
                                                        <label class="custom-control-label" for="${color.colorSecond}">${color.colorSecond}</label>
                                                    </div>
                                                </c:if>
                                                <c:if test="${color.colorThree != null && color.colorThree != ''}">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input type="radio" class="custom-control-input" id="${color.colorThree}" name="color" value="3">
                                                        <label class="custom-control-label" for="${color.colorThree}">${color.colorThree}</label>
                                                    </div>
                                                </c:if>
                                                <c:if test="${color.colorFour != null && color.colorFour != ''}">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input type="radio" class="custom-control-input" id="${color.colorFour}" name="color" value="4">
                                                        <label class="custom-control-label" for="${color.colorFour}">${color.colorFour}</label>
                                                    </div>
                                                </c:if>
                                                <c:if test="${color.colorFive != null && color.colorFive != ''}">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input type="radio" class="custom-control-input" id="${color.colorFive}" name="color" value="5">
                                                        <label class="custom-control-label" for="${color.colorFive}">${color.colorFive}</label>
                                                    </div>
                                                </c:if>
                                                <div class="quantity mt-4">
                                                    <label>Quantity</label>
                                                    <div class="cart-plus-minus">
                                                        <input class="cart-plus-minus-box" name="quantity" value="1" type="text">
                                                        <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                                                        <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                                    </div>
                                                </div>
                                                <input type="text" name="id" value="${p.productID}" hidden >
                                                <button class="add-to-cart" type="submit">Thêm Vào Giỏ Hàng</button>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="block-reassurance">
                                        <ul>
                                            <li>
                                                <div class="reassurance-item">
                                                    <div class="reassurance-icon">
                                                        <i class="fa fa-check-square-o"></i>
                                                    </div>
                                                    <p>Bảo Mật Thông Tin Khách Hàng 99%</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="reassurance-item">
                                                    <div class="reassurance-icon">
                                                        <i class="fa fa-truck"></i>
                                                    </div>
                                                    <p>Giao Hàng Nhanh Trong 7 Ngày Làm Việc Từ Khi Đặt Hàng</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="reassurance-item">
                                                    <div class="reassurance-icon">
                                                        <i class="fa fa-exchange"></i>
                                                    </div>
                                                    <p>Đổi Trả Miễn Phí Trong 1 Tháng Đầu Sử Dụng</p>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
            <!-- content-wraper end -->
            <!-- Begin Product Area -->
            <div class="product-area pt-35">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="li-product-tab">
                                <ul class="nav li-product-menu">
                                    <li><a class="${status == 0  ? 'active': ''}" data-toggle="tab" href="#description"><span>Description</span></a></li>
                                    <li><a data-toggle="tab" href="#product-details"><span>Product Details</span></a></li>
                                    <li><a data-toggle="tab" href="#reviews" class="${status == 1 ? 'active show' : ''}"><span>Reviews <small>(${requestScope.sizeReview})</small></span></a></li>
                                </ul>               
                            </div>
                            <!-- Begin Li's Tab Menu Content Area -->
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="description" class="tab-pane ${status == 0 ? 'active show': ''}" role="tabpanel">
                            <div class="product-description">
                                <span>${p.summary}
                            </div>
                        </div>
                        <div id="product-details" class="tab-pane" role="tabpanel">
                            <div class="product-details-manufacturer">

                                <h6 class="mb-3">Thiết Kế, Trọng Lượng</h6>

                                <table class="table table-striped table-bordered">
                                    <tbody>
                                        <tr>
                                            <th scope="row">Kích Thước:</th>
                                            <td>${p.size}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Trọng Lượng:</th>
                                            <td>${p.weight}</td>
                                        </tr>
                                    </tbody>
                                </table>

                                <h6 class="mb-3">Thông Số Kỹ Thuật</h6>

                                <table class="table table-striped table-bordered">
                                    <tbody>
                                        <tr>
                                            <th scope="row">Màn Hình:</th>
                                            <td>${p.screen}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Camera Sau: </th>
                                            <td>${p.camera}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Camera Selfie: </th>
                                            <td>${p.cameraSelfie}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">RAM: </th>
                                            <td>${p.RAM}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">CPU: </th>
                                            <td>${p.CPU}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">GPU: </th>
                                            <td>${p.card}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Camera Sau: </th>
                                            <td>${p.camera}</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                        <div id="reviews" class="tab-pane ${status == 1 ? 'active show' : ''}" role="tabpanel">
                            <div class="product-reviews">
                                <div class="product-details-comment-block">
                                    <div class="comment-review">
                                        <c:if test="${requestScope.sizeReview != 0}">
                                            <c:forEach items="${listByPage}" var="pr">
                                                <div class="comment-author-infos pt-10">
                                                    <span>${pr.account.information.fullName} <small class="ml-10">${pr.reviewTime}</small></span>
                                                </div>
                                                <span>Rate</span>
                                                <ul class="rating">
                                                    <c:set var="count" value="1"/>
                                                    <c:forEach begin="1" end="${pr.rate}" >
                                                        <li><i class="fa fa-star-o"></i></li>
                                                            <c:set var="count" value="${count + 1}"/>
                                                        </c:forEach>
                                                        <c:if test="${count <= 5}">
                                                            <c:forEach begin="${count}" end="5" >
                                                            <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                            </c:forEach>
                                                        </c:if>
                                                </ul>
                                                <div class="comment-details">
                                                    <p>${pr.content}</p>
                                                </div>
                                            </c:forEach>
                                            <c:if test="${numberPage > 1}">
                                                <div class="col-lg-6 col-md-6" style="padding-left: 0; margin-bottom: 1rem">
                                                    <ul class="pagination justify-content-start">
                                                        <li class="page-item ${page == 1 ? 'disabled' : ''}"><a class="page-link" href="productview?id=${p.productID}&page=${page-1}${producerS != null ? "&pid=" : ''}${producerS != null ? producerS : ''}${categoryS != null ? "&cid=" : ""}${categoryS != null ? categoryS : ""}${search != null ? '&search=' : ''}${search != null ? search : ''}${sortBy != null ? '&sortBy=': ''}${sortBy != null ? sortBy : ''}">Previous</a></li>
                                                            <c:forEach begin="${1}" end="${numberPage}" var="i">
                                                            <li class="page-item ${i==page ? "active" : ""}"><a class="page-link"
                                                                                                                href="productview?id=${p.productID}&page=${i}${producerS != null ? "&pid=" : ''}${producerS != null ? producerS : ''}${categoryS != null ? "&cid=" : ''}${categoryS != null ? categoryS : ''}${search != null ? '&search=' : ''}${search != null ? search : ''}${sortBy != null ? '&sortBy=': ''}${sortBy != null ? sortBy : ''}">${i}</a></li>
                                                            </c:forEach>
                                                        <li class="page-item ${page == numberPage ? 'disabled' : ''}"><a class="page-link" href="productview?id=${p.productID}&page=${page+1}${producerS != null ? "&pid=" : ""}${producerS != null ? producerS : ""}${categoryS != null ? "&cid=" : ""}${categoryS != null ? categoryS : ""}${search != null ? '&search=' : ''}${search != null ? search : ''}${sortBy != null ? '&sortBy=': ''}${sortBy != null ? sortBy : ''}">Next</a></li>
                                                    </ul>
                                                </div>
                                            </c:if>

                                        </c:if>

                                        <c:if test="${requestScope.sizeReview == 0}">
                                            <h2 class="text-center">Chưa Có Review Nào</h2>

                                        </c:if>
                                    </div>

                                    <div class="review-btn">
                                        <c:if test="${sessionScope.account == null}">
                                            <a class="review-links" href="#" onclick="checkLogin();">Write Your Review!</a>
                                        </c:if>

                                        <c:if test="${sessionScope.account != null}">
                                            <a class="review-links" href="#" data-toggle="modal" data-target="#writeReview">Write Your Review!</a>
                                        </c:if>
                                        <script>
                                            function checkLogin() {
                                                window.alert("Bạn Phải Đăng Nhập Để Review !");
                                                window.location = "http://localhost:9999/myproject/login";
                                            }
                                        </script>
                                    </div>

                                    <!-- Begin Quick View | Modal Area -->
                                    <div class="modal fade modal-wrapper" id="writeReview" >
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <h3 class="review-page-title">Viết Bình Luận Của Bạn</h3>
                                                    <div class="modal-inner-area row">
                                                        <div class="col-lg-6">
                                                            <div class="li-review-product">
                                                                <img width="100%" src="${p.image.imageFirst}" alt="ảnh product">
                                                                <div class="li-review-product-desc">
                                                                    <p class="li-product-name">${p.productName}
                                                                    <ul class="rating">
                                                                        <c:set var="count" value="1"/>
                                                                        <c:forEach begin="1" end="${p.rate}" >
                                                                            <li><i class="fa fa-star-o"></i></li>
                                                                                <c:set var="count" value="${count + 1}"/>
                                                                            </c:forEach>
                                                                            <c:if test="${count <= 5}">
                                                                                <c:forEach begin="${count}" end="5" >
                                                                                <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                    </ul>
                                                                    </p>
                                                                    <p><span>Hãng Sản Xuất: ${p.producer.producerName}</span></p>
                                                                    <p><span>Thời Gian Ra Mắt: ${p.createTime}</span></p>
                                                                    <p><span>Giá Thị Trường: ${p.lastPriceFormat} đ</span></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 mt-2">
                                                            <div class="li-review-content">
                                                                <!-- Begin Feedback Area -->
                                                                <div class="feedback-area">
                                                                    <div class="feedback">
                                                                        <h3 class="feedback-title">Your Feedback</h3>
                                                                        <form action="review" method="post">

                                                                            <p class="your-opinion">
                                                                                <label>Your Rating</label>
                                                                                <span>
                                                                                    <select class="star-rating" name="rate">
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                        <option value="4">4</option>
                                                                                        <option value="5">5</option>
                                                                                    </select>
                                                                                </span>
                                                                            </p>
                                                                            <p class="feedback-form">
                                                                                <label for="feedback">Your Review</label>
                                                                                <textarea id="feedback" name="content" cols="45" rows="9" aria-required="true"></textarea>
                                                                            </p>
                                                                            <div class="feedback-input">
                                                                                <div class="feedback-btn pb-15">
                                                                                    <button class="close" data-dismiss="modal" aria-label="Close">Close</button>
                                                                                    <button class="feedback-btn-submit close" type="submit" value="Submit">Submit</button>
                                                                                </div>
                                                                            </div>
                                                                            <input type="text" name="productID" value="${p.productID}" hidden>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                                <!-- Feedback Area End Here -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>   
                                    <!-- Quick View | Modal Area End Here -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Product Area End Here -->
            <!-- Begin Li's Laptop Product Area -->
            <section class="product-area li-laptop-product pt-30 pb-50">
                <div class="container">
                    <div class="row">
                        <!-- Begin Li's Section Area -->
                        <div class="col-lg-12">
                            <div class="li-section-title">
                                <h2>
                                    <span>Sản Phẩm Tương Tự </span>
                                </h2>
                            </div>
                            <div class="row">
                                <div class="product-active owl-carousel">
                                    <c:forEach items="${requestScope.listProductSameCategory}" var="psc">
                                        <div class="col-lg-12">
                                            <!-- single-product-wrap start -->
                                            <div class="single-product-wrap">
                                                <div class="product-image">
                                                    <a href="productview?id=${psc.productID}">
                                                        <img src="${psc.image.imageFirst}" alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">New</span>
                                                </div>
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <div class="product-review">
                                                            <h5 class="manufacturer">
                                                                <a href="#">${psc.category.categoryName}</a>
                                                            </h5>
                                                            <div class="rating-box">
                                                                <ul class="rating">
                                                                    <c:set var="count" value="1"/>
                                                                    <c:forEach begin="1" end="${psc.rate}" >
                                                                        <li><i class="fa fa-star-o"></i></li>
                                                                            <c:set var="count" value="${count + 1}"/>
                                                                        </c:forEach>
                                                                        <c:if test="${count <= 5}">
                                                                            <c:forEach begin="${count}" end="5" >
                                                                            <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                            </c:forEach>
                                                                        </c:if>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <h4><a class="product_name" style="min-height: 51px" href="productview?id=${psc.productID}">${psc.productName}</a></h4>
                                                        <div class="price-box">
                                                            <c:if test="${psc.discount != 0}">
                                                                <span class="new-price new-price-2">${psc.lastPriceFormat}</span>
                                                                <span class="old-price">${psc.priceFormat}</span>
                                                                <span class="discount-percentage">  - ${psc.discountPercent}  </span>
                                                            </c:if>

                                                            <c:if test="${psc.discount == 0}">
                                                                <span class="new-price">${psc.priceFormat} VND</span>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                    <div class="add-actions">
                                                        <ul class="add-actions-link">
                                                            <li class="add-cart active"><a href="#">Add to cart</a></li>
                                                            <li><a class="links-details" href=""><i class="fa fa-heart-o"></i></a></li>
                                                            <li><a href="productview?id=${psc.productID}" title="Xem Sản Phẩm" class="quick-view-btn"><i class="fa fa-eye"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- single-product-wrap end -->
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!-- Li's Section Area End Here -->
                    </div>
                </div>
            </section>
            <!-- Li's Laptop Product Area End Here -->
            <!-- Begin Footer Area -->

            <!-- Footer Static Top Area End Here -->
            <!-- Begin Footer Static Middle Area -->
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

    <!-- single-product-tab-style-top31:50-->
</html>

