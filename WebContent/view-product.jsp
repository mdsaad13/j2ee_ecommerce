<%@page import="com.ecom.modals.Products"%>
<%@page import="com.ecom.dbutil.ProductsUtil"%>
<%
    int ID = Integer.parseInt(request.getParameter("id").toString());

    ProductsUtil productsUtil = new ProductsUtil();
    Products item = productsUtil.GetActiveByID(ID);

    Boolean NotAvailable = item.getQuantity() <= 0;
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= item.getTitle() %>" />
    <jsp:param name="Products_Active" value="active" />
</jsp:include>

<section class="section-t8">
    <div class="container my-5">
        <div class="row">
            <div class="col-md-6 text-center">
                <img src="images/products/<%= item.getImage() %>" class="img-fluid" style="max-height: 500px;">
            </div>
            <div class="col-md-6">
                <div class="mb-3">
                    <h3 class="title-d"><%= item.getTitle() %></h3>
                    <a class="badge badge-primary"
                        href="category.jsp?id=<%= item.getCatID() %>"><%= item.getCategoryName() %></a>
                </div>
                <div class="property-description">
                    <p class="description color-text-a">
                        <%= item.getDescription() %>
                    </p>
                </div>
                <h1>&#x20B9; <%= item.getPrice() %></h1>
                <p class="text-danger">
                    <% if(NotAvailable){ %>
                    <span class="text-uppercase font-weight-bold">Product out of stock</span>
                    <% }else{ %>
                    <small>Hurry, Only <%= item.getQuantity() %> left!</small>
                    <% } %>
                </p>
                <a href="CartServlet?action=add&id=<%= item.getID() %>" class="btn btn-primary">
                    <span class="fa fa-cart-plus"></span> Add to cart
                </a>
                <a href="buy-now.jsp?id=<%= item.getID() %>" role="button"
                    class="btn btn-success <%= NotAvailable ? "disabled" : "" %>">
                    <span class="fa fa-credit-card"></span> Buy Now
                </a>
            </div>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp" />