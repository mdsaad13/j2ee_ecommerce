<%@page import="com.ecom.modals.Products"%>
<%@page import="com.ecom.dbutil.ProductsUtil"%>
<%
    int ID = Integer.parseInt(request.getParameter("id").toString());

    ProductsUtil productsUtil = new ProductsUtil();
    Products item = productsUtil.GetActiveByID(ID);

    Boolean NotAvailable = item.getQuantity() <= 0;

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
    <jsp:param name="Title" value="<%= item.getTitle() %>" />
    <jsp:param name="Products_Active" value="active" />
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
        <% } %>
        <table class="table">
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
            </tr>
        </table>

        <div class="row">
            <div class="col-md-4 ml-auto">
                <table class="table table-bordered">
                    <tr>
                        <th>Total</th>
                        <th class="h2">&#x20B9; <%= item.getPrice() %></th>
                    </tr>
                </table>
                <form action="OrderServlet" method="post">
                    <input type="hidden" name="action" value="direct_checkout">
                    <input type="hidden" name="ret_uri" value="buy-now.jsp?id=<%= item.getID() %>">
                    <input type="hidden" name="prod_id" value="<%= item.getID() %>">
                    <button type="submit" class="btn btn-success btn-lg w-100 mt-3"
                        <%= NotAvailable ? "disabled" : "" %>>Buy Now</button>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp" />