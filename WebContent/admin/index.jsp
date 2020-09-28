<%@page import="com.ecom.modals.Order"%>
<%@page import="com.ecom.dbutil.OrdersUtil"%>
<%@page import="com.ecom.modals.Products"%>
<%@page import="com.ecom.dbutil.ProductsUtil"%>
<%@page import="com.ecom.modals.User"%>
<%@page import="com.ecom.dbutil.AccountUtil"%>
<%@page import="com.ecom.Formatter"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

ProductsUtil productsUtil = new ProductsUtil();
OrdersUtil ordersUtil = new OrdersUtil();
AccountUtil accountUtil = new AccountUtil();

ArrayList<Order> list = ordersUtil.List();

String Title = "Orders";
%>
<jsp:include page="header.jsp">
	<jsp:param name="Title" value="<%= Title %>" />
	<jsp:param name="IndexActive" value="active" />
</jsp:include>

<div class="container-fluid mt-5">
	<div class="row">
		<div class="col">
			<div class="card">
				<!-- Card header -->
				<div class="card-header border-0">
					<h3 class="mb-0"><%= Title %></h3>
				</div>
				<div class="table-responsive">
					<table class="table align-items-center table-flush" id="dataTable">
						<thead class="thead-light">
							<th>
								#
							</th>
							<th>
								Product
							</th>
							<th>
								User
							</th>
							<th>
								Delivery Address
							</th>
							<th>
								Price
							</th>
							<th>
								Status
							</th>
							<th>
								Order Placed At
							</th>
							<th>
								Updated At
							</th>
							<th></th>
						</thead>
						<tbody class="list">
							<%
                            int i = 1;
                            for (Order item : list) {
                            Products product = productsUtil.GetByID(item.getProdID());
                            User user = accountUtil.GetUserByID(item.getUserID());
                            %>
							<tr>
								<td>
									<%= i %>
								</td>
								<td>
									<%= product.getTitle() %>
								</td>
								<td>
									<%= user.getName() %> <br>
									<%= user.getEmail() %>, <%= user.getPhone() %>
								</td>
								<td>
									<%= user.getAddress() %>
								</td>
								<td>
									<%= product.getPrice() %>
								</td>
								<td class="font-weight-bold">
									<%
                                    String Status = "";
                                    switch (item.getStatus()) {
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
									<% if(item.getStatus() == 1 || item.getStatus() == 2){ %>
									<div class="dropdown">
										<a class="btn btn-sm btn-icon-only font-weight-bold" href="#" role="button"
											data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<i class="fas fa-ellipsis-v"></i>
										</a>
										<div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
											<% if(item.getStatus() != 2){ %>
											<a class="dropdown-item"
												href="OrderServlet?id=<%= item.getID() %>&status=2">
												Mark as <b>Out for delivery</b>
											</a>
											<% } %>
											<a class="dropdown-item"
												href="OrderServlet?id=<%= item.getID() %>&status=3">
												Mark as <b>Delivered</b>
											</a>
											<a class="dropdown-item"
												href="OrderServlet?id=<%= item.getID() %>&status=4">
												Mark as <b>Canceled</b>
											</a>
										</div>
									</div>
									<% } %>
								</td>
								<td>
									<%= Formatter.FormatToDateTime(item.getCreated_at()) %>
								</td>
								<td>
									<%= Formatter.FormatToDateTime(item.getUpdated_at()) %>
								</td>
								<td>

								</td>
							</tr>
							<%  i++;
                            }
                            %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" />