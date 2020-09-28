<%@page import="com.ecom.modals.Slider"%>
<%@page import="com.ecom.dbutil.SliderUtil"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

String Title = "Slider";

SliderUtil util = new SliderUtil();

ArrayList<Slider> list = util.List();
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
    <jsp:param name="Slider_Active" value="active" />
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
                                Image
                            </th>
                            <th>
                                Title
                            </th>
                            <th>
                                Redirect
                            </th>
                            <th>
                                Action
                            </th>
                        </thead>
                        <tbody class="list">
                            <%
                            int i = 1;
                            for (Slider item : list) 
                            { %>
                            <tr>
                                <td>
                                    <%= i %>
                                </td>
                                <td>
                                    <img src="../images/slider/<%= item.getImage() %>" width="300">
                                </td>
                                <td>
                                    <%= item.getTitle() %>
                                </td>
                                <td>
                                    <%= item.getRedirect() %>
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
                                                data-image="<%= item.getImage() %>" data-title="<%= item.getTitle()%>"
                                                data-redirect="<%= item.getRedirect()%>">Edit</button>
                                            <button class="dropdown-item text-danger DeleteThis"
                                                data-redirect="SliderServelet?id=<%= item.getID() %>">Delete</button>
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
<form method="post" action="SliderServelet" enctype="multipart/form-data">
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
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="Enter title"
                            required>
                    </div>
                    <div class="form-group">
                        <label for="update_redirect">Redirect URL</label>
                        <input type="text" class="form-control" id="redirect" name="redirect"
                            placeholder="Enter redirect url" required>
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="image" name="image" required>
                            <label class="custom-file-label" for="image">Choose file...</label>
                        </div>
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
<form method="post" action="SliderServelet" enctype="multipart/form-data">
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
                    <input type="hidden" name="old_img" id="old_img">
                    <div class="form-group">
                        <img class="img-fluid" height="200">
                    </div>
                    <div class="form-group">
                        <label for="update_title">Title</label>
                        <input type="text" class="form-control" id="update_title" name="title" placeholder="Enter title"
                            required>
                    </div>
                    <div class="form-group">
                        <label for="update_redirect">Redirect URL</label>
                        <input type="text" class="form-control" id="update_redirect" name="redirect"
                            placeholder="Enter redirect url" required>
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="image" name="image">
                            <label class="custom-file-label" for="image">Choose file...</label>
                        </div>
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
        var image = button.data('image');
        var title = button.data('title');
        var redirect = button.data('redirect');

        var modal = $(this);

        modal.find('#updateModelTitle').text(title);
        modal.find('.modal-body img.img-fluid').attr('src', '../images/slider/' + image);
        modal.find('.modal-body #update_id').val(id);
        modal.find('.modal-body #old_img').val(image);
        modal.find('.modal-body #update_title').val(title);
        modal.find('.modal-body #update_redirect').val(redirect);
    })
</script>