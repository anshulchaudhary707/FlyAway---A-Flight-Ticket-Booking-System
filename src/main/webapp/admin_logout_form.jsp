<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Logged Out</title>
</head>
<body>
	<%
	session = request.getSession(false);
	session.removeAttribute("admin_name");
	session.removeAttribute("admin_password");
	System.out.println(session.getAttribute("admin_name"));
	System.out.println(session.getAttribute("admin_password"));
	session.invalidate();
	System.out.println("Admin Logged Out");
	request.getRequestDispatcher("index.jsp").include(request, response);
	%>
</body>
</html>