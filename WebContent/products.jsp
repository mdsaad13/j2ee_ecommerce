<%@page import="com.ecom.modals.Products"%>
<%@page import="com.ecom.dbutil.ProductsUtil"%>
<%@page import="java.util.ArrayList"%>
<%
    ProductsUtil productsUtil = new ProductsUtil();
    ArrayList<Products> list = productsUtil.ActiveList();
%>

<jsp:include page="header.jsp">
    <jsp:param name="Title" value="All Products" />
    <jsp:param name="Products_Active" value="active" />
</jsp:include>

<section class="intro-single">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-8">
                <div class="title-single-box">
                    <h1 class="title-single">All Products</h1>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.jsp">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            All Products
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>

<% if(!list.isEmpty()){ %>
<section class="section-property section-t4">
    <div class="container">
        <div class="row">
            <% for(Products item : list){ %>
            <div class="col-md-4 mb-5">
                <div class="carousel-item-b">
                    <div class="card-box-a">
                        <div class="img-box-a">
                            <a class="badge badge-primary"
                                href="category.jsp?id=<%= item.getCatID() %>"><%= item.getCategoryName() %></a>
                            <img src="images/products/<%= item.getImage() %>" alt="<%= item.getTitle() %>"
                                class="img-a img-fluid">
                        </div>
                        <div class="card-box-a-content">
                            <h4>
                                <a href="view-product.jsp?id=<%= item.getID() %>">
                                    <%= item.getTitle() %>
                                </a>
                            </h4>
                            <p class="price-box">
                                &#x20B9; <%= item.getPrice() %>
                            </p>
                            <a href="CartServlet?action=add&id=<%= item.getID() %>" class="btn btn-primary">
                                <span class="fa fa-cart-plus"></span> Add to cart
                            </a>
                            <a href="buy-now.jsp?id=<%= item.getID() %>" class="btn btn-success">
                                <span class="fa fa-credit-card"></span> Buy Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</section>
<% } else { %>
<div class="container mt-5">
    <div class="row">
        <div class="col-4 m-auto">
            <div class="alert alert-primary" role="alert">
                <strong>No Products found!</strong>
            </div>
        </div>
    </div>
</div>

<% } %>

<jsp:include page="footer.jsp" />