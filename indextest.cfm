<!DOCTYPE html>
<html>
<head>
    <title>Login Popup</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <button onclick="showLoginPopup()">Login</button>
    <div id="loginPopup" class="popup">
        <div class="popup-content">
            <span class="close" onclick="closeLoginPopup()">&times;</span>
            <h2>Login</h2>
            <form>
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <button type="submit">Login</button>
            </form>
        </div>
    </div>
    <script src="scripts.js"></script>
</body>
</html>