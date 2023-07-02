-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 01, 2023 at 08:24 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sayandeepkarak`
--
CREATE DATABASE IF NOT EXISTS `sayandeepkarak` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sayandeepkarak`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cid`, `uid`, `pid`) VALUES
(1, 1, 1),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `price` float NOT NULL,
  `stock` int(11) NOT NULL,
  `img` text NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `name`, `price`, `stock`, `img`) VALUES
(1, 'Fortune Oil, 1 L Pouch Rice Bran Health', 280, 2, 'https://m.media-amazon.com/images/I/51SW5iGfKpL._SX425_.jpg'),
(2, 'Unique Aashirvaad Shudh Chakki Atta, 5kg Unique', 240, 3, 'https://m.media-amazon.com/images/I/81+FF+RsymL._SX679_.jpg'),
(3, 'MAGGI 2-minute Instant Noodles, 840g (12 pouches x 70g each)\n', 158, 3, 'https://m.media-amazon.com/images/I/81Xzx5PHTFL._SX679_PIbundle-12,TopRight,0,0_AA679SH20_.jpg'),
(4, 'Guud - Family Fit Healthy Sugar |100% Natural | Sulphur free | 1KG', 284, 2, 'https://m.media-amazon.com/images/I/61z+zhhJ6RL._SX679_.jpg\r\n'),
(5, 'Tata Salt | Vacuum Evaporated Iodised Salt | 10 kg', 220, 4, 'https://m.media-amazon.com/images/I/61pPVRyfmgL._SX679_.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `utype` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mob` bigint(11) NOT NULL,
  `location` text NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `utype`, `fname`, `email`, `password`, `mob`, `location`) VALUES
(1, 'user', 'Aritra Kar', 'hello@gmail.com', 'helloworld', 8016437314, 'Bandel,howrah');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
