<%@page import="com.ecom.Formatter"%>
<%@page import="com.ecom.modals.ContactUs"%>
<%@page import="com.ecom.dbutil.ContactUsUtil"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

String Title = "Contact us enquiries";

ContactUsUtil util = new ContactUsUtil();

ArrayList<ContactUs> list = util.List();

util.UpdateSeen();
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
    <jsp:param name="ContactUs_Active" value="active" />
</jsp:include>

<div class="container-fluid mt-5">
    <div class="row">
        <div class="col">
            <div class="card">
                <!-- Card header -->
                <div class="card-header border-0">
                    <div class="row">
                        <div class="col-8">
                            <h3><%= Title %></h3>
                        </div>
                        <div class="col-4 text-right">
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
                                email
                            </th>
                            <th>
                                subject
                            </th>
                            <th>
                                message
                            </th>
                            <th>
                                datetime
                            </th>
                            <th></th>
                        </thead>
                        <tbody class="list">
                            <%
                            int i = 1;
                            for (ContactUs item : list) 
                            { %>
                            <tr>
                                <td>
                                    <%= i %>
                                </td>
                                <td>
                                    <%= item.getName() %>
                                </td>
                                <td>
                                    <%= item.getEmail() %>
                                </td>
                                <td>
                                    <%= item.getSubject() %>
                                </td>
                                <td>
                                    <%= item.getMessage() %>
                                </td>
                                <td>
                                    <%= Formatter.FormatToDateTime(item.getDatetime()) %>
                                </td>
                                <td>
                                    <button class="btn btn-danger btn-sm DeleteThis"
                                        data-redirect="ContactUsServelet?id=<%= item.getID() %>">Delete</button>
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

<jsp:include page="footer.jsp" />