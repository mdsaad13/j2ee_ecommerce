-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 28, 2020 at 01:21 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jee_ecom`
--
CREATE DATABASE IF NOT EXISTS `jee_ecom` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jee_ecom`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `phone` varchar(256) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`, `phone`) VALUES
(1, 'Admin', 'admin@mail.com', 'Admin123', '9123456789');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `prod_id` bigint(255) NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `user_id` (`user_id`),
  KEY `prod_id` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `prod_id`) VALUES
(7, 4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `isactive` int(11) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `name`, `isactive`) VALUES
(1, 'Women Cloths', 1),
(2, 'Groceries', 1),
(3, 'Men Cloths', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
CREATE TABLE IF NOT EXISTS `contact_us` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL,
  `seen` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `subject`, `message`, `datetime`, `seen`) VALUES
(6, 'Name', 'mail@gmail.com', 'Test Subject', 'Test Subject', '2020-09-28 02:00:51', 1),
(5, 'Name', 'mail@gmail.com', 'Test Subject', 'Test Subject', '2020-09-28 01:59:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `prod_id` bigint(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1-pending, 2-out for deliver, 3-delivered, 4-canceled',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `prod_id` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `prod_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 4, 1, '2020-09-28 15:40:54', '2020-09-28 15:40:54'),
(2, 4, 5, 2, '2020-09-28 15:42:47', '2020-09-28 15:42:47'),
(3, 4, 6, 3, '2020-09-28 15:42:47', '2020-09-28 15:42:47'),
(4, 4, 7, 1, '2020-09-28 15:42:47', '2020-09-28 15:42:47'),
(5, 4, 4, 1, '2020-09-28 16:08:01', '2020-09-28 16:08:01'),
(6, 4, 9, 3, '2020-09-28 16:11:37', '2020-09-28 18:35:41'),
(7, 4, 7, 4, '2020-09-28 16:11:37', '2020-09-28 16:11:37'),
(8, 4, 7, 4, '2020-09-28 16:16:16', '2020-09-28 16:16:16'),
(9, 4, 10, 4, '2020-09-28 16:19:51', '2020-09-28 16:19:51');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `prod_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `cat_id` int(255) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` text,
  `image` varchar(256) DEFAULT NULL,
  `isactive` int(2) NOT NULL,
  `isfeatured` int(2) NOT NULL,
  `quantity` int(255) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `cat_id`, `title`, `description`, `image`, `isactive`, `isfeatured`, `quantity`, `price`) VALUES
(4, 3, 'Men T-Shirt', 'Men T-Shirt', '9c3094be-5efc-4886-8f15-e251f1c3d9ff_cloth.jpeg', 1, 2, 5, 500),
(5, 3, 'Printed Men Round Neck Black T-Shirt', 'Printed Men Round Neck Black T-Shirt', 'ec651150-9b87-419e-8725-cae7d366f794_xl-blckbllnre-01-aanchalpore-original-imafv4877wyvjryx.jpeg', 1, 1, 2, 299),
(6, 3, 'Abstract Men Hooded Neck Dark Blue T-Shirt', 'Abstract Men Hooded Neck Dark Blue T-Shirt', 'cfd97a70-0245-453b-a5e7-e4dc13a0c0f8_s-tnvhdfulabstract1-tripr-original-imafbdarnwhfh7uu.jpeg', 1, 2, 5, 300),
(7, 1, 'Allen Solly Casual Short Sleeve Printed Women Blue Top', 'Allen Solly \r\nCasual Short Sleeve Printed Women Blue Top', 'f3e0e125-678a-4ff7-ac28-a0ca8423d0cf_3xl-ahtscrgh917871-allen-solly-original-imafdg5apyrr2uq7.jpeg', 1, 1, 5, 900),
(8, 1, 'Allen Solly Casual Bell Sleeve Solid Women Green Top', 'Allen Solly Casual Bell Sleeve Solid Women Green Top', 'c2634f66-c841-4f34-b2c0-cd8626fad956_m-ahtsfrgbx08724-allen-solly-original-imafpnrq6zun9mjy.jpeg', 1, 2, 0, 699),
(9, 2, 'Toor Dal  (500 g)', 'Brand\r\nUn Branded\r\n\r\nType\r\nToor Dal\r\n\r\nQuantity\r\n500 g\r\n\r\nForm\r\nNA\r\n\r\nCommon Name\r\nDal\r\n\r\nPolished\r\nNo\r\n\r\nOrganic\r\nNo\r\n\r\nContainer Type\r\nPouch\r\n\r\nMaximum Shelf Life\r\n6 Months\r\n\r\nModel Name\r\nToor Dal/Arhar Dal (Desi)\r\n\r\nDimensions\r\n\r\nWidth\r\n15 cm\r\n\r\nHeight\r\n23 cm', '314e27ae-9786-4b68-9984-2abecd89d6d9_500-toor-dal-arhar-dal-desi-arhar-dal-un-branded-original-imaeymjgrjw8xgvw.jpeg', 1, 1, 20, 79),
(10, 2, 'My Kitchen Polished Toor Dal (Split)  (1 kg)', 'General\r\nBrand\r\nMy Kitchen\r\nType\r\nToor Dal\r\nQuantity\r\n1 kg\r\nForm\r\nSplit\r\nPolished\r\nYes\r\nOrganic\r\nNo\r\nMaximum Shelf Life\r\n6 Months\r\nModel Name\r\nToor Dal', '7d2238d0-1ec6-4170-841d-2c9a43b3d591_1000-toor-dal-toor-dal-my-kitchen-original-imafu3p6wt6fkuqh.jpeg', 1, 2, 2, 105);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) DEFAULT NULL,
  `image` varchar(256) NOT NULL,
  `redirect` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `title`, `image`, `redirect`) VALUES
(4, 'Beauty Products', 'e245ab0b-729f-46de-b8f1-bbcfbf449338_ff1be7c7c4eae8d7.jpg', 'index.jsp'),
(2, 'Cloths', 'bf19ba0b-a4b6-469b-b517-34ca46e1ec36_25197669b1423119.jpg', 'index.jsp'),
(3, 'Mobile', '751fe07f-e284-4d5b-94e9-3ec1ff6e38e9_871a563f62da5c9c.jpg', 'index.jsp');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `phone` varchar(256) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `phone`, `address`) VALUES
(4, 'User', 'user@mail.com', 'User123', '9123456789', 'Bangalore');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
