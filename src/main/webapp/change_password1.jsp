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
<title>Password Changed</title>
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
	String newPass = request.getParameter("new_pass");
	HttpSession ss = request.getSession(false);
	SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
	Session s = sf.openSession();

	User u1 = (User) ss.getAttribute("user");
	User u2 = new User(u1.getEmail(), u1.getName(), u1.getPhone_no(), newPass, u1.getMoney(), u1.getAddress());

	Transaction tx = s.beginTransaction();
	s.saveOrUpdate(u2);
	tx.commit();
	s.close();
	ss.setAttribute("user", u2);
	%>
	<div style="text-align: center;">
		<h1>Your password has been changed.</h1>
		<br>
		<form action="index_user.jsp">
			<button class="button button2">Home Page</button>
		</form>
	</div>
</body>
</html>