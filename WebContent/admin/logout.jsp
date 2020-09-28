
<%
session.removeAttribute("AdminID");
response.sendRedirect("login.jsp");
return;
%>