<?php
session_start();
header('Content-Type: application/json');

// Database connection
$conn = mysqli_connect('localhost', 'root', '', 'dhukuti_nepal');

if (!$conn) {
    http_response_code(500);
    echo json_encode(['error' => 'Database connection failed']);
    exit;
}

// Fetch categories
$categories = [];
$cat_sql = "SELECT * FROM categories";
$cat_result = mysqli_query($conn, $cat_sql);
if ($cat_result && mysqli_num_rows($cat_result) > 0) {
    while ($row = mysqli_fetch_assoc($cat_result)) {
        $categories[] = $row;
    }
}

// Fetch products
$products = [];
$prod_sql = "SELECT * FROM products ORDER BY created_at DESC";
$prod_result = mysqli_query($conn, $prod_sql);
if ($prod_result && mysqli_num_rows($prod_result) > 0) {
    while ($row = mysqli_fetch_assoc($prod_result)) {
        $products[] = $row;
    }
}

// Send as JSON
echo json_encode([
    'categories' => $categories,
    'products' => $products,
    'session' => [
        'buyer_id' => $_SESSION['buyer_id'] ?? null,
        'seller_id' => $_SESSION['seller_id'] ?? null
    ]
]);

mysqli_close($conn);
?>
