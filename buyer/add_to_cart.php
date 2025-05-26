<?php
session_start();
$conn = mysqli_connect("localhost", "root", "", "dhukuti_nepal");

// Check if buyer is logged in
if (!isset($_SESSION['buyer_id'])) {
    header("Location: login.php");
    exit();
}

$buyer_id = $_SESSION['buyer_id'];
$product_id = intval($_POST['product_id']);

// Check if product is already in cart
$check = mysqli_query($conn, "SELECT * FROM cart WHERE buyer_id = $buyer_id AND product_id = $product_id");
if (mysqli_num_rows($check) > 0) {
    // Increase quantity if already in cart
    mysqli_query($conn, "UPDATE cart SET quantity = quantity + 1 WHERE buyer_id = $buyer_id AND product_id = $product_id");
} else {
    // Insert new item
    mysqli_query($conn, "INSERT INTO cart (buyer_id, product_id) VALUES ($buyer_id, $product_id)");
}

header("Location: view_cart.php");
?>
