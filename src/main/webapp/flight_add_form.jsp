<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Flight</title>
<link rel="stylesheet" href="style1.css">
<link rel="stylesheet" href="/Demo/src/main/webapp/custom-style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
a:link, a:visited {
	background-color: #9FE2BF;
	color: black;
	border: 2px solid black;
	padding: 14px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

a:hover, a:active {
	background-color: white;
}

div {
	margin: auto;
}
</style>
</head>
<body>
	<%
	if (session.getAttribute("admin_name") == null) {
		response.sendRedirect("index.jsp");
	}
	%>
	<div class="container">
		<div class="title">Enter Flight Details</div>
		<div class="content">
			<form action="AddFlightServlet" method="post">
				<div class="user-details">
					<div class="input-box">
						<span class="details">Source</span> <input type="text"
							placeholder="enter source" name="src" required>
					</div>
					<div class="input-box">
						<span class="details">Destination</span> <input type="text"
							placeholder="enter destination" name="dest" required>
					</div>
					<div class="input-box">
						<span class="details">Date</span> <input type="text"
							placeholder="yyyy-mm-dd" name="date" required>
					</div>

					<div class="input-box">
						<span class="details">Time</span> <input type="text"
							placeholder="hh:mm" name="time" required>
					</div>
					<div class="input-box">
						<span class="details">Airline</span> <input type="text"
							placeholder="enter airline" name="airline" required>
					</div>
					<div class="input-box">
						<span class="details">Price</span> <input type="text"
							placeholder="integer format" name="price" required>
					</div>
				</div>

				<div class="button">
					<input type="submit" value="Add">
				</div>
			</form>
		</div>
	</div>
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
						<br>
						<li class="nav-item"><a class="nav-link"
							href="view_scheduled_flights_admin.jsp">View All Flights</a></li>
						<br>
						<li class="nav-item"><a class="nav-link"
							href="index_admin.jsp">Home</a></li>
						<br>
						<li class="nav-item"><a class="nav-link"
							href="admin_logout_form.jsp">Log Out</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>