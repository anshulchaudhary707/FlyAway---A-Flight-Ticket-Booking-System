<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
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
							href="index_user.jsp">Home </a></li>

						<li class="nav-item"><a class="nav-link"
							href="user_logout_form.jsp">Log Out </a></li>
					</ul>
				</div>
			</div>
		</nav>
		<br>
	</div>
	<div class="container1">
		<h2>Change Password:</h2>
		<form id="myform" action="change_password1.jsp" method="post">
			<table>
				<tr>
					<td>Enter New Password :</td>
					<td><input type="text" name="new_pass"
						placeholder="new password" required /></td>
				</tr>

				<tr>
					<td>
						<div class="container text-center">
							<button type="submit">Submit</button>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>