<%-- 
    Document   : addProduct
    Created on : 13-10-2022, 04:44:44
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
        <!--paper bootstrap wizard-->
        <link rel="stylesheet" href="adminPugins/assets/css/themify-icons.css">
        <link rel="stylesheet" href="adminPugins/assets/css/paper-bootstrap-wizard.css">
        <!--Font Awesome-->
        <link rel="stylesheet" href="adminPugins/assets/css/fontawesome.css">
        <!--Chartist CSS-->
        <link rel="stylesheet" href="adminPugins/assets/css/chartist.min.css">
        <!--Bootstrap Calendar-->
        <link rel="stylesheet" href="adminPugins/assets/js/calendar/bootstrap_calendar.css">
        <!--Switchery CSS-->
        <!--Custom style.css-->
        <link rel="stylesheet" href="adminPugins/assets/css/quicksand.css">
        <link rel="stylesheet" href="adminPugins/assets/css/style.css">

        <script src="adminPugins/ckeditor/ckeditor.js"></script>

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
                    <h5 class="mb-0"><strong>Add Product</strong></h5>
                    <span class="text-secondary">Home <i class="fa fa-angle-right"></i> Add Product</span>

                    <div class="row mt-3">
                        <div class="col-sm-12">
                            <!--Form wizard-->

                            <div class="mt-1 mb-3 p-3 button-container bg-white border shadow-sm">

                                <div class="wizard-container">
                                    <div class="card wizard-card" data-color="green" id="wizardProfile">
                                        <form action="admin-addproduct" method="post" enctype="multipart/form-data">
                                            <!--You can switch " data-color="orange" "  with one of the next bright colors: "blue", "green", "orange", "red", "azure"-->          
                                            <div class="wizard-header text-center">
                                                <h3 class="wizard-title">Thêm Sản Phẩm</h3>
                                                <p class="category">Create By Phan Hiếu</p>
                                            </div>

                                            <div class="wizard-navigation">
                                                <div class="progress-with-circle">
                                                    <div class="progress-bar" role="progressbar" aria-valuenow="1"
                                                         aria-valuemin="1" aria-valuemax="3" style="width: 21%;"></div>
                                                </div>
                                                <ul>
                                                    <li>
                                                        <a href="#about" data-toggle="tab">
                                                            <div class="icon-circle">
                                                                <i class="ti-user text-dark"></i>
                                                            </div>
                                                            Step 1
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#account" data-toggle="tab">
                                                            <div class="icon-circle">
                                                                <i class="ti-settings text-dark"></i>
                                                            </div>
                                                            Step 2
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#address" data-toggle="tab">
                                                            <div class="icon-circle text-dark">
                                                                <i class="ti-map"></i>
                                                            </div>
                                                            Finish
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="tab-content">
                                                <div class="tab-pane" id="about">
                                                    <div class="row">

                                                        <div class="col-sm-10 offset-sm-1 mt-3">
                                                            <h6 class="info-text text-center">Thông Tin Sản Phẩm</h6>
                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="picture-container">
                                                                        <div class="picture" >
                                                                            <img src="adminPugins/assets/img/default-avatar.jpg" class="picture-src" id="wizardPicturePreview" title="" />
                                                                            <input type="file" id="wizard-picture"  name="imageProducts" accept=".jpg, .png">
                                                                        </div>
                                                                        <h6>Chọn 1 Ảnh Cho Sản Phẩm</h6>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-8">
                                                                    <div class="form-group">
                                                                        <label>ProductName <small>(required)</small></label>
                                                                        <input name="productName" type="text"
                                                                               class="form-control" placeholder="Tên Sản Phẩm ">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <div>
                                                                            <label>Category <small>(required)</small></label>
                                                                            <select name="categoryID" class="form-control" id="categoryIDSelect" onchange="checkProducer()" >
                                                                                <option value="0" >Chọn Danh Mục Cho Sản Phẩm</option>
                                                                                <c:forEach items="${listCategory}" var="c">
                                                                                    <option value="${c.categoryID}" >${c.categoryName}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <input type="text" id="categoryIDTake" value="Laptop" hidden>

                                                                    <div class="form-group">
                                                                        <div>
                                                                            <label>ProducerName <small>(required)</small></label>
                                                                            <select name="producerID" class="form-control" id="producerMeta">
                                                                                <option value="0">Chọn Hãng Sản Xuất</option>
                                                                                <c:forEach items="${listProducer}" var="p">
                                                                                    <option value="${p.producerID},${p.producerMeta}">${p.producerMeta} - ${p.producerName}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-3 offset-sm-5">
                                                            <div class="form-group">
                                                                <label>Price <small>(required)</small></label>
                                                                <input name="price" type="text" class="form-control"
                                                                       placeholder="Price - VND">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label>Discount<small>(Option)</small></label>
                                                                <input name="discount" type="text" class="form-control" placeholder="Giảm Giá Nếu Có">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="tab-pane" id="account">
                                                    <h5 class="info-text"> Thông Tin Sản Phẩm </h5>
                                                    <div class="row">
                                                        <div class="col-sm-4 col-sm-offset-1">
                                                            <div class="form-group">
                                                                <label>Memory</label>
                                                                <select name="memory" class="form-control">
                                                                    <option value="128gb" selected>128 GB</option>
                                                                    <option value="256gb">256 GB</option>
                                                                    <option value="512gb">512 GB</option>
                                                                    <option value="1tb">1 TB</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4 col-sm-offset-1">
                                                            <div class="form-group">
                                                                <label>Ram</label>
                                                                <select name="ram" class="form-control">
                                                                    <option value="2gb" selected>2 GB</option>
                                                                    <option value="4gb">4 GB</option>
                                                                    <option value="8gb">8 GB</option>
                                                                    <option value="16gb">16 GB</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4 col-sm-offset-1">
                                                            <div class="form-group">
                                                                <label>CPU</label>
                                                                <input name="cpu" type="text" class="form-control"  placeholder="CPU Của Sản Phẩm">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4 col-sm-offset-1">
                                                            <div class="form-group">
                                                                <label>Camera</label>
                                                                <input name="camera" type="text" class="form-control"  placeholder="Camera Của Sản Phẩm">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4 col-sm-offset-1">
                                                            <div class="form-group">
                                                                <label>Camera Selfie</label>
                                                                <input name="cameraSelfie" type="text" class="form-control"  placeholder="Camera Selfie Của Sản Phẩm">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4 col-sm-offset-1">
                                                            <div class="form-group">
                                                                <label>GPU</label>
                                                                <input name="card" type="text" class="form-control"  placeholder="GPU Của Sản Phẩm">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label>Màn Hình</label>
                                                                <input  name="screen" type="text" class="form-control" placeholder="Màn Hình Của Sản Phẩm">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label>Phần Cứng</label>
                                                                <input  name="hardDrive" type="text" class="form-control" placeholder="Phần Cứng Của Sản Phẩm (Option)">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6 col-sm-offset-1">
                                                            <div class="form-group">
                                                                <label>Số Lượng</label>
                                                                <input name="quantity" type="text" class="form-control"  placeholder="Số Lượng Của Sản Phẩm">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group ">
                                                                <label>Màu Sắc</label>
                                                                <div class="form-control">
                                                                    <input  name="colorProduct" type="checkbox" class="form-check-box"  value="Xanh" checked>
                                                                    <label>Xanh</label>
                                                                    <input  name="colorProduct" type="checkbox" class="form-check-box"  value="Đỏ">
                                                                    <label>Đỏ</label>
                                                                    <input  name="colorProduct" type="checkbox" class="form-check-box"  value="Tím">
                                                                    <label>Tím</label>
                                                                    <input  name="colorProduct" type="checkbox" class="form-check-box"  value="Vàng">
                                                                    <label>Vàng</label>
                                                                    <input  name="colorProduct" type="checkbox" class="form-check-box"  value="Đen">
                                                                    <label>Đen</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                                <div class="tab-pane" id="address">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <h5 class="info-text"> Thông Tin Chi Tiết Sản Phẩm ! </h5>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="form-group">
                                                                <label>Kích Thước</label>
                                                                <input  name="size" type="text" class="form-control" placeholder="Kích Thước Của Sản Phẩm">
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-4">
                                                            <div class="form-group">
                                                                <label>Trọng Lượng</label>
                                                                <input  name="weight" type="text" class="form-control" placeholder="Trọng Lượng Của Sản Phẩm">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="form-group">
                                                                <label>Thời Gian Bảo Hành</label><br>
                                                                <select name="warranty" class="form-control">
                                                                    <option value="1" selected> 1 Tháng </option>
                                                                    <option value="2"> 2 Tháng </option>
                                                                    <option value="3"> 3 Tháng </option>
                                                                    <option value="4"> 4 Tháng </option>
                                                                    <option value="5"> 5 Tháng </option>
                                                                    <option value="6"> 6 Tháng </option>
                                                                    <option value="7"> 7 Tháng </option>
                                                                    <option value="8"> 8 Tháng </option>
                                                                    <option value="9"> 9 Tháng </option>
                                                                    <option value="10"> 10 Tháng </option>
                                                                    <option value="11"> 11 Tháng </option>
                                                                    <option value="12"> 12 Tháng </option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <div class="form-group row">
                                                                <label class="control-label col-sm-2">Summary</label>
                                                                <div class="col-sm-12"> 
                                                                    <div class="mt-1 mb-3 button-container">
                                                                        <textarea name="summary" id="editor1" rows="100" cols="150">
                                                                                
                                                                        </textarea>
                                                                        <script>
                                                                            // Replace the <textarea id="editor1"> with a CKEditor 4
                                                                            // instance, using default configuration.
                                                                            CKEDITOR.replace('editor1');
                                                                        </script>

                                                                    </div>
                                                                </div>
                                                            </div>  
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="wizard-footer">
                                                <div class="pull-right">
                                                    <input type='button' class='btn btn-next btn-fill btn-theme btn-wd'
                                                           name='next' value='Next' />
                                                    <input type='submit' class='btn btn-finish btn-fill btn-theme btn-wd'
                                                           value='Finish' />
                                                </div>

                                                <div class="pull-left">
                                                    <input type='button' class='btn btn-previous btn-default btn-wd'
                                                           name='previous' value='Previous' />
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </form>
                                    </div>
                                </div> <!-- wizard container -->

                            </div>

                            <!--/Form wizard-->
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
        <!--Canvas JS-->
        <script src="adminPugins/assets/js/charts/canvas.min.js"></script>
        <!--Bootstrap Calendar JS-->
        <script src="adminPugins/assets/js/calendar/bootstrap_calendar.js"></script>
        <script src="adminPugins/assets/js/calendar/demo.js"></script>
        <!--Bootstrap Calendar-->

        <!--Paper bootstrap wizard-->
        <script src="adminPugins/assets/js/jquery.bootstrap.wizard.js"></script>
        <script src="adminPugins/assets/js/paper-bootstrap-wizard.js"></script>
        <script src="adminPugins/assets/js/jquery.validate.min.js"></script>

        <!--Custom Js Script-->
        <script src="adminPugins/assets/js/custom.js"></script>
        <script src="adminPugins/assets/js/mycode.js"></script>
        <!--Custom Js Script-->
    </body>

</html>
