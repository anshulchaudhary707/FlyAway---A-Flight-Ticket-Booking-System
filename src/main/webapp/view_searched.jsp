<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@
	page import="java.time.LocalDate"%>

<%@
	page import="java.time.LocalDateTime"%>

<%@
	page import="java.time.LocalTime"%>

<%@
	page import="java.time.format.DateTimeFormatter"%>

<%@
	page import="com.flight.view.ViewFlight"%>

<%@ 
	page import="org.hibernate.*"%>

<%@ 
	page import="org.hibernate.cfg.Configuration"%>

<%@ 
	page import="java.util.List"%>

<%@ 
	page import="org.hibernate.criterion.Restrictions"%>
<%@ 
	page import="javax.servlet.RequestDispatcher"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Searched Flights</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
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
							href="view_scheduled_flights_user.jsp">View All Flights</a></li>

						<li class="nav-item"><a class="nav-link"
							href="user_logout_form.jsp">Log Out</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<br>
	</div>
	<h2 class="text-uppercase">Available Flights :</h2>
	<div class="row">
		<div class="col-12">
			<%
			
			DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
			DateTimeFormatter format1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			Session s = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
			Criteria c = s.createCriteria(ViewFlight.class);
			String source = request.getParameter("from");
			String destination = request.getParameter("to");
			String sdate = request.getParameter("date");
			
			LocalDate date1 = LocalDate.parse(sdate,format1);
			
			
			
			if(date1.isEqual(LocalDate.now())){
				LocalTime t1 = LocalTime.now();
				LocalTime t2 = LocalTime.of(t1.getHour(),t1.getMinute());
				String st3 = t2.toString();
				String sDateTime2 = sdate + " " + st3;
				LocalDateTime dateTime2 = LocalDateTime.parse(sDateTime2,format);
				dateTime2 = dateTime2.plusHours(3);
				c.add(Restrictions.eq("source", source));
				c.add(Restrictions.eq("destination", destination));
				c.add(Restrictions.gt("dateTime", dateTime2));
				
				System.out.println(dateTime2);
				
				List<ViewFlight> list = c.list();
				int i = 0;
				for (ViewFlight vf : list) {
					i++;
				%><div class="card">
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
					<a href="#" class="btn btn-primary">Book Ticket</a>
					<!-- <a href="book_flight_help.jsp?flight_id=<%= vf.getId() %>" class="btn btn-primary">Book Ticket</a> -->
				</div>
			</div>

			<%
			}
				if(i == 0){
					out.println("<h2>No Scheduled Flights From "+source+" To "+destination+", at: "+sdate+".</h2>");
					%>
			<a href="index.jsp" class="btn btn-primary">Search Another
				Flight.</a>
			<%
				}
			}
			
			else if(date1.isAfter(LocalDate.now())){
				LocalTime t1 = LocalTime.now();
				LocalTime t2 = LocalTime.of(t1.getHour(),t1.getMinute());
				String st3 = t2.toString();
				String sDateTime2 = sdate + " " + "00:00";
				LocalDateTime dateTime2 = LocalDateTime.parse(sDateTime2,format);
				c.add(Restrictions.eq("source", source));
				c.add(Restrictions.eq("destination", destination));
				c.add(Restrictions.gt("dateTime", dateTime2));
				
				System.out.println(dateTime2);
				
				List<ViewFlight> list = c.list();
				int i = 0;
				for (ViewFlight vf : list) {
					i++;
				%><div class="card">
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
					<a href="#" class="btn btn-primary">Book Ticket</a>
					<!-- <a href="book_flight_help.jsp?flight_id=<%= vf.getId() %>" class="btn btn-primary">Book Ticket</a> -->
				</div>
			</div>

			<%
			}
			if (i == 0) {
			out.println("<h2>No Scheduled Flights From !!!!" + source + " To " + destination + ", at: " + sdate + ".</h2>");
			%>
			<a href="index.jsp" class="btn btn-primary">Search Another
				Flight.</a>
			<%
			}
			} else {
			out.println("<h2>You cant book a flight for yesterday !!!!</h2>");
			%>
			<a href="index.jsp" class="btn btn-primary">Search Another
				Flight.</a>
			<%
			}
			%>


			<%
			s.close();
			%>

		</div>
	</div>


	<br>
</body>
</html>