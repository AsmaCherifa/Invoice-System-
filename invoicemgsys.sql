-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 29, 2024 at 09:46 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoicemgsys`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `category`) VALUES
(16, 'sac a main'),
(13, 'sac a dos'),
(15, 'sac ');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice` int NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_address_1` varchar(255) NOT NULL,
  `customer_address_2` varchar(255) DEFAULT NULL,
  `customer_town` varchar(100) NOT NULL,
  `customer_county` varchar(100) DEFAULT NULL,
  `customer_postcode` varchar(20) NOT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `customer_matricule` varchar(50) DEFAULT NULL,
  `customer_fax` varchar(20) DEFAULT NULL,
  `person_name` varchar(255) DEFAULT NULL,
  `person_phone` varchar(20) DEFAULT NULL,
  `customer_cell` varchar(20) DEFAULT NULL,
  `person_email` varchar(255) DEFAULT NULL,
  `person_autre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice` (`invoice`)
) ENGINE=MyISAM AUTO_INCREMENT=398 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `invoice`, `customer_name`, `customer_email`, `customer_address_1`, `customer_address_2`, `customer_town`, `customer_county`, `customer_postcode`, `customer_phone`, `customer_matricule`, `customer_fax`, `person_name`, `person_phone`, `customer_cell`, `person_email`, `person_autre`) VALUES
(397, 3, 'Monogros', 'asmacherifa1999@gmail.com', 'Nabeul', NULL, 'Nabeul', NULL, '8000', '53610579', '666666', NULL, NULL, NULL, NULL, NULL, NULL),
(396, 2, 'Monogros', 'asmacherifa1999@gmail.com', 'Nabeul', NULL, 'Nabeul', NULL, '8000', '53610579', '666666', NULL, NULL, NULL, NULL, NULL, NULL),
(395, 1, 'asma cherifa ', 'asmacherifaa@gmail.com', 'Nabeul', NULL, 'Nabeul', NULL, '8000', '53610579', '895856', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice` int NOT NULL,
  `num_doc` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `custom_email` text NOT NULL,
  `invoice_date` varchar(255) NOT NULL,
  `subtotal` decimal(10,3) NOT NULL,
  `shipping` decimal(10,0) NOT NULL,
  `discount` decimal(10,0) NOT NULL,
  `vat` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `notes` text NOT NULL,
  `invoice_type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `num_comptable_invoice` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `remise_total` int DEFAULT NULL,
  `avance` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice`, `num_doc`, `custom_email`, `invoice_date`, `subtotal`, `shipping`, `discount`, `vat`, `total`, `notes`, `invoice_type`, `status`, `num_comptable_invoice`, `remise_total`, `avance`) VALUES
(132, 3, '1', '', '13/03/2024', '1347.000', '0', '0', '0', '0', 'null', 'Devis', 'open', '44-2024', 0, 0),
(131, 2, '1', '', '13/03/2024', '8880.000', '0', '0', '0', '0', 'null', 'BL', 'open', '43-2024', 0, 0),
(130, 1, '1', '', '13/03/2024', '90.000', '0', '0', '0', '0', 'null', 'invoice', 'open', '42-2024', 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
CREATE TABLE IF NOT EXISTS `invoice_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice` varchar(255) NOT NULL,
  `product` text NOT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(10,3) DEFAULT NULL,
  `discount` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `subtotal` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=616 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice`, `product`, `qty`, `price`, `discount`, `subtotal`) VALUES
(615, '3', 'sac  - 1096 - test', 23, '59.000', '10', '1347.000'),
(614, '2', 'sac normale - sac-nom - descrp', 20, '259.000', '0', '5180.000'),
(613, '2', 'sac cuire - sac01 - descrp', 25, '150.000', '50', '3700.000'),
(612, '1', 'sac cuire - sac01 - descrp', 10, '9.000', '0', '90.000');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` text NOT NULL,
  `reference` varchar(50) NOT NULL,
  `category` varchar(30) NOT NULL,
  `product_desc` text NOT NULL,
  `product_price` varchar(255) DEFAULT NULL,
  `product_price2` decimal(10,3) DEFAULT NULL,
  `code_product` varchar(20) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `reference`, `category`, `product_desc`, `product_price`, `product_price2`, `code_product`) VALUES
(18, 'sac ', '1096', 'sac a main', 'test', '15', '12.000', '1999'),
(15, 'sac normale', 'sac-nom', 'sac a dos', 'descrp', '100', '150.000', '555555'),
(14, 'sac cuire', 'sac01', 'sac a dos', 'descrp', '25', '20.000', '999');

-- --------------------------------------------------------

--
-- Table structure for table `smm_index_compteur_tab`
--

DROP TABLE IF EXISTS `smm_index_compteur_tab`;
CREATE TABLE IF NOT EXISTS `smm_index_compteur_tab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table` varchar(50) NOT NULL,
  `year` varchar(10) NOT NULL,
  `compteur` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `smm_index_compteur_tab`
--

INSERT INTO `smm_index_compteur_tab` (`id`, `table`, `year`, `compteur`) VALUES
(1, 'invoice', '2024', 44);

-- --------------------------------------------------------

--
-- Table structure for table `store_clients`
--

DROP TABLE IF EXISTS `store_clients`;
CREATE TABLE IF NOT EXISTS `store_clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_address_1` varchar(255) DEFAULT NULL,
  `customer_town` varchar(255) DEFAULT NULL,
  `customer_postcode` varchar(20) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `customer_matricule` varchar(50) DEFAULT NULL,
  `customer_fax` varchar(20) DEFAULT NULL,
  `person_name` varchar(255) DEFAULT NULL,
  `person_phone` varchar(20) DEFAULT NULL,
  `person_email` varchar(255) DEFAULT NULL,
  `person_autre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `store_clients`
--

INSERT INTO `store_clients` (`id`, `customer_name`, `customer_email`, `customer_address_1`, `customer_town`, `customer_postcode`, `customer_phone`, `customer_matricule`, `customer_fax`, `person_name`, `person_phone`, `person_email`, `person_autre`) VALUES
(17, 'Géant', 'asmacherifa1999@gmail.com', 'Nabeul', 'Nabeul', '8000', '', '895856', '53610579', '', '', '', ''),
(18, 'Monogros', 'asmacherifa1999@gmail.com', 'Nabeul', 'Nabeul', '8000', '53610579', '666666', '53610579', '', '', '', ''),
(19, 'asma cherifa ', 'asmacherifaa@gmail.com', 'Nabeul', 'Nabeul', '8000', '53610579', '895856', '53610579', '', '', '', ''),
(13, 'Asma Cherifa', 'asmacherifa@gmail.com', 'addresse', 'Nabeul', '8000', '53610579', 'mat', '53610579', 'Asma', '53610579', 'asmacherifa1999@gmail.com', 'info');

-- --------------------------------------------------------

--
-- Table structure for table `store_customers`
--

DROP TABLE IF EXISTS `store_customers`;
CREATE TABLE IF NOT EXISTS `store_customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `town` varchar(255) NOT NULL,
  `county` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `name_ship` varchar(255) NOT NULL,
  `address_1_ship` varchar(255) NOT NULL,
  `address_2_ship` varchar(255) NOT NULL,
  `town_ship` varchar(255) NOT NULL,
  `county_ship` varchar(255) NOT NULL,
  `postcode_ship` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone`, `password`) VALUES
(6, 'asma', 'asma', 'asmacherifa1999@gmail.com', '53610579', 'f93a40ec0518673f1242ab46b844d919'),
(23, 'mrabet', 'mrabet', 'mrabet@gmail.com', '78564123', 'c458fa72e1500a591391f8ef05161f30');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
