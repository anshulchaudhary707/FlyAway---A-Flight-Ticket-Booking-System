<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Already Exists !!</title>
<style>
.button {
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.button1 {
	background-color: #4CAF50;
}

.button2 {
	background-color: #008CBA;
}
</style>
</head>
<body>
	<div style="text-align: center;">
		<h1>User with this email already exists.</h1>
		<br>
		<form action="user_signup_form.jsp">
			<button class="button button1">Try Again</button>
		</form>
		<form action="user_login_form.jsp">
			<button class="button button2">Log In</button>
		</form>
		<form action="index.jsp">
			<button class="button button2">Home Page</button>
		</form>
	</div>

</body>
</html>