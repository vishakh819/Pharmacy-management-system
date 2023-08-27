-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2023 at 05:08 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simplepharmacy`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `category` ()   SELECT category,COUNT(*) AS COUNT FROM stock GROUP BY(category) ORDER BY(COUNT(*))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `no_of_medicines` ()   SELECT COUNT(*) AS COUNT FROM stock$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `invoice_number` varchar(13) NOT NULL,
  `quantity` varchar(20) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `invoice_number`, `quantity`, `Date`) VALUES
(54, 'CA-0300990', '10(Stp)', '2023-01-31');

-- --------------------------------------------------------

--
-- Table structure for table `on_hold`
--

CREATE TABLE `on_hold` (
  `id` int(11) NOT NULL,
  `invoice_number` varchar(13) CHARACTER SET utf8mb4 NOT NULL,
  `medicine_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `expire_date` date NOT NULL,
  `qty` bigint(11) NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `cost` bigint(11) NOT NULL,
  `amount` bigint(11) NOT NULL,
  `profit_amount` bigint(11) NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `on_hold`
--

INSERT INTO `on_hold` (`id`, `invoice_number`, `medicine_name`, `category`, `expire_date`, `qty`, `type`, `cost`, `amount`, `profit_amount`, `date`) VALUES
(141, 'CA-0300990', 'Allopurinol', 'Anti-inflammatory', '2026-01-31', 10, 'Stp', 15, 150, 50, '01/31/2023'),
(142, 'CA-9992909', 'Vitamin B12', 'Vitamins', '2026-11-10', 5, 'Bot', 19, 95, 45, '01/31/2023'),
(143, 'CA-9992909', 'Phara', 'Antifungals', '2023-02-12', 1, 'Bot', 15, 15, 5, '01/31/2023'),
(144, 'CA-9000299', 'Fluconazole', 'Antifungals', '2026-08-13', 10, 'Tab', 29, 290, 70, '01/31/2023'),
(145, 'CA-3032090', 'Mucinex', 'Expectorant', '2026-08-25', 14, 'Bot', 37, 518, 112, '01/31/2023'),
(147, 'CA-0020992', 'Biogesic', 'Painkiller', '2023-03-06', 8, 'Bot', 9, 72, 32, '01/31/2023'),
(148, 'CA-3093009', 'Altretamine', 'Antineoplastics', '2026-08-12', 12, 'Sachet', 87, 1044, 168, '02/01/2023'),
(149, 'CA-2000920', 'Doxycycline', 'Antibiotics', '2025-08-09', 15, 'Tab', 4, 60, 30, '02/01/2023'),
(150, 'CA-2000920', 'Altretamine', 'Antineoplastics', '2026-08-12', 1, 'Sachet', 87, 87, 14, '02/01/2023'),
(151, 'CA-2230990', 'Allopurinol', 'Anti-inflammatory', '2026-01-31', 100, 'Stp', 15, 1500, 500, '02/02/2023'),
(152, 'CA-3222320', 'Allopurinol', 'Anti-inflammatory', '2026-01-31', 10, 'Stp', 15, 150, 50, '02/02/2023'),
(153, 'CA-9329902', 'Allopurinol', 'Anti-inflammatory', '2026-02-02', 200, 'Bot', 15, 3000, 1000, '02/02/2023');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `invoice_number` varchar(13) CHARACTER SET utf8mb4 NOT NULL,
  `medicines` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `total_amount` bigint(11) NOT NULL,
  `total_profit` bigint(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `invoice_number`, `medicines`, `quantity`, `total_amount`, `total_profit`, `Date`) VALUES
(55, 'CA-9992909', 'Vitamin B12,Phara', '5(Bot),1(Bot)', 110, 50, '2023-01-31'),
(56, 'CA-9000299', 'Fluconazole', '10(Tab)', 290, 70, '2023-01-31'),
(57, 'CA-3032090', 'Mucinex', '14(Bot)', 518, 112, '2023-01-31'),
(58, 'CA-0020992', 'Biogesic', '8(Bot)', 72, 32, '2023-01-31'),
(59, 'CA-3093009', 'Altretamine', '12(Sachet)', 1044, 168, '2023-02-01'),
(60, 'CA-2000920', 'Doxycycline,Altretamine', '15(Tab),1(Sachet)', 147, 44, '2023-02-01'),
(61, 'CA-2230990', 'Allopurinol', '100(Stp)', 1500, 500, '2023-02-02'),
(62, 'CA-3222320', 'Allopurinol', '10(Stp)', 150, 50, '2023-02-02'),
(63, 'CA-9329902', 'Allopurinol', '200(Bot)', 3000, 1000, '2023-02-02');

--
-- Triggers `sales`
--
DELIMITER $$
CREATE TRIGGER `insertlog` BEFORE DELETE ON `sales` FOR EACH ROW INSERT INTO logs
VALUES(Old.id,Old.invoice_number,Old.quantity,old.Date)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(100) NOT NULL,
  `bar_code` varchar(255) NOT NULL,
  `medicine_name` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `used_quantity` int(100) NOT NULL,
  `remain_quantity` int(100) NOT NULL,
  `act_remain_quantity` int(10) NOT NULL,
  `register_date` date NOT NULL,
  `expire_date` date NOT NULL,
  `company` varchar(100) NOT NULL,
  `sell_type` varchar(100) NOT NULL,
  `actual_price` int(100) NOT NULL,
  `selling_price` int(100) NOT NULL,
  `profit_price` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `bar_code`, `medicine_name`, `category`, `quantity`, `used_quantity`, `remain_quantity`, `act_remain_quantity`, `register_date`, `expire_date`, `company`, `sell_type`, `actual_price`, `selling_price`, `profit_price`, `status`) VALUES
(21, '1112', 'Paracetemol', 'Painkiller', 20, 18, 2, 2, '2020-03-04', '2022-10-01', 'none', 'Bot', 1, 2, '1(100%)', 'Not Available'),
(23, '1121', 'Biogesic', 'Painkiller', 50, 12, 38, 38, '2020-03-05', '2023-03-06', 'none', 'Bot', 5, 9, '4(80%)', 'Available'),
(24, '101', 'Demo Med', 'Demo Category', 100, 12, 88, 88, '2022-08-06', '2022-08-17', 'none', 'Tab', 10, 18, '8(80%)', 'Available'),
(25, '1001', 'Doxycycline', 'Antibiotics', 85, 80, 5, 5, '2022-08-11', '2025-08-09', 'none', 'Bot', 2, 4, '2(100%)', 'Available'),
(26, '1003', 'Methisazone', 'Antiviral', 300, 4, 296, 296, '2022-08-13', '2026-08-03', 'none', 'Tab', 8, 12, '4(50%)', 'Available'),
(27, '1020', 'Deplin', 'Vitamins', 129, 22, 107, 107, '2022-08-10', '2026-09-14', 'none', 'Sachet', 113, 141, '28(25%)', 'Available'),
(28, '1169', 'Vitamin B12', 'Vitamins', 199, 43, 156, 156, '2022-08-12', '2026-11-10', 'none', 'Bot', 10, 19, '9(90%)', 'Available'),
(29, '2220', 'Altretamine', 'Antineoplastics', 177, 22, 155, 156, '2022-08-13', '2026-08-12', 'none', 'Sachet', 73, 87, '14(19%)', 'Available'),
(30, '2022', 'Econazole', 'Antifungals', 247, 10, 237, 237, '2022-08-13', '2023-08-17', 'none', 'Bot', 17, 24, '7(41%)', 'Available'),
(31, '1779', 'Fluconazole', 'Antifungals', 155, 41, 114, 114, '2022-08-13', '2026-08-13', 'none', 'Tab', 22, 29, '7(32%)', 'Available'),
(32, '1906', 'Mucinex', 'Expectorant', 109, 19, 90, 90, '2022-08-13', '2026-08-25', 'none', 'Bot', 29, 37, '8(28%)', 'Available'),
(33, '2779', 'Estazolam', 'Sedatives', 366, 22, 344, 344, '2022-08-13', '2026-08-26', 'none', 'Bot', 41, 54, '13(32%)', 'Available'),
(34, '2269', 'Alprazolam', 'Tranquilizer', 287, 5, 282, 287, '2022-08-13', '2026-10-06', 'none', 'Tab', 10, 19, '9(90%)', 'Available'),
(37, '1002', 'Phara', 'Antifungals', 15, 10, 5, 6, '2021-01-12', '2023-02-12', 'none', 'Bot', 10, 15, '5(50%)', 'Available'),
(38, '100', 'Xylometazoline', 'Antifungals', 200, 82, 118, 120, '2023-01-14', '2028-01-14', 'none', 'Bot', 20, 50, '30(150%)', 'Available'),
(41, '2002', 'Allopurinol', 'Anti-inflammatory', 400, 130, 270, 270, '2023-01-01', '2026-01-31', 'none', 'Stp', 10, 15, '5(50%)', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `password`) VALUES
(2, 'admin', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `on_hold`
--
ALTER TABLE `on_hold`
  ADD PRIMARY KEY (`id`,`invoice_number`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`,`invoice_number`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`,`bar_code`,`medicine_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_name`,`password`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `on_hold`
--
ALTER TABLE `on_hold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
