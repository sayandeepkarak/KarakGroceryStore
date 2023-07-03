-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2023 at 02:09 PM
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
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`oid`, `pid`, `uid`, `qty`, `delivery`, `discount`, `landmark`, `address`, `zip`, `contact`, `amount`, `orderDate`) VALUES
(4, 3, 1, 3, 60, 23, 'opposite Bargachia petrolpump', 'Bargachia,howrah', 758965, 8016437314, 511, '2023-07-03 16:55:24');

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
(1, 'Fortune Oil, 1 L Pouch Rice Bran Health', 280, 0, 'https://m.media-amazon.com/images/I/51SW5iGfKpL._SX425_.jpg'),
(2, 'Unique Aashirvaad Shudh Chakki Atta, 5kg Unique', 240, 0, 'https://m.media-amazon.com/images/I/81+FF+RsymL._SX679_.jpg'),
(3, 'MAGGI 2-minute Instant Noodles, 840g (12 pouches x 70g each)\n', 158, 0, 'https://m.media-amazon.com/images/I/81Xzx5PHTFL._SX679_PIbundle-12,TopRight,0,0_AA679SH20_.jpg'),
(4, 'Guud - Family Fit Healthy Sugar |100% Natural | Sulphur free | 1KG', 284, 2, 'https://m.media-amazon.com/images/I/61z+zhhJ6RL._SX679_.jpg\r\n'),
(5, 'Tata Salt | Vacuum Evaporated Iodised Salt | 10 kg', 220, 2, 'https://m.media-amazon.com/images/I/61pPVRyfmgL._SX679_.jpg');

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
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `utype`, `fname`, `email`, `password`, `mob`, `location`) VALUES
(1, 'user', 'Aritra Kar', 'hello@gmail.com', 'helloworld', 8016437314, 'Bandel,howrah'),
(2, 'user', 'Akshay Manna', 'akshay@gmail.com', 'helloworld', 8545869569, 'Hantal,Howrah'),
(3, 'user', 'Pritam Mal', 'pritam@gmail.com', 'helloworld', 7458541256, 'Hantal,howrah'),
(4, 'user', 'Rahul Maji', 'rahul@gmail.com', 'rahulrahul', 6523589658, 'Bargachia,Howrah');

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
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
