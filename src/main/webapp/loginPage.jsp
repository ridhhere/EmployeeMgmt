<!DOCTYPE html>
<html>
  <head>
    <title>Login Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
      /* Center the login form */
      body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 60vh;
        margin: 0;
        background-color: #f2f2f2;
      }
      form {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 400px;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
      }
      /* Style the input fields and buttons */
      input[type=text], input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
      }
      button[type=submit] {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
      }
      /* Style the error message */
      .error {
        color: red;
        font-size: 14px;
        margin-top: 10px;
      }
    </style>
  </head>
  <body>
    <form action="/login" method="post">
      <h2>Login</h2>
      <label for="username">Username</label>
      <input type="text" id="username" name="username" required>
      <label for="password">Password</label>
      <input type="password" id="password" name="password" required>
      <button type="submit">Login</button>
      <div class="error"></div>
    </form>
    <script>
      // Add event listener for form submission
      const form = document.querySelector('form');
      form.addEventListener('submit', event => {
        event.preventDefault(); // prevent the form from submitting normally
        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;
        if (username === 'admin' && password === 'admin123' 
        		||username === 'user' && password === 'user123') {
          window.location.href = './dashboard.jsp'; // redirect to dashboard if login successful
        } else {
          const error = document.querySelector('.error');
          error.innerHTML = 'Invalid username or password.';
        }
      });
    </script>
  </body>
</html>
