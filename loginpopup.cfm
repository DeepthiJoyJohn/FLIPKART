<!DOCTYPE html>
<html>
<head>
  <title>Flipkart-style Popup Login</title>
  <link rel="stylesheet" href="css/login.css">
</head>
<body>
  <button id="loginBtn">Login</button>
  <div id="loginPopup">
    <div class="loginContent">
      <span class="closeBtn" onclick="closePopup()">&times;</span>
      <!-- Login form goes here -->
      <form>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <button type="submit">Login</button>
      </form>
    </div>
  </div>
  <script src="js/loginjs.js"></script>
</body>
</html>