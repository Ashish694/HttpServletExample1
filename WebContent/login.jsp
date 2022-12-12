<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="mylinks.jsp"/>
</head>

<style type="text/css">
	body
	{
	margin:100px;
	border:6px double black;
	padding:20px;
	width:40%;
	}
	.row
	{
	margin-bottom:20px;
	}

</style>
<body>
	<form action="./aadhar" method="post">
		<input type="hidden" name="page" value="loginpage"/>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="display-4">Enter Login details</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					Enter Username
				</div>
				<div class="col-md-6">
					<input type="text" name="username" class="form-control"/>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					Enter Password
				</div>
				<div class="col-md-6">
					<input type="password" name="password" class="form-control"/>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2">
					<input type="submit" value="LOGIN" class="btn btn-info"/>
				</div>
				<div class="col-md-2">
					<input type="reset" value="RESET" class="btn btn-info"/>
				</div>
			</div>
		</div>
	</form>
</body>
</html>

