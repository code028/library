
<?php 
include('regFunctions.php');
?>

<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="reg.css">
</head>
<body>
    <form class="reg_form" method="POST">
        <div class="form_div">
            <label for="name">Name: </label>
            <input id="name" class="form_input" type="text" name="name" required>
            <label for="lastname">Lastname: </label>
            <input id="lastname" class="form_input" type="text" name="lastname" required>
            <label for="accName">Account Name: </label>
            <input id="accName" class="form_input" type="text" name="accName" required>
            <label for="password">Password: </label>
            <input id="password" class="form_input" type="password" name="password" required>
            <label for="password">Confirm Password: </label>
            <input id="password" class="form_input" type="password" name="confirmpassword" required>
            <label for="gmail">Gmail: </label>
            <input id="gmail" class="form_input" type="text" name="gmail" required>
            <label for="birthday">Birthday: </label>
            <input id="birthday" class="form_input" type="date" name="birthday" required>
            <button type="submit" name="regAcc">Register your account</button>
        </div>
        <?php 
            echo "$div";
        ?>

        <h4><a href="../login/login.php">You have account, lets Log In :D</a></h4>
        <h4><a href="../index.php">Home</a></h4>
    </form>
</body>
</html>
