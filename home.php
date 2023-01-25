<?php 
    require 'connect.php'; 

    if(!empty($_SESSION["accName"])){
        $accName = $_SESSION["accName"];
        $result = mysqli_query($conn,"SELECT * FROM user where accountName = '$accName'");
        $row = mysqli_fetch_assoc($result);
    }else{
        header('Location: ./index.php');
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>
<body>
    HOME PAGE
    <h1>Welcome <?php echo $row['accountName']; ?></h1>
    <h4><a href="./login/logout.php">Logout</a></h4>
</body>
</html>

