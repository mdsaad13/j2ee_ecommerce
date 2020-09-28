<%@page import="com.ecom.Formatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecom.modals.Products"%>
<%@page import="com.ecom.dbutil.ProductsUtil"%>
<%@page import="com.ecom.modals.Order"%>
<%@page import="com.ecom.dbutil.OrdersUtil"%>
<%

    if(session.getAttribute("UserID") == null){
        response.sendRedirect("login.jsp");
        return;
    }

    ProductsUtil productsUtil = new ProductsUtil();
    OrdersUtil ordersUtil = new OrdersUtil();

    ArrayList<Order> MyOrders = ordersUtil.UserList((int) session.getAttribute("UserID"));

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
    <jsp:param name="Title" value="My Orders" />
    <jsp:param name="Account_Active" value="active" />
    <jsp:param name="Orders_Active" value="active" />
</jsp:include>

<section class="intro-single">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-8">
                <div class="title-single-box">
                    <h1 class="title-single">My Orders</h1>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.jsp">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            My Orders
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>

<section class="section-t2">
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
        if(!MyOrders.isEmpty()){ %>
        <table class="table">
            <tr>
                <th>
                    Product Image
                </th>
                <th>
                    Product Name
                </th>
                <th>
                    Amount
                </th>
                <th>
                    Status
                </th>
                <th>
                    Order Placed At
                </th>
                <td></td>
            </tr>
            <%
            for(Order orderItem : MyOrders){
                Products item = productsUtil.GetByID(orderItem.getProdID());
            %>
            <tr>
                <td>
                    <img src="images/products/<%= item.getImage() %>" height="150">
                </td>
                <td>
                    <%= item.getTitle() %>
                </td>
                <th>
                    &#x20B9; <%= item.getPrice() %>
                </th>
                <td class="font-weight-bold">
                    <%
                    String Status = "";
                    switch (orderItem.getStatus()) {
                      case 1:
                        Status = "<span class=\"text-info\">Order Placed</span>";
                        break;
                      case 2:
                        Status = "<span class=\"text-warning\">Out for delivery</span>";
                        break;
                      case 3:
                        Status = "<span class=\"text-success\">Delivered</span>";
                        break;
                      case 4:
                        Status = "<span class=\"text-danger\">Canceled</span>";
                        break;
                    }
                    %>
                    <%= Status %>
                    <br>
                    <% if(orderItem.getStatus() == 1){ %>
                    <a href="OrderServlet?id=<%= orderItem.getID() %>" class="btn btn-sm btn-danger">Cancel</a>
                    <% } else { %>
                    <small
                        class="font-weight-normal">(<%= Formatter.FormatToDateTime(orderItem.getUpdated_at()) %>)</small>
                    <% } %>
                </td>
                <td>
                    <%= Formatter.FormatToDateTime(orderItem.getCreated_at()) %>
                </td>
            </tr>
            <% } %>
        </table>

        <% } else { %>
        <div class="row">
            <div class="col-md-4 m-auto">
                <div class="alert alert-warning">
                    <strong>You haven't placed any order yet!</strong>
                    <br>
                    <a href="index.jsp">Click here</a> to Order
                </div>
            </div>
        </div>
        <% } %>
    </div>
</section>

<jsp:include page="footer.jsp" />