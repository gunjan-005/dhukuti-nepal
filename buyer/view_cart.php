<?php
session_start();
$conn = mysqli_connect("localhost", "root", "", "dhukuti_nepal");

// Check DB connection
if (!$conn) {
    http_response_code(500);
    die(json_encode(["error" => "Database connection failed."]));
}

// Check if user is logged in
if (!isset($_SESSION['buyer_id'])) {
    http_response_code(401);
    die(json_encode(["error" => "Please login."]));
}

$buyer_id = $_SESSION['buyer_id']; // Fixed mismatch

// Use prepared statement for safety
$sql = "SELECT c.cart_id, c.quantity, p.name, p.price, p.photo
        FROM cart c
        JOIN product p ON c.product_id = p.p_id
        WHERE c.buyer_id = ?";

$stmt = mysqli_prepare($conn, $sql);
mysqli_stmt_bind_param($stmt, "i", $buyer_id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

$cart_items = [];
while ($row = mysqli_fetch_assoc($result)) {
    $cart_items[] = $row;
}

mysqli_stmt_close($stmt);
mysqli_close($conn);

// Return JSON response
header('Content-Type: application/json');
echo json_encode($cart_items);
?>
