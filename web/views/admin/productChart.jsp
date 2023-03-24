<%-- 
    Document   : productChart
    Created on : 28-10-2022, 10:15:10
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
        <link rel="stylesheet" href="adminPugins/assets/css/fontawesome.css">
        <!--Bootstrap Calendar-->
        <link rel="stylesheet" href="adminPugins/assets/js/calendar/bootstrap_calendar.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <script src="https://fastly.jsdelivr.net/npm/echarts@5.4.0/dist/echarts.min.js"></script>
        


        <title>Sleek Admin</title>
    </head>
    <body>
        <jsp:useBean id="pd" class="com.mywebsite.DAO.product.ProductDAO"/>
        <jsp:useBean id="com" class="com.mywebsite.DAO.dao.Common"/>
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
                    <h5 class="mb-0" ><strong>Thống Kê Product</strong></h5>
                    <span class="text-secondary">Product <i class="fa fa-angle-right"></i> Chart</span>

                    <div class="row mt-3">
                        <div class="col-sm-6">
                            <!--Line Chart-->
                            <div class="mt-1 mb-3 p-3 button-container bg-white shadow-sm border">
                                <h6 class="mb-2">Số Sản Phẩm Đã Bán Trong Năm </h6>

                                <canvas id="lineCharts"  height="150px"></canvas>
                                <form action="" method="get">
                                    Năm: 
                                    <select name="year" onchange="this.form.submit()" class="form-control">
                                        <c:forEach begin="0" end="4" var="i">
                                            <option value="${com.currentDateForJSP.year + 1900 - i}" ${year == (com.currentDateForJSP.year + 1900 - i) ? 'selected' : ''}>${com.currentDateForJSP.year + 1900 - i}</option>
                                        </c:forEach>
                                    </select>
                                    
                                </form>
                            </div>
                            <!--/Line Chart-->
                            <script>

                                let ctx = document.getElementById('lineCharts');
                                let lineChart = new Chart(ctx, {
                                type: 'line',
                                        data: {
                                        labels: [<c:forEach items="${smartPhone}" var="i">"Tháng ${i.key}", </c:forEach>],
                                                datasets: [{
                                                label: 'SmartPhone',
                                                        data: [<c:forEach items="${smartPhone}" var="i">${i.value}, </c:forEach>],
                                                        backgroundColor: [
                                                                'rgba(255, 99, 132, 0.2)',
                                                                'rgba(54, 162, 235, 0.2)',
                                                                'rgba(255, 206, 86, 0.2)',
                                                                'rgba(75, 192, 192, 0.2)',
                                                                'rgba(153, 102, 255, 0.2)',
                                                                'rgba(255, 159, 64, 0.2)'
                                                        ],
                                                        borderColor: [
                                                                'rgba(255,99,132,1)',
                                                                'rgba(54, 162, 235, 1)',
                                                                'rgba(255, 206, 86, 1)',
                                                                'rgba(75, 192, 192, 1)',
                                                                'rgba(153, 102, 255, 1)',
                                                                'rgba(255, 159, 64, 1)'
                                                        ],
                                                        pointRadius: 3,
                                                        borderWidth: 1,
                                                        fill: false
                                                },
                                                {
                                                label: 'Laptop',
                                                        data: [<c:forEach items="${laptop}" var="i">${i.value}, </c:forEach>],
                                                        backgroundColor: [
                                                                'rgba(252, 161, 3, 0.2)',
                                                                'rgba(252, 161, 3, 0.2)',
                                                                'rgba(252, 161, 3, 0.2)',
                                                                'rgba(252, 161, 3, 0.2)',
                                                                'rgba(252, 161, 3, 0.2)',
                                                                'rgba(252, 161, 3, 0.2)'
                                                        ],
                                                        borderColor: [
                                                                'rgba(252, 161, 3,1)',
                                                                'rgba(252, 161, 3, 1)',
                                                                'rgba(252, 161, 3, 1)',
                                                                'rgba(252, 161, 3, 1)',
                                                                'rgba(252, 161, 3, 1)',
                                                                'rgba(252, 161, 3, 1)'
                                                        ],
                                                        pointRadius: 3,
                                                        borderWidth: 1,
                                                        fill: false
                                                },
                                                {
                                                label: 'Tablet',
                                                        data: [<c:forEach items="${tablet}" var="i">${i.value}, </c:forEach>],
                                                        backgroundColor: [
                                                                'rgba(255, 99, 132, 0.2)',
                                                                'rgba(54, 162, 235, 0.2)',
                                                                'rgba(255, 206, 86, 0.2)',
                                                                'rgba(75, 192, 192, 0.2)',
                                                                'rgba(153, 102, 255, 0.2)',
                                                                'rgba(255, 159, 64, 0.2)'
                                                        ],
                                                        borderColor: [
                                                                'rgba(3, 165, 252,1)',
                                                                'rgba(3, 165, 252, 1)',
                                                                'rgba(3, 165, 252, 1)',
                                                                'rgba(3, 165, 252, 1)',
                                                                'rgba(3, 165, 252, 1)',
                                                                'rgba(3, 165, 252, 1)'
                                                        ],
                                                        pointRadius: 3,
                                                        borderWidth: 1,
                                                        fill: false
                                                }, ]
                                        },
                                        options: {
                                        scales: {
                                        yAxes: [{
                                        ticks: {
                                        beginAtZero: true
                                        }
                                        }]
                                        },
                                                legend: {
                                                display: false
                                                },
                                                elements: {
                                                point: {
                                                radius: 0
                                                }
                                                }

                                        }
                                });
                                </script>
                            </div>
                            <div class="col-sm-6">
                                <!--Pie Chart-->
                                <div class="mt-1 mb-3 p-3 button-container  bg-white shadow-sm border">
                                    <h6>Số Lượng Sản Phẩm Trong Kho</h6>

                                    <canvas id="pieCharts" height="150px"></canvas>
                                </div>
                                <script>

                                    let pieChartCanvass = document.getElementById("pieCharts");
                                    let pieCharts = new Chart(pieChartCanvass, {
                                    type: 'pie',
                                            data: {
                                            datasets: [{
                                            data: [<c:forEach items="${pd.quantityProductForChart}" var="item">${item.value}, </c:forEach>],
                                                    backgroundColor: [
                                                            'rgba(255, 99, 132, 0.5)',
                                                            'rgba(54, 162, 235, 0.5)',
                                                            'rgba(255, 206, 86, 0.5)',
                                                            'rgba(75, 192, 192, 0.5)',
                                                            'rgba(153, 102, 255, 0.5)',
                                                            'rgba(255, 159, 64, 0.5)'
                                                    ],
                                                    borderColor: [
                                                            'rgba(255,99,132,1)',
                                                            'rgba(54, 162, 235, 1)',
                                                            'rgba(255, 206, 86, 1)',
                                                            'rgba(75, 192, 192, 1)',
                                                            'rgba(153, 102, 255, 1)',
                                                            'rgba(255, 159, 64, 1)'
                                                    ],
                                            }],
                                                    // These labels appear in the legend and in the tooltips when hovering different arcs
                                                    labels: [ <c:forEach items="${pd.quantityProductForChart}" var="item">'${item.key}', </c:forEach>

                                                    ]
                                            },
                                            options: {
                                            responsive: true,
                                                    animation: {
                                                    animateScale: true,
                                                            animateRotate: true
                                                    }
                                            }
                                    });
                            </script>
                            <!--/Pie Table-->
                        </div>
                    </div>

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
        <!--Chart.JS-->
        <script src="adminPugins/assets/js/charts/chart.min.js"></script>
        <script src="adminPugins/assets/js/charts/demo.js"></script>
        <!--Bootstrap Calendar JS-->
        <script src="adminPugins/assets/js/calendar/bootstrap_calendar.js"></script>
        <script src="adminPugins/assets/js/calendar/demo.js"></script>
        <!--Bootstrap Calendar-->

        <!--Custom Js Script-->
        <script src="adminPugins/assets/js/custom.js"></script>
        <!--Custom Js Script-->

    </body>
</html>
