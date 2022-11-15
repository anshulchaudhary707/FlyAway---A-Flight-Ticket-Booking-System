<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@
	page import="com.user.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Balance</title>
<style>
.button {
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.button1 {
	background-color: #4CAF50;
}

.button2 {
	background-color: #008CBA;
}
</style>
</head>
<body>
	<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("index.jsp");
	}
	%>
	<%
	HttpSession ss = request.getSession(false);
	User u1 = (User) ss.getAttribute("user");
	%>
	<div style="text-align: center;">
		<h1>
			Balance in wallet is:
			<%=u1.getMoney()%></h1>
		<br> <br>
		<form action="add_money.jsp" method="post">
			<button class="button button1">Add Money</button>
		</form>
		<form action="index_user.jsp" method="post">
			<button class="button button1">Home</button>
		</form>
	</div>
</body>
</html>