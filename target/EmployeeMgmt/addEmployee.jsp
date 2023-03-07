<%@ page import="com.takeo.client.EmployeeClient" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Employee</title>
<style>
body {
  font-family: 'Roboto', sans-serif;
  background-color: #f2f2f2;
}
h1 {
  	font-size: 36px;
  	color: #333;
  	text-align: center;
  	margin-top: 200px;
  	text-shadow: 1px 1px #f2f2f2;
}
form {
  max-width: 400px;
  margin: 0 auto;
  background-color: #fff;
  border-radius: 10px;
  padding: 20px;
  box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
}
label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
  color: #555;
}
input[type="text"] {
  padding: 5px;
  margin-bottom: 10px;
  width: 100%;
  border-radius: 5px;
  border: 1px solid #ccc;
}
input[type="submit"] {
  background-color: #4CAF50;
  color: #fff;
  padding: 10px;
  border-radius: 5px;
  border: none;
  cursor: pointer;
}
input[type="submit"]:hover {
  background-color: #3e8e41;
}
.success-message {
  text-align: center;
  margin-top: 20px;
  font-weight: bold;
  color: green;
}
.button-container {
  position: absolute;
  top: 10px;
  right: 10px;
}
.button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.employee-list:hover {
  background-color: #3071a9;
}
.employee-list {
  display: block;
  margin-top: 20px;
  padding: 10px;
  background-color: #428bca;
  color: #fff;
  text-align: center;
  border-radius: 5px;
  cursor: pointer;
}
.employee-list:hover {
  background-color: #3071a9;
}
</style>
</head>
<body>
	<h1>Add Employee</h1>
	<form method="post" action="addEmployee.jsp">
		<label>First Name:</label>
		<input type="text" name="firstName"><br>
		<label>Last Name:</label>
		<input type="text" name="lastName"><br>
		<label>Email:</label>
		<input type="text" name="email"><br>
		<input type="submit" value="Add Employee">
	</form>
	<%
		if(request.getParameter("firstName")!=null && request.getParameter("lastName")!=null && request.getParameter("email")!=null){
			String firstName=request.getParameter("firstName");
			String lastName=request.getParameter("lastName");
			String email=request.getParameter("email");
			EmployeeClient.addEmployee(firstName, lastName, email);
			out.println("<div class='success-message'>Employee added successfully.</div>");
			out.println("<a href='./listEmployee.jsp' class='employee-list'>Go Back to Employee List</a>");
		}
	%>
</body>
</html>

