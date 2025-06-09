<?php
$conn = mysqli_connect('localhost', 'root', '', 'dhukuti_nepal');

if (isset($_POST['seller-register'])) {

    $business_name = $_POST['b_name'];
    $address = $_POST['b_address'];
    $email = $_POST['email'];
    $contact = $_POST['phone'];
    $esewa = $_POST['esewa_account'];
    $pan = $_POST['pan'];
    $password = $_POST['pass'];
    $cpassword = $_POST['cpass'];
    // Hash the password securely
    if ($password === $cpassword && !empty($business_name)) {

        $hashed_password =md5($password);

        // Check if email already exists
        $check_sql = "SELECT * FROM `dhukuti_seller` WHERE `email`='$email'";
        $check_result = mysqli_query($conn, $check_sql);

        if ($check_result && mysqli_num_rows($check_result) == 0) {
            $insert_sql = "INSERT INTO dhukuti_seller 
                (business_name, email, password, contact_number, esewa_account, pan_number, address) 
                VALUES 
                ('$business_name', '$email', '$hashed_password', '$contact', '$esewa', '$pan', '$address')";

            $insert_result = mysqli_query($conn, $insert_sql);
            if ($insert_result) {
                header("Location: ./index.php"); // redirect to login or success page
                exit();
            } else {
                echo "Something went wrong during registration.";
            }

        } else {
            echo "Email is already registered.";
        }

    } else {
        echo "Passwords do not match or business name is empty.";
    }
}

mysqli_close($conn);
?>
