<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ 
	page import="com.user.User"%>

<%@ 
	page import="com.flight.view.ViewFlight"%>

<%@ 
	page import="org.hibernate.*"%>

<%@ 
	page import="org.hibernate.cfg.Configuration"%>

<%@ 
	page import="java.util.List"%>

<%@ 
	page import="java.time.LocalDateTime"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Flights</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<%
	if (session.getAttribute("admin_name") == null) {
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
							href="view_scheduled_flights_admin.jsp">Scheduled Flights</a></li>
						<li class="nav-item"><a class="nav-link"
							href="index_admin.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							href="flight_add_form.jsp">Add Flight</a></li>
						<li class="nav-item"><a class="nav-link"
							href="admin_logout_form.jsp">Log Out</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<br>
	</div>

	<h2 class="text-uppercase">Taked Off FLights:</h2>

	<div class="row">
		<div class="col-12">
			<%
			SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			Session s = sf.openSession();

			Query q = s.createQuery("from ViewFlight");
			List<ViewFlight> list = q.list();
			int i = 0;
			for (ViewFlight vf : list) {
				if (vf.getDateTime().isAfter(LocalDateTime.now())) {

				} else {
					i++;
			%>

			<div class="card">
				<div class="card-body">
					<h5 class="card-title"><%=i%></h5>
					<p class="card-text">
						From
						<%=vf.getSource()%>
						to
						<%=vf.getDestination()%>
						at
						<%=vf.getDateTime()%>. Price per ticket is
						<%=vf.getPrice()%>
						and airline is
						<%=vf.getAirline()%>.
					</p>
					<a href="DeleteFlightServlet?flight_id=<%= vf.getId() %>" class="btn btn-primary">Delete</a>
				</div>
			</div>

			<%
			}
			}
			s.close();
			%>

		</div>
	</div>


</body>
</html>