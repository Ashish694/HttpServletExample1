<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="./person" method="post">
	<table width="50%" border="5px" cellpadding="10px">
	<tr>
		<td>Enter Name</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>Enter Age</td>
		<td><input type="text" name="age"></td>
	</tr>
	<tr>
		<td>Enter Phone</td>
		<td><input type="text" name="phone"></td>
	</tr>
	
	<tr>
		<td colspan="2">
		<input type="submit" value="SUBMIT">
		</td>
	</tr>
	</table>
</form>
</body>
</html>