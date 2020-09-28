
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

String Title = "Dashboard";
%>
<jsp:include page="header.jsp">
	<jsp:param name="Title" value="<%= Title %>" />
	<jsp:param name="IndexActive" value="active" />
</jsp:include>

<div class="container-fluid mt-5">
	<div class="row">
		<div class="col">
			<div class="card">
				<!-- Card header -->
				<div class="card-header border-0">
					<h3 class="mb-0"><%= Title %></h3>
				</div>
				<!-- Light table -->
				<div class="table-responsive">
					<table class="table align-items-center table-flush">
						<thead class="thead-light">

						</thead>
						<tbody class="list">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" />