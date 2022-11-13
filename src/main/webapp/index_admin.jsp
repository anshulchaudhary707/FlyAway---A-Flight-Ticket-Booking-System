<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="all_js_css.jsp"%>
<link rel="stylesheet" href="/Demo/src/main/webapp/custom-style.css">
</head>
<body>
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
						href="view_all_takedOff_flight.jsp">Taked Off Flights</a></li>
					<li class="nav-item"><a class="nav-link"
						href="view_scheduled_flights_admin.jsp">Scheduled Flights</a></li>
					<li class="nav-item"><a class="nav-link"
						href="flight_add_form.jsp">Add Flights</a></li>
					<li class="nav-item"><a class="nav-link"
						href="admin_logout_form.jsp">Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>