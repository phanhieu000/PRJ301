<%-- 
    Document   : profile
    Created on : 05-10-2022, 14:46:21
    Author     : phanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!--Meta Responsive tag-->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!--Bootstrap CSS-->
        <link rel="stylesheet" href="adminPugins/assets/css/bootstrap.min.css">
        <!--Font Awesome-->
        <link rel="stylesheet" href="adminPugins/assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="adminPugins/assets/css/fontawesome.css">
        <!--Custom style.css-->
        <link rel="stylesheet" href="adminPugins/assets/css/quicksand.css">
        <link rel="stylesheet" href="adminPugins/assets/css/style.css">
        <!--Chartist CSS-->
        <link rel="stylesheet" href="adminPugins/assets/css/chartist.min.css">
        <!--Bootstrap Calendar-->
        <link rel="stylesheet" href="adminPugins/assets/js/calendar/bootstrap_calendar.css">

        <link rel="shortcut icon" type="image/x-icon" href="adminPugins/images/logo/logo.jpg">
        <title>Admin</title>

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
                    <h5 class="mb-0"><strong>Profile</strong></h5>
                    <span class="text-secondary">Home <i class="fa fa-angle-right"></i> Profile</span>
                    <c:set var="account" value="${sessionScope.accountAdmin}"/>
                    <div class="row mt-3">
                        <div class="col-sm-12">
                            <!--User profile header-->
                            <div class="mt-1 mb-3 button-container bg-white border shadow-sm">
                                <div class="profile-bg p-5">
                                    <img id="wizardPicturePreview" src="${account.information.avatar}" height="125px" width="125px"
                                         class="rounded-circle shadow profile-img" />
                                </div>
                                <div class="profile-bio-main container-fluid">
                                    <div class="row">
                                        <div class="col-md-5 offset-md-3 col-sm-12 offset-sm-0 col-12 bio-header">
                                            <h3 class="mt-4">${account.information.fullName}</h3>
                                            <span class="text-muted mt-0 bio-request">${account.action.adminRole}</span>
                                            
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-12 px-5 text-right pt-4 bio-comment">
                                            <button type="button" class="btn btn-default">
                                                <i class="far fa-comment"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--/User profile header-->

                        </div>
                    </div>

                    <div class="row mt-3">
                        <!--User profile sidebar-->
                        <div class="col-sm-12 col-md-4">
                            <div class="mt-1 mb-3 p-3 button-container bg-white border shadow-sm">

                                <div class="mb-3">
                                    <div class="row user-about">
                                        <div class="col-sm-4 col-4 border-right text-center">
                                            <h4>00</h4>
                                            <p>Orders</p>
                                        </div>
                                        <div class="col-sm-4 col-4 text-center">
                                            <h4 style="font-size: 1.3rem; padding-bottom: 0.3rem">${acc.information.address}</h4>
                                            <p>Address</p>
                                        </div>
                                        <div class="col-sm-4 col-4 border-left text-center">
                                            <h4>${account.information.age}</h4>
                                            <p>Age</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="dropdown-divider"></div>

                                <div class="mb-3 ">
                                    <h6>Slogan</h6>
                                    
                                    <p class="p-typo text-center">${acc.information.status}</p>
                                    <div class="text-right">
                                        <button type="button" class="btn btn-theme">
                                            <i class="fa fa-heart"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="dropdown-divider"></div>

                                <div class="profile-gallery">
                                    <div class="mt-3 mb-3">
                                        <h6>Socials</h6>
                                        <div class="text-center">
                                            <div>
                                                <a class="text-light" href="https://www.facebook.com/phanhieu000">
                                                    <button type="button" class="btn btn-theme icon-round shadow">
                                                        <i class="fa fa-facebook"></i>
                                                    </button>
                                                </a>
                                                <a class="text-light" href="https://www.facebook.com/phanhieu000">
                                                    <button type="button" class="btn btn-primary icon-round shadow">
                                                        <i class="fa fa-twitter"></i>
                                                    </button>
                                                </a>
                                                <a class="text-light" href="https://www.facebook.com/phanhieu000">
                                                    <button type="button" class="btn btn-danger icon-round shadow">
                                                        <i class="fa fa-pinterest"></i>
                                                    </button>
                                                </a>
                                                <a class="text-light" href="https://www.facebook.com/phanhieu000">
                                                    <button type="button" class="btn btn-info icon-round shadow">
                                                        <i class="fa fa-linkedin"></i>
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/User profile sidebar-->

                        <!--User profile content-->
                        <div class="col-sm-12 col-md-8">
                            <div class="mt-1 mb-3 p-3 button-container bg-white border shadow-sm custom-tabs">

                                <nav>
                                    <div class="nav nav-tabs nav-fill" id="nav-customContent" role="tablist">
                                        <!-- <a class="nav-item nav-link active" id="nav-home" data-toggle="tab"
                                            href="#custom-home" role="tab" aria-controls="nav-home" aria-selected="true">
                                            <i class="fa fa-list-ul"></i> Feed
                                        </a> -->
                                        <a class="nav-item nav-link active" id="nav-profile" data-toggle="tab"
                                           href="#custom-profile" role="tab" aria-controls="nav-profile"
                                           aria-selected="true">
                                            <i class="fa fa-file-text-o"></i> Profiles
                                        </a>
                                        <a class="nav-item nav-link" id="nav-contact" data-toggle="tab"
                                           href="#custom-contact" role="tab" aria-controls="nav-contact"
                                           aria-selected="false">
                                            <i class="fa fa-paperclip"></i> Powers
                                        </a>
                                    </div>
                                </nav>

                                <div class="tab-content py-3 px-3 px-sm-0" id="nav-customContent">
                                    <!--Personal info tab-->
                                    <div class="tab-pane fade show active p-4" id="custom-profile" role="tabpanel"
                                         aria-labelledby="nav-profile">
                                        <div class="table-responsive mb-4">
                                            <table class="table table-borderless table-striped m-0">
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">Full Name</th>
                                                        <td>${acc.information.fullName}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Gender</th>
                                                        <td>
                                                            <c:if test="${acc.information.gender == 1}">
                                                                Male
                                                            </c:if>
                                                            <c:if test="${acc.information.gender == 0}">
                                                                Female
                                                            </c:if>
                                                            <c:if test="${acc.information.gender != 1 && account.information.gender != 0}">
                                                                null
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Birth Date</th>
                                                        <td>${acc.information.date}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Role</th>
                                                        <td>${acc.action.adminRole}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Location</th>
                                                        <td>${acc.information.location}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div class="dropdown-divider"></div>

                                        <div class="mt-4 mb-4">
                                            <h6 class="mb-2">Slogan</h6>
                                            <p class="p-typo">
                                                - Hy Vọng Càng Lớn Thất Vọng Càng Nhiều.
                                            </p>
                                            <p class="p-typo">
                                                - Cách Chơi Của Bạn Cũng Là Của Tôi.
                                            </p>
                                            <p class="p-typo">
                                                - Cảm Ơn Vì Đã Ở Lại
                                            </p>
                                        </div>

                                    </div>
                                    <!--/Personal info tab-->

                                    <!--Resume tab-->
                                    <div class="tab-pane fade p-4" id="custom-contact" role="tabpanel"
                                         aria-labelledby="nav-contact">

                                        <div class="mb-4">
                                            <h6 class="mb-2">Quyền Hạn</h6>
                                            <table class="table table-striped" id="project_table">
                                                <thead>
                                                    <tr>
                                                        <th>Action</th>
                                                        <th>Start Date</th>
                                                        <th>End Date</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>${account.action.stringViewProduct}</td>
                                                        <td>${account.action.startDate}</td>
                                                        <td>${account.action.endDate}</td>
                                                        <td>
                                                            <c:if test="${account.action.viewProduct eq true}">
                                                                <span class="badge badge-success">Accepted</span>
                                                            </c:if>
                                                            <c:if test="${account.action.viewProduct ne true}">
                                                                <span class="badge badge-danger">Suspended</span>
                                                            </c:if>    
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td>${account.action.stringInsertProduct}</td>
                                                        <td>${account.action.startDate}</td>
                                                        <td>${account.action.endDate}</td>
                                                        <td>
                                                            <c:if test="${account.action.insertProduct eq true}">
                                                                <span class="badge badge-success">Accepted</span>
                                                            </c:if>
                                                            <c:if test="${account.action.insertProduct ne true}">
                                                                <span class="badge badge-danger">Suspended</span>
                                                            </c:if>    
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>${account.action.stringUpdateProduct}</td>
                                                        <td>${account.action.startDate}</td>
                                                        <td>${account.action.endDate}</td>
                                                        <td>
                                                            <c:if test="${account.action.updateProduct eq true}">
                                                                <span class="badge badge-success">Accepted</span>
                                                            </c:if>
                                                            <c:if test="${account.action.updateProduct ne true}">
                                                                <span class="badge badge-danger">Suspended</span>
                                                            </c:if>    
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td>${account.action.stringDeleteProduct}</td>
                                                        <td>${account.action.startDate}</td>
                                                        <td>${account.action.endDate}</td>
                                                        <td>
                                                            <c:if test="${account.action.deleteProduct eq true}">
                                                                <span class="badge badge-success">Accepted</span>
                                                            </c:if>
                                                            <c:if test="${account.action.deleteProduct ne true}">
                                                                <span class="badge badge-danger">Suspended</span>
                                                            </c:if>    
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td>${account.action.stringViewAccount}</td>
                                                        <td>${account.action.startDate}</td>
                                                        <td>${account.action.endDate}</td>
                                                        <td>
                                                            <c:if test="${account.action.viewAccount eq true}">
                                                                <span class="badge badge-success">Accepted</span>
                                                            </c:if>
                                                            <c:if test="${account.action.viewAccount ne true}">
                                                                <span class="badge badge-danger">Suspended</span>
                                                            </c:if>    
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td>${account.action.stringUpdateAccount}</td>
                                                        <td>${account.action.startDate}</td>
                                                        <td>${account.action.endDate}</td>
                                                        <td>
                                                            <c:if test="${account.action.updateAccount eq true}">
                                                                <span class="badge badge-success">Accepted</span>
                                                            </c:if>
                                                            <c:if test="${account.action.updateAccount ne true}">
                                                                <span class="badge badge-danger">Suspended</span>
                                                            </c:if>    
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td>${account.action.stringDeleteAccount}</td>
                                                        <td>${account.action.startDate}</td>
                                                        <td>${account.action.endDate}</td>
                                                        <td>
                                                            <c:if test="${account.action.deleteAccount eq true}">
                                                                <span class="badge badge-success">Accepted</span>
                                                            </c:if>
                                                            <c:if test="${account.action.deleteAccount ne true}">
                                                                <span class="badge badge-danger">Suspended</span>
                                                            </c:if>    
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td>${account.action.stringAddAction}</td>
                                                        <td>${account.action.startDate}</td>
                                                        <td>${account.action.endDate}</td>
                                                        <td>
                                                            <c:if test="${account.action.addAction eq true}">
                                                                <span class="badge badge-success">Accepted</span>
                                                            </c:if>
                                                            <c:if test="${account.action.addAction ne true}">
                                                                <span class="badge badge-danger">Suspended</span>
                                                            </c:if>    
                                                        </td>
                                                    </tr>
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/User profile content-->
                    </div>

                    <!--Footer-->
                    <div class="row mt-5 mb-4 footer">
                        <div class="col-sm-8"></div>
                        <div class="col-sm-4 text-right">
                            <a href="#" class="ml-2">Contact Us</a>
                            <a href="#" class="ml-2">Support</a>
                        </div>
                    </div>
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
        <!--Charts-->
        <!--Canvas JS-->
        <script src="adminPugins/assets/js/charts/canvas.min.js"></script>
        <!--Bootstrap Calendar JS-->
        <script src="adminPugins/assets/js/calendar/bootstrap_calendar.js"></script>
        <script src="adminPugins/assets/js/calendar/demo.js"></script>
        <!--Bootstrap Calendar-->

        <!--Custom Js Script-->
        <script src="adminPugins/assets/js/custom.js"></script>
        <!--Custom Js Script-->
    </body>

</html>
