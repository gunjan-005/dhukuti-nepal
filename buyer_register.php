<?php
// Database connection
$conn = mysqli_connect('localhost', 'root', '', 'dhukuti_nepal');

// Debugging: check if the form was submitted
if (isset($_POST['buyer-register'])) {

    // Debug: Print all POST data
    echo "<pre>";
    print_r($_POST);
    echo "</pre>";

    // Collect and sanitize input
    $fullname = trim($_POST['fullname']);
    $parts = explode(" ", $fullname);
    $fname = array_shift($parts);
    $lname = implode(" ", $parts);

    $email = trim($_POST['email']);
    $contact = trim($_POST['contact_number']);
    $esewa = trim($_POST['esewa_account']);
    $password = $_POST['password'];
    $cpassword = $_POST['cpassword'];

    // Validation
    if ($password === $cpassword && preg_match('/^[A-Za-z ]+$/', $fullname)) {
        $hashed_pass = md5($password);
        

        // Check if email already exists
        $check_sql = "SELECT * FROM dhukuti_buyer WHERE email='$email'";
        $result = mysqli_query($conn, $check_sql);

        if ($result && $result->num_rows == 0) {
            // Insert into database
            $insert_sql = "INSERT INTO dhukuti_buyer 
                (fname, lname, email, password, contact_number, esewa_account) 
                VALUES 
                ('$fname', '$lname', '$email', '$hashed_pass', '$contact', '$esewa')";

            // Debug: Print the SQL being run
            // echo "Running SQL: <br>$insert_sql<br><br>";

            if (mysqli_query($conn, $insert_sql)) {
                // echo " Registration successful! Redirecting...";
                // Uncomment this after testing:
                header("Location: ./index.php");
                exit();
            } else {
                echo " SQL Error: " . mysqli_error($conn);
            }

        } else {
            echo " This email is already registered.";
        }

    } else {
         header("Location: ./index.php?error=invalid_username or password does not match");
    }

} else {
    echo "Form was not submitted correctly.";
}

// Close connection
mysqli_close($conn);
?>
