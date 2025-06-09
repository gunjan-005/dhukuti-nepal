<?php
session_start();
$conn = new mysqli("localhost", "root", "", "dhukuti_nepal");

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if buyer is logged in
if (!isset($_SESSION['buyer_id'])) {
    header("Location: ../index.php"); // go to login page in root folder
    exit();
}

// Validate and get cart_id
if (isset($_GET['cart_id'])) {
    $cart_id = intval($_GET['cart_id']);

    // Use prepared statement to avoid SQL injection
    $stmt = $conn->prepare("DELETE FROM cart WHERE cart_id = ?");
    $stmt->bind_param("i", $cart_id);
    $stmt->execute();
    $stmt->close();
}

// Close DB connection
$conn->close();

// Redirect back to cart page
header("Location: ../view_cart.php"); // assuming view_cart.php is in parent folder
exit();
?>
