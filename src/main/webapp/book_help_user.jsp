
<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("index.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@
	page import="com.flight.view.ViewFlight"%>

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


<%@
	page import="com.flight.book.BookFlight"%>

<%@
	page import="javax.servlet.RequestDispatcher"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Confirm</title>
<link rel="stylesheet" href="style1.css">
<%@include file="all_js_css.jsp"%>
<link rel="stylesheet" href="/Demo/src/main/webapp/custom-style.css">
</head>
<body>
	<%
	HttpSession ss = request.getSession(false);
	SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
	Session s = sf.openSession();

	BookFlight t1 = (BookFlight) ss.getAttribute("booked_ticket");

	ViewFlight vf = (ViewFlight) s.get(ViewFlight.class, t1.getFlight_id());

	int ticket_price = vf.getPrice();

	int total_ticket_price = t1.getTotalPrice();

	User u1 = (User) ss.getAttribute("user");

	float user_amount = u1.getMoney();

	if (user_amount < total_ticket_price) {
		RequestDispatcher rd = request.getRequestDispatcher("not_enough_balance.jsp");
		rd.forward(request, response);
	} else {

		float user_money_left = user_amount - total_ticket_price;

		User u2 = new User(u1.getEmail(), u1.getName(), u1.getPhone_no(), u1.getPassword(), user_money_left,
		u1.getAddress());

		Transaction tx = s.beginTransaction();
		s.save(t1);
		s.saveOrUpdate(u2);
		tx.commit();
		s.close();
		ss.setAttribute("user", u2);
	%>
	<h1>Your flight has been booked.</h1>
	<br>
	<h1>
		Money left in your wallet: Rs
		<%=user_money_left%></h1>
	<br>
	<div class="content">
		<div class="button">
			<a href="index_user.jsp" class="btn btn-primary">Return To Home ?</a>
		</div>
		<div class="button">
			<a href="user_logout_form.jsp" class="btn btn-primary">Log Out</a>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>