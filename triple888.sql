-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 08, 2024 at 08:06 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `triple888`
--

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `batch_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `batch_number` int DEFAULT NULL,
  `expiry_date` varchar(25) NOT NULL,
  `batch_quantity` int NOT NULL,
  `batch_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batch_id`, `prod_id`, `batch_number`, `expiry_date`, `batch_quantity`, `batch_status`) VALUES
(1, 4, 2001, '2024-09-30', 300, 'expired'),
(2, 2, 2001, '2024-09-25', 175, 'sold'),
(3, 47, 2002, '2024-12-06', 75, NULL),
(4, 44, 2002, '2024-11-06', 5, NULL),
(5, 40, 2003, '2024-10-30', 60, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_contact` varchar(100) NOT NULL,
  `discount_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_contact`, `discount_id`) VALUES
(1, 'Leoj Tripole', '911', 12345),
(2, 'Yong Tripole', '100', 100),
(3, 'Yong Tripole', '100', 100),
(4, 'Gahi Bai', '111', 123),
(5, '', '', 0),
(6, '', '', 0),
(7, '', '', 0),
(11, '', '', 0),
(12, '', '', 0),
(13, '', '', 0),
(14, '', '', 0),
(15, '', '', 0),
(16, 'Andrea Caparas', '143', 1436689),
(17, 'Paulo Medel', '911', 1231231234);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `threshold` int DEFAULT NULL,
  `last_updated` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `prod_id`, `quantity`, `threshold`, `last_updated`) VALUES
(2, 5, 230, 250, ''),
(3, 36, 16, 25, NULL),
(4, 1, 35, NULL, NULL),
(5, 2, 94, NULL, NULL),
(6, 3, 18, NULL, NULL),
(7, 4, 69, NULL, NULL),
(8, 5, 100, NULL, NULL),
(9, 6, 175, NULL, NULL),
(11, 8, 30, NULL, NULL),
(12, 9, 57, NULL, NULL),
(13, 10, 15, NULL, NULL),
(14, 11, 62, NULL, NULL),
(15, 12, 84, NULL, NULL),
(16, 13, 45, NULL, NULL),
(17, 14, 55, NULL, NULL),
(18, 15, 35, NULL, NULL),
(19, 16, 65, NULL, NULL),
(20, 17, 108, NULL, NULL),
(21, 18, 93, NULL, NULL),
(22, 19, 39, NULL, NULL),
(23, 20, 147, NULL, NULL),
(24, 21, 78, NULL, NULL),
(25, 22, 100, NULL, NULL),
(26, 23, 124, NULL, NULL),
(27, 24, 157, NULL, NULL),
(28, 25, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prod_id` int NOT NULL,
  `prod_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prod_brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prod_manufacturer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prod_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prod_form` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prod_dosage` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prod_price` double NOT NULL,
  `prod_archive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `prod_name`, `prod_brand`, `prod_manufacturer`, `prod_category`, `prod_form`, `prod_dosage`, `prod_price`, `prod_archive`) VALUES
(1, 'Loperamide', 'Diatabs', 'Unilab', 'Drug', 'Tablet', '2 mg', 7.5, 0),
(2, 'Ibuprofen', 'Advil', 'Wyeth', 'Analgesics', 'Tablet', '200 mg', 10, 0),
(3, 'Amoxicillin', 'Ammoron', 'Abiolex', 'Antibiotic', 'Tablet', '250mg', 20, 0),
(4, 'Carbocisteine', 'Solmux', 'Unilab', 'Mucolytics', 'Tablet', '500mg', 12.31, 0),
(5, 'Paracetamol', 'Neozep', 'Unilab', 'Analgesics', 'Syrup', '50 mL', 55, 0),
(6, 'Losartan', 'Lifezar', 'Ritemed', 'Antihypertensive', 'Tablet', '100mg', 25.25, 0),
(7, 'Losartan', 'Angel-50', 'Ritemed', 'Antihypertensive', 'Tablet', '50mg', 5.5, 0),
(8, 'Losartan', 'Gensartan', 'Medinova', 'Antihypertensive', 'Tablet', '50mg', 6, 0),
(9, 'Paracetamol', 'Panadol', 'GSK', 'Pain Relief', 'Tablet', '500mg', 5, 0),
(10, 'Ibuprofen', 'Advil', 'Pfizer', 'Pain Relief', 'Tablet', '400mg', 8, 0),
(11, 'Amoxicillin', 'Amoxil', 'Bristol-Myers Squibb', 'Antibiotic', 'Capsule', '50mg', 10, 0),
(12, 'Cetrizine', 'Zywoo', 'UCB', 'Antihistamine', 'Tablet', '10mg', 6.5, 0),
(13, 'Metformin', 'Glucophage', 'Boehringer Ingelheim', 'Diabetes', 'Tablet', '500mg', 15, 0),
(14, 'Lisinopril', 'Prinivil', 'Merck', 'Hypertension', 'Tablet', '10mg', 7, 0),
(15, 'Simvastatin', 'Zocor', 'Merck', 'Cholesterol', 'Tablet', '20mg', 12, 1),
(16, 'Omeprazole', 'Prilosec', 'AstraZeneca', 'Acid Reducer', 'Capsule', '20mg', 9, 0),
(17, 'Aspirin', 'Aspoo', 'Bayer', 'Pain Relief', 'Tablet', '81mg', 4, 0),
(18, 'Diphenhydramine', 'Benadryl', 'Pfizer', 'Antihistamine', 'Tablet', '25mg', 5.5, 0),
(19, 'Paracetamol', 'Panadol', 'GSK', 'Pain Relief', 'Tablet', '500mg', 5, 0),
(20, 'Ibuprofen', 'Advil', 'Pfizer', 'Pain Relief', 'Tablet', '400mg', 8, 0),
(21, 'Amoxicillin', 'Amoxil', 'Bristol-Myers Squibb', 'Antibiotic', 'Capsule', '500mg', 100, 0),
(22, 'Cetrizine', 'Zyrtec', 'UCB', 'Antihistamine', 'Tablet', '10mg', 6.5, 1),
(23, 'Metformin', 'Glucophage', 'Boehringer Ingelheim', 'Diabetes', 'Tablet', '500mg', 15, 1),
(24, 'Lisinopril', 'Prinivil', 'Merck', 'Hypertension', 'Tablet', '10mg', 7, 0),
(25, 'Simvastatin', 'Zocor', 'Merck', 'Cholesterol', 'Tablet', '20mg', 12, 0),
(26, 'Omeprazole', 'Prilosec', 'AstraZeneca', 'Acid Reducer', 'Capsule', '20mg', 9, 0),
(27, 'Aspirin', 'Bayer', 'Bayer', 'Pain Relief', 'Tablet', '81mg', 400, 0),
(28, 'Diphenhydramine', 'Benadryl', 'Pfizer', 'Antihistamine', 'Tablet', '25mg', 5.5, 0),
(29, 'Loratadine', 'Claritin', 'Bristol-Myers Squibb', 'Antihistamine', 'Tablet', '10mg', 6, 0),
(30, 'Naproxen', 'Aleve', 'Bayer', 'Pain Relief', 'Tablet', '250mg', 9.5, 0),
(31, 'Fluticasone', 'Flonase', 'GSK', 'Nasal Spray', 'Spray', '50mcg', 14, 0),
(32, 'Levothyroxine', 'Synthroid', 'AbbVie', 'Thyroid', 'Tablet', '50mcg', 11, 0),
(33, 'Gabapentin', 'Neurontin', 'Pfizer', 'Neuropathic Pain', 'Capsule', '300mg', 13, 0),
(34, 'Ranitidine', 'Zantac', 'Sanofi', 'Acid Reducer', 'Tablet', '150mg', 8.5, 0),
(35, 'Hydrochlorothiazide', 'Microzide', 'Boehringer Ingelheim', 'Hypertension', 'Tablet', '25mg', 6, 0),
(36, 'Sertraline', 'Zoloft', 'Pfizer', 'Antidepressant', 'Tablet', '50mg', 10.5, 0),
(37, 'Tamsulosin', 'Flomax', 'Boeringer Ingelheim', 'BPH', 'Capsule', '0.4mg', 9, 0),
(38, 'Montelukast', 'Singulair', 'Merck', 'Asthma', 'Tablet', '100mg', 11.5, 0),
(39, 'Citalopram', 'Celexa', 'Lundbeck', 'Antidepressant', 'Tablet', '20mg', 9.5, 0),
(40, 'Duloxetine', 'Cymbalta', 'Eli Lilly', 'Antidepressant', 'Capsule', '30mg', 12, 0),
(41, 'Ointment', 'Trimycin', 'Unilab', 'Skin Care', 'Ointment', '10g', 290, 0),
(42, 'Supplement', 'MX3', 'MX3', 'Supplement', 'Tablet', '50mg', 19, 0),
(43, 'Cough Relief', 'HealthBest', 'HealthCorp', 'Cough Syrup', 'Syrup', '100mL', 53, 0),
(44, 'Cold Syrup', 'NatureAid', 'NaturePharma', 'Cold Remedy', 'Syrup', '200mL', 1900, 0),
(45, 'Energy Booster', 'FitLife', 'LifeCorp', 'Supplements', 'Tablet', '500mg', 100, 0),
(46, 'Vitamins Plus', 'VitalCare', 'WellnessCorp', 'Vitamins', 'Tablet', '100mg', 150, 0),
(47, 'Pain Reliever', 'MedXtra', 'MediHealth', 'Pain Relief', 'Tablet', '500mg', 50, 0),
(48, 'Wipes', 'Beybiko', 'CleanCare', 'Wipes', 'Wet Wipes', '10 Pack', 5, 0),
(49, 'Antiseptic Cream', 'CareFirst', 'FirstAid', 'Skin Care', 'Cream', '50g', 333, 0),
(50, 'Disinfectant Wipes', 'CleanWell', 'CleanX', 'Wipes', 'Wet Wipes', '50 Pack', 555, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_history`
--

CREATE TABLE `product_history` (
  `product_history_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `prod_price_old` int NOT NULL,
  `prod_price_new` int NOT NULL,
  `price_update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `receipt_no` int NOT NULL,
  `transaction_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int NOT NULL,
  `transaction_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `transaction_id`) VALUES
(58, 1),
(59, 2),
(60, 3),
(61, 4),
(62, 5),
(63, 6),
(64, 7),
(65, 8),
(66, 9),
(67, 10),
(68, 11),
(69, 12),
(70, 55),
(71, 56),
(72, 57);

-- --------------------------------------------------------

--
-- Table structure for table `sales_items`
--

CREATE TABLE `sales_items` (
  `sale_item_id` int NOT NULL,
  `sale_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `quantity_sold` int NOT NULL,
  `price_sold` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sales_items`
--

INSERT INTO `sales_items` (`sale_item_id`, `sale_id`, `prod_id`, `quantity_sold`, `price_sold`) VALUES
(68, 58, 5, 1, 55.00),
(69, 59, 24, 1, 7.00),
(70, 60, 5, 1, 55.00),
(71, 60, 6, 1, 25.00),
(72, 61, 6, 2, 25.00),
(73, 61, 12, 1, 6.00),
(74, 62, 6, 1, 25.25),
(75, 62, 18, 1, 5.50),
(76, 63, 1, 1, 7.50),
(77, 63, 2, 1, 10.00),
(78, 63, 3, 1, 20.00),
(79, 63, 4, 1, 12.31),
(80, 64, 2, 1, 10.00),
(81, 64, 36, 2, 10.00),
(82, 64, 3, 2, 20.00),
(83, 65, 3, 1, 20.00),
(84, 65, 36, 1, 10.00),
(85, 65, 1, 1, 7.00),
(86, 66, 5, 2, 55.00),
(87, 67, 22, 1, 6.00),
(88, 67, 23, 1, 15.00),
(89, 67, 25, 2, 12.00),
(90, 68, 36, 3, 10.50),
(91, 68, 6, 5, 25.25),
(92, 69, 22, 1, 6.50),
(93, 69, 21, 1, 100.00),
(94, 69, 20, 1, 8.00),
(95, 70, 23, 3, 15.00),
(96, 70, 22, 1, 6.50),
(97, 71, 21, 1, 100.00),
(98, 71, 20, 1, 8.00),
(99, 71, 19, 1, 5.00),
(100, 72, 4, 1, 12.31),
(101, 72, 3, 1, 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL,
  `transaction_date` date NOT NULL,
  `user_id` int DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `total_purchase` decimal(15,2) DEFAULT NULL,
  `customer_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `transaction_date`, `user_id`, `payment_method`, `total_purchase`, `customer_id`) VALUES
(1, '2024-10-05', 3, 'Cash', 65.50, 7),
(2, '2024-10-05', 3, 'Cash', 28.50, 11),
(3, '2024-10-05', 3, 'Cash', 80.25, 12),
(4, '2024-10-05', 3, 'Cash', 57.00, 13),
(5, '2024-10-05', 3, 'Cash', 30.75, 14),
(6, '2024-10-05', 3, 'Cash', 49.81, 15),
(7, '2024-10-05', 3, 'Cash', 71.00, NULL),
(8, '2024-10-05', 3, 'Cash', 38.00, NULL),
(9, '2024-10-05', 3, 'Cash', 110.00, NULL),
(10, '2024-10-05', 3, 'Cash', 40.04, 16),
(11, '2024-10-05', 3, 'Cash', 157.75, NULL),
(12, '2024-10-06', 3, 'Cash', 114.50, NULL),
(55, '2024-10-06', 3, 'Cash', 45.32, 17),
(56, '2024-10-06', 3, 'Cash', 113.00, NULL),
(57, '2024-10-07', 3, 'Cash', 32.31, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `role` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `birthday`, `phone`, `email`, `username`, `password`, `role`, `status`) VALUES
(1, 'Leoj ', 'Tripole', NULL, '09055501896', 'yong.tripole@gmail.com', 'lthrdoublee', 'tripole23', 'Admin', 1),
(2, 'Bart', 'Mangum', NULL, '1231231234', 'bart@gmail.com', 'admin', 'admin', 'Admin', 1),
(3, 'Paulo', 'Medel 2.0', NULL, '90876578215', 'true.2356@gmail.com', 'user', 'user', 'User', 1),
(4, 'Paulo', 'Medel', NULL, '666666666', '66666@gmail.com', 'aaaa', NULL, 'User', 0),
(5, 'Andrea Nicole', 'Caparas', NULL, '143', 'andreacaps17@gmail.com', 'andreacaps17', NULL, 'Admin', 0),
(6, 'Keanu', 'Reeves', '1998-02-23', '911', 'breathtaking@gmail.com', 'superadmin', 'superadmin', 'Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_history`
--

CREATE TABLE `user_history` (
  `user_history_id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_last_updated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`batch_id`),
  ADD KEY `med_id` (`prod_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `med_id` (`prod_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `product_history`
--
ALTER TABLE `product_history`
  ADD PRIMARY KEY (`product_history_id`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`receipt_no`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD PRIMARY KEY (`sale_item_id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`prod_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_history`
--
ALTER TABLE `user_history`
  ADD PRIMARY KEY (`user_history_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `batch_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_history`
--
ALTER TABLE `product_history`
  MODIFY `product_history_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receipt`
--
ALTER TABLE `receipt`
  MODIFY `receipt_no` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `sales_items`
--
ALTER TABLE `sales_items`
  MODIFY `sale_item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_history`
--
ALTER TABLE `user_history`
  MODIFY `user_history_id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batch`
--
ALTER TABLE `batch`
  ADD CONSTRAINT `batch update prod_id` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inv update med_id` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD CONSTRAINT `product_id` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sale_id` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
