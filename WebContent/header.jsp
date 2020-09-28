<%@page import="com.ecom.modals.Categories"%>
<%@page import="com.ecom.dbutil.CategoriesUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecom.modals.Slider"%>
<%@page import="com.ecom.dbutil.SliderUtil"%>
<%@page import="com.ecom.Environment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
CategoriesUtil catUtil = new CategoriesUtil();
ArrayList<Categories> ActiveCats = catUtil.ActiveList();
%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

	<title>${param.Title} - <%= Environment._SoftwareName %></title>

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

	<!-- Vendor CSS Files -->
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
	<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
		integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
	<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">

	<!-- Template Main CSS File -->
	<link href="assets/css/style.css" rel="stylesheet">

	<link href="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/theme-default.min.css" rel="stylesheet"
		type="text/css" />
</head>

<body>

	<!-- ======= Header/Navbar ======= -->
	<nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
		<div class="container">
			<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
				aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
				<span></span>
				<span></span>
				<span></span>
			</button>
			<a class="navbar-brand text-brand" href="index.jsp">
				<span class="color-b"><%= Environment._SoftwareName %></span>
			</a>
			<button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none"
				data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-expanded="false">
				<span class="fa fa-search" aria-hidden="true"></span>
			</button>
			<div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link ${param.IndexActive}" href="index.jsp">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link ${param.Products_Active}" href="products.jsp">Products</a>
					</li>
					<% if(!ActiveCats.isEmpty()){ %>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle ${param.Categories_Active}" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Categories
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<% for(Categories catlist : ActiveCats){ %>
							<a class="dropdown-item"
								href="category.jsp?id=<%= catlist.getID() %>"><%= catlist.getName() %>
								(<%= catlist.getActiveProducts() %>)</a>
							<% } %>
						</div>
					</li>
					<% } %>
					<li class="nav-item">
						<a class="nav-link ${param.Contact_Active}" href="contact.jsp">Contact</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle ${param.Account_Active}" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							My Account
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<% if(session.getAttribute("UserID") == null){ %>
							<a class="dropdown-item ${param.Login_Active}" href="login.jsp">Login</a>
							<a class="dropdown-item ${param.Register_Active}" href="register.jsp">Register</a>
							<% } else { %>
							<a class="dropdown-item ${param.Cart_Active}" href="cart.jsp">My Cart</a>
							<a class="dropdown-item ${param.Orders_Active}" href="orders.jsp">My Orders</a>
							<hr>
							<a class="dropdown-item ${param.Profile_Active}" href="my-account.jsp">My Account</a>
							<a class="dropdown-item" href="logout.jsp">Logout</a>
							<% } %>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- End Header/Navbar -->

	<% 
	if(request.getParameter("intro_slider") != null ) {
		
		SliderUtil sliderUtil = new SliderUtil();
		ArrayList<Slider> slider = sliderUtil.List();
	%>
	<!-- ======= Intro Section ======= -->
	<div class="intro intro-carousel">
		<div id="carousel" class="owl-carousel owl-theme">
			<% for(Slider item : slider){ %>
			<a href="<%= item.getRedirect() %>">
				<div class="carousel-item-a intro-item bg-image"
					style="background-image: url(images/slider/<%= item.getImage() %>)">
					<div class="overlay overlay-a"></div>
					<div class="intro-content display-table">
						<div class="table-cell">
							<div class="container">
								<div class="row">
									<div class="col-lg-8">
										<div class="intro-body">
											<h1 class="intro-title mb-4">
												<%= item.getTitle() %>
											</h1>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</a>
			<% } %>
		</div>
	</div><!-- End Intro Section -->
	<% } %>
	<main id="main">