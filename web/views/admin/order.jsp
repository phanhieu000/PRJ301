<%-- 
    Document   : order
    Created on : 05-10-2022, 14:41:48
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
        <!--Chartist CSS-->
        <link rel="stylesheet" href="adminPugins/assets/css/chartist.min.css">
        <!--Datatable-->
        <link rel="stylesheet" href="adminPugins/assets/css/dataTables.bootstrap4.min.css">
        <!--Nice select -->
        <link rel="stylesheet" href="adminPugins/assets/css/nice-select.css">
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
                    <h5 class="mb-0" ><strong>Orders</strong></h5>
                    <span class="text-secondary">Home <i class="fa fa-angle-right"></i> Order</span>

                    <div class="mt-4 mb-4 p-3 bg-white border shadow-sm lh-sm">
                        <!--Order Listing-->
                        <div class="product-list">

                            <div class="table-responsive product-list">

                                <table class="table table-bordered table-striped mt-3" id="productList">
                                    <thead>
                                        <tr>
                                            <th width="5%" class="align-middle text-center">ID</th>
                                            <th width="15%" class="align-middle text-center">Customer</th>
                                            <th width="14%" class="align-middle text-center">Số Điện Thoại</th>
                                            <th class="align-middle text-center">Địa Chỉ</th>
                                            <th class="align-middle text-center">Thành Tiền</th>
                                            <th width="15%" class="align-middle text-center">Thời Gian</th>
                                            <th width="5%" class="align-middle text-center">Status</th>
                                            <th class="align-middle text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.listOrder}" var="o">
                                            <tr>
                                                <td class="align-middle text-center">${o.orderID}</td>
                                                <td class="align-middle text-center">
                                                    ${o.fullName}
                                                </td>
                                                <td class="align-middle text-center">
                                                    ${o.phone}
                                                </td>
                                                <td class="align-middle text-center">${o.address}</td>
                                                <td class="align-middle text-center">${o.totalFormat} VND</td>
                                                <td class="align-middle text-center">${o.createTime}</td>
                                                <td class="align-middle text-center">
                                                    <c:if test="${o.status == 0}">
                                                        <span class="badge badge-warning">Pending</span>
                                                    </c:if>

                                                    <c:if test="${o.status == 1}">
                                                        <span class="badge badge-success">Paid</span>
                                                    </c:if>

                                                    <c:if test="${o.status == 2}">
                                                        <span class="badge badge-warning">Delivering</span>
                                                    </c:if>

                                                    <c:if test="${o.status == 3}">
                                                        <span class="badge badge-danger">Cancelled</span>
                                                    </c:if>
                                                </td>


                                                <td class="align-middle text-center">
                                                    <a href="admin-orderview?id=${o.orderID}"><button class="btn btn-theme" >
                                                            <i class="fa fa-eye"></i>
                                                        </button></a>
                                                    <button class="btn btn-success" data-toggle="modal" data-target="#order${o.orderID}"><i class="fa fa-pencil"></i></button>
                                                    <a href="delete-order?id=${o.orderID}"><button class="btn btn-danger"><i class="fas fa-trash"></i></button></a>
                                                    <div class="modal fade" id="order${o.orderID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                                            <jsp:useBean id="orderLine" class="com.mywebsite.DAO.product.OrderDAO"/>
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLongTitle">Order #${o.orderID}</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <table class="table table-striped table-bordered">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>#</th>
                                                                                <th scope="row">Item</th>
                                                                                <th class="order-qty-head">Quantity</th>
                                                                                <th>Unit price</th>
                                                                                <th>Total</th>
                                                                                <!--<th>Action</th>-->
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <c:set var="index" value="1"/>
                                                                            <c:forEach items="${orderLine.getOrderLineByOrderID(o.orderID)}" var="i">
                                                                                <tr>
                                                                                    <td class="align-middle">${index}</td>
                                                                                    <td scope="row" class="align-middle">${i.product.productName}</td>
                                                                                    <td class="text-center align-middle">${i.quantity}</td>
                                                                                    <td class="align-middle">${i.product.lastPriceFormat} đ</td>
                                                                                    <td class="align-middle">${i.subTotalFormat}</td>
                                                                                </tr>
                                                                                <c:set var="index" value="${index + 1}"/>
                                                                            </c:forEach>
                                                                        </tbody>
                                                                    </table>

                                                                    <div class="text-left mt-4 p-4">
                                                                        <form action="" method="post">
                                                                            <label>Status Order</label>
                                                                            <select name="status" class="form-control" onchange="this.form.submit()" ${o.status == 1 ? 'disabled' : ''}>
                                                                                <option value="0" ${o.status == 0 ? 'selected' : ''}><span class="badge badge-warning">Pending</span></option>
                                                                                <option value="1" ${o.status == 1 ? 'selected' : ''}><span class="badge badge-success">Paid</span></option>
                                                                                <option value="2" ${o.status == 2 ? 'selected' : ''}><span class="badge badge-warning">Delivering</span></option>
                                                                                <option value="3" ${o.status == 3 ? 'selected' : ''}><span class="badge badge-danger">Cancelled</span></option>
                                                                            </select>
                                                                                <input type="text" name="id" value="${o.orderID}" hidden>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>

                                            </tr>



                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--/Order Listing-->

                        <!--Order Update Modal-->

                        <!--Order Update Modal-->
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
        <!--Datatable-->
        <script src="adminPugins/assets/js/jquery.dataTables.min.js"></script>
        <script src="adminPugins/assets/js/dataTables.bootstrap4.min.js"></script>
        <!--Bootstrap Calendar JS-->
        <script src="adminPugins/assets/js/calendar/bootstrap_calendar.js"></script>
        <script src="adminPugins/assets/js/calendar/demo.js"></script>
        <!--Nice select-->
        <script src="adminPugins/assets/js/jquery.nice-select.min.js"></script>

        <!--Custom Js Script-->
        <script src="adminPugins/assets/js/custom.js"></script>
        <!--Custom Js Script-->
        <script>
                                        //Order list dataTable
                                        $("#productList").DataTable();
                                        //Nice select
                                        $('.bulk-actions').niceSelect();
        </script>
    </body>
</html>