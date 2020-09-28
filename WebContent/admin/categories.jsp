<%@page import="com.ecom.modals.Categories"%>
<%@page import="com.ecom.dbutil.CategoriesUtil"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

String Title = "Categories";

CategoriesUtil util = new CategoriesUtil();

ArrayList<Categories> list = util.List();
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
    <jsp:param name="Categories_Active" value="active" />
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
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#addModel">Add New</button>
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
                                Name
                            </th>
                            <th>
                                Total Products
                            </th>
                            <th>
                                Active Products
                            </th>
                            <th>
                                Status
                            </th>
                            <th>
                                Action
                            </th>
                        </thead>
                        <tbody class="list">
                            <%
                            int i = 1;
                            for (Categories item : list) 
                            { %>
                            <tr>
                                <td>
                                    <%= i %>
                                </td>
                                <td>
                                    <%= item.getName() %>
                                </td>
                                <td>
                                    <%= item.getTotalProducts() %>
                                </td>
                                <td>
                                    <%= item.getActiveProducts() %>
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
                                            <button class="dropdown-item" type="button" data-toggle="modal"
                                                data-target="#updateModel" data-id="<%= item.getID() %>"
                                                data-name="<%= item.getName() %>"
                                                data-isactive="<%= item.getIsActive()%>">Edit</button>
                                            <button class="dropdown-item text-danger DeleteThis"
                                                data-redirect="CategoriesServelet?id=<%= item.getID() %>"
                                                data-sub_question="Deleting Category will delete all related products">Delete</button>
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

<!-- Add Modal -->
<form method="post" action="CategoriesServelet">
    <input type="hidden" name="action" value="add">
    <div class="modal fade" id="addModel" tabindex="-1" role="dialog" aria-labelledby="addModelTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModelTitle">Add New <%= Title %></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter name">
                    </div>
                    <div class="form-group">
                        <label for="isactive">Status</label>
                        <select class="form-control" id="isactive" name="isactive">
                            <option value="1">Active</option>
                            <option value="2">In-Active</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </div>
</form>

<!-- Update Modal -->
<form method="post" action="CategoriesServelet">
    <input type="hidden" name="action" value="update">
    <div class="modal fade" id="updateModel" tabindex="-1" role="dialog" aria-labelledby="updateModelTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Update <%= Title %> <span id="updateModelTitle"></span></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="update_id">
                    <div class="form-group">
                        <label for="update_name">Name</label>
                        <input type="text" class="form-control" id="update_name" name="name" placeholder="Enter name">
                    </div>
                    <div class="form-group">
                        <label for="update_isactive">Status</label>
                        <select class="form-control" id="update_isactive" name="isactive">
                            <option value="1">Active</option>
                            <option value="2">In-Active</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </div>
</form>

<jsp:include page="footer.jsp" />

<script>
    $('#updateModel').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var id = button.data('id');
        var name = button.data('name');
        var isactive = button.data('isactive');

        var modal = $(this);
        modal.find('#updateModelTitle').text(name);

        modal.find('.modal-body #update_id').val(id);
        modal.find('.modal-body #update_name').val(name);
        modal.find('.modal-body #update_isactive').val(isactive).change();
    })
</script>