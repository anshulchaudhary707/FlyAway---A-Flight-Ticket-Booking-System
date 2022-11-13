<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<!---<title> Responsive Registration Form | CodingLab </title>--->
<%@include file="all_js_css.jsp"%>
<link rel="stylesheet" href="/Demo/src/main/webapp/custom-style.css">
<link rel="stylesheet" href="style1.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<div class="container">
		<div class="title">User Log In</div>
		<div class="content">
			<form action="LogInServlet" method="post">
				<div class="user-details">

					<div class="input-box">
						<span class="details">Email</span> <input type="text"
							placeholder="Enter your email" name="email" required>
					</div>

					<div class="input-box">
						<span class="details">Password</span> <input type="password"
							placeholder="Enter your password" name="password" required>
					</div>

				</div>
				<div class="button">
					<input type="submit" value="Register">
				</div>
			</form>
			<div class="button">
				<a href="user_signup_form.jsp" class="btn btn-primary">New User?
					Sign Up Then</a> <a href="index.jsp" class="btn btn-primary">Home
					Page</a>
			</div>
		</div>
	</div>

</body>
</html>
