-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2025 at 07:27 AM
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
-- Database: `id21195606_ecommerce_db_roqonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_usersid` int(11) NOT NULL,
  `address_name` varchar(255) NOT NULL,
  `address_city` varchar(255) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_lat` double NOT NULL,
  `address_long` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_usersid`, `address_name`, `address_city`, `address_street`, `address_lat`, `address_long`) VALUES
(8, 43, 'vvv', 'ggg', 'dff', 15.349650100016602, 44.15558561682701),
(9, 43, 'vvv', 'gggg', 'gggg', 15.35448847220227, 44.15557254105806),
(10, 43, 'xvhj', 'dfghj', 'dgbjj', 15.366959736105295, 44.16938994079828),
(11, 43, 'AddRamdan4', 'ademRamdan', '3Ramdan', 15.34990487309712, 44.16447043418884),
(13, 43, 'Orange Streat', 'Sana&#039;a', 'Omran', 15.422635991888198, 44.19066421687603);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_verfiycode` smallint(6) NOT NULL,
  `admin_approve` tinyint(4) NOT NULL DEFAULT 0,
  `admin_role` int(11) NOT NULL DEFAULT 0,
  `admin_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_password`, `admin_email`, `admin_phone`, `admin_verfiycode`, `admin_approve`, `admin_role`, `admin_create`) VALUES
(1, 'joan', '4c39457380a15b80224ac41b3dc29735dc9940a3', 'joan@gmail.com', '771139750', 11111, 1, 0, '2025-03-06 01:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_usersid` int(11) NOT NULL,
  `cart_itemsid` int(11) NOT NULL,
  `cart_orders` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_usersid`, `cart_itemsid`, `cart_orders`) VALUES
(8, 43, 1, 1),
(9, 43, 1, 1),
(10, 43, 1, 1),
(11, 43, 1, 1),
(12, 43, 1, 1),
(13, 43, 1, 1),
(14, 42, 1, 0),
(15, 42, 2, 0),
(17, 42, 3, 0),
(18, 42, 1, 0),
(19, 42, 2, 0),
(20, 43, 3, 1),
(21, 43, 3, 1),
(22, 43, 2, 1),
(23, 43, 2, 1),
(24, 43, 2, 3),
(25, 43, 2, 3),
(27, 43, 1, 4),
(28, 43, 5, 5),
(29, 43, 5, 5),
(30, 43, 5, 5),
(31, 43, 5, 5),
(32, 43, 3, 6),
(34, 43, 2, 7),
(35, 43, 2, 7),
(36, 43, 3, 7),
(37, 43, 3, 7),
(38, 43, 2, 8),
(39, 43, 4, 9),
(40, 43, 2, 10),
(41, 43, 2, 11),
(42, 43, 1, 12),
(44, 43, 5, 12),
(45, 43, 1, 12),
(46, 43, 1, 12),
(47, 43, 5, 12),
(48, 43, 6, 12),
(49, 43, 7, 13),
(50, 43, 5, 14),
(51, 43, 7, 15),
(52, 43, 1, 16),
(53, 43, 3, 17),
(54, 43, 3, 17),
(55, 43, 3, 17),
(56, 43, 3, 17),
(57, 43, 3, 17),
(58, 43, 3, 17),
(59, 43, 3, 17),
(60, 43, 5, 17),
(61, 43, 6, 18),
(62, 43, 5, 19),
(63, 43, 5, 20),
(64, 43, 5, 20),
(65, 43, 2, 20),
(66, 43, 4, 21),
(67, 43, 7, 22),
(68, 43, 1, 22),
(69, 43, 1, 23),
(70, 43, 3, 24),
(71, 43, 5, 25),
(72, 43, 2, 26),
(73, 43, 2, 27),
(74, 43, 1, 28),
(75, 43, 1, 28),
(76, 43, 2, 28),
(77, 43, 2, 28),
(78, 43, 5, 29),
(79, 43, 6, 30),
(80, 43, 6, 30),
(81, 43, 6, 30);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartview`
-- (See below for the actual view)
--
CREATE TABLE `cartview` (
`itemsprice` double
,`countitems` bigint(21)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(100) NOT NULL,
  `categories_name_ar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `categories_image` varchar(255) NOT NULL,
  `categories_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_name_ar`, `categories_image`, `categories_datetime`) VALUES
(1, 'laptop', 'لابتوب', 'laptop.svg', '2024-06-18 23:42:49'),
(2, 'camera', 'كاميرا', 'camera.svg', '2024-06-18 23:42:49'),
(3, 'dress', 'ملابس', 'dress.svg', '2024-06-18 23:43:45'),
(4, 'mobile', 'موبايل', 'mobile.svg', '2024-06-18 23:44:21'),
(5, 'shoes', 'احذية', 'shoes.svg', '2024-06-18 23:45:09'),
(22, 'Sport Supplies', 'مستلزمات رياضيه', '7324Sport.svg', '2025-03-09 01:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(50) NOT NULL,
  `coupon_count` int(11) NOT NULL,
  `coupon_discount` smallint(6) NOT NULL DEFAULT 0,
  `coupon_expiredate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_name`, `coupon_count`, `coupon_discount`, `coupon_expiredate`) VALUES
(1, 'coupon_roq', 7, 10, '2024-07-19 22:02:28'),
(2, 'coupon_jor', 5, 5, '2024-07-15 22:02:28');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_name` varchar(100) NOT NULL,
  `delivery_password` varchar(255) NOT NULL,
  `delivery_email` varchar(100) NOT NULL,
  `delivery_phone` varchar(10) NOT NULL DEFAULT '0',
  `delivery_verfiycode` int(11) NOT NULL,
  `delivery_approve` tinyint(4) NOT NULL DEFAULT 0,
  `delivery_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `delivery_name`, `delivery_password`, `delivery_email`, `delivery_phone`, `delivery_verfiycode`, `delivery_approve`, `delivery_create`) VALUES
(1, 'jory', '4c39457380a15b80224ac41b3dc29735dc9940a3', 'jory@gmail.com', '0', 88888, 1, '2025-02-21 03:23:34');

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_usersid` int(11) NOT NULL,
  `favorite_itemsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`favorite_id`, `favorite_usersid`, `favorite_itemsid`) VALUES
(4, 39, 2),
(7, 40, 1),
(8, 40, 2),
(12, 35, 1),
(13, 35, 3),
(17, 42, 4),
(18, 42, 2),
(19, 43, 1),
(20, 43, 4),
(21, 43, 3),
(22, 43, 2),
(23, 43, 7),
(24, 43, 4),
(25, 43, 1),
(26, 43, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `items_id` int(11) NOT NULL,
  `items_name` varchar(100) NOT NULL,
  `items_name_ar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `items_desc` varchar(255) NOT NULL,
  `items_desc_ar` varchar(255) NOT NULL,
  `items_image` varchar(255) NOT NULL,
  `items_count` int(11) NOT NULL,
  `items_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 =>hidden , 1 => active',
  `items_price` float NOT NULL,
  `items_discount` smallint(6) NOT NULL,
  `items_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `items_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `items_name`, `items_name_ar`, `items_desc`, `items_desc_ar`, `items_image`, `items_count`, `items_active`, `items_price`, `items_discount`, `items_date`, `items_cat`) VALUES
(1, 'laptop surface go2', 'لابتوب سيؤفس غو', 'laptop surface go2 amazing core i5 gen 11 Ram 12', 'لابتوب مميز انيق رفيع معالج كور ايفايف ؤام 12', 'laptop.png', 5, 1, 200, 10, '2024-06-19 20:50:44', 1),
(2, 'mobile s22 ultr', ' اس 22 الترا سامسونج', 'Samsung s22 ultr a Ram 12 Hard 512 GB Camera 100 Me', 'موبايل اس 22 الترا سامسونج رام 12 هارد 512 كاميرا 100 مغ', 'smasung.jpg', 22, 1, 300, 0, '2024-06-19 21:00:10', 4),
(3, 'camera 250d canon', 'كاميرا 250 دي كانون', 'camera 22 megapixel 4k 30 frame ', 'كاميرا بدقة 22 ميغا بيكسل', 'camera.PNG', 3, 1, 20, 10, '2024-06-19 21:00:10', 2),
(4, 'MacBook M1 Air', 'ماك بوك', 'macbook m1 detailes M1 proccessor Ram 8 Giga Hards 5', 'ماك بوك مع معالج M1  والرام  8 [d[h  والهارد 5', 'laptop3.png', 4, 1, 250, 10, '2024-06-24 01:14:18', 1),
(5, 'dress', 'ملابس', 'The best dress of summer', 'من اجود انواع الملابس الصيفية', 'dressroq.jpg', 3, 1, 500, 20, '2025-02-16 00:51:11', 3),
(6, 'Sport Shose', 'احذية رياضية', 'The Best Sport Shose', ' من اقوى الاحذية الرياضية', 'shoseroq1.jpg', 10, 1, 200, 0, '2025-02-16 01:50:45', 5),
(7, 'Flat Shose', 'احذية ارضية', 'Stronger Shoes in World', 'اقوى الاحذية العالمية', 'shoseroq2.png', 5, 1, 4000, 5, '2025-02-16 01:50:45', 5),
(12, 'updated item٢٢٢٢', '٢٢٢٢٢منتج محدث', 'uuuuuuuu٢٢', '٢٢محدثثثثثثثث', '5255scaled_0f6e3269-f0e3-4bc9-a814-12a22b9617e23716114274874337133.jpg', 5, 1, 2000, 7, '2025-03-12 21:27:54', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `items1view`
-- (See below for the actual view)
--
CREATE TABLE `items1view` (
`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`categories_id` int(11)
,`categories_name` varchar(100)
,`categories_name_ar` varchar(100)
,`categories_image` varchar(255)
,`categories_datetime` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemstopselling`
-- (See below for the actual view)
--
CREATE TABLE `itemstopselling` (
`countitems` bigint(21)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`itemspricedisount` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myfavorite`
-- (See below for the actual view)
--
CREATE TABLE `myfavorite` (
`favorite_id` int(11)
,`favorite_usersid` int(11)
,`favorite_itemsid` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`users_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `notification_title` varchar(255) NOT NULL,
  `notification_body` varchar(255) NOT NULL,
  `notification_userid` int(11) NOT NULL,
  `notification_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `notification_title`, `notification_body`, `notification_userid`, `notification_datetime`) VALUES
(1, 'RoqNoti_1', 'Plz My God Show the notiRoq_1', 43, '2024-08-01 12:00:05'),
(2, 'RoqNoti_2', 'Plz My God Show the notiRoq_1', 43, '2024-08-11 12:00:05'),
(3, 'ShimaNoti1', 'Plz My God Show the notiShim_1', 39, '2024-08-01 12:00:05'),
(4, 'ShimaNoti1', 'Plz My God Show the notiShim_1', 39, '2024-08-23 12:00:05'),
(5, 'success', 'Your order is on the way', 43, '2025-02-23 01:59:20'),
(6, 'success', 'Your order is on the way', 43, '2025-02-23 02:11:18'),
(7, 'success', 'Your order is on the way', 43, '2025-02-23 02:12:27'),
(8, 'success', 'Your order is on the way', 43, '2025-02-23 02:12:28'),
(9, 'success', 'Your order is on the way', 43, '2025-02-23 02:13:03'),
(10, 'success', 'Your order is on the way', 43, '2025-02-23 02:13:03'),
(11, 'success', 'Your order is on the way', 43, '2025-02-23 02:13:04'),
(12, 'success', 'Your order is on the way', 43, '2025-02-23 02:14:59'),
(13, 'success', 'Your order is on the way', 43, '2025-02-23 02:19:09'),
(14, 'success', 'Your order is on the way', 43, '2025-02-23 02:33:55'),
(15, 'success', 'Your order is on the way', 43, '2025-02-23 03:03:46'),
(16, 'success', 'Your order is on the way', 43, '2025-03-05 23:34:36'),
(17, 'success', 'Your order is on the way', 43, '2025-03-05 23:46:03'),
(18, 'success', 'Your Order Has been deliverd', 43, '2025-03-05 23:56:54'),
(19, 'success', 'Your Order Has been deliverd', 43, '2025-03-05 23:58:22'),
(20, 'success', 'Your Order Has been deliverd', 43, '2025-03-06 00:10:32'),
(21, 'success', 'Your Order Has been deliverd', 43, '2025-03-06 00:11:32'),
(22, 'success', 'Your order is on the way', 43, '2025-03-06 00:23:22'),
(23, 'success', 'Your Order Has been deliverd', 43, '2025-03-06 00:23:55'),
(24, 'success', 'Your Order Has been deliverd', 43, '2025-03-06 00:34:05'),
(25, 'success', 'Your Order Has been deliverd', 43, '2025-03-06 00:35:54'),
(26, 'success', 'Your Order Has been deliverd', 43, '2025-03-06 00:39:37'),
(27, 'success', 'Your Order Has been deliverd', 43, '2025-03-06 00:42:09'),
(28, 'success', 'Your Order Has been deliverd', 43, '2025-03-06 00:42:42'),
(29, 'success', 'Your order is on the way', 43, '2025-03-06 00:43:42'),
(30, 'success', 'Your Order Has been deliverd', 43, '2025-03-06 00:45:26'),
(31, 'success', 'Your order is on the way', 43, '2025-03-06 00:49:17'),
(32, 'success', 'The Order Has been Approved', 43, '2025-03-13 03:17:53'),
(33, 'success', 'The Order Has been Approved', 43, '2025-03-13 03:24:28'),
(34, 'success', 'The Order Has been Approved', 43, '2025-03-13 03:26:27'),
(35, 'success', 'The Order Has been Approved', 43, '2025-03-13 03:28:15'),
(36, 'success', 'Your order is on the way', 43, '2025-04-06 23:19:08'),
(37, 'success', 'Your order is on the way', 43, '2025-04-06 23:24:08'),
(38, 'success', 'Your order is on the way', 43, '2025-04-06 23:41:28'),
(39, 'success', 'Your order is on the way', 43, '2025-04-07 00:04:33'),
(40, 'success', 'Your order is on the way', 43, '2025-04-07 00:14:23'),
(41, 'success', 'Your Order Has been deliverd', 43, '2025-04-11 04:06:43'),
(42, 'success', 'Your Order Has been deliverd', 43, '2025-04-11 04:09:41'),
(43, 'success', 'Your Order Has been deliverd', 43, '2025-04-11 04:15:30'),
(44, 'success', 'Your Order Has been deliverd', 43, '2025-04-11 04:18:34'),
(45, 'success', 'Your Order Has been deliverd', 43, '2025-04-11 04:54:18'),
(46, 'success', 'Your Order Has been deliverd', 43, '2025-04-11 04:58:20'),
(47, 'success', 'The Order Has been Approved', 43, '2025-04-11 07:23:18'),
(48, 'success', 'The Order Has been Approved', 43, '2025-04-11 07:24:49'),
(49, 'success', 'Your order is on the way', 43, '2025-04-11 07:26:52'),
(50, 'success', 'Your Order Has been deliverd', 43, '2025-04-11 07:28:32'),
(51, 'success', 'Your Order Has been deliverd', 43, '2025-04-11 07:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `orders_usersid` int(11) NOT NULL,
  `orders_address` int(11) NOT NULL,
  `orders_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 =>delivery; 1 =>recive',
  `orders_pricedelivery` int(11) NOT NULL DEFAULT 0,
  `orders_price` int(11) NOT NULL,
  `orders_totalprice` double NOT NULL DEFAULT 0,
  `orders_coupon` int(11) NOT NULL DEFAULT 0,
  `orders_rating` tinyint(4) NOT NULL DEFAULT 0,
  `orders_noterating` varchar(255) NOT NULL DEFAULT 'none',
  `orders_paymentmethod` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 =>cash ; 1 => payment card',
  `orders_status` tinyint(4) NOT NULL DEFAULT 0,
  `orders_delivery` int(4) NOT NULL DEFAULT 0,
  `orders_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `orders_usersid`, `orders_address`, `orders_type`, `orders_pricedelivery`, `orders_price`, `orders_totalprice`, `orders_coupon`, `orders_rating`, `orders_noterating`, `orders_paymentmethod`, `orders_status`, `orders_delivery`, `orders_datetime`) VALUES
(1, 43, 1, 0, 10, 20, 0, 0, 0, 'none', 0, 3, 1, '2024-07-10 00:47:05'),
(2, 43, 1, 0, 10, 20, 0, 0, 5, 'Berfect mmm', 0, 4, 0, '2024-07-10 00:59:14'),
(3, 43, 1, 0, 10, 20, 0, 0, 0, 'none', 0, 3, 1, '2024-07-10 01:04:27'),
(4, 43, 0, 1, 10, 180, 0, 0, 0, 'none', 1, 4, 0, '2024-07-10 01:19:06'),
(5, 43, 1, 0, 10, 900, 0, 1, 0, 'none', 0, 4, 1, '2024-07-10 01:23:03'),
(6, 43, 0, 1, 10, 18, 0, 0, 0, 'none', 1, 4, 0, '2024-07-10 01:32:05'),
(7, 43, 1, 0, 10, 636, 582.4, 1, 1, 'zzzzzzz', 1, 3, 0, '2024-07-10 02:10:09'),
(8, 43, 2, 0, 10, 300, 280, 1, 0, 'none', 0, 4, 1, '2024-07-10 02:14:41'),
(9, 43, 11, 0, 10, 225, 212.5, 1, 0, 'none', 0, 4, 1, '2024-07-10 02:27:47'),
(13, 43, 3, 0, 10, 3800, 3810, 0, 0, 'none', 0, 4, 1, '2025-02-20 04:54:04'),
(14, 43, 0, 1, 0, 400, 400, 0, 0, 'none', 0, 0, 0, '2025-02-20 04:55:25'),
(15, 43, 10, 0, 10, 3800, 3810, 0, 0, 'none', 0, 0, 0, '2025-02-20 04:59:50'),
(16, 43, 0, 0, 10, 180, 190, 0, 0, 'none', 0, 4, 1, '2025-02-20 05:06:40'),
(17, 43, 11, 0, 10, 526, 536, 0, 0, 'none', 0, 3, 1, '2025-02-21 03:11:03'),
(18, 43, 9, 0, 0, 200, 200, 0, 0, 'none', 0, 4, 1, '2025-02-21 03:13:26'),
(19, 43, 11, 0, 10, 400, 410, 0, 0, 'none', 0, 4, 1, '2025-02-21 03:17:58'),
(20, 43, 9, 0, 10, 1100, 1110, 0, 0, 'none', 0, 4, 1, '2025-02-21 03:31:08'),
(21, 43, 0, 0, 10, 225, 235, 0, 0, 'none', 0, 0, 0, '2025-02-21 03:31:27'),
(22, 43, 11, 0, 10, 3980, 3990, 0, 0, 'none', 0, 2, 0, '2025-02-21 03:40:02'),
(23, 43, 0, 0, 10, 180, 190, 0, 0, 'none', 0, 0, 0, '2025-02-21 03:49:25'),
(24, 43, 10, 0, 10, 18, 28, 0, 0, 'none', 0, 2, 1, '2025-02-21 03:51:44'),
(25, 43, 0, 0, 10, 400, 410, 0, 0, 'none', 0, 3, 0, '2025-02-21 03:55:57'),
(26, 43, 8, 0, 10, 300, 310, 0, 0, 'none', 0, 4, 1, '2025-02-21 04:13:54'),
(27, 43, 8, 0, 0, 300, 300, 0, 0, 'none', 0, 4, 0, '2025-02-21 04:16:38'),
(28, 43, 8, 0, 10, 960, 970, 0, 0, 'none', 0, 0, 0, '2025-03-04 03:45:10'),
(29, 43, 12, 0, 10, 400, 410, 0, 0, 'none', 0, 0, 0, '2025-04-11 07:05:57'),
(30, 43, 13, 0, 10, 600, 610, 0, 0, 'none', 0, 4, 1, '2025-04-11 07:11:33');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersdetailsview`
-- (See below for the actual view)
--
CREATE TABLE `ordersdetailsview` (
`itemsprice` double
,`countitems` bigint(21)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersview`
-- (See below for the actual view)
--
CREATE TABLE `ordersview` (
`orders_id` int(11)
,`orders_usersid` int(11)
,`orders_address` int(11)
,`orders_type` tinyint(4)
,`orders_pricedelivery` int(11)
,`orders_price` int(11)
,`orders_totalprice` double
,`orders_coupon` int(11)
,`orders_rating` tinyint(4)
,`orders_noterating` varchar(255)
,`orders_paymentmethod` tinyint(4)
,`orders_status` tinyint(4)
,`orders_delivery` int(4)
,`orders_datetime` datetime
,`address_id` int(11)
,`address_usersid` int(11)
,`address_name` varchar(255)
,`address_city` varchar(255)
,`address_street` varchar(255)
,`address_lat` double
,`address_long` double
);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `settings_titlehome` varchar(50) NOT NULL,
  `settings_bodyhome` varchar(100) NOT NULL,
  `settings_deliverytime` int(11) NOT NULL DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `settings_titlehome`, `settings_bodyhome`, `settings_deliverytime`) VALUES
(1, 'A Summer Surprise', 'Discount 80%', 30);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_name` varchar(100) NOT NULL,
  `users_password` varchar(255) NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_phone` varchar(10) NOT NULL,
  `users_verfiycode` int(11) NOT NULL,
  `users_approve` tinyint(4) NOT NULL DEFAULT 0,
  `users_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_name`, `users_password`, `users_email`, `users_phone`, `users_verfiycode`, `users_approve`, `users_create`) VALUES
(32, 'faraa', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'ruqaih3.salman3@gmail.com', '789456123', 93939, 0, '2024-06-07 02:37:03'),
(35, 'ruqaih', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'ruqaihw3.salmanw3@gmail.com', '771139750', 94605, 1, '2024-06-07 22:48:13'),
(37, 'joan', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'ruqaih.salman.edu2040@gmail.com', '789456321', 93800, 1, '2024-06-19 00:24:43'),
(39, 'shima', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'shima@gmail.com', '798465132', 32293, 1, '2024-06-19 00:44:09'),
(40, 'Amal', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'amal@gmail.com', '741852369', 91004, 1, '2024-06-19 02:10:26'),
(41, 'sukina', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'ruqsal3.flutter3@gmail.com', '749865123', 49732, 1, '2024-06-19 02:48:26'),
(42, 'jory', '449c12180dbc4b85a4338d500feb4c5d3d81373d', 'jory@gmail.com', '159357456', 10750, 1, '2024-06-27 21:10:01'),
(43, 'reem', '4c39457380a15b80224ac41b3dc29735dc9940a3', 'reem@gmail.com', '7536987412', 93602, 1, '2024-06-27 22:07:35'),
(44, 'hhh', 'e950c1517ee0d7e20454d22c306c4c501a7cf11c', 'hh@gmail.com', '741258963', 87624, 0, '2024-08-23 01:55:32'),
(45, 'RoqSal', 'a4b5b49c12c8ee14217a490dcf038435c69b577e', 'roqsal@gmail.com', '963258741', 87373, 0, '2024-08-23 02:17:31'),
(46, 'jjjj', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'jjj@gmail.com', '987654321', 38507, 0, '2024-08-23 02:23:08'),
(47, 'gggg', 'bbf887026ef0e704ad2ea1bc73b7db6ec7f4dbbf', 'gggg@gmail.com', '365421789', 70221, 1, '2024-08-23 11:38:19'),
(48, 'bbbb', 'bf7b979b6b0a37aef5e047370ab0c6157b59b899', 'bbbb@gmail.com', '369852147', 14134, 1, '2024-08-23 11:41:15'),
(49, 'aaa', 'ac09ac205569c640c63ff4ebdea3570f812f6928', 'aaa@gmail.com', '456321987', 32471, 1, '2024-08-23 11:54:42'),
(50, 'ssss', 'ecc5beaff1629d7d8adb987a36848eb73c161124', 'ssss@gmail.com', '5456321897', 15798, 1, '2024-08-23 12:38:42'),
(51, 'zzz', '52c167ea83abd6e4b7c1e84509954062d2042ea7', 'zzz@gmail.com', '985632147', 11351, 0, '2024-08-23 18:31:20'),
(52, 'sukina', 'af65bef76430025391b2c1d0d8bb12e29b857480', 'suk@gmail.com', '5678965432', 83586, 1, '2025-02-15 23:28:00');

-- --------------------------------------------------------

--
-- Structure for view `cartview`
--
DROP TABLE IF EXISTS `cartview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cartview`  AS SELECT sum(`items`.`items_price` - `items`.`items_price` * `items`.`items_discount` / 100) AS `itemsprice`, count(`cart`.`cart_itemsid`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_itemsid`)) WHERE `cart`.`cart_orders` = 0 GROUP BY `cart`.`cart_itemsid`, `cart`.`cart_usersid`, `cart`.`cart_orders` ;

-- --------------------------------------------------------

--
-- Structure for view `items1view`
--
DROP TABLE IF EXISTS `items1view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `items1view`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `categories`.`categories_id` AS `categories_id`, `categories`.`categories_name` AS `categories_name`, `categories`.`categories_name_ar` AS `categories_name_ar`, `categories`.`categories_image` AS `categories_image`, `categories`.`categories_datetime` AS `categories_datetime` FROM (`items` join `categories` on(`items`.`items_cat` = `categories`.`categories_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `itemstopselling`
--
DROP TABLE IF EXISTS `itemstopselling`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemstopselling`  AS SELECT count(`cart`.`cart_id`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `items`.`items_price`- `items`.`items_price` * `items`.`items_discount` / 100 AS `itemspricedisount` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_itemsid`)) WHERE `cart`.`cart_orders` <> 0 GROUP BY `cart`.`cart_itemsid` ;

-- --------------------------------------------------------

--
-- Structure for view `myfavorite`
--
DROP TABLE IF EXISTS `myfavorite`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myfavorite`  AS SELECT `favorite`.`favorite_id` AS `favorite_id`, `favorite`.`favorite_usersid` AS `favorite_usersid`, `favorite`.`favorite_itemsid` AS `favorite_itemsid`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `users`.`users_id` AS `users_id` FROM ((`favorite` join `users` on(`users`.`users_id` = `favorite`.`favorite_usersid`)) join `items` on(`items`.`items_id` = `favorite`.`favorite_itemsid`)) ;

-- --------------------------------------------------------

--
-- Structure for view `ordersdetailsview`
--
DROP TABLE IF EXISTS `ordersdetailsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersdetailsview`  AS SELECT sum(`items`.`items_price` - `items`.`items_price` * `items`.`items_discount` / 100) AS `itemsprice`, count(`cart`.`cart_itemsid`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_itemsid`)) WHERE `cart`.`cart_orders` <> 0 GROUP BY `cart`.`cart_itemsid`, `cart`.`cart_usersid`, `cart`.`cart_orders` ;

-- --------------------------------------------------------

--
-- Structure for view `ordersview`
--
DROP TABLE IF EXISTS `ordersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersview`  AS SELECT `orders`.`orders_id` AS `orders_id`, `orders`.`orders_usersid` AS `orders_usersid`, `orders`.`orders_address` AS `orders_address`, `orders`.`orders_type` AS `orders_type`, `orders`.`orders_pricedelivery` AS `orders_pricedelivery`, `orders`.`orders_price` AS `orders_price`, `orders`.`orders_totalprice` AS `orders_totalprice`, `orders`.`orders_coupon` AS `orders_coupon`, `orders`.`orders_rating` AS `orders_rating`, `orders`.`orders_noterating` AS `orders_noterating`, `orders`.`orders_paymentmethod` AS `orders_paymentmethod`, `orders`.`orders_status` AS `orders_status`, `orders`.`orders_delivery` AS `orders_delivery`, `orders`.`orders_datetime` AS `orders_datetime`, `address`.`address_id` AS `address_id`, `address`.`address_usersid` AS `address_usersid`, `address`.`address_name` AS `address_name`, `address`.`address_city` AS `address_city`, `address`.`address_street` AS `address_street`, `address`.`address_lat` AS `address_lat`, `address`.`address_long` AS `address_long` FROM (`orders` left join `address` on(`address`.`address_id` = `orders`.`orders_address`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_usersid` (`address_usersid`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_usersid` (`cart_usersid`),
  ADD KEY `cart_itemsid` (`cart_itemsid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_itemsid` (`favorite_itemsid`),
  ADD KEY `favorite_usersid` (`favorite_usersid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`),
  ADD KEY `items_cat` (`items_cat`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_itemsid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`favorite_itemsid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`favorite_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`items_cat`) REFERENCES `categories` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
