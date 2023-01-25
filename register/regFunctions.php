<?php  

    require '../connect.php';

    if(!empty($_SESSION["accName"])){
        header('Location: ../home.php');
    }

    $div = '';

    if(isset($_POST['regAcc'])){
        $name = $_POST['name'];
        $lastname = $_POST['lastname'];
        $accName = $_POST['accName'];
        $password = md5($_POST['password']);
        $confirmPassword = md5($_POST['confirmpassword']);
        $gmail = $_POST['gmail'];
        $birthday = $_POST['birthday'];
        $regDate = date('y-m-d H:i:s');
        $lastLog = date('y-m-d H:i:s');
 
        $duplicate = mysqli_query($conn, "SELECT * FROM `user` WHERE accountName = '$accName' or gmail = '$gmail' ");
        
        if(mysqli_num_rows($duplicate) > 0) {
            echo "<script> alert('Account name or gmail already exist!')</script>";
        }else {
            if($password == $confirmPassword){
                $stmt = $conn->prepare(
                    "INSERT INTO user (name,lastname,accountName,password,gmail,birthday,regDate,lastLog) 
                    VALUES('$name','$lastname','$accName','$password','$gmail','$birthday','$regDate','$lastLog')"
                    );
                $stmt->execute();
                $div = "<div>
                    <div>Your account has been created YEY !</div>
                Rediceting on home in 3 second</div>";
                header("refresh:3;url=../index.php");
            }else{
                echo "<script> alert('Password doesn`t match!')</script>";
            }
        }
    }

?>