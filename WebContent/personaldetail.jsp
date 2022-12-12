<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="mylinks.jsp"/>
</head>
<body>
<div class="container">
	<jsp:include page="header.jsp"/>
	<div class="row">
	<form action="./aadhar" method="post">
	<input type="hidden" name="page" value="personaldetails"/>
	<table cellpadding="5px" cellspacing="5px">
		<tr>
			<th colspan="2">Personal Information</th>
		</tr>
		
		<tr>
			<td>Enter Name</td>
			<td><input type="text" name="name"/></td>
		</tr>
		
		<tr>
			<td>Enter Age</td>
			<td><input type="text" name="age"/></td>
		</tr>
		
		<tr>
			<td>Select Gender</td>
			<td>
			<input type="radio" name="gender" value="male"/>Male
			<input type="radio" name="gender" value="female"/>Female
			</td>
		</tr>
		
		<tr>
			<td colspan="2"><input type="submit" value="NEXT>>"/></td>
		</tr>
	</table> 
	</form>
	
	</div>
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>