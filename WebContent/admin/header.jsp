<%@page import="com.ecom.modals.Admin"%>
<%@page import="com.ecom.dbutil.AccountUtil"%>
<%@page import="com.ecom.Environment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
int ID = (Integer)session.getAttribute("AdminID");

AccountUtil accountUtil = new AccountUtil();
Admin adminDetails = accountUtil.GetAdminByID(ID);
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${param.Title}- <%= Environment._SoftwareName %> Admin
    </title>
    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
    <!-- Icons -->
    <link rel="stylesheet" href="assets/vendor/nucleo/css/nucleo.css" type="text/css">
    <link rel="stylesheet" href="assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
    <!-- <link rel="stylesheet" href="assets/vendor/datatables.net" type="text/css"> -->
    <link rel="stylesheet" href="assets/vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css" type="text/css">
    <!-- Argon CSS -->
    <link rel="stylesheet" href="assets/css/argon.css?v=1.2.0" type="text/css">
    <!-- Validation -->
    <link href="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/theme-default.min.css" rel="stylesheet"
        type="text/css" />
    <link rel="stylesheet" href="assets/css/custom.css" type="text/css">
</head>

<body>
    <!-- Sidenav -->
    <nav class="sidenav navbar navbar-vertical fixed-left navbar-expand-xs navbar-light bg-white" id="sidenav-main">
        <div class="scrollbar-inner">
            <!-- Brand -->
            <div class="sidenav-header  align-items-center">
                <a class="navbar-brand" href="index.jsp"> <%= Environment._SoftwareShortName %>
                </a>
            </div>
            <div class="navbar-inner">
                <!-- Collapse -->
                <div class="collapse navbar-collapse" id="sidenav-collapse-main">
                    <!-- Nav items -->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link ${param.IndexActive}" href="index.jsp">
                                <i class="ni ni-tv-2 text-primary"></i> <span class="nav-link-text">Home/Orders</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${param.ContactUs_Active}" href="contact-us.jsp">
                                <i class="ni ni-tv-2 text-primary"></i> <span class="nav-link-text">Contact us</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${param.Slider_Active}" href="slider.jsp">
                                <i class="ni ni-tv-2 text-primary"></i> <span class="nav-link-text">Slider</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${param.Categories_Active}" href="categories.jsp">
                                <i class="ni ni-tv-2 text-primary"></i> <span class="nav-link-text">Categories</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${param.Products_Active}" href="products.jsp">
                                <i class="ni ni-tv-2 text-primary"></i> <span class="nav-link-text">Products</span>
                            </a>
                        </li>
                    </ul>
                    <!-- Divider -->
                    <hr class="my-3">
                </div>
            </div>
        </div>
    </nav>
    <!-- Main content -->
    <div class="main-content" id="panel">
        <!-- Topnav -->
        <nav class="navbar navbar-top navbar-expand navbar-dark bg-primary border-bottom">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Navbar links -->
                    <ul class="navbar-nav align-items-center mr-lg-auto">
                        <li class="nav-item d-xl-none">
                            <!-- Sidenav toggler -->
                            <div class="pr-3 sidenav-toggler sidenav-toggler-dark" data-action="sidenav-pin"
                                data-target="#sidenav-main">
                                <div class="sidenav-toggler-inner">
                                    <i class="sidenav-toggler-line"></i> <i class="sidenav-toggler-line"></i> <i
                                        class="sidenav-toggler-line"></i>
                                </div>
                            </div>
                        </li>
                        <li>
                            <h1 class="text-white">Admin Panel</h1>
                        </li>
                    </ul>
                    <ul class="navbar-nav align-items-center ml-auto ml-md-0 ">
                        <li class="nav-item dropdown"><a class="nav-link pr-0" href="#" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="media align-items-center">
                                    <span class="avatar avatar-sm rounded-circle"> <img alt="Image placeholder"
                                            src="assets/img/user.png">
                                    </span>
                                    <div class="media-body  ml-2  d-none d-lg-block">
                                        <span
                                            class="mb-0 text-sm  font-weight-bold"><%= adminDetails.getName() %></span>
                                    </div>
                                </div>
                            </a>
                            <div class="dropdown-menu  dropdown-menu-right ">
                                <div class="dropdown-header noti-title">
                                    <h6 class="text-overflow m-0">
                                        Welcome
                                        <%= adminDetails.getName() %></h6>
                                </div>
                                <a href="profile.jsp" class="dropdown-item"> <i class="ni ni-single-02"></i> <span>My
                                        profile</span>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="logout.jsp" class="dropdown-item"> <i class="ni ni-user-run"></i>
                                    <span>Logout</span>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Header -->