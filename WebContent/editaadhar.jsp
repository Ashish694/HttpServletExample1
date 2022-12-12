<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	String pid=request.getParameter("id");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/genericservlet","root","");
	Statement smt = con.createStatement();
	ResultSet rs = smt.executeQuery("select * from aadhars where status=1 and id="+pid);
 %>
 	<form action="./aadhar" method="post">
		<input type="hidden" name="page" value="editaadhar"/>
		<input type="hidden" name="pid" value="<%=pid%>"/>
		<div class="container">
			<jsp:include page="header.jsp"/>
			<%
			while(rs.next())
			{
			%>
			<div class="row r3">
				<div class="col-md-3">Enter Name</div>
				<div class="col-md-3"><input type="text" name="name" value="<%out.print(rs.getString("name"));%>"/></div>
			</div>
			
			<div class="row r3">
				<div class="col-md-3">Enter Age</div>
				<div class="col-md-3"><input type="text" name="age" value="<%out.print(rs.getString("age"));%>"/></div>
			</div>
			
			<div class="row r3">
				<div class="col-md-3">Enter Gender</div>
				<div class="col-md-3"><input type="text" name="gender" value="<%out.print(rs.getString("gender"));%>"/></div>
			</div>
			
			<div class="row r3">
				<div class="col-md-3">Enter Phone</div>
				<div class="col-md-3"><input type="text" name="phone" value="<%out.print(rs.getString("phone"));%>"/></div>
			</div>
			
			<div class="row r3">
				<div class="col-md-3">Enter Email</div>
				<div class="col-md-3"><input type="text" name="email" value="<%out.print(rs.getString("email"));%>"/></div>
			</div>
			
			<div class="row r3">
				<div class="col-md-3">Enter Address</div>
				<div class="col-md-3"><input type="text" name="address" value="<%out.print(rs.getString("address"));%>"/></div>
			</div>
			
			<div class="row r3">
				<div class="col-md-3">Enter Languages</div>
				<div class="col-md-3"><input type="text" name="languages" value="<%out.print(rs.getString("languages"));%>"/></div>
			</div>
			
			<div class="row r3">
				<div class="col-md-3">Enter Education</div>
				<div class="col-md-3"><input type="text" name="education" value="<%out.print(rs.getString("education"));%>"/></div>
			</div>
			
			<div> 
				<div class="col-md-6">
				<input type="submit" value="UPDATE RECORD" class="btn btn-success"/>
				</div>
			</div>
			<%
			}
			%>
			
			<jsp:include page="footer.jsp"/>
		</div>
	</form>
</body>
</html>