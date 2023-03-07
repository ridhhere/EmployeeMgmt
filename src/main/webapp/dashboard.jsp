<!DOCTYPE html>
<html>
<head>
<title>Dashboard Page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
/* Center the dashboard content */
body {
	display: flex;
	font-family: 'Roboto', sans-serif;
	justify-content: center;
	align-items: center;
	height: 60vh;
	margin: 0;
	background-color: #f2f2f2;
}

.dashboard {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 400px;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}
/* Style the logout button */
.logout {
	position: absolute;
	top: 10px;
	right: 10px;
	background-color: #f44336;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.logout:hover {
	background-color: #d32f2f;
}
/* Style the buttons */
.button-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 30px;
}

.button-container a {
	text-decoration: none;
}

.button {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 200px;
	height: 100px;
	background-color: #4CAF50;
	color: white;
	font-size: 20px;
	font-weight: bold;
	border: none;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	cursor: pointer;
}

.button:hover {
	background-color: #3e8e41;
}
</style>
</head>
<body>
	<div class="dashboard">
		<h2>Welcome to the Dashboard</h2>
		<p>You are now logged in.</p>
		<button class="logout">Logout</button>
		<div class="button-container">
			<a href="addEmployee.jsp">
				<button class="button">Add Employee</button>
			</a> <a href="listEmployee.jsp">
				<button class="button">View All Employees</button>
			</a>
		</div>
	</div>
	<script>
      // Add event listener for logout button
      const logoutButton = document.querySelector('.logout');
      logoutButton.addEventListener('click', event => {
        window.location.href = './loginPage.jsp'; // redirect to login page on logout
      });
    </script>
</body>
</html>
