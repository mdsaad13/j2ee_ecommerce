<%@page import="com.ecom.modals.User"%>
<%@page import="com.ecom.dbutil.AccountUtil"%>
<%
if(session.getAttribute("UserID") == null){
	response.sendRedirect("login.jsp");
	return;
}

AccountUtil accountUtil = new AccountUtil();
User user = accountUtil.GetUserByID((int) session.getAttribute("UserID"));

String Message = null;
Message = request.getParameter("message");

%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="My Account" />
    <jsp:param name="Account_Active" value="active" />
    <jsp:param name="Profile_Active" value="active" />
</jsp:include>

<section class="intro-single">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-8">
                <div class="title-single-box">
                    <h1 class="title-single">My Account</h1>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.jsp">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            My Account
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>

<div class="container my-5">
    <div class="row">
        <div class="col-md-6 m-auto">
            <%
			if (Message != null)
			if (Message.equals("UpdateSuccess")) {
		%>
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                Profile updated successfully!
            </div>
            <%
			} else if (Message.equals("UpdateFailed")) {
		%>
            <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                Profile update failed!
            </div>
            <%
			} else if (Message.equals("PasswordChangeSuccess")) {
		%>
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                Password changed successfully!
            </div>
            <%
			} else if (Message.equals("PasswordChangeFailed")) {
		%>
            <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                Password change failed!
            </div>
            <%
			} else if (Message.equals("IncorrectPassword")) {
		%>
            <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                Incorrect password entered! Kindly enter correct password.
            </div>
            <%
			}
		%>
        </div>
        <div class="col-12"></div>
        <div class="col-md-6">
            <form method="POST" role="form" action="SettingsServlet">
                <input type="hidden" name="action" value="update">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="name" name="name" class="form-control form-control-lg" id="name"
                        placeholder="Enter name" data-validation="required" value="<%= user.getName() %>">
                </div>
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" name="email" class="form-control form-control-lg" id="email"
                        placeholder="Enter email" autocomplete="email" data-validation="email"
                        value="<%= user.getEmail() %>">
                </div>
                <div class="form-group">
                    <label for="phone">Mobile number</label>
                    <input type="text" placeholder="Mobile number" name="phone" id="phone"
                        class="form-control form-control-lg" data-validation-regexp="^([6-9]{1})(\d{9})$"
                        data-validation="custom" value="<%= user.getPhone() %>">
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea placeholder="Enter delivery address" name="address" id="address" rows="4"
                        class="form-control form-control-lg"
                        data-validation="required"><%= user.getAddress() %></textarea>
                </div>

                <button type="submit" class="btn btn-warning w-100 mt-3">Submit</button>
            </form>
        </div>
        <div class="col-md-6">
            <form role="form" method="post" action="SettingsServlet">
                <input type="hidden" name="action" value="changepassword">
                <div class="form-group">
                    <label for="password">Current Password</label> <input type="password" class="form-control"
                        name="password" id="password" data-validation="strength" data-validation-strength="2" />
                </div>
                <div class="form-group">
                    <label for="new_password">New Password</label>
                    <input type="password" class="form-control" name="new_password_confirmation" id="inputPassword3"
                        data-validation="strength" data-validation-strength="2" />
                </div>
                <div class="form-group">
                    <label for="re_new_password">Re-Enter New Password</label>
                    <input type="password" class="form-control" name="new_password" id="inputPassword3"
                        data-validation="confirmation" />
                </div>
                <button type="submit" class="btn btn-danger w-100 mt-3">Save</button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />