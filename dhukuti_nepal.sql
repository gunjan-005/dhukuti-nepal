-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2025 at 09:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dhukuti_nepal`
--
CREATE DATABASE IF NOT EXISTS `dhukuti_nepal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dhukuti_nepal`;

-- --------------------------------------------------------

--
-- Table structure for table `dhukuti_admin`
--

CREATE TABLE `dhukuti_admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dhukuti_buyer`
--

CREATE TABLE `dhukuti_buyer` (
  `buyer_id` int(11) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `esewa_account` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dhukuti_buyer`
--

INSERT INTO `dhukuti_buyer` (`buyer_id`, `fname`, `lname`, `email`, `password`, `contact_number`, `esewa_account`) VALUES
(1, 'Anusha', 'Tuladhar', 'anusha@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '9840260812', '9898989898'),
(2, 'Tilasma', '', 'tilasma@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '9812345678', '980000001'),
(3, 'Ashma', 'Shrestha', 'ashma@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '9087123456', '981234561'),
(5, 'Chandra', 'Laxmi', 'chandra@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '9012345678', '980000002'),
(6, 'Raman', 'Shrestha', 'raman@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '90871234567', '980000004'),
(7, 'ipsa', 'tuladhar', 'ipsa@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '9841212566', '9841212566');

-- --------------------------------------------------------

--
-- Table structure for table `dhukuti_cart`
--

CREATE TABLE `dhukuti_cart` (
  `cart_id` int(11) NOT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dhukuti_category`
--

CREATE TABLE `dhukuti_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dhukuti_payment`
--

CREATE TABLE `dhukuti_payment` (
  `payment_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `delivery_status` varchar(30) DEFAULT NULL,
  `payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dhukuti_product`
--

CREATE TABLE `dhukuti_product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `stock_status` varchar(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `delivery_method` varchar(50) DEFAULT NULL,
  `is_negotiable` varchar(10) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `upload_date` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dhukuti_review`
--

CREATE TABLE `dhukuti_review` (
  `review_id` int(11) NOT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` varchar(500) DEFAULT NULL,
  `review_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dhukuti_review_image`
--

CREATE TABLE `dhukuti_review_image` (
  `image_id` int(11) NOT NULL,
  `review_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dhukuti_seller`
--

CREATE TABLE `dhukuti_seller` (
  `seller_id` int(11) NOT NULL,
  `business_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `esewa_account` varchar(30) DEFAULT NULL,
  `pan_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dhukuti_seller`
--

INSERT INTO `dhukuti_seller` (`seller_id`, `business_name`, `email`, `password`, `contact_number`, `esewa_account`, `pan_number`, `address`) VALUES
(1, 'Dosrojivan', '238039_anusha@kusom.edu.np', '827ccb0eea8a706c4c34a16891f84e7b', '9840260812', '980000001', '12345', 'kathmandu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dhukuti_admin`
--
ALTER TABLE `dhukuti_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `dhukuti_buyer`
--
ALTER TABLE `dhukuti_buyer`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `dhukuti_cart`
--
ALTER TABLE `dhukuti_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `dhukuti_category`
--
ALTER TABLE `dhukuti_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `dhukuti_payment`
--
ALTER TABLE `dhukuti_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `dhukuti_product`
--
ALTER TABLE `dhukuti_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `dhukuti_review`
--
ALTER TABLE `dhukuti_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `dhukuti_review_image`
--
ALTER TABLE `dhukuti_review_image`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `review_id` (`review_id`);

--
-- Indexes for table `dhukuti_seller`
--
ALTER TABLE `dhukuti_seller`
  ADD PRIMARY KEY (`seller_id`),
  ADD UNIQUE KEY `pan_number` (`pan_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dhukuti_admin`
--
ALTER TABLE `dhukuti_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dhukuti_buyer`
--
ALTER TABLE `dhukuti_buyer`
  MODIFY `buyer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dhukuti_cart`
--
ALTER TABLE `dhukuti_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dhukuti_category`
--
ALTER TABLE `dhukuti_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dhukuti_payment`
--
ALTER TABLE `dhukuti_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dhukuti_product`
--
ALTER TABLE `dhukuti_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dhukuti_review`
--
ALTER TABLE `dhukuti_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dhukuti_review_image`
--
ALTER TABLE `dhukuti_review_image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dhukuti_seller`
--
ALTER TABLE `dhukuti_seller`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dhukuti_cart`
--
ALTER TABLE `dhukuti_cart`
  ADD CONSTRAINT `dhukuti_cart_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `dhukuti_buyer` (`buyer_id`),
  ADD CONSTRAINT `dhukuti_cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `dhukuti_product` (`product_id`);

--
-- Constraints for table `dhukuti_payment`
--
ALTER TABLE `dhukuti_payment`
  ADD CONSTRAINT `dhukuti_payment_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `dhukuti_buyer` (`buyer_id`),
  ADD CONSTRAINT `dhukuti_payment_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `dhukuti_seller` (`seller_id`);

--
-- Constraints for table `dhukuti_product`
--
ALTER TABLE `dhukuti_product`
  ADD CONSTRAINT `dhukuti_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `dhukuti_category` (`category_id`),
  ADD CONSTRAINT `dhukuti_product_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `dhukuti_seller` (`seller_id`);

--
-- Constraints for table `dhukuti_review`
--
ALTER TABLE `dhukuti_review`
  ADD CONSTRAINT `dhukuti_review_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `dhukuti_buyer` (`buyer_id`),
  ADD CONSTRAINT `dhukuti_review_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `dhukuti_product` (`product_id`);

--
-- Constraints for table `dhukuti_review_image`
--
ALTER TABLE `dhukuti_review_image`
  ADD CONSTRAINT `dhukuti_review_image_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `dhukuti_review` (`review_id`);
--
-- Database: `dosrojivan`
--
CREATE DATABASE IF NOT EXISTS `dosrojivan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dosrojivan`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `email`, `password`) VALUES
(1, 'dosrojivan_admin@gmail.com', '0192023a7bbd73250516f069df18b500');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `u_id`, `p_id`) VALUES
(17, 1003, 29),
(18, 1003, 28),
(23, 1006, 34),
(26, 1002, 37),
(28, 1002, 4),
(29, 1002, 43);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(11) NOT NULL,
  `c_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `c_name`) VALUES
(1, 'Kitchen Appliances'),
(2, 'Living Room Appliances'),
(3, 'Bathroom Appliances'),
(4, 'Laundry Room Appliances'),
(5, 'Home Office Appliances');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `price` int(225) NOT NULL,
  `photo` varchar(225) NOT NULL,
  `buyer_acc` varchar(20) NOT NULL,
  `seller_acc` varchar(20) NOT NULL,
  `delivery` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `pname`, `price`, `photo`, `buyer_acc`, `seller_acc`, `delivery`, `status`, `date`) VALUES
(5, 'Used CG Washing Machine', 400, '1732821924.jpg', '9806800001', '9806800003', 'Received', 'Pending', '2025-02-25'),
(21, 'CG Microwave', 1200, '1734070041.jpeg', '9806800004', '9806800001', 'Not Received', 'Pending', '2025-02-25'),
(22, 'Metal office desk', 120, '1734070334.jpg', '9806800001', '9806800002', 'Received', 'Complete', '2025-02-25'),
(26, 'Dining Table', 340, '1735909772.jpg', '9806800004', '9806800001', 'Not Received', 'Pending', '2025-02-27'),
(31, 'Mixer Set', 1500, '1740446359.jpg', '9806800003', '9806800004', 'Not Received', 'Pending', '2025-02-25'),
(32, 'Old Toaster', 200, '1740446462.jpg', '9806800001', '9806800003', 'Received', 'Complete', '2025-02-25'),
(33, 'Small Working Fridge ', 2400, '1740446572.jpg', '9806800001', '9806800005', 'Not Received', 'Pending', '2025-02-25');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `p_id` int(11) NOT NULL,
  `pname` varchar(225) NOT NULL,
  `price` int(225) NOT NULL,
  `description` varchar(500) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `location` varchar(500) NOT NULL,
  `delivery` varchar(20) NOT NULL,
  `negotiation` varchar(20) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `cid` int(11) NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`p_id`, `pname`, `price`, `description`, `Status`, `location`, `delivery`, `negotiation`, `photo`, `date`, `cid`, `u_id`) VALUES
(4, 'Wodden Bed', 15000, 'Single size wooden bed\r\ndimensions: 80 cm × 200 cm (31 in × 79 in)', 'Used', 'Banaeshor, Kathmandu', 'Available', 'Not Negotiable', '1732821603.jpg', '2024-11-29 00:00:00', 2, 1003),
(7, 'Sofa for sale!!!!', 300, 'born color L shape sofa. \r\ncomfortable to sit at and clean', 'Used', 'Asan, Kathamandu', 'Not Available', 'negotiable', '1732834652.jpg', '2024-11-29 04:42:32', 2, 1002),
(8, 'Wooden dinning table with 4 chairs for Sale', 10000, 'In good condition dining table and chair set', 'Used', 'swayambhu, Kathmandu', 'Not Available', 'Not Negotiable', '1732861011.jpg', '2024-11-29 12:01:51', 1, 1006),
(9, 'Kitchen Mixer', 5000, 'In good condition mixer, has all the parts', 'Used', 'Pancha kumari Mandir, Kathmandu', 'Not Available', 'negotiable', '1732861236.jpg', '2024-11-29 12:05:36', 1, 1009),
(10, 'Wooden Daraj for Sale', 25000, '35 * 50 inch daraj', 'Used', 'Jaulakhel, Lalitpur', 'Available', 'Not Negotiable', '1732861388.jpg', '2024-11-29 12:08:08', 2, 1003),
(16, 'Wodden Drawer, Night stand', 2400, 'wodden drawer 12x16inch\r\nin good condition', 'Used', 'Godawari, Lalitpur', 'Not Available', 'Not Negotiable', '1733835909.jpg', '2024-12-10 18:50:09', 5, 1002),
(17, 'Hand Fan', 5000, 'mini green color hand held fan\r\nwith original charging cord', 'Used', 'Manbhawan, Lalitpur', 'Not Available', 'Not Negotiable', '1733836196.jpg', '2024-12-10 18:54:56', 2, 1011),
(18, 'Wooden Office Table', 2300, 'wooden office table with an attached drawer', 'Used', 'Sano gau, Lalitpur', 'Available', 'negotiable', '1733836317.jpg', '2024-12-10 18:56:57', 5, 1011),
(19, 'LG microwave', 10000, 'LG microwave with original tray and rack', 'Used', 'Sarangkot is Ward 18 of Pokhara,', 'Not Available', 'Not Negotiable', '1733836745.jpg', '2024-12-10 19:04:05', 1, 1003),
(20, 'White Bathroom Cabinet', 26000, 'Used while bathroom cabinet, \r\nthoroly cleaned', 'Used', 'Godawari, Lalitpur', 'Not Available', 'Not Negotiable', '1733837094.jpg', '2024-12-10 19:09:54', 3, 1012),
(27, 'Dining Table Set', 450, 'Old dining table with all the original chairs', 'Used', 'lalitpur', 'Available', 'Not Negotiable', '1735913704.jpg', '2025-01-03 20:00:04', 2, 1002),
(28, 'L shape sofa', 600, 'hello world', 'Used', 'Kathmandu', 'Available', 'negotiable', '1737282867.jpg', '2025-01-19 16:19:27', 3, 1002),
(29, 'Old Dressing table', 5900, 'Used dressing table but in good condition and very spacious', 'Used', 'Lalitpur', 'Available', 'negotiable', '1737282988.jpg', '2025-01-19 16:21:28', 3, 1002),
(34, 'Very Old Mixer', 1200, 'Mixer is missing some parts but the remaining parts work perfectly', 'Used', 'Godawari, Lalitpur', 'Not Available', 'negotiable', '1740446677.jpg', '2025-02-25 07:09:37', 1, 1003),
(35, 'Washing Machine FOR SALE!!!!', 1400, 'In good Condition Washing machine, can handle huge amount of cloths', 'Used', 'Banepa', 'Not Available', 'negotiable', '1740446871.jpg', '2025-02-25 07:12:51', 4, 1005),
(36, 'Group of chairs for sale!!!!!', 2500, '6 pair of good condition office chairs, barely been used', 'Like New', 'Putalisadak Kathmandu', 'Available', 'Not Negotiable', '1740446998.jpg', '2025-02-25 07:14:58', 5, 1006),
(37, 'A single office chair for sale', 120, 'Barely used office chair, in very good condition', 'Used', 'DurbarMarg, Kathmandu', 'Not Available', 'Not Negotiable', '1740448693.jpg', '2025-02-25 07:43:13', 5, 1006),
(38, 'Mixer Set FOR SALE!!!', 1200, 'Used mixer with all the original items \r\n', 'Used', 'Swayambhu, Kathmandu', 'Available', 'negotiable', '1740613583.jpg', '2025-02-27 05:31:23', 1, 1006),
(39, 'Working Fridge for Sale!!!', 2300, 'Used mini fridge for sale and works completely fine ', 'Used', 'Godawari, Lalitpur', 'Not Available', 'Not Negotiable', '1740613709.jpg', '2025-02-27 05:33:29', 1, 1011),
(40, 'Mirror for Sale!!', 600, 'Good size mirror for sale', 'Used', 'Banaeshor, Kathmandu', 'Not Available', 'negotiable', '1740613779.jpg', '2025-02-27 05:34:39', 3, 1011),
(41, 'Toaster For Sale!!!', 230, 'Old toaster but works well. No repair required', 'Used', 'Banaeshor, Kathmandu', 'Not Available', 'Not Negotiable', '1740627860.jpg', '2025-02-27 09:29:20', 1, 1002),
(42, 'Washer Machine for Sale!!!!', 12000, 'WASHING MACHINE FOR SALE!!!! LIKE NEW', 'Like New', 'Godawari, Lalitpur', 'Available', 'negotiable', '1740628480.jpg', '2025-02-27 09:30:54', 4, 1003),
(43, 'White Sofa!!! Sale!!!!', 25000, 'white sofa for sale, in good condition, NO STANES!!', 'Used', 'Asan, Kathamandu', 'Available', 'Not Negotiable', '1740628219.jpg', '2025-02-27 09:35:19', 2, 1006),
(44, 'Standing Fan For Sale!!!', 500, 'Standing fan for sale!!! In very good condition', 'Used', 'Jaulakhel, Lalitpur', 'Not Available', 'Not Negotiable', '1740628324.jpg', '2025-02-27 09:37:04', 2, 1011);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `E-Sewa Account` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `fname`, `lname`, `email`, `password`, `E-Sewa Account`) VALUES
(1001, 'Tilasma', 'Tuladhar', 'tilu2tuladhar@gmail.com', '123456789', NULL),
(1002, 'Ashma', 'Tuladhar', 'ashma@gmail.com', '8d7c57cdc09d3321b94d904bf21deaed', '9806800001'),
(1003, 'Raman', 'Shrestha', 'raman@gmail.com', '96b8ad5425b8a15ab43b2c0bb6e7ff06', '9806800002'),
(1005, 'Amog', 'Ratna Maharjan', 'amog@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '9806800003'),
(1006, 'Samana', 'Joshi', 'samana@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '9806800004'),
(1009, 'Sara', 'Rai', 'sara@gmail.com', '07202c76d675ac619874e7db254f2a2d', NULL),
(1010, 'Christina', 'Joshi', 'joshichris@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', NULL),
(1011, 'Sirjan', 'Basnet', 'sirjan@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '9806800005'),
(1012, 'Hiro', 'sidoriya', 'shoto@gmail.com', '674f3c2c1a8a6f90461e8a66fb5550ba', NULL),
(1014, '67788', '', 'd@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_ibfk_1` (`u_id`),
  ADD KEY `cart_ibfk_2` (`p_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `buyer_account` (`buyer_acc`),
  ADD KEY `seller_account` (`seller_acc`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `E-Sewa Account` (`E-Sewa Account`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10002;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1015;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `buyer_account` FOREIGN KEY (`buyer_acc`) REFERENCES `users` (`E-Sewa Account`),
  ADD CONSTRAINT `seller_account` FOREIGN KEY (`seller_acc`) REFERENCES `users` (`E-Sewa Account`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"dhukuti_nepal\",\"table\":\"dhukuti_buyer\"},{\"db\":\"dhukuti_nepal\",\"table\":\"dhukuti_seller\"},{\"db\":\"dhukuti_nepal\",\"table\":\"dhukuti_review\"},{\"db\":\"dosrojivan\",\"table\":\"users\"},{\"db\":\"dosrojivan\",\"table\":\"product\"},{\"db\":\"dosrojivan\",\"table\":\"payment\"},{\"db\":\"dosrojivan\",\"table\":\"categories\"},{\"db\":\"dosrojivan\",\"table\":\"cart\"},{\"db\":\"dosrojivan\",\"table\":\"admin\"},{\"db\":\"dhukuti_nepal\",\"table\":\"dhukuti_admin\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-06-08 07:47:25', '{\"Console\\/Mode\":\"show\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
