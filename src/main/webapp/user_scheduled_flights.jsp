<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ 
	page import="org.hibernate.*"%>

<%@ 
	page import="org.hibernate.cfg.Configuration"%>

<%@ 
	page import="java.util.List"%>

<%@ 
	page import="org.hibernate.criterion.Restrictions"%>

<%@
	page import="javax.servlet.http.HttpSession"%>

<%@
	page import="com.flight.book.BookFlight"%>

<%@
	page import="com.user.User"%>

<%@
	page import="java.time.LocalDateTime"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scheduled Flights</title>
<%@include file="all_js_css.jsp"%>
<link rel="stylesheet" href="/Demo/src/main/webapp/custom-style.css">

<style>
.dropbtn {
	background-color: #7B68EE;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
	margin: auto;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #D3D3D3;
}
</style>
</head>
<body>
	<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("index.jsp");
	}
	%>
	<div class="container">
		<nav class="navbar navbar-expand-md bg-light">
			<div class="container">
				<a class="navbar-brand">FlyAway</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link"
							href="index_user.jsp">Home </a></li>
					</ul>
				</div>
				<div class="dropdown">
					<button class="dropbtn">Profile</button>
					<div class="dropdown-content">
						<a href="view_user_history.jsp">History Tickets</a> <a href="view_money.jsp">Check Wallet</a> <a
							href="user_logout_form.jsp">Log Out</a>
					</div>
				</div>
			</div>
		</nav>
		<br>
	</div>
	<%
	User u1 = (User) session.getAttribute("user");
	String email = u1.getEmail();

	Session s = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
	Criteria c = s.createCriteria(BookFlight.class);
	c.add(Restrictions.eq("email", email));
	c.add(Restrictions.gt("dateTime", LocalDateTime.now()));
	List<BookFlight> list = c.list();

	int i = 0;

	if (list.size() > 0) {
		for (BookFlight bf : list) {
			i++;
	%>
	<div class="card">
		<div class="card-body">
			<h5 class="card-title"><%=i%></h5>
			<p class="card-text">
				From
				<%=bf.getSource()%>
				to
				<%=bf.getDestination()%>
				at
				<%=bf.getDateTime()%>. Airline is
				<%=bf.getAirline_name()%>. Ticket Holder:
				<%=bf.getName()%>
			</p>
			<a href="CancelFlightServlet?tid=<%=bf.getTicket_id()%>"
				class="btn btn-primary">Cancel Flight</a>
		</div>
	</div>
	<%
	}
	} else {
	out.println("There is no scheduled flight for you !");
	}
	%>
</body>
</html>