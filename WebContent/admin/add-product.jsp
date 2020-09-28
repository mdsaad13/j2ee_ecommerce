<%@page import="com.ecom.modals.Categories"%>
<%@page import="com.ecom.dbutil.CategoriesUtil"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

String Title = "Add Products";

CategoriesUtil util = new CategoriesUtil();
ArrayList<Categories> list = util.ActiveList();
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
    <jsp:param name="Products_Active" value="active" />
</jsp:include>

<div class="container-fluid mt-5">
    <div class="row">
        <div class="col">
            <div class="card card-primary">
                <!-- Card header -->
                <div class="card-header border-0">
                    <div class="row">
                        <div class="col-8">
                            <h3 class="mb-0"><%= Title %></h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 pl-5">
                        <form method="POST" action="ProductsServelet" enctype="multipart/form-data">
                            <input type="hidden" name="action" value="add">
                            <div class="form-group">
                                <label for="title">Title</label>
                                <input type="text" name="title" id="title" class="form-control"
                                    placeholder="Enter title" required>
                            </div>
                            <div class="form-group">
                                <label for="cat_id">Category</label>
                                <select class="form-control" id="cat_id" name="cat_id">
                                    <%
                                    for (Categories item : list) 
                                    { %>
                                    <option value="<%= item.getID() %>"><%= item.getName() %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="description">Description/Details</label>
                                <textarea name="description" id="description" rows="10" placeholder="Enter description"
                                    class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="quantity">Quantity</label>
                                <input type="number" name="quantity" id="quantity" class="form-control"
                                    placeholder="Enter available quantity" required>
                            </div>
                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="number" name="price" id="price" class="form-control"
                                    placeholder="Enter price per quantity" required>
                            </div>
                            <div class="form-group">
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="image" name="image" required>
                                    <label class="custom-file-label" for="image">Choose file...</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="isactive">Status</label>
                                <select class="form-control" id="isactive" name="isactive">
                                    <option value="1">Active</option>
                                    <option value="2" selected>In-Active</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="isfeatured">Featured</label>
                                <select class="form-control" id="isfeatured" name="isfeatured">
                                    <option value="1">Yes</option>
                                    <option value="2" selected>No</option>
                                </select>
                            </div>
                            <div class="mt-5 text-center">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />