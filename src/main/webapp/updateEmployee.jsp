<%@ page import="com.takeo.client.EmployeeClient" %>
<%@ page import="com.takeo.pojo.EmployeeEntity" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Employee</title>
<style>
body {
  font-family: 'Roboto', sans-serif;
  background-color: #f2f2f2;
}
h1 {
  font-family: 'Roboto', sans-serif;
  	font-size: 36px;
  	color: #333;
  	text-align: center;
  	margin-top: 50px;
  	text-shadow: 1px 1px #f2f2f2;
}
form {
  max-width: 800px;
  margin: 0 auto;
  background-color: #fff;
  border-radius: 10px;
  padding: 20px;
  box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
}
label {
  display: block;
  margin-top: 10px;
}
input[type="text"], input[type="email"] {
  width: 100%;
  padding: 10px;
  border-radius: 5px;
  border: none;
  box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.2);
}
input[type="submit"] {
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
.button:hover {
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
	<h1>Edit Employee</h1>
	<div class="button-container">
		<a href="dashboard.jsp">
			<button class="button">Go Back to Dashboard</button>
		</a>
	</div>
	<%
		String enoString = request.getParameter("eno");
		if(enoString != null) {
			int eno = Integer.parseInt(enoString);
			EmployeeEntity emp = EmployeeClient.getEmployeeById(eno);
			if(emp != null) {
	%>
	<form method="post" action="updateEmployee.jsp">
		<input type="hidden" name="eno" value="<%= emp.getEno() %>">
		<label for="firstName">First Name:</label>
		<input type="text" id="firstName" name="firstName" value="<%= emp.getFirstName() %>">
		<label for="lastName">Last Name:</label>
		<input type="text" id="lastName" name="lastName" value="<%= emp.getLastName() %>">
		<label for="email">Email:</label>
		<input type="email" id="email" name="email" value="<%= emp.getEmail() %>">
		<input type="submit" value="Save Changes">
	</form>
	<%
			} else {
				out.println("Employee with id " + eno + " not found.");
			}
		} else {
			out.println("No employee id provided.");
		}
	%>
	<%
        if (request.getMethod().equals("POST")) {
            int eno = Integer.parseInt(request.getParameter("eno"));
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            EmployeeClient.updateEmployee(eno, firstName, lastName, email);
			out.println("<div class='success-message'>Employee updated successfully reload page to see changes.</div>");
			out.println("<a href='./listEmployee.jsp' class='employee-list'>Go Back to Employee List</a>");
        }
    %>
</body>
</html>
