<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@
	page import="com.flight.book.BookFlight"%>

<%@
	page import="com.user.User"%>

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
	HttpSession ss = request.getSession(false);
	BookFlight bf1 = (BookFlight) ss.getAttribute("booked_ticket");
	User u1 = (User) ss.getAttribute("user");

	float money_required = bf1.getTotalPrice() - u1.getMoney();
	User u2 = new User(u1.getEmail(), u1.getName(), u1.getPhone_no(), u1.getPassword(), money_required + u1.getMoney(),
			u1.getAddress());
	System.out.println(u2);
	ss.setAttribute("user", u2);
	response.sendRedirect("book_help_user.jsp");
	%>
</body>
</html>