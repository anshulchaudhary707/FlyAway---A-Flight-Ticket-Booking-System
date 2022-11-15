<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("index.jsp");
	}
	%>
	<%
	int ticket_id = Integer.parseInt(request.getParameter("tid"));
	System.out.println("Ticket Id: " + ticket_id);
	%>

</body>
</html>