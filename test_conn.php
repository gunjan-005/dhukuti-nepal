<?php
// Enable error reporting
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Try connecting to the database
$host = 'localhost';
$user = 'root';
$pass = '';
$db = 'dhukuti_nepal';

$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if ($conn->connect_error) {
    die("❌ Database connection failed: " . $conn->connect_error);
} else {
    echo "✅ Database connected successfully!";
}

// Optional: list tables
$result = mysqli_query($conn, "SHOW TABLES");
if ($result) {
    echo "<br>📋 Tables in database:<br>";
    while ($row = mysqli_fetch_array($result)) {
        echo "- " . $row[0] . "<br>";
    }
} else {
    echo "⚠️ Could not fetch tables.";
}

$conn->close();
?>
