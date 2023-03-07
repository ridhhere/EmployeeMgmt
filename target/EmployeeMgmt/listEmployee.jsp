<%@ page import="java.util.List"%>
<%@ page import="com.takeo.pojo.EmployeeEntity"%>
<%@ page import="com.takeo.client.EmployeeClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Employees</title>
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

input[type="text"] {
	position: absolute;
	margin-top: 10px;
	left: 45%;
	padding: 10px;
  	border-radius: 5px;
  	border: none;
  	cursor: pointer;
}
input[type="text"]:hover {
  background-color: white;
}

table {
	position: absolute;
	margin-top: 100px;
	left: 35%;
	background-color: #fff;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
}

th, td {
	padding: 5px;
	text-align: left;
}
a
th {
	background-color: #4CAF50;
	color: #fff;
}

tr:hover {
	background-color: #e6e6e6;
	cursor: pointer;
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

</style>
<script>
function goToUpdateEmployee(eno) {
  window.location.href = "updateEmployee.jsp?eno=" + eno;
}
function filterTable() {
// Declare variables
var input, filter, table, tr, td, i, txtValue;
input = document.getElementById("searchInput");
filter = input.value.toUpperCase();
table = document.getElementById("employeeTable");
tr = table.getElementsByTagName("tr");

// Loop through all table rows, and hide those that do not match the search query
for (i = 0; i < tr.length; i++) {
td = tr[i].getElementsByTagName("td")[0];
if (td) {
txtValue = td.textContent || td.innerText;
if (txtValue.toUpperCase().indexOf(filter) > -1) {
tr[i].style.display = "";
} else {
tr[i].style.display = "none";
}
}
}
}
</script>

</head>
<body>
	<h1>List Employees</h1>
	<div class="button-container">
		<a href="dashboard.jsp">
			<button class="button">Go Back to Dashboard</button>
		</a>
	</div>
	<input type="text" id="searchInput" onkeyup="filterTable()"
		placeholder="Search for Employee ID...">
	<table id="employeeTable">
		<tr>
			<th>Employee ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
		</tr>
		<%
			List<EmployeeEntity> employees = EmployeeClient.getAllEmployees();
			for(EmployeeEntity emp : employees) {
		%>
		<tr onclick="goToUpdateEmployee(<%=emp.getEno()%>)">
			<td><%=emp.getEno()%></td>
			<td><%=emp.getFirstName()%></td>
			<td><%=emp.getLastName()%></td>
			<td><%=emp.getEmail()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
