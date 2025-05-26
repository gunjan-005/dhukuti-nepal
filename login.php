<?php
session_start();

// Connect to Dhukuti_Nepal database
$conn = mysqli_connect('localhost', 'root', '', 'dhukuti_nepal'); 

if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}

if (isset($_POST['login'])) {
    $email = $_POST['email'];
    $pass = md5($_POST['password']); // For now using md5, consider upgrading to password_hash()

    if ($email === "dhukutinepal_admin@gmail.com") {
    $pass = $_POST['password']; 

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
        $sql = "SELECT * FROM `users` WHERE `email` = '$email' AND `password` = '$pass'";
        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);

            // Assuming a user can be either buyer or seller based on a role field
            if ($row['role'] == 'buyer') {
                $_SESSION['buyer_id'] = $row['buyer_id'];
            } elseif ($row['role'] == 'seller') {
                $_SESSION['seller_id'] = $row['seller_id'];
            }

            $_SESSION['fname'] = $row['fname'];
            $_SESSION['lname'] = $row['lname'];
            $_SESSION['email'] = $row['email'];
            $_SESSION['acc'] = $row['esewa_account']; // renamed field to match camel_case

            echo "<script>console.log('login success');</script>";

            if (empty($row['esewa_account'])) {
                header("Location: ../user/edit.php");
            } else {
                header("Location: ../index.php");
            }

        } else {
            header("Location: ../index.php?error=invalid_user");
        }
    }
}

mysqli_close($conn);
?>
