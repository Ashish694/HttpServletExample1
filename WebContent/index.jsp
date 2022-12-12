<%@page import="org.nlt.include.DatabaseConnection"%>
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
	Object loginObject=session.getAttribute("loginAttr");
	String name="";
	if(loginObject==null)//without login//not login yet
	{
		response.sendRedirect("login.jsp");
	}
	else
	{
		name=loginObject.toString();
	}

	Connection con=DatabaseConnection.getDatabaseConnection();
	Statement smt = con.createStatement();
	ResultSet rs = smt.executeQuery("select * from aadhars where status=1");
%>

<!--start of the container -->

<div class="container">
	<jsp:include page="header.jsp"/>
	
	<div class="row heading1">
		<div class="col-md-3">
			<h4>AADHAR DETAILS</h4>
		</div>
		<div class="col-md-3">
			<h4>LOGIN: <% out.println(name.toUpperCase()); %></h4>
		</div>
		<div class="col-md-3" style="text-align: right;">
			<h5><a href="personaldetail.jsp"><img src="images/new.gif" height="40px" width="70px"/>NEW AADHAR!</a></h5>
		</div>
		
		<div class="col-md-3">
			<jsp:include page="logout.jsp"/>
		</div>
	</div>
	
	<div class="row r1">
		<div class="col-md-1"><h6>ID</h6></div>
		<div class="col-md-2"><h6>NAME</h6></div>
		<div class="col-md-1"><h6>AGE</h6></div>
		<div class="col-md-1"><h6>GENDER</h6></div>
		<div class="col-md-2"><h6>PHONE</h6></div>
		<div class="col-md-3"><h6>EMAIL</h6></div>
		<div class="col-md-2"><h6>ACTION</h6></div>	
	</div>
	<%
	while(rs.next())
	{
	%>
	<div class="row r2">
		<div class="col-md-1"><%out.print(rs.getInt("id")); %></div>
		<div class="col-md-2"><%out.print(rs.getString("name")); %></div>
		<div class="col-md-1"><%out.print(rs.getString("age")); %></div>
		<div class="col-md-1"><%out.print(rs.getString("gender")); %></div>
		<div class="col-md-2"><%out.print(rs.getString("phone")); %></div>
		<div class="col-md-3"><%out.print(rs.getString("email")); %></div>
		<div class="col-md-2"><a href="editaadhar.jsp?id=<%out.print(rs.getInt("id")); %>"><img src="images/b_edit.png"/>Edit </a> || <a href="deleteaadhar.jsp?id=<%out.print(rs.getInt("id")); %>"><img src="images/b_drop.png"/>Delete</a></div>
	</div>
	<%
	}
	%>
	
	<%
	rs.close();
	smt.close();
	
	%>
	<jsp:include page="footer.jsp"/>
</div>

</body>
</html>