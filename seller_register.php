<?php
$conn = mysqli_connect('localhost', 'root', '', 'dhukuti_nepal');

if (isset($_POST['seller-register'])) {

    $business_name = $_POST['business_name'];
    $email = $_POST['email'];
    $contact = $_POST['contact_number'];
    $esewa = $_POST['esewa_account'];
    $pan = $_POST['pan_number'];
    $address = $_POST['address'];

    $password = $_POST['password'];
    $cpassword = $_POST['cpassword'];

    // Hash the password securely
    if ($password === $cpassword && !empty($business_name)) {

        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        // Check if email already exists
        $check_sql = "SELECT * FROM dhukuti_seller WHERE email='$email'";
        $check_result = mysqli_query($conn, $check_sql);

        if ($check_result && mysqli_num_rows($check_result) == 0) {
            $insert_sql = "INSERT INTO dhukuti_seller 
                (business_name, email, password, contact_number, esewa_account, pan_number, address, is_verified) 
                VALUES 
                ('$business_name', '$email', '$hashed_password', '$contact', '$esewa', '$pan', '$address', false)";

            $insert_result = mysqli_query($conn, $insert_sql);

            if ($insert_result) {
                header("Location: ../login.php"); // redirect to login or success page
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
