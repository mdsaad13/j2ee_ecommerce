<%@page import="com.ecom.modals.Categories"%>
<%@page import="com.ecom.dbutil.CategoriesUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecom.Environment"%>
<%
CategoriesUtil catUtil = new CategoriesUtil();
ArrayList<Categories> ActiveCats = catUtil.ActiveList();
%>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<section class="section-footer">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-4">
                <div class="widget-a">
                    <div class="w-header-a">
                        <h3 class="w-title-a text-brand"><%= Environment._SoftwareName %></h3>
                    </div>
                    <div class="w-footer-a">
                        <ul class="list-unstyled">
                            <li class="color-a">
                                <span class="color-text-a">Address .</span> <%= Environment._OwnerAddress %>
                            </li>
                            <li class="color-a">
                                <span class="color-text-a">Phone .</span> <%= Environment._OwnerMobile %>
                            </li>
                            <li class="color-a">
                                <span class="color-text-a">Email .</span> <%= Environment._OwnerEmail %>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-4 section-md-t3">
                <div class="widget-a">
                    <div class="w-header-a">
                        <h3 class="w-title-a text-brand">Quick Links</h3>
                    </div>
                    <div class="w-body-a">
                        <div class="w-body-a">
                            <ul class="list-unstyled">
                                <li class="item-list-a">
                                    <i class="fa fa-angle-right"></i> <a href="index.jsp">Home</a>
                                </li>
                                <li class="item-list-a">
                                    <i class="fa fa-angle-right"></i> <a href="products.jsp">Products</a>
                                </li>
                                <li class="item-list-a">
                                    <i class="fa fa-angle-right"></i> <a href="contact.jsp">Contact</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <% if(!ActiveCats.isEmpty()){ %>
            <div class="col-sm-12 col-md-4 section-md-t3">
                <div class="widget-a">
                    <div class="w-header-a">
                        <h3 class="w-title-a text-brand">Categories</h3>
                    </div>
                    <div class="w-body-a">
                        <ul class="list-unstyled">
                            <% for(Categories catlist : ActiveCats){ %>
                            <li class="item-list-a">
                                <i class="fa fa-angle-right"></i>
                                <a href="category.jsp?id=<%= catlist.getID() %>">
                                    <%= catlist.getName() %> (<%= catlist.getActiveProducts() %>)
                                </a>
                            </li>
                            <% } %>
                        </ul>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</section>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="copyright-footer">
                    <p class="copyright color-text-a">
                        &copy; Copyright
                        <span class="color-a"><%= Environment._SoftwareName %></span> All Rights Reserved.
                    </p>
                </div>
                <div class="credits">
                    Powered by <%= Environment._SoftwareName %>
                </div>
            </div>
        </div>
    </div>
</footer><!-- End  Footer -->

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
<!-- <div id="preloader"></div> -->

<!-- Vendor JS Files -->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="assets/js/validate.js"></script>
<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
<script src="assets/vendor/scrollreveal/scrollreveal.min.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

<!-- Validator -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>

    $.validate({
        modules: 'location, date, security, file',
        onModulesLoaded: function () {
            $('#country').suggestCountry();
        }
    });

    // Restrict presentation length
    $('#presentation').restrictLength($('#pres-max-length'));
</script>

</body>

</html>