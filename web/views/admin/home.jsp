<%-- 
    Document   : 404
    Created on : 30-09-2022, 10:43:52
    Author     : phanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<!DOCTYPE html>
<html>

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
        <!--Custom style.css-->
        <link rel="stylesheet" href="adminPugins/assets/css/quicksand.css">
        <link rel="stylesheet" href="adminPugins/assets/css/style.css">
        <!--Font Awesome-->
        <link rel="stylesheet" href="adminPugins/assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="adminPugins/assets/css/fontawesome.css">
        <!--Animate CSS-->
        <link rel="stylesheet" href="adminPugins/assets/css/chartist.min.css">
        <!--Map-->
        <link rel="stylesheet" href="adminPugins/assets/css/jquery-jvectormap-2.0.2.css">
        <!--Bootstrap Calendar-->
        <link rel="stylesheet" href="adminPugins/assets/js/calendar/bootstrap_calendar.css">
        <script src="adminPugins/assets/js/ckeditor5/build-classic/ckeditor.js"></script>


        <link rel="stylesheet" href="adminPugins/assets/css/alertify.min.css">
        <link rel="stylesheet" href="adminPugins/assets/css/themes/default.rtl.min.css">

        <link rel="shortcut icon" type="image/x-icon" href="adminPugins/images/logo/logo.jpg">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
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
                <jsp:useBean id="ad" class="com.mywebsite.DAO.account.AccountDAO"/>
                <div class="col-sm-10 col-xs-12 content pt-3 pl-0">
                    <h5 class="mb-3"><strong>Chart reports</strong></h5>

                    <div class="row mt-1">
                        <div class="col-sm-8 col-md-8">
                            <!--Analytics-->
                            <div class="mt-1 mb-3 p-3 button-container bg-white shadow-sm border">
                                <h6 class="mb-3">Doanh Thu Năm</h6>
                                <canvas id="revenueCharts" height="300px"></canvas>
                            </div>

                            <script >
                                let ctx = document.getElementById("revenueCharts");
                                ctx.height = 150;

                                let revChart = new Chart(ctx, {
                                    type: 'line',
                                    data: {

                                        labels: [<c:forEach items="${paids}" var="type">"Tháng ${type.key}", </c:forEach>],
                                                datasets: [
                                                    {
                                                        label: "Paid",
                                                        borderColor: "rgb(23, 252, 3)",
                                                        borderWidth: "3",
                                                        backgroundColor: "rgb(23, 252, 3, 0.5)",
                                                        data: [<c:forEach items="${paids}" var="paid">${paid.value}, </c:forEach>]
                                                    },
                                                    {
                                                        label: "Pending",
                                                        borderColor: "rgb(252, 240, 3)",
                                                        borderWidth: "3",
                                                        backgroundColor: "rgba(252, 240, 3, 0.5)",
                                                        data: [<c:forEach items="${pendings}" var="pending">${pending.value}, </c:forEach>]
                                                    }
                                                ]
                                    },
                                    options: {
                                        responsive: true,
                                        tooltips: {
                                            mode: 'index',
                                            intersect: false,

                                        },
                                        hover: {
                                            mode: 'nearest',
                                            intersect: true
                                        }

                                    }
                                });
                                </script>
                                <!--/Analytics-->


                            </div>

                            <div class="col-sm-4 col-md-4">
                                <!--Analytics-->
                                <div class="bg-white border shadow mb-4">
                                    <div class="media p-4">
                                        <div class="align-self-center mr-3 rounded-circle notify-icon_2 bg-white">
                                            <i class="fa fa-users text-theme"></i>
                                        </div>
                                        <div class="media-body pl-2 ml-4">
                                            <h3 class="mt-0 mb-2"><strong>${requestScope.totalUsers}</strong></h3>
                                        <p><small class="bc-description text-theme mt-4">Người Dùng</small></p>
                                    </div>
                                </div>
                            </div>

                            <div class="bg-white border shadow mb-4">
                                <div class="media p-4">
                                    <div class="align-self-center mr-3 rounded-circle notify-icon_2 bg-white">
                                        <i class="fas fa-money-bill-wave text-danger"></i>
                                    </div>
                                    <div class="media-body pl-2 ml-4">
                                        <h3 class="mt-0 mb-2"><strong>${requestScope.totalRevenue} VND</strong></h3>
                                        <p><small class="bc-description text-danger mt-4">Doanh Thu Tháng</small></p>
                                    </div>
                                </div>
                            </div>

                            <div class="bg-white border shadow mb-4">
                                <div class="media p-4">
                                    <div class="align-self-center mr-3 rounded-circle notify-icon_2 bg-white">
                                        <i class="fa fa-lightbulb text-success"></i>
                                    </div>
                                    <div class="media-body pl-2 ml-4">
                                        <h3 class="mt-0 mb-2"><strong>${requestScope.totalProducts}</strong></h3>
                                        <p><small class="text-success bc-description ">Sản Phẩm</small></p>
                                    </div>
                                </div>
                            </div>

                            <div class="bg-white border shadow mb-4">
                                <div class="media p-4">
                                    <div class="align-self-center mr-3 rounded-circle notify-icon_2 bg-white">
                                        <i class="fa fa-lightbulb text-success"></i>
                                    </div>
                                    <div class="media-body pl-2 ml-4">
                                        <h3 class="mt-0 mb-2"><strong>${totalProductSeller}</strong></h3>
                                        <p><small class="text-success bc-description">Số Sản Phẩm Đã Bán</small></p>
                                    </div>
                                </div>
                            </div>
                            <!--/Analytics-->

                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-sm-12 col-md-8">
                            <!--Store summary-->
                            <div class="mt-1 mb-3 p-3 button-container bg-white shadow-sm border">
                                <h6 class="mb-3">Store summary</h6>
                                <input type="text" id="tablet" value="${tablet}" hidden>
                                <input type="text" id="smartphone" value="${smartphone}" hidden>
                                <input type="text" id="laptop" value="${laptop}" hidden>
                                <input type="text" id="tivi" value="${tivi}" hidden>
                                <input type="text" id="accessories" value="${accessories}" hidden>
                                <hr>
                                <div id="donutChartEcharts" style="height: 300px; width: 100%"></div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-4">
                            <!--Profile card-->
                            <div class="card shadow">
                                <div class="card-body">
                                    <h5 class="card-title bc-header">TOP 5 Khách Hàng Trong Tháng ${month}</h5>

                                    <c:forEach items="${ad.top5CustomerGratitude}" var="i">
                                        <div class="media border-top border-bottom pt-1">
                                            <img class="align-self-center mr-2 rounded-circle mb-1" src="${i.key.information.avatar != null && i.key.information.avatar != '' ? i.key.information.avatar : 'adminPugins/images/avatar-user/avatar-default.jpg'}" width="40px" height="40px" alt="Generic placeholder image">
                                            <div class="media-body">
                                                <p class="bc-description mt-2">${i.key.information.fullName} <span class="pull-right"><span class="">${ad.getFormatDouble(i.value)} VND</span><i class="fa fa-phone ml-4"></i></span></p>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

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
        <!--Flot.JS-->
        <script src="adminPugins/assets/js/charts/jquery.flot.min.js"></script>
        <script src="adminPugins/assets/js/charts/jquery.flot.pie.min.js"></script>
        <script src="adminPugins/assets/js/charts/jquery.flot.categories.min.js"></script>
        <script src="adminPugins/assets/js/charts/jquery.flot.stack.min.js"></script>
        <!--Echarts-->
        <script src="adminPugins/assets/js/charts/echarts.min.js"></script>
        <script src="adminPugins/assets/js/charts/echarts-data.js"></script>
        <!--Charts JS-->
        <script src="adminPugins/assets/js/charts/chart.min.js"></script>
        <script src="adminPugins/assets/js/charts/demo.js"></script>
        <!--Maps-->
        <script src="adminPugins/assets/js/maps/jquery-jvectormap-2.0.2.min.js"></script>
        <script src="adminPugins/assets/js/maps/jquery-jvectormap-world-mill-en.js"></script>
        <script src="adminPugins/assets/js/maps/jvector-maps.js"></script>
        <!--Bootstrap Calendar JS-->
        <script src="adminPugins/assets/js/calendar/bootstrap_calendar.js"></script>
        <script src="adminPugins/assets/js/calendar/demo.js"></script>
        <!--Nice select-->
        <script src="adminPugins/assets/js/jquery.nice-select.min.js"></script>

        <!--Custom Js Script-->
        <script src="adminPugins/assets/js/custom.js"></script>
        <!--Custom Js Script-->
        <script>
                                //Nice select
                                $('.bulk-actions').niceSelect();
        </script>

        <script src="adminPugins/assets/js/alertify.min.js"></script>

    </body>

</html>