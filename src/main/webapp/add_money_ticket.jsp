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
<title>Add Money</title>
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
		//RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		response.sendRedirect("index.jsp");
		System.out.println("Hii from here.");
		//rd.forward(request,response);
	}
	HttpSession ss = request.getSession(false);
	BookFlight bf1 = (BookFlight) ss.getAttribute("booked_ticket");
	User u1 = (User) ss.getAttribute("user");

	float money_required = bf1.getTotalPrice() - u1.getMoney();
	System.out.println(money_required);
	%>
	<div style="text-align: center;">
		<h1>Your wallet has Rs <%=u1.getMoney()%>,
			you need to add Rs
			<%=money_required%>. Money will be deducted from your bank account
			and will be added to your wallet.
		</h1>
		<br>
		<form action="add_money_ticket_1.jsp">
			<button class="button button1">Press ok to continue.</button>
		</form>
		<form action="index_user.jsp">
			<button class="button button2">Home Page</button>
		</form>
	</div>
</body>
</html>