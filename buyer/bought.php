<?php
session_start();

// Connect to the database
$conn = mysqli_connect('localhost', 'root', '', 'dhukuti_nepal'); // change DB name as needed

if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}
// Redirect to login if user is not logged in
if (!isset($_SESSION['u_id'])) {
    header("Location:../index.php");
    exit();
}

// Mark a payment as done
if (isset($_POST['done'])) {
    $payment_id = $_POST['done'];
    $update_sql = "UPDATE payment SET status = 'Paid' WHERE id = ?";
    $stmt = mysqli_prepare($conn, $update_sql);
    mysqli_stmt_bind_param($stmt, "i", $payment_id);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    header("Location: payments.php");
    exit();
}

// Cancel a payment
if (isset($_POST['cancel'])) {
    $payment_id = $_POST['cancel'];
    $update_sql = "UPDATE payment SET status = 'Cancelled' WHERE id = ?";
    $stmt = mysqli_prepare($conn, $update_sql);
    mysqli_stmt_bind_param($stmt, "i", $payment_id);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    header("Location: payments.php");
    exit();
}

// Fetch all payment records
$query = "
    SELECT p.id, p.amount, p.status, p.date, u.username 
    FROM payment p 
    JOIN users u ON p.user_id = u.id
    ORDER BY p.date DESC
";

$result = mysqli_query($conn, $query);

$payments = [];

if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $payments[] = $row;
    }
    mysqli_free_result($result);
} else {
    die("Query failed: " . mysqli_error($conn));
}

mysqli_close($conn);
?>
