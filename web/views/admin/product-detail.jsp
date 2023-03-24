<%-- 
    Document   : product-detail
    Created on : 05-10-2022, 14:52:34
    Author     : phanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!--Slick Carousel CSS-->
        <link rel="stylesheet" href="adminPugins/assets/css/slick/slick.css">
        <link rel="stylesheet" href="adminPugins/assets/css/slick/slick-theme.css">
        <!--Rating Bars-->
        <link rel="stylesheet" href="adminPugins/assets/css/fontawesome-stars.css">
        <!--Datatable-->
        <link rel="stylesheet" href="adminPugins/assets/css/dataTables.bootstrap4.min.css">
        <!--Bootstrap Calendar-->
        <link rel="stylesheet" href="adminPugins/assets/js/calendar/bootstrap_calendar.css">


        <link rel="shortcut icon" type="image/x-icon" href="adminPugins/images/logo/logo.jpg">
        <title>Admin</title>
        <style>
            .slick-prev:before,
            .slick-next:before
            {
                font-size: 20px;
                line-height: 1;
                opacity: .75;
                color: black;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }
        </style>
    </head>

    <body>
        <!--Page loader-->
        <div class="loader-wrapper">
            <div class="loader-circle">
                <div class="loader-wave"></div>
            </div>
        </div>
        <!--Page loader-->

        <!--Page Wrapper-->

        <div class="container-fluid">
            <c:set var="account" value="${accountAdmin}"/>
            <!--Header-->
            <div class="row header shadow-sm">

                <!--Logo-->
                <div class="col-sm-2 pl-0  text-center header-logo">
                    <div class="bg-theme mr-3 pt-3 pb-2 mb-0">
                        <h3 class="logo">
                            <a href="#" class="text-secondary logo">Admin <span class="small">Controller</span>
                            </a>
                        </h3>
                    </div>
                </div>
                <!--Logo-->

                <!--Header Menu-->
                <div class="col-sm-10 header-menu pt-2 pb-0">
                    <div class="row">

                        <div class="col-sm-6 col-4 text-right flex-header-menu justify-content-start">
                            <span class="menu-icon align-self-center" onclick="toggle_sidebar()">
                                <span id="sidebar-toggle-btn"></span>
                            </span>
                        </div>

                        <div class="col-sm-6 col-4 text-right flex-header-menu justify-content-end">
                            <!--Notification icon-->

                            <div class="menu-icon">
                                <a class="" href="#" onclick="toggle_dropdown(this); return false" role="button"
                                   class="dropdown-toggle">
                                    <i class="fa fa-bell align-self-center"></i>
                                    <span class="badge badge-danger ">5</span>
                                </a>
                                <div class="dropdown dropdown-right bg-white shadow border">
                                    <a class="dropdown-item" href="#"><strong>Thông Báo</strong></a>
                                    <div class="dropdown-divider"></div>
                                    <a href="#" class="dropdown-item">
                                        <div class="media">
                                            <div class="align-self-center mr-3 rounded-circle notify-icon bg-primary">
                                                <i class="fa fa-bookmark"></i>
                                            </div>
                                            <div class="media-body">
                                                <h6 class="mt-0"><strong>Meeting</strong></h6>
                                                <p>You have a meeting by 8:00</p>
                                                <small class="text-success">09:23am</small>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a href="#" class="dropdown-item">
                                        <div class="media">
                                            <div class="align-self-center mr-3 rounded-circle notify-icon bg-secondary">
                                                <i class="fa fa-link"></i>
                                            </div>
                                            <div class="media-body">
                                                <h6 class="mt-0"><strong>Events</strong></h6>
                                                <p>Launching new programme</p>
                                                <small class="text-success">09:23am</small>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a href="#" class="dropdown-item">
                                        <div class="media">
                                            <div class="align-self-center mr-3 rounded-circle notify-icon bg-warning">
                                                <i class="fa fa-user"></i>
                                            </div>
                                            <div class="media-body">
                                                <h6 class="mt-0"><strong>Personnel</strong></h6>
                                                <p>New employee arrival</p>
                                                <small class="text-success">09:23am</small>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item text-center link-all" href="#">See all notifications ></a>
                                </div>
                            </div>
                            <!--Notication icon-->
                            <div class="ml-2">
                                <a class="" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false">
                                    <img src="${account.information.avatar}" alt="avatar" class="rounded-circle"
                                         width="40px" height="40px">
                                </a>
                                <div class="dropdown-menu dropdown-menu-right mt-13" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="admin-profile"><i class="fa fa-user pr-2"></i>Profile</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="admin-changepassword"><i class="fa fa-unlock pr-2"></i>Change Password</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="admin-settings"><i class="fa fa-cogs pr-2"></i>Change Profiles</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="admin-logout"><i class="fa fa-power-off pr-2"></i>Logout</a>
                                </div>
                            </div>
                        </div>
                        <!--Search box and avatar-->
                    </div>
                </div>
                <!--Header Menu-->
            </div>
            <!--Header-->

            <!--Main Content-->

            <div class="row main-content">
                <!--Sidebar left-->
                <div class="col-sm-2 col-xs-6 sidebar pl-0">
                    <div class="inner-sidebar mr-3">

                        <!--Sidebar Navigation Menu-->
                        <div class="sidebar-menu-container">
                            <ul class="sidebar-menu mb-4">
                                <li class="parent">
                                    <a href="admin-home" class=""><i class="fa fa-home mr-3"></i>
                                        <span class="none ">Home</span>
                                    </a>
                                </li>
                                </li>
                                <li class="parent">
                                    <a href="#" onclick="toggle_menu('tables'); return false" class=""><i
                                            class="fa fa-tasks mr-3"></i>
                                        <span class="none">Managerment<i
                                                class="fa fa-angle-down pull-right align-bottom"></i></span>
                                    </a>
                                    <ul class="children" id="tables">
                                        <li class="child"><a href="admin-admin" class="ml-4"><i
                                                    class="fa fa-angle-right mr-2"></i>Admins</a></li>
                                        <li class="child"><a href="admin-user" class="ml-4"><i
                                                    class="fa fa-angle-right mr-2"></i>Users</a></li>
                                        <li class="child"><a href="admin-addproduct" class="ml-4"><i
                                                    class="fa fa-angle-right mr-2"></i>Add Product</a></li>
                                        <li class="child"><a href="admin-add-category" class="ml-4"><i
                                                    class="fa fa-angle-right mr-2"></i>Add Category</a></li>
                                        <li class="child"><a href="admin-add-producer" class="ml-4"><i
                                                    class="fa fa-angle-right mr-2"></i>Add Producer</a></li>

                                    </ul>
                                </li>


                                <li class="parent">
                                    <a href="#" onclick="toggle_menu('ecommerce'); return false" class=""><i
                                            class="fa fa-shopping-cart mr-3"></i>
                                        <span class="none">Product <i
                                                class="fa fa-angle-down pull-right align-bottom"></i></span>
                                    </a>
                                    <ul class="children" id="ecommerce">
                                        <li class="child">
                                            <a href="admin-product" class="ml-4"><i class="fa fa-angle-right mr-2"></i> 
                                                Product List</a>
                                        </li>
                                        <li class="child">
                                            <a href="admin-category" class="ml-4"><i class="fa fa-angle-right mr-2"></i> 
                                                Category List</a>
                                        </li>
                                        <li class="child">
                                            <a href="admin-producer" class="ml-4"><i class="fa fa-angle-right mr-2"></i> 
                                                Producer List</a>
                                        </li>
                                        <li class="child">
                                            <a href="admin-order" class="ml-4"><i class="fa fa-angle-right mr-2"></i> 
                                                Order List</a>
                                        </li>
                                    </ul>
                                </li>


                                <li class="parent">
                                    <a href="#" onclick="toggle_menu('charts'); return false" class=""><i
                                            class="fa fa-pie-chart mr-3"></i>
                                        <span class="none">Charts <i
                                                class="fa fa-angle-down pull-right align-bottom"></i></span>
                                    </a>
                                    <ul class="children" id="charts">
                                        <li class="child"><a href="admin-product-chart" class="ml-4"><i
                                                    class="fa fa-angle-right mr-2"></i> Product Chart</a></li>
                                        <li class="child"><a href="admin-review-chart" class="ml-4"><i
                                                    class="fa fa-angle-right mr-2"></i> Review Chart</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!--Sidebar Naigation Menu-->
                    </div>
                </div>
                <!--Sidebar left-->

                <!--Content right-->
                <div class="col-sm-9 col-xs-12 content pt-3 pl-0">
                    <h5 class="mb-0" ><strong>Product View</strong></h5>
                    <span class="text-secondary">Home <i class="fa fa-angle-right"></i> View</span>
                    <c:set  value="${requestScope.product}" var="p"/>
                    <div class="mt-4 mb-4 p-3 bg-white border shadow-sm lh-sm">
                        <!--Product detail-->
                        <div class="product-list">
                            <div class="row">
                                <div class="col-sm-5 col-12">
                                    <div class="slider-for border">
                                        <c:if test="${p.image.imageFirst != null && p.image.imageFirst != ''}">
                                            <img  src="${p.image.imageFirst}" alt="">
                                        </c:if>
                                        <c:if test="${p.image.imageSecond != null && p.image.imageSecond != ''}">
                                            <img  src="${p.image.imageSecond}" alt="">
                                        </c:if>
                                        <c:if test="${p.image.imageThree != null && p.image.imageThree != ''}">
                                            <img  src="${p.image.imageThree}" alt="">
                                        </c:if>
                                        <c:if test="${p.image.imageFour != null && p.image.imageFour != ''}">
                                            <img  src="${p.image.imageFour}" alt="">
                                        </c:if>
                                        <c:if test="${p.image.imageFive != null && p.image.imageFive != ''}">
                                            <img  src="${p.image.imageFive}" alt="">
                                        </c:if>

                                    </div>
                                    <div class="slider-nav pl-4 pr-4 bg-white shadow">
                                        <c:if test="${p.image.imageFirst != null && p.image.imageFirst != ''}">
                                            <img  src="${p.image.imageFirst}" alt="">
                                        </c:if>
                                        <c:if test="${p.image.imageSecond != null && p.image.imageSecond != ''}">
                                            <img  src="${p.image.imageSecond}" alt="">
                                        </c:if>
                                        <c:if test="${p.image.imageThree != null && p.image.imageThree != ''}">
                                            <img  src="${p.image.imageThree}" alt="">
                                        </c:if>
                                        <c:if test="${p.image.imageFour != null && p.image.imageFour != ''}">
                                            <img  src="${p.image.imageFour}" alt="">
                                        </c:if>
                                        <c:if test="${p.image.imageFive != null && p.image.imageFive != ''}">
                                            <img  src="${p.image.imageFive}" alt="">
                                        </c:if>
                                    </div>
                                </div>

                                <div class="col-sm-7 col-12">
                                    <div class="p-2">
                                        <div class="text-right">
                                            <p class="small"><strong>Availability</strong>: 

                                                <span class="${p.SKU eq 'Còn Hàng' ? 'text-success' : 'text-danger'}"> ${p.SKU}</span>
                                            </p>
                                        </div>
                                        <h3 class="mb-3">${p.productName}</h3>
                                        <p class="small"><strong>Category:</strong> ${p.category.categoryName}</p>

                                        <div  class="mt-3 mb-4">
                                            <select id="example">
                                                <option value="1" ${p.rate == 1 ? 'selected' : ''}>1</option>
                                                <option value="2" ${p.rate == 2 ? 'selected' : ''}>2</option>
                                                <option value="3" ${p.rate == 3 ? 'selected' : ''}>3</option>
                                                <option value="4" ${p.rate == 4 ? 'selected' : ''}>4</option>
                                                <option value="5" ${p.rate == 5 ? 'selected' : ''}>5</option>
                                            </select>
                                        </div>
                                        <c:if test="${p.discount == 0}">
                                            <span>${p.priceFormat} Đ</span> 
                                        </c:if>

                                        <c:if test="${p.discount != 0}">
                                            <div  class="mt-3 mb-4">
                                                <span class="text-danger">${p.lastPriceFormat} Đ </span>
                                                - 
                                                <strong><del> ${p.priceFormat} Đ</del></strong>
                                                <div class="menu-icon">
                                                    <strong>&nbsp;</strong>
                                                    <span class="badge badge-danger">${p.discountPercent}</span>
                                                </div>
                                                </span>
                                            </div>
                                        </c:if>    
                                        <hr>
                                        <form class="needs-validation" novalidate>
                                            <div class="form-row">
                                                <div class="col-md-12 mb-3">
                                                    <p class="product-slug">Summary: ${p.summary}</p>
                                                </div>
                                            </div>

                                            <div class="form-row">
                                                <div class="col-md-6 mb-3">
                                                    <p class="product-slug">Số Lượng Trong Kho: ${p.quantity}</p>
                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <p class="product-slug">Số Lượng Mua: ${p.countBuy}</p>

                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <p class="product-slug">Hãng Sản Xuất: ${p.producer.producerName}</p>
                                                </div>


                                            </div>
                                        </form>
                                        <hr>
                                        <div>
                                            <a href="admin-edit-product?id=${p.productID}">
                                                <button type="button" class="btn btn-success rounded-0 mr-3 px-3">
                                                    <i class="fa fa-history mr-3"></i> Chỉnh Sửa
                                                </button>
                                            </a>
                                        </div>
                                    </div>

                                </div>

                            </div>

                        </div>
                        <!--Product Detail-->
                    </div>

                    <div class="mt-4 mb-4 p-3 bg-white button-container border shadow-sm">
                        <div class="product-list custom-tabs">
                            <nav>
                                <div class="nav nav-tabs nav-fill" id="nav-customContent" role="tablist">
                                    <a class="nav-item nav-link active" id="nav-home" data-toggle="tab" href="#custom-home" role="tab" aria-controls="nav-home" aria-selected="true"> Reviews (${requestScope.sizeReview})</a>

                                    <a class="nav-item nav-link" id="nav-profile" data-toggle="tab" href="#custom-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Thông Tin Chi Tiết</a>
                                </div>
                            </nav>

                            <div class="tab-content py-3 px-3 px-sm-0" id="nav-customContent">
                                <div class="tab-pane fade show active p-3" id="custom-home" role="tabpanel" aria-labelledby="nav-home">

                                    <c:forEach items="${requestScope.review}" var="r">
                                        <!--Single feed-->
                                        <div class="feed-single mb-3">
                                            <div class="media">
                                                <c:if test="${r.account.information.avatar ne ''}">
                                                    <img class="mr-3 rounded-circle" height="40px" width="40px" src="${r.account.information.avatar}" alt="avatar">
                                                </c:if>
                                                <c:if test="${r.account.information.avatar eq ''}">
                                                    <img class="mr-3 rounded-circle" height="40px" width="40px" src="adminPugins\images\avatar-user\avatar-default.jpg" alt="avatar">

                                                </c:if>
                                                <div class="media-body">
                                                    <c:if test="${r.account.information.fullName eq ''}">
                                                        <h6 class="mt-1">${r.account.userName}#${r.account.accountID}
                                                            <small class="text-muted pl-3"><i class="fa fa-clock"></i> ${r.reviewTime}</small>
                                                            <p class="clearfix"></p>
                                                        </h6>
                                                    </c:if>
                                                    <c:if test="${r.account.information.fullName ne ''}">
                                                        <h6 class="mt-1">${r.account.information.fullName}
                                                            <small class="text-muted pl-3"><i class="fa fa-clock"></i> ${r.reviewTime}</small>
                                                            <p class="clearfix"></p>
                                                        </h6>
                                                    </c:if>

                                                    <div class="user-rating">
                                                        <select class="reviewRating">
                                                            <option value="1" ${r.rate == 1 ? 'selected' : ''}>1</option>
                                                            <option value="2" ${r.rate == 2 ? 'selected' : ''}>2</option>
                                                            <option value="3" ${r.rate == 3 ? 'selected' : ''}>3</option>
                                                            <option value="4" ${r.rate == 4 ? 'selected' : ''}>4</option>
                                                            <option value="5" ${r.rate == 5 ? 'selected' : ''}>5</option>
                                                        </select>
                                                    </div>
                                                    <p class="mt-2">${r.content}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <!--/Single feed-->
                                    </c:forEach>
                                </div>
                                <!--/Feed tab-->

                                <!--Personal info tab-->
                                <div class="tab-pane fade p-3" id="custom-profile" role="tabpanel" aria-labelledby="nav-profile">

                                    <div class="mt-1 mb-3 p-3 custom-tabs">
                                        <h6 class="mb-3">Product Details</h6>
                                        <strong class="mt-1 ml-4 text-primary">${p.productName}</strong>

                                        <nav>
                                            <div class="nav nav-tabs nav-fill" id="nav-customContent" role="tablist">
                                                <a class="nav-item nav-link active" id="nav-home" data-toggle="tab" href="#product-home" role="tab" aria-controls="nav-home" aria-selected="true">Thông Tin Hàng Hóa</a>
                                                <a class="nav-item nav-link" id="nav-profile" data-toggle="tab" href="#product-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Chi Tiết Linh Kiện</a>
                                                <a class="nav-item nav-link" id="nav-contact" data-toggle="tab" href="#product-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Thống Kê</a>
                                            </div>
                                        </nav>
                                        <div class="tab-content py-3 px-3 px-sm-0" id="nav-customContent">

                                            <div class="tab-pane fade show active" id="product-home" role="tabpanel" aria-labelledby="nav-home">

                                                <div class="form-row">
                                                    <div class="col-md-6 mb-2">
                                                        <div class="col-md-12 mb-3">
                                                            <p class="product-slug">Hãng Sản Xuất: ${p.producer.producerName}</p>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6 mb-2">
                                                        <div class="col-md-12 mb-3">
                                                            <p class="product-slug">Xuất Xứ: ${p.producer.country}</p>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6 mb-2">
                                                        <div class="col-md-12 mb-3">
                                                            <p class="product-slug">Thời Điểm Ra Mắt: ${p.productCreateAt}</p>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6 mb-2">
                                                        <div class="col-md-12 mb-3">
                                                            <p class="product-slug">Thời Gian Bảo Hàng: ${p.warranty} Tháng</p>
                                                        </div>
                                                    </div>


                                                    <div class="col-md-6 mb-2">
                                                        <div class="col-md-12 mb-3">
                                                            <p class="product-slug">Hướng dẫn bảo quản: Để nơi khô ráo, nhẹ tay, dễ vỡ.</p>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6 mb-2">
                                                        <div class="col-md-12 mb-3">
                                                            <p class="product-slug">Hướng dẫn sử dụng: Xem trong sách hướng dẫn sử dụng</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="product-profile" role="tabpanel" aria-labelledby="nav-profile">
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

                                            <div class="tab-pane fade" id="product-contact" role="tabpanel" aria-labelledby="nav-contact">
                                                <p>Thống Kê</p>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!--/Personal info tab-->

                                <!--Resume tab-->

                            </div>
                        </div>
                    </div>

                    <!--Footer-->

                    <!--Footer-->

                </div>
            </div>

            <!--Main Content-->

        </div>

        <!--Page Wrapper-->

        <!-- Page JavaScript Files-->
        <script src="adminPugins/assets/js/jquery.min.js"></script>
        <script src="adminPugins/assets/js/jquery-1.12.4.min.js"></script>
        <!--Popper JS-->
        <script src="adminPugins/assets/js/popper.min.js"></script>
        <!--Bootstrap-->
        <script src="adminPugins/assets/js/bootstrap.min.js"></script>
        <!--Sweet alert JS-->
        <script src="adminPugins/assets/js/sweetalert.js"></script>
        <!--Progressbar JS-->
        <script src="adminPugins/assets/js/progressbar.min.js"></script>
        <!--Slick Courasel-->
        <script src="adminPugins/assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="adminPugins/assets/css/slick/slick.min.js"></script>
        <script src="adminPugins/assets/js/product-carousel.js"></script>
        <!--Bootstrap Calendar JS-->
        <script src="adminPugins/assets/js/calendar/bootstrap_calendar.js"></script>
        <script src="adminPugins/assets/js/calendar/demo.js"></script>
        <!--Bar rating-->
        <script src="adminPugins/assets/js/jquery.barrating.min.js"></script>

        <!--Custom Js Script-->
        <script src="adminPugins/assets/js/custom.js"></script>

    </body>
</html>
