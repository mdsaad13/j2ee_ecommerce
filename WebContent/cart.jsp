<%@page import="java.util.ArrayList"%>
<%@page import="com.ecom.modals.Products"%>
<%@page import="com.ecom.dbutil.ProductsUtil"%>
<%@page import="com.ecom.modals.Cart"%>
<%@page import="com.ecom.dbutil.CartUtil"%>
<%

    if(session.getAttribute("UserID") == null){
        response.sendRedirect("login.jsp");
        return;
    }

    ProductsUtil productsUtil = new ProductsUtil();
    CartUtil cartUtil = new CartUtil();

    ArrayList<Cart> MyCart = cartUtil.List((int) session.getAttribute("UserID"));
    Double TotalPrice = 0.0;

    String AlertType = null;
    String AlertMessage = null;

    if(session.getAttribute("success_msg") != null)
    try{
        AlertMessage = session.getAttribute("success_msg").toString();
        session.removeAttribute("success_msg");
        AlertType = "alert-success";
    }catch(Exception e){}

    if(session.getAttribute("error_msg") != null)
    try{
        AlertMessage = session.getAttribute("error__msg").toString();
        session.removeAttribute("error_msg");
        AlertType = "alert-warning";
    }catch(Exception e){}

    if(session.getAttribute("warning_msg") != null)
    try{
        AlertMessage = session.getAttribute("warning_msg").toString();
        session.removeAttribute("warning_msg");
        AlertType = "alert-danger";
    }catch(Exception e){}
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="My Cart" />
    <jsp:param name="Account_Active" value="active" />
    <jsp:param name="Cart_Active" value="active" />
</jsp:include>

<section class="section-t8">
    <div class="container my-5">
        <% if(AlertMessage != null && AlertType != null){ %>
        <div class="row">
            <div class="col-5 m-auto">
                <div class="alert <%= AlertType %> alert-dismissible fade show" role="alert">
                    <strong><%= AlertMessage %></strong>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </div>
        </div>
        <% }
        if(!MyCart.isEmpty()){ %>
        <table class="table">
            <%
            for(Cart cartItem : MyCart){
                Products item = productsUtil.GetActiveByID(cartItem.getProdID());
                TotalPrice += item.getPrice();
                Boolean NotAvailable = item.getQuantity() <= 0;
            %>
            <tr>
                <td>
                    <img src="images/products/<%= item.getImage() %>" height="150">
                </td>
                <td class="<%= NotAvailable ? "text-danger" : "" %>">
                    <%= item.getTitle() %>
                </td>
                <th class="<%= NotAvailable ? "text-danger" : "" %>">
                    &#x20B9; <%= item.getPrice() %>
                    <%= NotAvailable ? "<br> <small class=\"text-uppercase\">Product out of stock</small>" : "" %>
                </th>
                <td>
                    <a href="CartServlet?action=remove&id=<%= cartItem.getID() %>"
                        class="btn btn-sm btn-danger">Remove</a>
                </td>
            </tr>
            <% } %>
        </table>

        <div class="row">
            <div class="col-md-4 ml-auto">
                <table class="table table-bordered">
                    <tr>
                        <th>Total</th>
                        <th class="h2">&#x20B9; <%= TotalPrice %></th>
                    </tr>
                </table>
                <form action="OrderServlet" method="post">
                    <input type="hidden" name="action" value="cart_checkout">
                    <input type="hidden" name="ret_uri" value="cart.jsp">
                    <button type="submit" class="btn btn-success btn-lg w-100 mt-3">Buy Now</button>
                </form>
            </div>
        </div>
        <% } else { %>
        <div class="row">
            <div class="col-md-4 m-auto">
                <div class="alert alert-warning">
                    <strong>Your cart is empty!</strong>
                    <br>
                    <a href="index.jsp">Click here</a> to Continue Shopping
                </div>
            </div>
        </div>
        <% } %>
    </div>
</section>

<jsp:include page="footer.jsp" />