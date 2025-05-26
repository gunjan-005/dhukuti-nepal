<?php
session_start();
$conn = mysqli_connect("localhost", "root", "", "dhukuti_nepal");

if (!isset($_SESSION['buyer_id'])) {
    die("Please login.");
}

$buyer_id = $_SESSION['buyer_id'];

$sql = "SELECT c.cart_id, c.quantity, p.name, p.price, p.photo
        FROM cart c
        JOIN product p ON c.product_id = p.p_id
        WHERE c.buyer_id = $buyer_id";

$result = mysqli_query($conn, $sql);
$cart_items = [];

while ($row = mysqli_fetch_assoc($result)) {
    $cart_items[] = $row;
}

header('Content-Type: application/json');
echo json_encode($cart_items);
mysqli_close($conn);
?>
