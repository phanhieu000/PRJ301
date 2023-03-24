<%-- 
    Document   : shop
    Created on : 17-09-2022, 17:10:13
    Author     : phanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html >

    <head>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Shop</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="images/menu/logo/logo.jpg">
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
            .add-actions-link button.add-cart {
                color: #a4a4a4;
                font-size: 13px;
                font-weight: 500;
                text-transform: uppercase;
            }
        </style>
    </head>
    <body class="text-capitalize">
        <!-- Begin Body Wrapper -->
        <jsp:useBean id="pd" class="com.mywebsite.DAO.product.ProductDAO"/>
        <jsp:useBean id="cd" class="com.mywebsite.DAO.product.CategoryDAO"/>
        <jsp:useBean id="prd" class="com.mywebsite.DAO.product.ProducerDAO"/>
        <c:set var="listCategory" value="${cd.all}"/>
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
                            <li class="active">${category.categoryName}</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- Begin Li's Content Wraper Area -->
            <div class="content-wraper pt-60 pb-60 pt-sm-30">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 order-1 order-lg-2">
                            <!-- Begin Li's Banner Area -->
                            <div class="single-banner shop-page-banner">
                                <a href="#">
                                    <img src="userPugins/images/bg-banner/2.jpg" alt="Li's Static Banner">
                                </a>
                            </div>
                            <!-- Li's Banner Area End Here -->
                            <!-- shop-top-bar start -->
                            <div class="shop-top-bar mt-30">
                                <div class="shop-bar-inner">
                                    <div class="product-view-mode">
                                        <!-- shop-item-filter-list start -->
                                        <ul class="nav shop-item-filter-list" role="tablist">
                                            <li class="active" role="presentation">
                                                <a aria-selected="true" class="active show" data-toggle="tab" role="tab"
                                                   aria-controls="grid-view" href="#grid-view"><i class="fa fa-th"></i></a>
                                            </li>

                                        </ul>
                                        <!-- shop-item-filter-list end -->
                                    </div>
                                    <div class="toolbar-amount">

                                    </div>
                                </div>
                                <div class="product-select-box">
                                    <div class="product-short">
                                        <p>Sort By:</p>
                                        <form action="" method="get">


                                            <select class="nice-select" name="sortBy" onchange="this.form.submit()">
                                                <option value="Default" ${sortBy == 'Default' ? 'selected' : ''}>Default</option>
                                                <option value="name" ${sortBy == 'name' ? 'selected' : ''}>Name (Z - A)</option>
                                                <option value="price"${sortBy == 'price' ? 'selected' : ''}>Price (Low &gt; High)</option>
                                                <option value="rate" ${sortBy == 'rate' ? 'selected' : ''}>Rating (High)</option>
                                            </select>


                                            <c:forEach begin="0" end="${listProducer.size() - 1}" var="i">

                                                <li class="form-check-label">
                                                    <input hidden type="checkbox" value="${listProducer.get(i).getProducerID()}" 
                                                           ${producerCheck[i] ? 'checked' : ''} name="pid"> </li>
                                                </c:forEach>
                                            <ul class="form-check">
                                                <c:forEach begin="0" end="${listCategory.size() - 1}" var="i">
                                                    <li class="form-check-label">
                                                        <input hidden type="checkbox" value="${listCategory.get(i).getCategoryID()}" 
                                                               ${categoryCheck[i] ? 'checked' : ''} name="cid"> </li>
                                                    </c:forEach>
                                            </ul>
                                            <c:if test="${search != null}">
                                                <input type="text" name="search" value="${search}" hidden>
                                            </c:if>
                                            <c:if test="${price != null}">
                                                <input type="text" name="price" value="${price}" hidden>
                                            </c:if>

                                        </form>
                                    </div>
                                </div>
                                <!-- product-select-box start -->
                                <!-- product-select-box end -->
                            </div>
                            <!-- shop-top-bar end -->
                            <!-- shop-products-wrapper start -->

                            <div class="shop-products-wrapper">
                                <c:set var="cid" value="${id}"/>
                                <div class="tab-content">
                                    <c:if test="${totalItem != 0}">
                                        <div id="grid-view" class="tab-pane fade active show" role="tabpanel">
                                            <div class="product-area shop-product-area">
                                                <div class="row">
                                                    <!-- single-product-wrap start -->
                                                    <c:forEach items="${listByPage}" var="p">

                                                        <div class="col-lg-4 col-md-4 col-sm-6 mt-40">
                                                            <form action="" method="post">
                                                                <div class="single-product-wrap">
                                                                    <div class="product-image">
                                                                        <a href="productview?id=${p.productID}">
                                                                            <img src="${p.image.imageFirst}" alt="Li's Product Image">
                                                                        </a>
                                                                        <span class="sticker">New</span>
                                                                    </div>
                                                                    <div class="product_desc">
                                                                        <div class="product_desc_info">
                                                                            <div class="product-review">
                                                                                <h5 class="manufacturer">
                                                                                    <a href="#">${p.category.categoryName}</a>
                                                                                </h5>
                                                                                <div class="rating-box">
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
                                                                                </div>
                                                                            </div>
                                                                            <h4><a class="product_name text-center" href="productview?id=${p.productID}" style="min-height: 36px">${p.productName}</a></h4>
                                                                            <div class="price-box">
                                                                                <c:if test="${p.discount != 0}">
                                                                                    <span class="new-price new-price-2">${p.lastPriceFormat}</span>
                                                                                    <span class="old-price">${p.priceFormat}</span>
                                                                                    <span class="discount-percentage">  - ${p.discountPercent}  </span>
                                                                                </c:if>
                                                                                <c:if test="${p.discount == 0}">
                                                                                    <span class="new-price text-center">${p.priceFormat} Đ</span>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                        <div class="add-actions">
                                                                            <ul class="add-actions-link">
                                                                                <input class="addToCartCss" type="submit" value="Add To Cart">
                                                                                <!--<li class="add-cart active"><a>Add To Cart</a></li>-->
                                                                                <input type="text" name="id" value="${p.productID}" hidden>
                                                                                <input type="text" name="quantity" value="1" hidden>
                                                                                <input type="text" name="color" value="1" hidden>
                                                                                <li><a href="productview?id=${p.productID}" title="Xem Sản Phẩm" class="quick-view-btn"><i class="fa fa-eye"></i></a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:set var="producer" value="${listProducer}"/>
                                    <c:set var="producerCheck" value="${producerCheck}"/> 

                                    <c:if test="${numberPage == 0}">
                                        <div class="alert alert-danger text-center mt-50">
                                            <strong>Xin Lỗi !</strong> Hiện Tại Mục Này Chưa Có Sản Phẩm
                                        </div>
                                    </c:if>

                                    <c:if test="${numberPage != 0}">
                                        <div class="paginatoin-area">
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 pt-xs-15">
                                                    <p style="align-items: center">Showing ${start} - ${end} of ${totalItem} Product(s)</p>
                                                </div>

                                                <div class="col-lg-6 col-md-6">
                                                    <ul class="pagination justify-content-end">
                                                        <li class="page-item ${page == 1 ? 'disabled' : ''}"><a class="page-link" href="shop?page=${page-1}${producerS != null ? "&pid=" : ''}${producerS != null ? producerS : ''}${categoryS != null ? "&cid=" : ""}${categoryS != null ? categoryS : ""}${search != null ? '&search=' : ''}${search != null ? search : ''}${sortBy != null ? '&sortBy=': ''}${sortBy != null ? sortBy : ''}${price != null ? '&price=' : ''}${price != null ? price : ''}">Previous</a></li>
                                                            <c:forEach begin="${1}" end="${numberPage}" var="i">
                                                            <li class="page-item ${i==page ? "active" : ""}"><a class="page-link"
                                                                                                                href="shop?page=${i}${producerS != null ? "&pid=" : ''}${producerS != null ? producerS : ''}${categoryS != null ? "&cid=" : ''}${categoryS != null ? categoryS : ''}${search != null ? '&search=' : ''}${search != null ? search : ''}${sortBy != null ? '&sortBy=': ''}${sortBy != null ? sortBy : ''}${price != null ? '&price=' : ''}${price != null ? price : ''}">${i}</a></li>
                                                            </c:forEach>
                                                        <li class="page-item ${page == numberPage ? 'disabled' : ''}"><a class="page-link" href="shop?page=${page+1}${producerS != null ? "&pid=" : ""}${producerS != null ? producerS : ""}${categoryS != null ? "&cid=" : ""}${categoryS != null ? categoryS : ""}${search != null ? '&search=' : ''}${search != null ? search : ''}${sortBy != null ? '&sortBy=': ''}${sortBy != null ? sortBy : ''}${price != null ? '&price=' : ''}${price != null ? price : ''}">Next</a></li>
                                                    </ul>

                                                </div>


                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <!-- shop-products-wrapper end -->
                        </div>
                        <div class="col-lg-3 order-2 order-lg-1">
                            <!--sidebar-categores-box start  -->
                            <div class="sidebar-categores-box mt-sm-30 mt-xs-30">
                                <div class="sidebar-title">
                                    <h2>Categories</h2>
                                </div>
                                <!-- category-sub-menu start -->
                                <div class="category-sub-menu">
                                    <ul>
                                        <c:forEach items="${listCategory}" var="c">
                                            <li class="has-sub"><a href="shop?cid=${c.categoryID}">${c.categoryName}</a>
                                                <ul>
                                                    <c:if test="${c.categoryName eq 'Laptop'}">
                                                        <c:forEach items="${listProducerLaptop}" var="pl">
                                                            <li><a href="shop?cid=${c.categoryID}&pid=${pl.producerID}">${pl.producerName}</a></li>
                                                            </c:forEach>
                                                        </c:if>

                                                    <c:if test="${c.categoryName eq 'SmartPhone'}">
                                                        <c:forEach items="${listProducerSmartphone}" var="pl">
                                                            <li><a href="shop?cid=${c.categoryID}&pid=${pl.producerID}">${pl.producerName}</a></li>
                                                            </c:forEach>
                                                        </c:if>
                                                        <c:if test="${c.categoryName eq 'Tablet'}">
                                                            <c:forEach items="${listProducerTablet}" var="pl">
                                                            <li><a href="shop?cid=${c.categoryID}&pid=${pl.producerID}">${pl.producerName}</a></li>
                                                            </c:forEach>
                                                        </c:if>

                                                    <c:if test="${c.categoryName eq 'Apple'}">
                                                        <c:forEach items="${listSubcategoryApple}" var="psa">
                                                            <li><a href="shop?cid=${psa.categoryID}">${psa.categoryName}</a></li>
                                                            </c:forEach>
                                                        </c:if>
                                                </ul>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <!-- category-sub-menu end -->
                            </div>
                            <!--sidebar-categores-box end  -->
                            <!--sidebar-categores-box start  -->
                            <div class="sidebar-categores-box">
                                <div class="sidebar-title">
                                    <h2>Selects</h2>
                                </div>
                                <div class="filter-sub-area">
                                    <h5 class="filter-sub-titel">Category</h5>
                                    <div class="categori-checkbox">

                                        <form action="shop">
                                            <c:forEach begin="0" end="${listProducer.size() - 1}" var="i">

                                                <li class="form-check-label">
                                                    <input hidden type="checkbox" value="${listProducer.get(i).getProducerID()}" 
                                                           ${producerCheck[i] ? 'checked' : ''} name="pid"> </li>
                                                </c:forEach>
                                            <ul class="form-check">
                                                <c:forEach begin="0" end="${listCategory.size() - 1}" var="i">
                                                    <li class="form-check-label">
                                                        <input type="checkbox" value="${listCategory.get(i).getCategoryID()}" 
                                                               ${categoryCheck[i] ? 'checked' : ''} name="cid" class="form-check-input" onclick="this.form.submit()"> ${listCategory.get(i).getCategoryName()}</li>
                                                    </c:forEach>
                                            </ul>
                                            <c:if test="${sortBy != null}">
                                                <input type="text" name="sortBy" value="${sortBy}" hidden>
                                            </c:if>
                                            <c:if test="${search != null}">
                                                <input type="text" name="search" value="${search}" hidden>
                                            </c:if>
                                            <c:if test="${price != null}">
                                                <input type="text" name="price" value="${price}" hidden>
                                            </c:if>
                                        </form>
                                    </div>
                                </div>
                                <!-- btn-clear-all start -->
                                <!-- <button class="btn-clear-all mb-sm-30 mb-xs-30">Clear all</button> -->
                                <!-- btn-clear-all end -->
                                <!-- filter-sub-area start -->
                                <div class="filter-sub-area">
                                    <h5 class="filter-sub-titel">Hãng Sản Xuất</h5>
                                    <div class="categori-checkbox">

                                        <form action="shop">

                                            <c:forEach begin="0" end="${listCategory.size() - 1}" var="i">
                                                <li class="form-check-label">
                                                    <input hidden type="checkbox" value="${listCategory.get(i).getCategoryID()}" 
                                                           ${categoryCheck[i] ? 'checked' : ''} name="cid" ></li>
                                                </c:forEach>
                                            <ul class="form-check">
                                                <c:forEach begin="0" end="${listProducer.size() - 1}" var="i">
                                                    <li class="form-check-label">
                                                        <input type="checkbox" value="${listProducer.get(i).getProducerID()}" 
                                                               ${producerCheck[i] ? 'checked' : ''} name="pid" class="form-check-input" onclick="this.form.submit()"> ${producer.get(i).getProducerName()} <span class="text-danger">(${producer.get(i).getProducerMeta()})</span></li>
                                                    </c:forEach>
                                            </ul>
                                            <c:if test="${sortBy != null}">
                                                <input type="text" name="sortBy" value="${sortBy}" hidden>
                                            </c:if>
                                            <c:if test="${search != null}">
                                                <input type="text" name="search" value="${search}" hidden>
                                            </c:if>
                                            <c:if test="${price != null}">
                                                <input type="text" name="price" value="${price}" hidden>
                                            </c:if>
                                        </form>
                                    </div>
                                </div>
                                <div class="filter-sub-area pt-sm-10 pt-xs-10">
                                    <h5 class="filter-sub-titel">Price:</h5>
                                    <div class="range-wrap">
                                        <div class="range-value" id="rangeV"> </div>
                                        <form action="" method="get">
                                            <input id="range" name="price" type="range" min="0" max="1000000000" value="${price}" step="1" onchange="this.form.submit()">
                                        </form>
                                    </div>
                                    <script type="text/javascript">
                                        range = document.getElementById('range');
                                        rangeV = document.getElementById('rangeV');
                                        setValue = () => {
                                            const
                                                    newValue = Number((range.value - range.min) * 100 / (range.max - range.min)),
                                                    newPosition = 10 - (newValue * 0.2);
                                            rangeV.innerHTML = '<span>0 - ' + range.value + ' VND</span>';
                                            rangeV.style.left = 'calc(' + newValue + '% + (' + newPosition + 'px))';
                                        };
                                        document.addEventListener("DOMContentLoaded", setValue);
                                        range.addEventListener('input', setValue);
                                    </script>
                                </div>
                            </div>
                            <!--sidebar-categores-box end  -->
                            <!-- category-sub-menu start -->
                            <div class="sidebar-categores-box mb-sm-0 mb-xs-0">
                                <div class="sidebar-title">
                                    <h2>Laptop</h2>
                                </div>
                                <div class="category-tags">
                                    <ul>
                                        <li><a href="# ">MacBook</a></li>
                                        <li><a href="# ">Trống</a></li>
                                        <li><a href="# ">Văn Phòng</a></li>
                                        <li><a href="# ">Trống</a></li>
                                        <li><a href="# ">Gaming</a></li>
                                        <li><a href="# ">Phụ Kiện</a></li>
                                    </ul>
                                </div>
                                <!-- category-sub-menu end -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content Wraper Area End Here -->
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
                                <div class="footer-links"></div>
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
                                    <span><a target="_blank" href="https://www.templateshub.net">Made By Phan Hiếu: www.facebook.com/phanhieu000</a></span>
                                </div>
                                <!-- Copyright Area End Here -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer Static Bottom Area End Here -->
            </div>

            <!-- Footer Area End Here -->
            <!-- Begin Quick View | Modal Area -->
            <div class="modal fade modal-wrapper" id="exampleModalCenter">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <div class="modal-inner-area row">
                                <div class="col-lg-5 col-md-6 col-sm-6">
                                    <!-- Product Details Left -->
                                    <div class="product-details-left">
                                        <div class="product-details-images slider-navigation-1">
                                            <div class="lg-image">
                                                <img src="images/product/large-size/1.jpg" alt="product image">
                                            </div>
                                            <div class="lg-image">
                                                <img src="images/product/large-size/2.jpg" alt="product image">
                                            </div>
                                            <div class="lg-image">
                                                <img src="images/product/large-size/3.jpg" alt="product image">
                                            </div>
                                            <div class="lg-image">
                                                <img src="images/product/large-size/4.jpg" alt="product image">
                                            </div>
                                            <div class="lg-image">
                                                <img src="images/product/large-size/5.jpg" alt="product image">
                                            </div>
                                            <div class="lg-image">
                                                <img src="images/product/large-size/6.jpg" alt="product image">
                                            </div>
                                        </div>
                                        <div class="product-details-thumbs slider-thumbs-1">
                                            <div class="sm-image"><img src="images/product/small-size/1.jpg"
                                                                       alt="product image thumb"></div>
                                            <div class="sm-image"><img src="images/product/small-size/2.jpg"
                                                                       alt="product image thumb"></div>
                                            <div class="sm-image"><img src="images/product/small-size/3.jpg"
                                                                       alt="product image thumb"></div>
                                            <div class="sm-image"><img src="images/product/small-size/4.jpg"
                                                                       alt="product image thumb"></div>
                                            <div class="sm-image"><img src="images/product/small-size/5.jpg"
                                                                       alt="product image thumb"></div>
                                            <div class="sm-image"><img src="images/product/small-size/6.jpg"
                                                                       alt="product image thumb"></div>
                                        </div>
                                    </div>
                                    <!--// Product Details Left -->
                                </div>

                                <div class="col-lg-7 col-md-6 col-sm-6">
                                    <div class="product-details-view-content pt-60">
                                        <div class="product-info">
                                            <h2>Today is a good day Framed poster</h2>
                                            <span class="product-details-ref">Reference: demo_15</span>
                                            <div class="rating-box pt-20">
                                                <ul class="rating rating-with-review-item">
                                                    <li><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                    <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                    <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                    <li class="review-item"><a href="#">Read Review</a></li>
                                                    <li class="review-item"><a href="#">Write Review</a></li>
                                                </ul>
                                            </div>
                                            <div class="price-box pt-20">
                                                <span class="new-price new-price-2">$57.98</span>
                                            </div>
                                            <div class="product-desc">
                                                <p>
                                                    <span>100% cotton double printed dress. Black and white striped top and
                                                        orange high waisted skater skirt bottom. Lorem ipsum dolor sit amet,
                                                        consectetur adipisicing elit. quibusdam corporis, earum facilis et
                                                        nostrum dolorum accusamus similique eveniet quia pariatur.
                                                    </span>
                                                </p>
                                            </div>
                                            <div class="product-variants">
                                                <div class="produt-variants-size">
                                                    <label>Dimension</label>
                                                    <select class="nice-select">
                                                        <option value="1" title="S" selected="selected">40x60cm</option>
                                                        <option value="2" title="M">60x90cm</option>
                                                        <option value="3" title="L">80x120cm</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="single-add-to-cart">
                                                <form action="#" class="cart-quantity">
                                                    <div class="quantity">
                                                        <label>Quantity</label>
                                                        <div class="cart-plus-minus">
                                                            <input class="cart-plus-minus-box" value="1" type="text">
                                                            <div class="dec qtybutton"><i class="fa fa-angle-down"></i>
                                                            </div>
                                                            <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                                        </div>
                                                    </div>
                                                    <button class="add-to-cart" type="submit">Add to cart</button>
                                                </form>
                                            </div>
                                            <div class="product-additional-info pt-25">
                                                <a class="wishlist-btn" href="wishlist.html"><i
                                                        class="fa fa-heart-o"></i>Add to wishlist</a>
                                                <div class="product-social-sharing pt-25">
                                                    <ul>
                                                        <li class="facebook"><a href="#"><i
                                                                    class="fa fa-facebook"></i>Facebook</a></li>
                                                        <li class="twitter"><a href="#"><i
                                                                    class="fa fa-twitter"></i>Twitter</a></li>
                                                        <li class="google-plus"><a href="#"><i
                                                                    class="fa fa-google-plus"></i>Google +</a></li>
                                                        <li class="instagram"><a href="#"><i
                                                                    class="fa fa-instagram"></i>Instagram</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Quick View | Modal Area End Here -->
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
    </body>

    <!-- shop-left-sidebar31:48-->

</html>