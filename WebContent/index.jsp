<%@page import="com.ecom.modals.Categories"%>
<%@page import="com.ecom.dbutil.CategoriesUtil"%>
<%@page import="com.ecom.modals.Products"%>
<%@page import="com.ecom.dbutil.ProductsUtil"%>
<%@page import="java.util.ArrayList"%>
<%
    CategoriesUtil catUtil = new CategoriesUtil();
    ArrayList<Categories> ActiveCats = catUtil.ActiveList();

    ProductsUtil productsUtil = new ProductsUtil();
    ArrayList<Products> FeaturedProducts = productsUtil.FeaturedProducts();
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="Home" />
    <jsp:param name="IndexActive" value="active" />
    <jsp:param name="intro_slider" value="true" />
</jsp:include>

<% if(!FeaturedProducts.isEmpty()){ %>
<section class="section-property section-t8">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="title-wrap d-flex justify-content-between">
                    <div class="title-box">
                        <h2 class="title-a">Featured Products</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="owl-carousel owl-theme product-carousel">
            <% for(Products fProdsList : FeaturedProducts){ %>
            <div class="carousel-item-b">
                <div class="card-box-a">
                    <div class="img-box-a">
                        <a class="badge badge-primary"
                            href="category.jsp?id=<%= fProdsList.getCatID() %>"><%= fProdsList.getCategoryName() %></a>
                        <img src="images/products/<%= fProdsList.getImage() %>" alt="<%= fProdsList.getTitle() %>"
                            class="img-a img-fluid">
                    </div>
                    <div class="card-box-a-content">
                        <h4>
                            <a href="view-product.jsp?id=<%= fProdsList.getID() %>">
                                <%= fProdsList.getTitle() %>
                            </a>
                        </h4>
                        <p class="price-box">
                            &#x20B9; <%= fProdsList.getPrice() %>
                        </p>
                        <a href="CartServlet?action=add&id=<%= fProdsList.getID() %>" class="btn btn-primary">
                            <span class="fa fa-cart-plus"></span> Add to cart
                        </a>
                        <a href="buy-now.jsp?id=<%= fProdsList.getID() %>" class="btn btn-success">
                            <span class="fa fa-credit-card"></span> Buy Now
                        </a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</section>
<% } %>

<% 
    if(!ActiveCats.isEmpty()){ 
    for(Categories catlist : ActiveCats){
        ArrayList<Products> ProductsOfCat = productsUtil.GetByCatID(catlist.getID());
      if(!ProductsOfCat.isEmpty()){
%>
<section class="section-property section-t8">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="title-wrap d-flex justify-content-between">
                    <div class="title-box">
                        <h2 class="title-a"><%= catlist.getName() %></h2>
                    </div>
                    <div class="title-link">
                        <a href="category.jsp?id=<%= catlist.getID() %>">View All
                            <span class="ion-ios-arrow-forward"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="owl-carousel owl-theme product-carousel">
            <% for(Products CatProdsSingle : ProductsOfCat){ %>
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
            <% } %>
        </div>
    </div>
</section>
<% } } } %>

<jsp:include page="footer.jsp" />