<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@
	page import="com.flight.book.BookFlight"%>

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


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket Payment</title>
<link rel="stylesheet" href="style1.css">
<%@include file="all_js_css.jsp"%>
<link rel="stylesheet" href="/Demo/src/main/webapp/custom-style.css">
</head>
<body>
	<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("index.jsp");
	}
	%>
	<%
	int flight_id = Integer.parseInt(request.getParameter("fd"));
	String passport = request.getParameter("passport");
	int ticket = Integer.parseInt(request.getParameter("tickets"));

	SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
	Session s = sf.openSession();

	ViewFlight vf = (ViewFlight) s.get(ViewFlight.class, flight_id);
	System.out.println("Flight Details: " + vf.getAirline());

	int ticket_price = vf.getPrice();

	System.out.println("Flight Price: " + ticket_price);

	int total_ticket_price = ticket_price * ticket;
	System.out.println("Total Flight Price: " + total_ticket_price);

	System.out.println(flight_id);
	System.out.println(passport);
	System.out.println(ticket);

	HttpSession ss = request.getSession(false);

	User u1 = (User) ss.getAttribute("user");

	BookFlight t1 = new BookFlight(vf.getSource(), vf.getDestination(), u1.getName(), u1.getEmail(), u1.getPhone_no(),
			ticket, total_ticket_price, vf.getDateTime(), vf.getId(), passport, vf.getAirline());

	ss.setAttribute("booked_ticket", t1);
	%>
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">Ticket Details</h5>
			<p class="card-text">
				Ticket Holder Name:
				<%=u1.getName()%>.
			</p>
			<p class="card-text">
				Source:
				<%=vf.getSource()%>.
			</p>
			<p class="card-text">
				Destination:
				<%=vf.getDestination()%>.
			</p>
			<p class="card-text">
				Date and Timing:
				<%=vf.getDateTime()%>.
			</p>
			<p class="card-text">
				Number Of Tickets:
				<%=ticket%>.
			</p>
			<p class="card-text">
				Total Price:
				<%=total_ticket_price%>.
			</p>
		</div>
	</div>
	<br>
	<div class="content">
		<form action="book_help_user.jsp" method="post">
			<tr>
				<td><input type="hidden" id="custId" name="fd"
					value=<%=flight_id%>></td>
				<td><input type="hidden" id="custId" name="passport"
					value=<%=passport%>></td>
				<td><input type="hidden" id="custId" name="ticket"
					value=<%=ticket%>></td>
			</tr>
			<div class="button">
				<br> <input type="submit" value="Confirm Payment">
			</div>
		</form>
		<div class="button">
			<a href="index_user.jsp" class="btn btn-primary">Return To Home ?</a>
		</div>
	</div>
</body>
</html>