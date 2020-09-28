<%@page import="com.ecom.modals.Admin"%>
<%@page import="com.ecom.dbutil.AccountUtil"%>
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

AccountUtil accountUtil = new AccountUtil();
Admin user = accountUtil.GetAdminByID((int) session.getAttribute("AdminID"));

String Message = null;
Message = request.getParameter("message");

String Title = "Settings";
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
</jsp:include>
<div class="container-fluid mt-5">

    <%
			if (Message != null)
			if (Message.equals("UpdateSuccess")) {
		%>
    <div class="alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>

        Profile updated successfully!
    </div>
    <%
			} else if (Message.equals("UpdateFailed")) {
		%>
    <div class="alert alert-danger alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>

        Profile update failed!
    </div>
    <%
			} else if (Message.equals("PasswordChangeSuccess")) {
		%>
    <div class="alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>

        Password changed successfully!
    </div>
    <%
			} else if (Message.equals("PasswordChangeFailed")) {
		%>
    <div class="alert alert-danger alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>

        Password change failed!
    </div>
    <%
			} else if (Message.equals("IncorrectPassword")) {
		%>
    <div class="alert alert-danger alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>

        Incorrect password entered! Kindly enter correct password.
    </div>
    <%
			}
		%>
    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table mr-1"></i><%= Title %>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-6">
                    <h3 class="text-center">General Details</h3>
                    <form role="form" method="post" action="AdminSettings">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter name"
                                    value="<%= user.getName() %>" data-validation="required">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email"
                                    placeholder="Enter email" value="<%= user.getEmail() %>" data-validation="email">
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input type="text" class="form-control" id="email" name="phone"
                                    placeholder="Enter phone" value="<%= user.getPhone() %>" data-validation="required">
                            </div>
                        </div>
                        <input type="hidden" name="action" value="update">
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">Update
                                Profile</button>
                        </div>
                    </form>
                </div>
                <div class="col-6">
                    <h3 class="text-center">Change Password</h3>
                    <form role="form" method="post" action="AdminSettings">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="password">Current Password</label> <input type="password"
                                    class="form-control" name="password" id="password" data-validation="strength"
                                    data-validation-strength="2" />
                            </div>
                            <div class="form-group">
                                <label for="new_password">New Password</label>
                                <input type="password" class="form-control" name="new_password_confirmation"
                                    id="inputPassword3" data-validation="strength" data-validation-strength="2" />
                            </div>
                            <div class="form-group">
                                <label for="re_new_password">Re-Enter New Password</label>
                                <input type="password" class="form-control" name="new_password" id="inputPassword3"
                                    data-validation="confirmation" />
                            </div>
                        </div>
                        <input type="hidden" name="action" value="changepassword">
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">Change
                                Password</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />