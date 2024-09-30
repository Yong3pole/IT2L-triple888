-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 30, 2024 at 06:17 AM
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
  `med_id` int NOT NULL,
  `batch_number` int DEFAULT NULL,
  `expiry_date` varchar(25) NOT NULL,
  `batch_quantity` int NOT NULL,
  `batch_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batch_id`, `med_id`, `batch_number`, `expiry_date`, `batch_quantity`, `batch_status`) VALUES
(1, 4, 2001, '2024-09-30', 300, 'endorsed'),
(2, 2, 2001, '2024-09-25', 175, 'sold');

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
(2, 5, 250, 250, ''),
(3, 36, 24, 25, NULL),
(4, 1, 50, NULL, NULL),
(5, 2, 100, NULL, NULL),
(6, 3, 25, NULL, NULL),
(7, 4, 75, NULL, NULL),
(8, 5, 120, NULL, NULL),
(9, 6, 200, NULL, NULL),
(11, 8, 30, NULL, NULL),
(12, 9, 60, NULL, NULL),
(13, 10, 15, NULL, NULL),
(14, 11, 70, NULL, NULL),
(15, 12, 85, NULL, NULL),
(16, 13, 45, NULL, NULL),
(17, 14, 55, NULL, NULL),
(18, 15, 35, NULL, NULL),
(19, 16, 65, NULL, NULL),
(20, 17, 110, NULL, NULL),
(21, 18, 95, NULL, NULL),
(22, 19, 40, NULL, NULL),
(23, 20, 150, NULL, NULL),
(24, 21, 80, NULL, NULL),
(25, 22, 105, NULL, NULL),
(26, 23, 130, NULL, NULL),
(27, 24, 160, NULL, NULL),
(28, 25, 10, NULL, NULL);

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
(1, 'Loperamide', 'Diatabs', 'Unilab', 'Drug', 'Tablet', '2 mg', 7.5, 1),
(2, 'Ibuprofen', 'Advil', 'Wyeth', 'Analgesics', 'Tablet', '200 mg', 10, 1),
(3, 'Amoxicillin', 'Amoxil', 'Abiolex', 'Antibiotic', 'Tablet', '250mg', 20, 1),
(4, 'Carbocisteine', 'Solmux', 'Unilab', 'Mucolytics', 'Tablet', '500mg', 12.31, 1),
(5, 'Paracetamol', 'Neozep', 'Unilab', 'Analgesics', 'Syrup', '50 mL', 55, 1),
(6, 'Losartan', 'Lifezar', 'Ritemed', 'Antihypertensive', 'Tablet', '100mg', 25.25, 1),
(7, 'Losartan', 'Angel-50', 'Ritemed', 'Antihypertensive', 'Tablet', '50mg', 5.5, 1),
(8, 'Losartan', 'Gensartan', 'Medinova', 'Antihypertensive', 'Tablet', '50mg', 6, 1),
(9, 'Paracetamol', 'Panadol', 'GSK', 'Pain Relief', 'Tablet', '500mg', 5, 1),
(10, 'Ibuprofen', 'Advil', 'Pfizer', 'Pain Relief', 'Tablet', '400mg', 8, 1),
(11, 'Amoxicillin', 'Amoxil', 'Bristol-Myers Squibb', 'Antibiotic', 'Capsule', '500mg', 10, 1),
(12, 'Cetrizine', 'Zyrtec', 'UCB', 'Antihistamine', 'Tablet', '10mg', 6.5, 1),
(13, 'Metformin', 'Glucophage', 'Boehringer Ingelheim', 'Diabetes', 'Tablet', '500mg', 15, 1),
(14, 'Lisinopril', 'Prinivil', 'Merck', 'Hypertension', 'Tablet', '10mg', 7, 1),
(15, 'Simvastatin', 'Zocor', 'Merck', 'Cholesterol', 'Tablet', '20mg', 12, 1),
(16, 'Omeprazole', 'Prilosec', 'AstraZeneca', 'Acid Reducer', 'Capsule', '20mg', 9, 1),
(17, 'Aspirin', 'Bayer', 'Bayer', 'Pain Relief', 'Tablet', '81mg', 4, 1),
(18, 'Diphenhydramine', 'Benadryl', 'Pfizer', 'Antihistamine', 'Tablet', '25mg', 5.5, 1),
(19, 'Paracetamol', 'Panadol', 'GSK', 'Pain Relief', 'Tablet', '500mg', 5, 1),
(20, 'Ibuprofen', 'Advil', 'Pfizer', 'Pain Relief', 'Tablet', '400mg', 8, 1),
(21, 'Amoxicillin', 'Amoxil', 'Bristol-Myers Squibb', 'Antibiotic', 'Capsule', '500mg', 100, 1),
(22, 'Cetrizine', 'Zyrtec', 'UCB', 'Antihistamine', 'Tablet', '10mg', 6.5, 1),
(23, 'Metformin', 'Glucophage', 'Boehringer Ingelheim', 'Diabetes', 'Tablet', '500mg', 15, 1),
(24, 'Lisinopril', 'Prinivil', 'Merck', 'Hypertension', 'Tablet', '10mg', 7, 1),
(25, 'Simvastatin', 'Zocor', 'Merck', 'Cholesterol', 'Tablet', '20mg', 12, 1),
(26, 'Omeprazole', 'Prilosec', 'AstraZeneca', 'Acid Reducer', 'Capsule', '20mg', 9, 1),
(27, 'Aspirin', 'Bayer', 'Bayer', 'Pain Relief', 'Tablet', '81mg', 4, 1),
(28, 'Diphenhydramine', 'Benadryl', 'Pfizer', 'Antihistamine', 'Tablet', '25mg', 5.5, 1),
(29, 'Loratadine', 'Claritin', 'Bristol-Myers Squibb', 'Antihistamine', 'Tablet', '10mg', 6, 1),
(30, 'Naproxen', 'Aleve', 'Bayer', 'Pain Relief', 'Tablet', '250mg', 9.5, 1),
(31, 'Fluticasone', 'Flonase', 'GSK', 'Nasal Spray', 'Spray', '50mcg', 14, 1),
(32, 'Levothyroxine', 'Synthroid', 'AbbVie', 'Thyroid', 'Tablet', '50mcg', 11, 1),
(33, 'Gabapentin', 'Neurontin', 'Pfizer', 'Neuropathic Pain', 'Capsule', '300mg', 13, 1),
(34, 'Ranitidine', 'Zantac', 'Sanofi', 'Acid Reducer', 'Tablet', '150mg', 8.5, 1),
(35, 'Hydrochlorothiazide', 'Microzide', 'Boehringer Ingelheim', 'Hypertension', 'Tablet', '25mg', 6, 1),
(36, 'Sertraline', 'Zoloft', 'Pfizer', 'Antidepressant', 'Tablet', '50mg', 10.5, 1),
(37, 'Tamsulosin', 'Flomax', 'Boeringer Ingelheim', 'BPH', 'Capsule', '0.4mg', 9, 1),
(38, 'Montelukast', 'Singulair', 'Merck', 'Asthma', 'Tablet', '10mg', 11.5, 1),
(39, 'Citalopram', 'Celexa', 'Lundbeck', 'Antidepressant', 'Tablet', '20mg', 9.5, 1),
(40, 'Duloxetine', 'Cymbalta', 'Eli Lilly', 'Antidepressant', 'Capsule', '30mg', 12, 1),
(41, 'Ointment', 'Trimycin', 'Unilab', 'Skin Care', 'Ointment', '10g', 290, 1),
(42, 'Supplement', 'MX3', 'MX3', 'Supplement', 'Tablet', '50mg', 19, 1),
(43, '123', 'BBBB', 'Ritemed', 'Tambal', 'Drugsss', '100g', 532, 1),
(44, 'Tambal', 'Foreman', 'Bakal', 'Lata', 'Syrup', '2500mg', 1900, 1),
(45, 'abcd', '123', '1111', '1111', '1111', '111', 12345.03, 1),
(46, 'Bayook', '2222', '2222', '3333', '444', '555', 666, 1),
(47, 'Bakokang', 'Bakokang', 'Bakokang', 'Tambal', 'Tablet', '200mg', 5000, 1),
(48, 'Wipes', 'Beybiko', 'Wipes', 'Wipes', 'N.A.', '50mg', 5, 1),
(49, 'AAAAA', 'AAAAA', 'AAAAAA', 'AAAAAAA', 'AAAAA', '333g', 333, 1),
(50, 'zzzz', 'zzzz', 'zzzz', 'zzz', 'zzzz', 'zzzz', 555, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int NOT NULL,
  `transaction_id` int NOT NULL,
  `total_amount` int NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `customer_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_items`
--

CREATE TABLE `sales_items` (
  `sale_item_id` int NOT NULL,
  `sale_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `quantity_sold` int NOT NULL,
  `price_sold` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(3, 'Paulo', 'Medel 2.0', NULL, '11156', 'true.2356@gmail.com', '123', '123', 'User', 0),
(4, 'Paulo', 'Medel', NULL, '666666666', '66666@gmail.com', 'aaaa', NULL, 'User', 0),
(5, 'Andrea Nicole', 'Caparas', NULL, '143', 'andreacaps17@gmail.com', 'dwei', NULL, 'Admin', 0),
(6, 'Keanu', 'Reeves', '1998-02-23', '911', 'breathtaking@gmail.com', 'superadmin', 'superadmin', 'Admin', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`batch_id`),
  ADD KEY `med_id` (`med_id`);

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
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `sale to user` (`user_id`);

--
-- Indexes for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD PRIMARY KEY (`sale_item_id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`prod_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `batch_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_items`
--
ALTER TABLE `sales_items`
  MODIFY `sale_item_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batch`
--
ALTER TABLE `batch`
  ADD CONSTRAINT `batch update med_id` FOREIGN KEY (`med_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inv update med_id` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sale to user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD CONSTRAINT `product_id` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sale_id` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
