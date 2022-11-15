<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cannot Cancel</title>
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
	<div style="text-align: center;">
		<h1>You are not allowed to cancel the flight as only 1 hour is
			left in flight to take off.</h1>
		<br>
		<form action="view_scheduled_flights_user.jsp">
			<button class="button button1">View Scheduled Flights</button>
		</form>
		<form action="index_user.jsp">
			<button class="button button2">Home Page</button>
		</form>
	</div>
</body>
</html>