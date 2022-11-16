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
						href="user_signup_form.jsp">New User? Sign Up </a></li>
				</ul>
			</div>
			<div class="dropdown">
				<button class="dropbtn">Log In</button>
				<div class="dropdown-content">
					<a href="user_login_form.jsp">User Log In</a> <a
						href="admin_login_form.jsp">Admin Log In</a>
				</div>
			</div>
		</div>
	</nav>
	<br>
</div>
<body>
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
	<div style="text-align: center;">
		<h1>Admin UserName : root</h1>
		<br>
		<h1>Admin Password : root</h1>
		<br>
		<h1>Admin first need to add flights by signing in such that flights are available to user.</h1>
		<br>
		<h1>User first needs to sign up before logging in and as many users can sign up.</h1>
		<br>
	</div>
</body>
</html>