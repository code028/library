<?php 
    require 'logFunction.php';  
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>

    <form method="POST" autocomplete="off">
        <label for="gmail">Account name:</label>
        <input type="text" name="accName" id="gmail" required>
        <label for="password">Password</label>
        <input type="password" name="password" id="password" required>
        <button type="submit" name="logIn" >Log In</button>
    </form>
    
    <h4><a href="../register/register.php">You are new here? Sign Up</a></h4>
    <h4><a href="../index.php">Home</a></h4>
</body>
</html>

