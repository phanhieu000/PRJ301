<%-- 
    Document   : settings
    Created on : 06-10-2022, 20:52:19
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
        <!--Chartist CSS-->
        <link rel="stylesheet" href="adminPugins/assets/css/chartist.min.css">
        <!--Bootstrap Calendar-->
        <link rel="stylesheet" href="adminPugins/assets/js/calendar/bootstrap_calendar.css">
        <!--Summernote editor-->
        <link rel="stylesheet" href="adminPugins/assets/js/summernote/summernote-bs4.css">
        <!--        Ckeditor
                <script src="adminPugins/assets/js/ckeditor5/build-inline/ckeditor.js"></script>-->
        <link rel="stylesheet" href="adminPugins/assets/css/alertify.min.css">
        <link rel="stylesheet" href="adminPugins/assets/css/themes/default.rtl.min.css">
        <!--paper bootstrap wizard-->
        <link rel="stylesheet" href="adminPugins/assets/css/themify-icons.css">
        <link rel="stylesheet" href="adminPugins/assets/css/paper-bootstrap-wizard.css">

        <script src="adminPugins/assets/js/ckeditor5/build-classic/ckeditor.js"></script>


        <link rel="stylesheet" href="adminPugins/assets/css/mystyle.css"/>
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
                    <h5 class="mb-0" ><strong>Settings</strong></h5>
                    <span class="text-secondary">Home <i class="fa fa-angle-right"></i> Settings</span>

                    <div class="row mt-3">
                        <div class="col-sm-12">
                            <!--Blank Page-->
                            <div class="mt-1 mb-3 p-3 button-container border bg-white">
                                <nav>
                                    <div class="nav nav-tabs nav-fill" id="nav-customContent" role="tablist">
                                        <a class="nav-item nav-link active" id="nav-home" data-toggle="tab" href="#custom-home" role="tab" aria-controls="nav-home" aria-selected="true">Thông Tin Cá Nhân</a>
                                        <a class="nav-item nav-link" id="nav-profile" data-toggle="tab" href="#custom-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Profile</a>
                                        <a class="nav-item nav-link" id="nav-contact" data-toggle="tab" href="#custom-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</a>
                                    </div>
                                </nav>
                                <div class="tab-content py-3 px-3 px-sm-0" id="nav-customContent">
                                    <div class="tab-pane fade show active" id="custom-home" role="tabpanel" aria-labelledby="nav-home">
                                        <form class="form-horizontal mt-4 mb-5" id="f1" action="admin-settings" method="post" enctype="multipart/form-data">

                                            <div class="form-group row">
                                                <label class="control-label col-sm-2" for="userName">UserName</label>
                                                <div class="col-sm-6">

                                                    <input type="text" class="form-control" id="userName" name="userName" placeholder="User Name" value="${account.userName}" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group row" id="passwordProfiles">
                                                <label class="control-label col-sm-2" for="password">Password</label>
                                                <div class="col-sm-6">
                                                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" value="${account.password}" disabled>
                                                    <span onclick="showPassword()" class="show-password-btn"><i class="fa fa-eye"></i></span>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="control-label col-sm-2" for="Email">Email</label>
                                                <div class="col-sm-6">
                                                    <input type="email" maxlength="50" class="form-control" id="email" name="email" placeholder="Email" value="${account.email}"  />
                                                    <span id="span-save" onclick="changeProfile('#email')" class="show-password-btn"><i id="pen-email"  class="fa fa-pencil"></i><i id="check-email" class="fa fa-check text-success"></i></span>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="control-label col-sm-2" for="password">Full Name</label>
                                                <div class="col-sm-3 col-12">
                                                    <input class="form-control" type="text" placeholder="First Name" id="firstName" name="firstName" value="${account.information.firstName}" >
                                                    <span id="span-save" onclick="changeProfile('#firstName')" class="show-password-btn"><i id="pen-firstName" class="fa fa-pencil pen"></i><i id="check-firstName" class="fa fa-check text-success"></i></span>
                                                </div>
                                                <div class="col-sm-3 col-12">
                                                    <input class="form-control" type="text" placeholder="Last Name" id="lastName" name="lastName" value="${account.information.lastName}"  >
                                                    <span id="span-save" onclick="changeProfile('#lastName')" class="show-password-btn"><i id="pen-lastName" class="fa fa-pencil pen"></i><i id="check-lastName" class="fa fa-check text-success check"></i></span>

                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="control-label col-sm-2" for="Gender">Gender</label>
                                                <div class="col-sm-3 col-12">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" name="gender" id="male" value="1" ${account.information.gender == 1 ? 'checked' : ''}>
                                                        <label class="custom-control-label" for="male">Male</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3 col-12">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" name="gender" id="female" value="0" ${account.information.gender == 0 ? 'checked' : ''}>
                                                        <label class="custom-control-label" name="gender" for="female">Female</label>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="form-group row wizard-card" style="min-height: 0">
                                                <label class="control-label col-sm-2">Avatar</label>
                                                <div class="col-sm-6">
                                                    <div class="picture-container">
                                                        <div class="picture" style="margin: 0">
                                                            <img src="${account.information.avatar}"  class="picture-src" id="wizardPicturePreview" title="" />
                                                            <input type="file" id="wizard-picture" name="avatar">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="control-label col-sm-2" for="Phone">Phone</label>
                                                <div class="col-sm-6">
                                                    <input type="text" maxlength="20" class="form-control" id="phone" name="phone" placeholder="Phone" value="${account.information.phone}"/>
                                                    <span id="span-save" onclick="changeProfile('#phone')" class="show-password-btn"><i id="pen-phone" class="fa fa-pencil"></i><i id="check-phone" class="fa fa-check text-success"></i></span>

                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="control-label col-sm-2" for="birthDay">Birth Day</label>
                                                <div class="col-sm-6">
                                                    <input type="date" class="form-control" name="birthday" id="birthDay" placeholder="Ngày Sinh Nhật" value="${account.information.birthDay}"/>
                                                    <span id="span-save" onclick="changeProfile('#birthDay')" class="show-password-btn"></span>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="control-label col-sm-2" for="address">Address</label>
                                                <div class="col-sm-6">
                                                    <input type="text" maxlength="50" class="form-control" name="address" id="address" placeholder="Address" value="${account.information.address}"/>
                                                    <span id="span-save" onclick="changeProfile('#address')" class="show-password-btn"><i id="pen-address" class="fa fa-pencil"></i><i id="check-address" class="fa fa-check text-success text-success"></i></span>

                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="country" class="control-label col-sm-2">Country</label>
                                                <div class="col-sm-6">
                                                    <select class="form-control" id="country" name="countryID">

                                                        <option value="0">Chọn Quốc Gia Của Bạn ...</option>
                                                        <c:forEach items="${requestScope.listCountry}" var="c">
                                                            <option value="${c.countryID}" ${account.information.country.countryID == c.countryID ? 'selected': ''}>${c.countryName} </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="control-label col-sm-2">Status</label>
                                                <div class="col-sm-6"> 
                                                    <div class="mt-1 mb-3 button-container">
                                                        <div id="summernote_textarea" class="editor p-3 border bg-white shadow-sm" >
                                                            ${account.information.status}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>        

                                            <div class="form-group row">
                                                <label class="control-label col-sm-7"></label>
                                                <div class="col-sm-2"> 
                                                    <button type="submit" id="alertify_success_top" class="btn btn-success">Save</button>

                                                </div>
                                            </div>       
                                        </form>      
                                    </div>
                                    <div class="tab-pane fade" id="custom-profile" role="tabpanel" aria-labelledby="nav-profile">
                                        <p>Profile tab</p>
                                    </div>
                                    <div class="tab-pane fade" id="custom-contact" role="tabpanel" aria-labelledby="nav-contact">
                                        <p>Contact tab</p>
                                    </div>
                                </div>
                            </div>
                            <!--/Blank Page-->

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

        <!--Summernote Editor-->
        <script src="adminPugins/assets/js/summernote/summernote-bs4.js"></script>

        <!--Custom Js Script-->
        <script src="adminPugins/assets/js/custom.js"></script>
        <!--Custom Js Script-->

        <!--Alertify JS-->
        <script src="adminPugins/assets/js/alertify.min.js"></script>

        <!--Paper bootstrap wizard-->
        <script src="adminPugins/assets/js/jquery.bootstrap.wizard.js"></script>
        <script src="adminPugins/assets/js/paper-bootstrap-wizard.js"></script>
        <script src="adminPugins/assets/js/jquery.validate.min.js"></script>

        <script src="adminPugins/assets/js/mycode.js"></script>

        <script type="text/javascript">
                                                        //Summernote for div
                                                        $('#summernote_div').summernote();

                                                        //Summernote for textarea
                                                        $('#summernote_textarea').summernote();
        </script>
    </body>
</html>
