<?php
session_start();
$conn = mysqli_connect("localhost", "root", "", "dhukuti_nepal");

if (!isset($_SESSION['buyer_id'])) {
    die("Login first.");
}

$cart_id = intval($_GET['cart_id']);
mysqli_query($conn, "DELETE FROM cart WHERE cart_id = $cart_id");

echo "Item removed from cart.";
mysqli_close($conn);
?>
