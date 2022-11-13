<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>FlyAway</title>
<%@include file="all_js_css.jsp"%>
<link rel="stylesheet" href="/Demo/src/main/webapp/custom-style.css">
<style>
.container1 {
	width: 40%;
	border: 1px solid black;
	margin: auto;
	padding: 20px;
	font-size: 20px;
}

#myform table tr td input {
	font-size: 20px;
}
</style>
</head>

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
					<li class="nav-item"><a class="nav-link" href="view_scheduled.jsp">View All Flights</a></li>
					<li class="nav-item"><a class="nav-link" href="user_signup_form.jsp">User Sign Up</a></li>
					<li class="nav-item"><a class="nav-link" href="user_login_form.jsp">User Log In</a></li>
					<li class="nav-item"><a class="nav-link" href="admin_login_form.jsp">Admin Log In</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
</div>

<div class="container1">
	<h2>Search A Flight</h2>
	<form id="myform" action="view_searched.jsp">
		<table>
			<tr>
				<td>Enter Source :</td>
				<td><input type="text" name="from" placeholder="Enter Source"
					required /></td>
			</tr>
			<tr>
				<td>Enter Destination :</td>
				<td><input type="text" name="to"
					placeholder="Enter Destination" required /></td>
			</tr>
			<tr>
				<td>Enter Date :</td>
				<td><input type="text" name="date" placeholder="yyyy-mm-dd" /></td>
			</tr>

			<tr>
				<td>
					<div class="container text-center">
						<button type="submit">Search</button>
						<button type="reset">Reset</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>