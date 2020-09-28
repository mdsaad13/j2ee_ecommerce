<jsp:include page="header.jsp">
    <jsp:param name="Title" value="Register" />
    <jsp:param name="Account_Active" value="active" />
    <jsp:param name="Register_Active" value="active" />
</jsp:include>

<section class="intro-single">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-8">
                <div class="title-single-box">
                    <h1 class="title-single">Register</h1>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.jsp">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Register
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
                String msg = "";
                msg = (String) request.getAttribute("message");
                            
                if(msg == "RegisterFailed") {
            %>
            <div class="alert alert-danger" role="alert">
                <strong>An error occured while processing your request!</strong>
            </div>
            <% } %>
            <form method="POST" role="form" action="AuthServlet">
                <input type="hidden" name="action" value="register">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="name" name="name" class="form-control form-control-lg" id="name"
                        placeholder="Enter name" autofocus data-validation="required">
                </div>
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" name="email" class="form-control form-control-lg" id="email"
                        placeholder="Enter email" autocomplete="email" data-validation="email">
                </div>
                <div class="form-group">
                    <label for="phone">Mobile number</label>
                    <input type="text" placeholder="Mobile number" name="phone" id="phone"
                        class="form-control form-control-lg" data-validation-regexp="^([6-9]{1})(\d{9})$"
                        data-validation="custom">
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea placeholder="Enter delivery address" name="address" id="address" rows="4"
                        class="form-control form-control-lg" data-validation="required"></textarea>
                </div>
                <div class="form-group">
                    <label for="inputPassword2">Password</label>
                    <input type="password" class="form-control form-control-lg" name="password_confirmation"
                        placeholder="Enter password" id="inputPassword2" data-validation="strength"
                        data-validation-strength="1" />
                    <small>Enter 1 alphabet, 1 number and atleast 4 charactes</small>
                </div>
                <div class="form-group">
                    <label for="inputPassword2">Re-Password</label>
                    <input type="password" class="form-control form-control-lg" id="inputPassword2"
                        placeholder="Re-Enter password" name="password" data-validation="confirmation">
                </div>
                <button type="submit" class="btn btn-primary w-100 mt-3">Submit</button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />