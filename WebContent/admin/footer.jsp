</div>
</div>

<!-- Core -->
<script src="assets/vendor/jquery/dist/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/js-cookie/js.cookie.js"></script>
<script src="assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
<script src="assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
<script src="assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="assets/vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<!-- Argon JS -->
<script src="assets/js/argon.js?v=1.2.0"></script>

<script src="assets/vendor/bootstrap-notify/bootstrap-notify.min.js" type="text/javascript"></script>

<script>
	$(document).on('click', '.DeleteThis', function (e) {
		e.preventDefault();
		var main_question = $(this).data('main_question');
		var sub_question = $(this).data('sub_question');

		if (typeof main_question === 'undefined') main_question = 'Are you sure? ';
		if (typeof sub_question === 'undefined') sub_question = '';

		if (confirm(main_question + sub_question)) {
			window.location.replace($(this).data('redirect'));
		}
	});

	$(document).ready(function () {
		$('#dataTable').dataTable({
			"language": {
				"paginate": {
					"next": `<i class="fas fa-angle-right"></i>`,
					"previous": `<i class="fas fa-angle-left"></i>`,
				}
			}
		});
	});
</script>

<%

String SuccessToast = null;
String ErrorToast = null;
try{
	SuccessToast = session.getAttribute("success_msg").toString();
	session.removeAttribute("success_msg");
}catch(Exception e){
	
}
try{
	ErrorToast = session.getAttribute("error_msg").toString();
	session.removeAttribute("error_msg");
}catch(Exception e){
	
}

if(SuccessToast != null){
%>

<script type="text/javascript">
	$.notify({
		// options
		message: '<%= SuccessToast %>'
	}, {
		// settings
		type: 'success',
		allow_dismiss: true,
		animate: {
			enter: 'animated fadeInDown',
			exit: 'animated fadeOutUp'
		},
	});
</script>
<% } if(ErrorToast != null){ %>
<script type="text/javascript">
	$.notify({
		// options
		message: '<%= ErrorToast %>'
	}, {
		// settings
		type: 'danger',
		allow_dismiss: true,
		animate: {
			enter: 'animated fadeInDown',
			exit: 'animated fadeOutUp'
		},
	});
</script>
<% } %>

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