-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2019 at 12:57 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `invoice_order`
--

CREATE TABLE `invoice_order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_receiver_name` varchar(250) NOT NULL,
  `order_receiver_address` text NOT NULL,
  `order_total_before_tax` decimal(10,2) NOT NULL,
  `order_total_tax` decimal(10,2) NOT NULL,
  `order_tax_per` varchar(250) NOT NULL,
  `order_total_after_tax` double(10,2) NOT NULL,
  `order_amount_paid` decimal(10,2) NOT NULL,
  `order_total_amount_due` decimal(10,2) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice_order`
--

INSERT INTO `invoice_order` (`order_id`, `user_id`, `order_date`, `order_receiver_name`, `order_receiver_address`, `order_total_before_tax`, `order_total_tax`, `order_tax_per`, `order_total_after_tax`, `order_amount_paid`, `order_total_amount_due`, `note`) VALUES
(1, 2, '2019-08-24 17:30:00', 'rg', 'ygn', '22.00', '22.00', '2222', 2221.00, '2221.00', '1231231.00', 'sfaf'),
(1, 2, '2019-08-24 17:30:00', 'rg', 'ygn', '22.00', '22.00', '2222', 2221.00, '2221.00', '1231231.00', 'sfaf'),
(2, 1, '2019-08-26 04:04:33', 'afaf', 'afwfafdaf', '32.00', '232.00', '3', 3232.00, '3323.00', '232423.00', 'dfgdhfghfh'),
(2, 1, '2019-08-26 04:04:38', 'afaf', 'afwfafdaf', '32.00', '232.00', '3', 3232.00, '3323.00', '232423.00', 'dfgdhfghfh'),
(0, 1, '2019-08-26 08:08:58', 'nnn', 'mdy', '5882.00', '0.00', '', 5882.00, '0.00', '5882.00', '555555'),
(0, 1, '2019-08-26 09:02:35', 'gg', 'safdwfeaf', '310.00', '0.00', '', 310.00, '0.00', '310.00', 'hhhh'),
(0, 1, '2019-08-26 10:12:05', 'tt', 'asdf', '220.00', '0.00', '', 220.00, '0.00', '220.00', 'gg');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_order_item`
--

CREATE TABLE `invoice_order_item` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_code` varchar(250) NOT NULL,
  `item_name` varchar(250) NOT NULL,
  `order_item_quantity` decimal(10,2) NOT NULL,
  `order_item_price` decimal(10,2) NOT NULL,
  `order_item_final_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice_order_item`
--

INSERT INTO `invoice_order_item` (`order_item_id`, `order_id`, `item_code`, `item_name`, `order_item_quantity`, `order_item_price`, `order_item_final_amount`) VALUES
(1, 1, 'r22', 'rr', '2.00', '333.00', '666.00'),
(1, 1, 'r22', 'rr', '2.00', '333.00', '666.00'),
(2, 3, 'eewr', 'afsf', '3.00', '33.00', '3333.00'),
(3, 4, '546ggedg', 'dgd', '435.00', '345.00', '35435.00'),
(2, 3, 'eewr', 'afsf', '3.00', '33.00', '3333.00'),
(3, 4, '546ggedg', 'dgd', '435.00', '345.00', '35435.00'),
(0, 0, '', 'gg', '2.00', '2324.00', '4648.00'),
(0, 0, '', 'nn', '1.00', '1234.00', '1234.00'),
(0, 0, '11', 'safaf', '4.00', '22.00', '88.00'),
(0, 0, '12', 'fgrdgsh', '1.00', '222.00', '222.00'),
(0, 0, '12', 'losarm ', '2.00', '44.00', '88.00'),
(0, 0, '13', 'errtet', '3.00', '44.00', '132.00');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_user`
--

CREATE TABLE `invoice_user` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice_user`
--

INSERT INTO `invoice_user` (`id`, `email`, `password`, `first_name`, `last_name`, `mobile`, `address`) VALUES
(1, 'admin@gmail.com', '12345', 'admin', 'lynn', 9222333, 'Yangon'),
(1, 'admin@gmail.com', '12345', 'admin', 'lynn', 9222333, 'Yangon'),
(2, 'editor@gmail.com', 'asdf123', 'editor', 'System', 92222333, 'ygn');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
