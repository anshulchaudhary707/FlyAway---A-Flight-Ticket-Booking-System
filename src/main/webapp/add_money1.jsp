<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@
	page import="com.user.User"%>

<%@
	page import="org.hibernate.Session"%>

<%@
	page import="org.hibernate.SessionFactory"%>

<%@
	page import="org.hibernate.Transaction"%>

<%@
	page import="org.hibernate.cfg.Configuration"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Money Added</title>
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
	SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
	Session s = sf.openSession();

	User u1 = (User) ss.getAttribute("user");

	int amt = Integer.parseInt(request.getParameter("amount"));
	System.out.println("User requested for Rs. " + amt);

	float total = amt + u1.getMoney();

	System.out.println("Total Money: " + total);

	User u2 = new User(u1.getEmail(), u1.getName(), u1.getPhone_no(), u1.getPassword(), total, u1.getAddress());

	Transaction tx = s.beginTransaction();

	s.saveOrUpdate(u2);
	tx.commit();
	s.close();
	ss.setAttribute("user", u2);
	%>
	<div style="text-align: center;">
		<h1>
			Updated balance in wallet is:
			<%=u2.getMoney()%></h1>
		<br> <br>
		<form action="add_money.jsp" method="post">
			<button class="button button1">Add More Money</button>
		</form>
		<form action="index_user.jsp" method="post">
			<button class="button button1">Home</button>
		</form>
	</div>
</body>
</html>