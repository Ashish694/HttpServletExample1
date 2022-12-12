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
	<%
		Object pageObj = session.getAttribute("page1");
		if(pageObj==null)//when personal detail not filled
		{
			response.sendRedirect("personaldetail.jsp");
		}
	%>
	<div class="container">
	<jsp:include page="header.jsp"/>
	<div class="row">
	<form action="./aadhar" method="post">
	<input type="hidden" name="page" value="contactdetails"/>
	<table cellpadding="5px" cellspacing="5px">
		<tr>
			<th colspan="2">Contact Information</th>
		</tr>
		
		<tr>
			<td>Enter Phone</td>
			<td><input type="text" name="phone"/></td>
		</tr>
		
		<tr>
			<td>Enter Email</td>
			<td><input type="text" name="email"/></td>
		</tr>
		
		<tr>
			<td>Enter Address</td>
			<td>
			<textarea rows="4" cols="20" name="address"></textarea>
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