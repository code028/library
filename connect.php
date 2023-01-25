<?php 
    session_start();
    $servername = 'localhost';
    $username = 'root';
    $password = '';
    $database = 'library';
    $conn = mysqli_connect($servername,$username,$password,$database);

    if($conn -> connect_error ){ 
        echo $connect_error;
    }else {
        //echo "Connection was established successfully";
    }
?>

