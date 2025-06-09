<?php
session_start();

// Connect to Dhukuti_Nepal database
$conn = mysqli_connect('localhost', 'root', '', 'dhukuti_nepal'); 

if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}

if (isset($_POST['login'])) {
    $email = $_POST['email'];
    $pass = md5($_POST['password']);

    echo $email;
    echo $pass;
    if ($email === "dhukutinepal_admin@gmail.com") {
    $sql = "SELECT * FROM `admin` WHERE `email` = '$email' AND `password` = '$pass'";
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $_SESSION['admin_id'] = $row['a_id'];
        $_SESSION['name'] = "Admin";
        $_SESSION['email'] = $row['email'];
        $now = date('Y-m-d H:i:s');
        mysqli_query($conn, "UPDATE `admin` SET `last_login` = '$now' WHERE `email` = '$email'");

        header("Location: ../admin/adminpage.php");
    } else {
        header("Location: ../index.php?error=invalid_admin");
    }
    

    } else {
        // Buyer/Seller login (assuming all users are stored in `users`)
        $sql_buyer= "SELECT * FROM `dhukuti_buyer` WHERE `email` = '$email' AND `password` = '$pass'";
        $result_buyer= mysqli_query($conn, $sql_buyer);
        $sql_seller = "SELECT * FROM `dhukuti_seller` WHERE `email` = '$email' AND `password` = '$pass'"; 
        $result_seller=mysqli_query($conn,$sql_seller);
        echo"hrer";
        if ($result_buyer->num_rows>0) {
            $row = mysqli_fetch_assoc($result_buyer);
            // // Assuming a user can be either buyer or seller based on a role field
            // if ($row['role'] == 'buyer') {
            //     $_SESSION['buyer_id'] = $row['buyer_id'];
            // } elseif ($row['role'] == 'seller') {
            //     $_SESSION['seller_id'] = $row['seller_id'];
            // }
            $_SESSION['b_id']=$row['buyer_id'];
            $_SESSION['fname'] = $row['fname'];
            $_SESSION['lname'] = $row['lname'];
            $_SESSION['email'] = $row['email'];
            $_SESSION['acc'] = $row['esewa_account']; // renamed field to match camel_case4
            echo 'buyer';
            header("Location: ./index.php");
        } elseif($result_seller->num_rows>0){
            $row = mysqli_fetch_assoc($result_seller);
            // // Assuming a user can be either buyer or seller based on a role field
            // if ($row['role'] == 'buyer') {
            //     $_SESSION['buyer_id'] = $row['buyer_id'];
            // } elseif ($row['role'] == 'seller') {
            //     $_SESSION['seller_id'] = $row['seller_id'];
            // }
            $_SESSION['s_id']=$row['seller_id'];
            $_SESSION['bname'] = $row['business_name'];
            $_SESSION['email'] = $row['email'];
            echo 'seller';
            header("Location: ./seller_dashboard.php");

        }
        else {
            echo"<script>console.log('fail');</script>";
            header("Location: ./index.php?error=invalid_user");
        }
    }
}

mysqli_close($conn);
?>
