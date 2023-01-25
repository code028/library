<?php 
    require '../connect.php';
    
    if(!empty($_SESSION["accName"])){
        header('Location: ../home.php');
    }

    $lastLog = date('y-m-d H:i:s');

    if(isset($_POST['logIn'])){
        $accName = $_POST['accName'];
        $password = md5($_POST['password']);
       
        $accNameCheck = mysqli_query($conn, "SELECT accountName FROM user WHERE accountName = '$accName'");
        $passwordCheck = mysqli_query($conn, "SELECT password FROM user WHERE accountName = '$accName' and password = '$password'");

        $rowAccName = mysqli_fetch_assoc($accNameCheck);
        $rowPassword = mysqli_fetch_assoc($passwordCheck);

        if($rowAccName > 0){
            if($rowPassword > 0){
                $_SESSION['login'] = true;
                $_SESSION['accName'] = $rowAccName["accountName"];
                $update = "UPDATE user SET lastLog = '$lastLog' WHERE user.id = (SELECT DISTINCT id FROM user WHERE user.accountName = '$accName')";
                $query = mysqli_query($conn,$update);
                header('Location: .././home.php');
            }else {
                echo "<script> alert('Wrong password!')</script>";
            }
        }else{
            echo "<script> alert('Account name is incorrect!')</script>";
        }
    }
?>