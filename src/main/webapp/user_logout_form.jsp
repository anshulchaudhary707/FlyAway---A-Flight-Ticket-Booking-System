<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Logged Out</title>
</head>
<body>
	<%
	session = request.getSession(false);
	session.removeAttribute("user");
	session.removeAttribute("booked_ticket");
	System.out.println("User Attribute"+session.getAttribute("user"));
	System.out.println("Ticket 1 attribute"+session.getAttribute("user"));
	session.invalidate();
	System.out.println("User Logged Out");
	request.getRequestDispatcher("index.jsp").include(request, response);
	%>
</body>
</html>