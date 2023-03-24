<%-- 
    Document   : reviewChart
    Created on : 03-11-2022, 07:07:41
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

        <script src="https://fastly.jsdelivr.net/npm/echarts@5.4.0/dist/echarts.min.js"></script>
        <style>
            #chart-container {
                position: relative;
                height: 100vh;
                overflow: hidden;
            }
        </style>


        <title>Sleek Admin</title>
    </head>
    <body>


        <div class="container-fluid">

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
                                    <img src="${accountAdmin.information.avatar}" alt="avatar" class="rounded-circle"
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
                <jsp:useBean id="prd" class="com.mywebsite.DAO.product.ProductReviewDAO"/>
                 <jsp:useBean id="com" class="com.mywebsite.DAO.dao.Common"/>

                <!--Content right-->
                <div class="col-sm-9 col-xs-12 content pt-3 pl-0">
                    <h5 class="mb-0" ><strong>Echarts</strong></h5>
                    <span class="text-secondary">Charts <i class="fa fa-angle-right"></i> Chartist js</span>

                    <div class="row mt-3">
                        <div class="col-sm-12">
                            <!--Stacked Area Chart-->
                            <div class="mt-1 mb-3 p-3 button-container  bg-white shadow-sm border">
                                <div id="chart-container" style="height: 400px"></div>
                                <form action="">
                                    Năm: 
                                    <select name="year" class="form-control" onchange="this.form.submit()">
                                        <c:forEach begin="0" end="4" var="i">
                                            <option value="${com.currentDateForJSP.year + 1900 - i}" ${year == (com.currentDateForJSP.year + 1900 - i) ? 'selected' : ''}>${com.currentDateForJSP.year + 1900 - i}</option>
                                        </c:forEach>
                                    </select>

                                </form>
                                <script>
                                    var dom = document.getElementById('chart-container');
                                    var myChart = echarts.init(dom, null, {
                                        renderer: 'canvas',
                                        useDirtyRect: false
                                    });
                                    var app = {};
                                    var option;
                                    option = {
                                        title: {
                                            text: 'Thống Kê Review'
                                        },
                                        tooltip: {
                                            trigger: 'axis',
                                            axisPointer: {
                                                type: 'cross',
                                                label: {
                                                    backgroundColor: '#6a7985'
                                                }
                                            }
                                        },
                                        legend: {
                                            data: ['1 Sao', '2 Sao', '3 Sao', '4 Sao', '5 Sao']
                                        },
                                        toolbox: {
                                            feature: {
                                                saveAsImage: {}
                                            }
                                        },
                                        grid: {
                                            left: '3%',
                                            right: '4%',
                                            bottom: '3%',
                                            containLabel: true
                                        },
                                        xAxis: [
                                            {
                                                type: 'category',
                                                boundaryGap: false,
                                                data: [<c:forEach items="${prd.getDataForChart(1, year)}" var="i">'Tháng ${i.key}', </c:forEach>]
                                            }
                                        ],
                                        yAxis: [
                                            {
                                                type: 'value'
                                            }
                                        ],
                                        series: [
                                            {
                                                name: '1 Sao',
                                                type: 'line',
                                                stack: 'Total',
                                                areaStyle: {},
                                                emphasis: {
                                                    focus: 'series'
                                                },
                                                data: [<c:forEach items="${prd.getDataForChart(1, year)}" var="i">${i.value}, </c:forEach>]
                                            },
                                            {
                                                name: '2 Sao',
                                                type: 'line',
                                                stack: 'Total',
                                                areaStyle: {},
                                                emphasis: {
                                                    focus: 'series'
                                                },
                                                data: [<c:forEach items="${prd.getDataForChart(2, year)}" var="i">${i.value}, </c:forEach>]
                                            },
                                            {
                                                name: '3 Sao',
                                                type: 'line',
                                                stack: 'Total',
                                                areaStyle: {},
                                                emphasis: {
                                                    focus: 'series'
                                                },
                                                data: [<c:forEach items="${prd.getDataForChart(3, year)}" var="i">${i.value}, </c:forEach>]
                                            },
                                            {
                                                name: '4 Sao',
                                                type: 'line',
                                                stack: 'Total',
                                                areaStyle: {},
                                                emphasis: {
                                                    focus: 'series'
                                                },
                                                data: [<c:forEach items="${prd.getDataForChart(4, year)}" var="i">${i.value}, </c:forEach>]
                                            },
                                            {
                                                name: '5 Sao',
                                                type: 'line',
                                                stack: 'Total',
                                                label: {
                                                    show: true,
                                                    position: 'top'
                                                },
                                                areaStyle: {},
                                                emphasis: {
                                                    focus: 'series'
                                                },
                                                data: [<c:forEach items="${prd.getDataForChart(5, year)}" var="i">${i.value}, </c:forEach>]
                                            }
                                        ]
                                    };
                                    if (option && typeof option === 'object') {
                                        myChart.setOption(option);
                                    }

                                    window.addEventListener('resize', myChart.resize);
                                </script>
                            </div>
                            <!--/Stacked Area Table-->
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
        <!--Echarts.JS-->
        <script src="adminPugins/assets/js/charts/echarts.min.js"></script>
        <script src="adminPugins/assets/js/charts/echarts-data.js"></script>
        <!--Bootstrap Calendar JS-->
        <script src="adminPugins/assets/js/calendar/bootstrap_calendar.js"></script>
        <script src="adminPugins/assets/js/calendar/demo.js"></script>
        <!--Bootstrap Calendar-->

        <!--Custom Js Script-->
        <script src="adminPugins/assets/js/custom.js"></script>
        <!--Custom Js Script-->
    </body>
</html>
