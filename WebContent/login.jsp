<% 
String Email = (String) request.getAttribute("Email");

if(Email == null){
	Email = "";
}
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="Login" />
    <jsp:param name="Account_Active" value="active" />
    <jsp:param name="Login_Active" value="active" />
</jsp:include>

<section class="intro-single">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-8">
                <div class="title-single-box">
                    <h1 class="title-single">Login</h1>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.jsp">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Login
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>

<div class="container my-5">
    <div class="row">
        <div class="col-md-4 m-auto">
            <%
                String msg = "";
                msg = (String) request.getAttribute("message");
                            
                if(msg == "InvalidCreds") {
            %>
            <div class="alert alert-danger" role="alert">
                <strong>Incorrect email or password!</strong>
            </div>
            <% } %>
            <form method="POST" role="form" action="AuthServlet">
                <input type="hidden" name="action" value="login">
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" name="email" class="form-control form-control-lg" id="email"
                        placeholder="Enter email" autofocus autocomplete="email" value="<%= Email %>"
                        data-validation="email">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" class="form-control form-control-lg" id="password"
                        placeholder="Enter Password" data-validation="required">
                </div>
                <button type="submit" class="btn btn-primary w-100 mt-3">Submit</button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />