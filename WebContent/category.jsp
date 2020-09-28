<%@page import="com.ecom.modals.Categories"%>
<%@page import="com.ecom.dbutil.CategoriesUtil"%>
<%@page import="com.ecom.modals.Products"%>
<%@page import="com.ecom.dbutil.ProductsUtil"%>
<%@page import="java.util.ArrayList"%>
<%
    int CatID = Integer.parseInt(request.getParameter("id").toString());

    CategoriesUtil catUtil = new CategoriesUtil();
    ProductsUtil productsUtil = new ProductsUtil();

    ArrayList<Products> ProductsOfCat = productsUtil.GetByCatID(CatID);

    Categories CurentCat = catUtil.GetByID(CatID);

%>

<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= CurentCat.getName() %>" />
    <jsp:param name="Categories_Active" value="active" />
</jsp:include>

<section class="intro-single">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-8">
                <div class="title-single-box">
                    <h1 class="title-single"><%= CurentCat.getName() %></h1>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.jsp">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <%= CurentCat.getName() %>
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>

<% if(!ProductsOfCat.isEmpty()){ %>
<section class="section-property section-t4">
    <div class="container">
        <div class="row">
            <% for(Products CatProdsSingle : ProductsOfCat){ %>
            <div class="col-md-4 mb-5">
                <div class="carousel-item-b">
                    <div class="card-box-a">
                        <div class="img-box-a">
                            <img src="images/products/<%= CatProdsSingle.getImage() %>"
                                alt="<%= CatProdsSingle.getTitle() %>" class="img-a img-fluid">
                        </div>
                        <div class="card-box-a-content">
                            <h4>
                                <a href="view-product.jsp?id=<%= CatProdsSingle.getID() %>">
                                    <%= CatProdsSingle.getTitle() %>
                                </a>
                            </h4>
                            <p class="price-box">
                                &#x20B9; <%= CatProdsSingle.getPrice() %>
                            </p>
                            <a href="CartServlet?action=add&id=<%= CatProdsSingle.getID() %>" class="btn btn-primary">
                                <span class="fa fa-cart-plus"></span> Add to cart
                            </a>
                            <a href="buy-now.jsp?id=<%= CatProdsSingle.getID() %>" class="btn btn-success">
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
                <strong>No Products found for <%= CurentCat.getName() %></strong>
            </div>
        </div>
    </div>
</div>

<% } %>

<jsp:include page="footer.jsp" />