<%@page import="com.ecom.Environment"%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="Contact us" />
    <jsp:param name="Contact_Active" value="active" />
</jsp:include>

<section class="intro-single">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-8">
                <div class="title-single-box">
                    <h1 class="title-single">Contact us</h1>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.jsp">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Contact us
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>

<section class="contact">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 section-t4">
                <div class="row">
                    <div class="col-md-7">
                        <form action="/ContactUsServelet" method="post" role="form" class="php-email-form">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <div class="form-group">
                                        <input type="text" name="name"
                                            class="form-control form-control-lg form-control-a" placeholder="Your Name"
                                            data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                                        <div class="validate"></div>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <div class="form-group">
                                        <input name="email" type="email"
                                            class="form-control form-control-lg form-control-a" placeholder="Your Email"
                                            data-rule="email" data-msg="Please enter a valid email">
                                        <div class="validate"></div>
                                    </div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <div class="form-group">
                                        <input type="text" name="subject"
                                            class="form-control form-control-lg form-control-a" placeholder="Subject"
                                            data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject">
                                        <div class="validate"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea name="message" class="form-control" name="message" cols="45" rows="8"
                                            data-rule="required" data-msg="Please write something for us"
                                            placeholder="Message"></textarea>
                                        <div class="validate"></div>
                                    </div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <div class="mb-3">
                                        <div class="loading">Loading</div>
                                        <div class="error-message"></div>
                                        <div class="sent-message">Your message has been sent. Thank you!</div>
                                    </div>
                                </div>

                                <div class="col-md-12 text-center">
                                    <button type="submit" class="btn btn-a">Send Message</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-5 section-md-t3">
                        <div class="icon-box section-b2">
                            <div class="icon-box-icon">
                                <span class="ion-ios-paper-plane"></span>
                            </div>
                            <div class="icon-box-content table-cell">
                                <div class="icon-box-title">
                                    <h4 class="icon-title">Say Hello</h4>
                                </div>
                                <div class="icon-box-content">
                                    <p class="mb-1">Email.
                                        <span class="color-a"><%= Environment._OwnerEmail %></span>
                                    </p>
                                    <p class="mb-1">Phone.
                                        <span class="color-a"><%= Environment._OwnerMobile %></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="icon-box section-b2">
                            <div class="icon-box-icon">
                                <span class="ion-ios-pin"></span>
                            </div>
                            <div class="icon-box-content table-cell">
                                <div class="icon-box-title">
                                    <h4 class="icon-title">Find us in</h4>
                                </div>
                                <div class="icon-box-content">
                                    <p class="mb-1">
                                        <%= Environment._OwnerAddress %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp" />