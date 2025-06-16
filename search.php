<?php
// connect to your database
$conn = mysqli_connect('localhost', 'root', '', 'dhukuti_nepal');

// check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if (isset($_GET['query'])) {
    $search = mysqli_real_escape_string($conn, $_GET['query']);

    // search in product_name, category, or description
    $sql = "SELECT * FROM products 
            WHERE product_name LIKE '%$search%' 
               OR category LIKE '%$search%' 
               OR description LIKE '%$search%'";

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        echo "<h2>Search Results for '<i>" . htmlspecialchars($search) . "</i>'</h2>";
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<div style='margin-bottom:20px;'>";
            echo "<h3>" . htmlspecialchars($row['product_name']) . "</h3>";
            echo "<p>" . htmlspecialchars($row['description']) . "</p>";
            echo "<strong>Price: Rs. " . htmlspecialchars($row['price']) . "</strong>";
            echo "</div><hr>";
        }
    } else {
        echo "<p>No results found for '<strong>" . htmlspecialchars($search) . "</strong>'</p>";
    }
} else {
    echo "No search term entered.";
}

mysqli_close($conn);
?>
