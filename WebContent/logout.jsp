<%
session.removeAttribute("UserID");
response.sendRedirect("login.jsp");
return;
%>