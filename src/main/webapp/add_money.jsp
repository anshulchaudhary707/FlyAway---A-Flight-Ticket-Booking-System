<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Money Form</title>
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
	<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("index.jsp");
	}
	%>
	<div class="container1">
		<h2>Add Money</h2>
		<form id="myform" action="add_money1.jsp">
			<table>
				<tr>
					<td>Enter Amount :</td>
					<td><input type="text" name="amount"
						placeholder="enter amount" required /></td>
				</tr>
				<tr>
					<td>
						<div class="container text-center">
							<button type="submit">Add</button>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>