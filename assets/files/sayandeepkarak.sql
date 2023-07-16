-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2023 at 08:50 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sayandeepkarak`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cid`, `uid`, `pid`) VALUES
(35, 1, 2),
(37, 1, 18),
(38, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `oid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `delivery` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `landmark` text NOT NULL,
  `address` text NOT NULL,
  `zip` int(11) NOT NULL,
  `contact` bigint(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `orderDate` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`oid`, `pid`, `uid`, `qty`, `delivery`, `discount`, `landmark`, `address`, `zip`, `contact`, `amount`, `orderDate`, `status`) VALUES
(10, 1, 1, 2, 0, 28, 'opposite Bargachia petrolpump', 'Bargachia,howrah', 711404, 8016437314, 532, '2023-07-05 20:41:22', 4);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` float NOT NULL,
  `stock` int(11) NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `name`, `price`, `stock`, `img`) VALUES
(1, 'Fortune Oil, 1 L Pouch Rice Bran Health', 280, 8, 'https://m.media-amazon.com/images/I/51SW5iGfKpL._SX425_.jpg'),
(2, 'Unique Aashirvaad Shudh Chakki Atta, 5kg Unique', 240, 2, 'https://m.media-amazon.com/images/I/81+FF+RsymL._SX679_.jpg'),
(3, 'MAGGI 2-minute Instant Noodles(12 pouches)\n', 158, 4, 'https://m.media-amazon.com/images/I/81Xzx5PHTFL._SX679_PIbundle-12,TopRight,0,0_AA679SH20_.jpg'),
(4, 'Guud - Family Fit Healthy Sugar |100% Natural | 1KG', 284, 2, 'https://m.media-amazon.com/images/I/61z+zhhJ6RL._SX679_.jpg\r\n'),
(5, 'Tata Salt | Vacuum Evaporated Iodised Salt | 10 kg', 220, 1, 'https://m.media-amazon.com/images/I/61pPVRyfmgL._SX679_.jpg'),
(6, 'Amazon Brand - Vedaka Whole Jeera (Cumin), 200g', 159, 2, 'https://m.media-amazon.com/images/I/91jx9jfekrL._SX522_.jpg'),
(7, 'Bakeshree Premium eggless Roasted Bread (400g)', 180, 5, '	https://m.media-amazon.com/images/I/41WXb9NW-zL._AC_UL320_.jpg'),
(8, 'Pintola Organic Wholegrain Brown Rice Cakes 125 g', 142, 3, '	https://m.media-amazon.com/images/I/71TwA-eDYzL._SX569_.jpg'),
(9, 'Darling Chicken Masala 200gm+Chicken 65 Masala 200gms+Mutton Masala 400gms', 340, 3, '	https://m.media-amazon.com/images/I/81Tu8Vuq0NL._SX679_PIbundle-4,TopRight,0,0_SX679SY382SH20_.jpg'),
(10, 'Keya Penne Pasta 1kg,100% Durum Wheat Pasta', 99, 1, 'https://m.media-amazon.com/images/I/61fCfnwBTQL._SX569_.jpg'),
(11, 'Fortune Rozana Basmati Rice, suitable for daily cooking, 1 kg', 99, 6, 'https://m.media-amazon.com/images/I/51P9gYrBViL.jpg'),
(12, 'Kissan Fresh Tomato Ketchup 2 kg Pouch', 225, 2, 'https://m.media-amazon.com/images/I/61UHSImAt3L._SX569_.jpg'),
(13, 'Kellogg Chocos Moons & Stars 1.2kg with Multi Grain', 432, 4, 'https://m.media-amazon.com/images/I/61hm-b9tZ9L._SX679_.jpg'),
(14, 'Dettol Intense Cool Bathing Soap Bar with Menthol (Pack of 4- 75g each)', 135, 6, 'https://m.media-amazon.com/images/I/61MvUQp2hRL._SX679_.jpg'),
(15, 'Sunfeast Dark Fantasy Choco Fills, 300g, Original Filled Cookies with Choco CrÃ¨me', 143, 5, 'https://m.media-amazon.com/images/I/81LO0QPqZAL._SX569_.jpg'),
(16, 'AMUL Butter 200 GM. (Pack of 2)', 228, 6, 'https://m.media-amazon.com/images/I/41znecrbx5L._PIbundle-2,TopRight,0,0_SX500SY343SH20_.jpg'),
(17, 'Red Bull Energy Drink, Sugar Free, 250 ml', 125, 3, '	https://m.media-amazon.com/images/I/51PeLfYNggL._SX679_.jpg'),
(18, 'Tata Tea Agni | Strong chai With 10% Extra Strong Leaves | Black Tea | 1.5 kg', 300, 6, 'https://m.media-amazon.com/images/I/61HYcQ3CrlL._SX569_.jpg'),
(19, 'Saffola Masala Oats | Tasty Evening Snack| Healthy Snack| Classic Masala| 500g', 190, 1, 'https://m.media-amazon.com/images/I/71TjYGru1TL._SX466_.jpg'),
(20, 'Saffola Honey Active, Made with Sundarban Forest Honey, 100% Pure Honey, No sugar adulteration, Natural Immunity booster, 1Kg', 258, 3, 'https://m.media-amazon.com/images/I/614tne6K3VL._SX679_.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `utype` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mob` bigint(11) NOT NULL,
  `location` text NOT NULL,
  `isVerified` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `utype`, `fname`, `email`, `password`, `mob`, `location`, `isVerified`) VALUES
(1, 'user', 'Aritra Kar', 'hello@gmail.com', 'helloworld', 8016437314, 'Hantal,howrah', 1),
(5, 'admin', 'Sayandeep Karak', 'sayandeep@gmail.com', 'helloworld', 8015427813, 'Hantal,Howrah', 1),
(6, 'user', 'Akshay Manna', 'akshay@gmail.com', 'helloworld', 8547987458, 'Hantal,Howrah', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
