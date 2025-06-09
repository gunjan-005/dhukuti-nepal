<?php
session_start();         // Start the session
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title> DHUKUTI-NEPAL </title>
        <link rel="stylesheet" href="style.css">
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
            <?php
            if(isset($_SESSION['s_id'])){
              echo'<div class="side-logo">
                <a href="#logoutModal"><img src="images/people.png" style="cursor:pointer;"></a>
                <span  class="username">'.$_SESSION['bname'].'</span>
                <img src="images/trolley.png" >
            </div>';
            }
            else{
              echo'<div class="side-logo">
                <a href="#loginModal"><img src="images/people.png" style="cursor:pointer;"></a>
                <img src="images/trolley.png" >
            </div>';
            }
            ?>
            
        </div>
        

        </div>
        <section class="hero">
            <img src="images/statuef.webp" alt="Hero Image" class="hero-bg">
            <div class="overlay">
              <h1>DHUKUTI NEPAL</h1>
              <p class="tagline">“Nepali Sipkala ko Digital Khajana”</p>
              <a href="#" class="btn">Shop Now</a>
              
            </div>
        </section>
        <!-- logout As Modal -->
<div id="logoutModal" class="modal">
  <div class="modal-content">
    <a href="#" class="close">&times;</a>
    <h2>User</h2>
    <div class="button-container">
      <a href="./logout.php"><button>Logout</button></a>
      <a href="#"><button>Profile</button></a>
    </div>
  </div>
</div>
</body>
</html>