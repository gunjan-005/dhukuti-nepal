-- Create the database
CREATE DATABASE dhukuti_nepal;
USE dhukuti_nepal;

-- Admin Table
CREATE TABLE dhukuti_admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100),
    password VARCHAR(255)
);

-- Buyer Table
CREATE TABLE dhukuti_buyer (
    buyer_id INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(255),
    contact_number VARCHAR(20),
    esewa_account VARCHAR(30)
);

-- Seller Table
CREATE TABLE dhukuti_seller (
    seller_id INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    business_name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(255),
    contact_number VARCHAR(20),
    esewa_account VARCHAR(30),
    pan_number VARCHAR(20) UNIQUE,
    address VARCHAR(255)
);

-- Category Table
CREATE TABLE dhukuti_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100)
);

-- Product Table
CREATE TABLE dhukuti_product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    price INT,
    description VARCHAR(500),
    stock_status VARCHAR(20),
    location VARCHAR(255),
    delivery_method VARCHAR(50),
    is_negotiable VARCHAR(10),
    image VARCHAR(100),
    upload_date DATETIME,
    category_id INT,
    seller_id INT,
    FOREIGN KEY (category_id) REFERENCES dhukuti_category(category_id),
    FOREIGN KEY (seller_id) REFERENCES dhukuti_seller(seller_id)
);

-- Cart Table
CREATE TABLE dhukuti_cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    buyer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (buyer_id) REFERENCES dhukuti_buyer(buyer_id),
    FOREIGN KEY (product_id) REFERENCES dhukuti_product(product_id)
);

-- Payment Table
CREATE TABLE dhukuti_payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255),
    amount INT,
    product_image VARCHAR(100),
    buyer_id INT,
    seller_id INT,
    delivery_status VARCHAR(30),
    payment_date DATE,
    FOREIGN KEY (buyer_id) REFERENCES dhukuti_buyer(buyer_id),
    FOREIGN KEY (seller_id) REFERENCES dhukuti_seller(seller_id)
);

-- Review Table
CREATE TABLE dhukuti_review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    buyer_id INT,
    product_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment VARCHAR(500),
    review_date DATETIME,
    FOREIGN KEY (buyer_id) REFERENCES dhukuti_buyer(buyer_id),
    FOREIGN KEY (product_id) REFERENCES dhukuti_product(product_id)
);

-- Review Image Table
CREATE TABLE dhukuti_review_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    review_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (review_id) REFERENCES dhukuti_review(review_id)
);
