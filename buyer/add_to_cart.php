<?php
session_start();
$conn = new mysqli("localhost", "root", "", "dhukuti_nepal");

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if buyer is logged in
if (!isset($_SESSION['buyer_id'])) {
    header("Location: ../login.php"); // redirect up to main folder
    exit();
}

$buyer_id = $_SESSION['buyer_id'];
$product_id = intval($_POST['product_id']); // sanitize input

// Check if product is already in cart
$check_stmt = $conn->prepare("SELECT quantity FROM cart WHERE buyer_id = ? AND product_id = ?");
$check_stmt->bind_param("ii", $buyer_id, $product_id);
$check_stmt->execute();
$check_result = $check_stmt->get_result();

if ($check_result->num_rows > 0) {
    // Product exists in cart, increase quantity
    $update_stmt = $conn->prepare("UPDATE cart SET quantity = quantity + 1 WHERE buyer_id = ? AND product_id = ?");
    $update_stmt->bind_param("ii", $buyer_id, $product_id);
    $update_stmt->execute();
    $update_stmt->close();
} else {
    // Product not in cart, insert with quantity 1
    $insert_stmt = $conn->prepare("INSERT INTO cart (buyer_id, product_id, quantity) VALUES (?, ?, 1)");
    $insert_stmt->bind_param("ii", $buyer_id, $product_id);
    $insert_stmt->execute();
    $insert_stmt->close();
}

$check_stmt->close();
$conn->close();

// Redirect to cart view page in parent folder
header("Location: ../view_cart.php");
exit();
?>
