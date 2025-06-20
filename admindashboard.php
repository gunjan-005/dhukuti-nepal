<?php
session_start();
$conn=mysqli_connect('localhost','root','','dhukuti_nepal'); 
if (!isset($_SESSION['admin_id'])) {
    // Redirect to login page if user is not logged in
    header("Location:../index.php");
    exit();
}
$sql="SELECT * FROM `dhukuti_category`";
$result = mysqli_query($conn, $sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="admindashboard.css">
  
</head>
<body>
        <div>

          <div class="navbar">
            <div class="logo">
                <img src="images/logo.jpeg" width="100px">
            </div>
            <nav>
                <ul>
                    <li><a href="">ABOUT US</a></li>
                    <li><a href="">CONTACT US</a></li>
                </ul>
            </nav>
            <div class="search-bar">
              <form action="#" method="get">
                <input type="text" placeholder="Search products">
                <button type="submit">Search</button>
              </form>
            </div>
            
            <div class="side-logo">
                <a href="#loginModal"><img src="images/people.png" style="cursor:pointer;"></a>


                <img src="images/trolley.png" >
            </div>
        </div>
        

        

  <div class="container">
    <aside class="sidebar">
      <h2>Admin Dashboard</h2>
      
     
       <a href="manage-categories.html">Manage Categories</a>
       <a href="manage-payments.html">Manage Payments</a>
       

       <a href="#" class="logout"> Log-out</a>

    </aside>

    <main class="main">
      <div class="dashboard-stats">
        <div class="stat-box">Total no. of Sellers</div>
        <div class="stat-box">Total Active Listings</div>
        <div class="stat-box">Total Orders</div>
        
        
      </div>
      <div class="dashboard-tables">
        <div class="table-section">
            
        <div class="table-section">
          <h3>All Orders Summary</h3>
          <table>
            <thead>
              <tr>
                <th>Order ID</th>
                <th>Date</th>
                <th>Delivery Status</th>
                <th>Seller</th>
                <th>Buyer</th>
              </tr>
               <tr>
                <th>203</th>
                <th>2nd june</th>
                <th>Pending</th>
                <th>Rakura</th>
                <th>Raman</th>
              </tr>
            </thead>
            <tbody>
              <!-- Order rows go here -->
            </tbody>
          </table>
        </div>
      </div>
    </main>
  </div>
</body>
</html>