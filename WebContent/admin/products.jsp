<%@page import="com.ecom.modals.Products"%>
<%@page import="com.ecom.dbutil.ProductsUtil"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

String Title = "Products";

ProductsUtil util = new ProductsUtil();

ArrayList<Products> list = util.List();
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
    <jsp:param name="Products_Active" value="active" />
</jsp:include>

<div class="container-fluid mt-5">
    <div class="row">
        <div class="col">
            <div class="card">
                <!-- Card header -->
                <div class="card-header border-0">
                    <div class="row">
                        <div class="col-8">
                            <h3 class="mb-0"><%= Title %></h3>
                        </div>
                        <div class="col-4 text-right">
                            <a href="add-product.jsp" class="btn btn-primary">Add New</a>
                        </div>
                    </div>

                </div>
                <!-- Light table -->
                <div class="table-responsive">
                    <table class="table align-items-center table-flush" id="dataTable">
                        <thead class="thead-light">
                            <th>
                                #
                            </th>
                            <th>
                                Image
                            </th>
                            <th>
                                Title
                            </th>
                            <th>
                                Category
                            </th>
                            <th>
                                Description
                            </th>
                            <th>
                                Quantity
                            </th>
                            <th>
                                Price
                            </th>
                            <th>
                                Is featured
                            </th>
                            <th>
                                Status
                            </th>
                            <th></th>
                        </thead>
                        <tbody class="list">
                            <%
                            int i = 1;
                            for (Products item : list) 
                            { %>
                            <tr>
                                <td>
                                    <%= i %>
                                </td>
                                <td>
                                    <img src="../images/products/<%= item.getImage() %>" height="80">
                                </td>
                                <td>
                                    <%= item.getTitle() %>
                                </td>
                                <td>
                                    <%= item.getCategoryName() %>
                                </td>
                                <td>
                                    <%= item.getDescription() %>
                                </td>
                                <td>
                                    <%= item.getQuantity() %>
                                </td>
                                <td>
                                    <%= item.getPrice() %>
                                </td>
                                <td class="font-weight-bold">
                                    <%= (item.getIsFeatured() == 1) ? "<span class='text-success'>Yes</span>" : "<span class='text-danger'>No</span>" %>
                                </td>
                                <td class="font-weight-bold">
                                    <%= (item.getIsActive() == 1) ? "<span class='text-success'>Active</span>" : "<span class='text-danger'>In-Active</span>" %>
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <a class="btn btn-sm btn-icon-only font-weight-bold" href="#" role="button"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                            <a class="dropdown-item"
                                                href="edit-product.jsp?id=<%= item.getID() %>">Edit</a>
                                            <button class="dropdown-item text-danger DeleteThis"
                                                data-redirect="ProductsServelet?id=<%= item.getID() %>"
                                                data-sub_question="You want to delete <%= item.getTitle() %>">Delete</button>
                                        </div>
                                    </div>
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