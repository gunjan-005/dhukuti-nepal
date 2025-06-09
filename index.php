index.php
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
                    <li><a href="about.html">ABOUT US</a></li>
                    <li><a href="#contact">CONTACT US</a></li>
                </ul>
            </nav>
            <div class="search-bar">
              <form action="#" method="get">
                <input type="text" placeholder="Search products">
                <button type="submit">Search</button>
              </form>
            </div>
            <?php
            if(isset($_SESSION['b_id']))
            {
                $fnameInitial = substr($_SESSION['fname'], 0, 1); // First letter of first name
                $lnameInitial = substr($_SESSION['lname'], 0, 1); // First letter of last name
                $initials = strtoupper($fnameInitial . $lnameInitial);
              echo'<div class="side-logo">
                <a href="#logoutModal"><img src="images/people.png" style="cursor:pointer;"></a>
                <span  class="username">'.$initials.'</span>
                <img src="images/trolley.png" >
            </div>';
              //seller ko ho seller dashboard ko lagi
            }elseif(isset($_SESSION['s_id'])){
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
              <a href="#featured" class="btn">Shop Now</a>
              
            </div>
        </section>
        <div class="category-bar">
            <ul>
              <li><a href="#">Handicrafts</a></li>
              <li><a href="#">Gifts & Souvenirs</a></li>
              <li><a href="#">Accessories</a></li>
              <li><a href="#">Health and Wellness</a></li>
              <li><a href="#">Food & Beverages</a></li>
            </ul>
          </div>
          <div class="offer">
            <div class="offer-img">
              <img src="images/pashmina2.jpg" alt="Smart Band 4">
            </div>
            <div class="offer-text">
              <p>UP TO 20% OFF</p>
              <h1>Wrap Yourself in Elegance</h1>
              <small>
                Discover the timeless beauty of handcrafted Nepali Pashmina – soft as a whisper, warm as a hug.
                Adorned with intricate, colorful embroidery inspired by Himalayan flora, our premium pashminas blend tradition, luxury, and artistry. </small>
              <br><br>
              <a href="#" class="btn">Buy Now →</a>
            </div>
          </div>

<!-- products -->
<section class="products-section" id="featured">
  <div class="section-header">
      <h2>Featured Products</h2>
      <div class="underline">
      </div>
  <div class="product-grid">
    <div class="product-card">
      <div class="product-img-container">
        <img src="images/nepali.jpg" alt="Pashmina">
        </div>
        <h3>Woolen braids</h3>
        <p>Traditional handmade woolen accessories worn during festivals and rituals.</p>
      
    </div>
    <div class="product-card">
      <div class="product-img-container">
        <img src="../images/sing.jpg" alt="Singing Bowl">
        </div>
        <h3>Singing Bowl</h3>
        <p>Used for meditation and healing, made with ancient Himalayan craftsmanship.</p>
      
    </div>
    <div class="product-card">
      <div class="product-img-container">
        <img src="images/yonjan.jpeg" alt="Homemade Radish Pickle">
        </div>
        <h3>Homemade Radish Pickle</h3>
        <p>Spicy and tangy radish pickle made with traditional Nepali herbs.</p>
      
    </div>
     
  </div>
</section>

<section class="products-section2">
  <div class="section-header2">
    <h2>Latest Products</h2>
    <div class="underline2"></div>
  </div>
  <div class="product-grid">
    <div class="product-card">
      <div class="product-img-container">
        <img src="images/body-soap.jpeg" alt="Natural Herbal Soap">
      </div>
      <h3>Natural Herbal Soap</h3>
      <p>Gentle, handmade soap with natural ingredients for healthy skin.</p>
    </div>

    <div class="product-card">
      <div class="product-img-container">
        <img src="images/flat.jpg" alt="Bamboo Basket">
      </div>
      <h3>Bamboo Basket</h3>
      <p>Eco-friendly and durable baskets woven from natural bamboo.</p>
    </div>

    <div class="product-card">
      <div class="product-img-container">
        <img src="images/puppets.webp" alt="Nepali Puppet">
      </div>
      <h3>Nepali Puppet</h3>
      <p>Beautifully painted wooden puppets reflecting local folklore.</p>
    </div>
  </div>
</section>
          <!-- Trigger Buttons -->


<!-- Login Modal -->
<div id="loginModal" class="modal">
  <div class="modal-content">
    <a href="#" class="close">&times;</a>
    <h2>Login</h2>
    <form action="./login.php" method="POST">
      <input type="text" placeholder="Username" name="email" required>
      <input type="password" placeholder="Password" name="password" required>
        <button type="submit" name="login">Login</button>
    </form>
	<p2 class="forgot">
     Forgot password?
</p2>
    <p class="signup-text">
      Don't have an account?
      <a href="#signupChooser" class="underline-link">Sign up</a>
    </p>
  </div>
</div>

<!-- Sign Up As Modal -->
<div id="signupChooser" class="modal">
  <div class="modal-content">
    <a href="#" class="close">&times;</a>
    <h2>Sign Up As</h2>
    <div class="button-container">
      <a href="#buyerSignup"><button>Buyer</button></a>
      <a href="#sellerSignup"><button>Seller</button></a>
    </div>
  </div>
</div>

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



<!-- Buyer Signup Modal -->
<div id="buyerSignup" class="modal">
  <div class="modal-content">
    <a href="#" class="close">&times;</a>
    <h2>Sign Up</h2>
    <form action="./buyer_register.php" method="POST">
  <input type="text" name="fullname" placeholder="Full Name" required>
  <input type="email" name="email" placeholder="Email" required>
  <input type="text" name="contact_number" placeholder="Contact Number" required>
  <input type="text" name="esewa_account" placeholder="eSewa ID" required>
  <input type="password" name="password" placeholder="New Password" required>
  <input type="password" name="cpassword" placeholder="Re-enter Password" required>

  <button type="submit" name="buyer-register">Sign up</button>
</form>
  </div>
</div>


<!-- Seller Signup Modal -->
<div id="sellerSignup" class="modal">
  <div class="modal-content">
    <a href="#" class="close">&times;</a>
    <h2>Sign Up</h2>
    <form action="./seller_register.php" method="POST">
      <input type="text" name="b_name" placeholder="Business Name" required>
      <input type="text" name="b_address" placeholder="Business Address" required>
      <input type="email" name="email" placeholder="Email" required>
      <input type="number"name="phone"  placeholder="Phone Number" required>
      <input type="text" name="esewa_account" placeholder="eSewa ID" required>
      <input type="number" name="pan" placeholder="PAN Number" required>
      <input type="password" name="pass" placeholder="New Password" required>
      <input type="password" name="cpass" placeholder="Re-enter Password" required>
      <button type="submit" name="seller-register">Register</button>
    
    </form>
  </div>
</div>     
<section class="join-section" id="contact">
  <div class="join-container">
    <h2>Join Our Community</h2>
    <p>Get updates, exclusive offers, and support local makers across Nepal.</p>
    <form class="email-form">
      <input type="email" placeholder="example@gmail.com" required />
      <button type="submit">Submit</button>
    </form>
  </div>
</section>
<footer class="contact-page">
  <img src="images/bamboo making.jpg" class="contact-page-bg">
  <div class="info-content">
    <div class="contact-info">
      <div class="info-left">
        <h3>Explore Local Treasures</h3>
        <p>Showcasing handmade, natural, and authentic goods from Nepali artisans and farmers. Support local, shop sustainable.</p>
  
        <h3>Follow Us</h3>
        <p>
          Facebook: <a href="#">dhukutinepal</a><br>
          Instagram: <a href="#">dhukuti_nepal</a>
        </p>
      </div>
  
      <div class="info-right">
        <div>
          <h3>Phone</h3>
          <p>+977-9841234567<br>+977-9841567890</p>
        </div>
        <div>
          <h3>Email</h3>
          <p>dhukutinepal@gmail.com</p>
        </div>
      </div>
    </div>
  </div>
</footer>



    </body>
</html>