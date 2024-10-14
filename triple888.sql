-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 14, 2024 at 03:58 AM
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
(17, 'Paulo Medel', '911', 1231231234),
(18, '', '', 999956423),
(19, '', '', 0),
(20, '', '', 0),
(21, '', '', 0),
(22, '', '', 0),
(23, '', '', 0),
(24, '', '', 0),
(25, '', '', 0),
(26, '', '', 0),
(27, '', '', 0),
(28, '', '', 0),
(29, '', '', 0),
(30, '', '', 0),
(31, '', '', 0),
(32, '', '', 0),
(33, '', '', 0),
(34, '', '', 999555),
(35, '', '', 0),
(36, '', '', 0),
(37, '', '', 0),
(38, '', '', 0),
(39, '', '', 0),
(40, '', '', 0),
(41, '', '', 0),
(42, '', '', 0),
(43, '', '', 0),
(44, '', '', 0),
(45, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int NOT NULL,
  `prod_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `threshold` int DEFAULT NULL,
  `last_updated` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `prod_id`, `quantity`, `threshold`, `last_updated`) VALUES
(2, 5, 214, 250, ''),
(3, 36, 10, 25, NULL),
(4, 1, 25, 50, NULL),
(5, 2, 81, 100, NULL),
(6, 3, 120, NULL, NULL),
(7, 4, 100, 100, NULL),
(9, 6, 147, NULL, NULL),
(11, 8, 25, NULL, NULL),
(12, 9, 55, 55, NULL),
(13, 10, 120, 50, NULL),
(14, 11, 57, 100, NULL),
(15, 12, 81, NULL, NULL),
(16, 13, 40, NULL, NULL),
(17, 14, 50, NULL, NULL),
(18, 15, 32, NULL, NULL),
(19, 16, 63, NULL, NULL),
(20, 17, 0, NULL, NULL),
(21, 18, 86, NULL, NULL),
(22, 19, 0, NULL, NULL),
(23, 20, 127, NULL, NULL),
(24, 21, 68, NULL, NULL),
(25, 22, 67, NULL, NULL),
(26, 23, 112, NULL, NULL),
(27, 24, 136, NULL, NULL),
(28, 25, 100, NULL, NULL);

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
(9, 'Paracetamol', 'Aigoo', 'GSK', 'Pain Relief', 'Tablet', '500mg', 5, 0),
(10, 'Ibuprofen', 'Albion', 'Pfizer', 'Pain Relief', 'Tablet', '400mg', 8, 0),
(11, 'Amoxicillin', 'Amoxil', 'Bristol-Myers Squibb', 'Antibiotic', 'Capsule', '50mg', 10, 0),
(12, 'Cetrizine', 'Zywoo', 'UCB', 'Antihistamine', 'Tablet', '10mg', 6.5, 0),
(13, 'Metformin', 'Boehringer', 'Boehringer Ingelheim', 'Diabetes', 'Tablet', '500mg', 15, 0),
(14, 'Lisinopril', 'Kaye', 'Merck', 'Hypertension', 'Tablet', '10mg', 7, 0),
(15, 'Simvastatin', 'Zocor', 'Merck', 'Cholesterol', 'Tablet', '20mg', 12, 1),
(16, 'Omeprazole', 'Pie', 'AstraZeneca', 'Acid Reducer', 'Capsule', '20mg', 9, 0),
(17, 'Aspirin', 'Aspoo', 'Bayer', 'Pain Relief', 'Tablet', '81mg', 4, 0),
(18, 'Diphenhydramine', 'Dorit', 'Pfizer', 'Antihistamine', 'Tablet', '25mg', 5.5, 0),
(19, 'Paracetamol', 'Panadol', 'GSK', 'Pain Relief', 'Tablet', '500mg', 5, 0),
(20, 'Ibuprofen', 'Ade', 'Pfizer', 'Pain Relief', 'Tablet', '400mg', 8, 0),
(21, 'Amoxicillin', 'Ambrox', 'Bristol-Myers Squibb', 'Antibiotic', 'Capsule', '500mg', 100, 0),
(22, 'Cetrizine', 'Zyrtec', 'UCB', 'Antihistamine', 'Tablet', '10mg', 6.5, 1),
(23, 'Metformin', 'Glucophage', 'Boehringer Ingelheim', 'Diabetes', 'Tablet', '500mg', 15, 1),
(24, 'Lisinopril', 'Prinivil', 'Merck', 'Hypertension', 'Tablet', '10mg', 7, 0),
(25, 'Simvastatin', 'Zoom', 'Merck', 'Cholesterol', 'Tablet', '20mg', 12, 0),
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

--
-- Dumping data for table `receipt`
--

INSERT INTO `receipt` (`receipt_no`, `transaction_id`) VALUES
(1, 68),
(2, 69),
(3, 70),
(4, 71),
(5, 72),
(6, 73),
(7, 74),
(8, 75),
(9, 76),
(10, 77),
(11, 78),
(12, 79),
(13, 80),
(14, 81),
(15, 82),
(16, 83),
(17, 84),
(18, 85),
(19, 86),
(20, 87),
(21, 88),
(22, 89),
(23, 90),
(24, 91),
(25, 92),
(26, 93),
(27, 94),
(28, 95),
(29, 96),
(30, 97),
(31, 98),
(32, 99),
(33, 100),
(34, 101),
(35, 102),
(36, 103),
(37, 104),
(38, 105),
(39, 106),
(40, 107),
(41, 108),
(42, 109),
(43, 110),
(44, 111),
(45, 112),
(46, 113),
(47, 114),
(48, 115),
(49, 116),
(50, 117),
(51, 118),
(52, 119),
(53, 120),
(54, 121),
(55, 122),
(56, 123),
(57, 124),
(58, 125),
(59, 126),
(60, 127),
(61, 128),
(62, 129),
(63, 130),
(64, 131),
(65, 132),
(66, 133),
(67, 134),
(68, 135),
(69, 136),
(70, 137),
(71, 138),
(72, 139);

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
(70, 13),
(71, 14),
(72, 15),
(73, 16),
(74, 17),
(77, 18),
(78, 19),
(81, 20),
(75, 21),
(76, 22),
(79, 23),
(80, 24),
(82, 25),
(83, 26),
(84, 27),
(85, 28),
(86, 29),
(87, 30),
(88, 31),
(89, 32),
(90, 33),
(91, 34),
(92, 35),
(93, 36),
(94, 37),
(95, 38),
(96, 39),
(97, 40),
(98, 41),
(99, 42),
(100, 43),
(101, 44),
(102, 45),
(103, 46),
(104, 47),
(105, 48),
(106, 49),
(107, 50),
(108, 51),
(109, 52),
(110, 53),
(111, 54),
(112, 55),
(113, 56),
(114, 57),
(115, 58),
(116, 59),
(117, 60),
(118, 61),
(119, 62),
(120, 63),
(121, 64),
(122, 65),
(123, 66),
(124, 67),
(125, 68),
(126, 69),
(127, 70),
(128, 71),
(129, 72),
(130, 73),
(131, 74),
(132, 75),
(133, 76),
(134, 77),
(135, 78),
(136, 79),
(137, 80),
(138, 81),
(139, 82),
(140, 83),
(141, 84),
(142, 85),
(143, 86),
(144, 87),
(145, 88),
(146, 89),
(147, 90),
(148, 91),
(149, 92),
(150, 93),
(151, 94),
(152, 95),
(153, 96),
(154, 97),
(155, 98),
(156, 99),
(157, 100),
(158, 101),
(159, 102),
(160, 103),
(161, 104),
(162, 105),
(163, 106),
(164, 107),
(165, 108),
(166, 109),
(167, 110),
(168, 111),
(169, 112),
(170, 113),
(171, 114),
(172, 115),
(173, 116),
(174, 117),
(175, 118),
(176, 119),
(177, 120),
(178, 121),
(179, 122),
(180, 123),
(181, 124),
(182, 125),
(183, 126),
(184, 127),
(185, 128),
(186, 129),
(187, 130),
(188, 131),
(189, 132),
(190, 133),
(191, 134),
(192, 135),
(193, 136),
(194, 137),
(195, 138),
(196, 139);

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
(101, 72, 3, 1, 20.00),
(102, 73, 5, 1, 55.00),
(103, 73, 36, 1, 10.50),
(104, 73, 1, 4, 7.50),
(105, 73, 2, 1, 10.00),
(106, 74, 36, 1, 10.50),
(107, 75, 20, 1, 8.00),
(108, 76, 21, 1, 100.00),
(109, 77, 2, 1, 10.00),
(110, 77, 3, 1, 20.00),
(111, 78, 24, 1, 7.00),
(112, 79, 20, 1, 8.00),
(113, 80, 24, 1, 7.00),
(114, 81, 24, 1, 7.00),
(115, 82, 23, 1, 15.00),
(116, 83, 20, 1, 8.00),
(117, 83, 21, 1, 100.00),
(118, 84, 4, 1, 12.31),
(119, 85, 8, 1, 6.00),
(120, 86, 24, 1, 7.00),
(121, 87, 21, 2, 100.00),
(122, 88, 4, 1, 12.31),
(123, 88, 5, 1, 55.00),
(124, 89, 23, 1, 15.00),
(125, 89, 24, 1, 7.00),
(126, 90, 17, 1, 4.00),
(127, 90, 18, 1, 5.50),
(128, 91, 1, 1, 7.50),
(129, 92, 5, 1, 55.00),
(130, 93, 24, 1, 7.00),
(131, 93, 23, 1, 15.00),
(132, 94, 24, 1, 7.00),
(133, 95, 24, 1, 7.00),
(134, 96, 5, 1, 55.00),
(135, 97, 24, 1, 7.00),
(136, 98, 5, 1, 55.00),
(137, 99, 24, 1, 7.00),
(138, 100, 6, 1, 25.25),
(139, 101, 24, 1, 7.00),
(140, 102, 24, 1, 7.00),
(141, 103, 18, 1, 5.50),
(142, 103, 17, 1, 4.00),
(143, 104, 24, 1, 7.00),
(144, 104, 23, 1, 15.00),
(145, 104, 22, 1, 6.50),
(146, 105, 6, 1, 25.25),
(147, 105, 8, 1, 6.00),
(148, 106, 2, 1, 10.00),
(149, 107, 23, 1, 15.00),
(150, 108, 6, 1, 25.25),
(151, 109, 24, 1, 7.00),
(152, 110, 24, 1, 7.00),
(153, 111, 23, 1, 15.00),
(154, 112, 24, 1, 7.00),
(155, 113, 22, 1, 6.50),
(156, 114, 24, 1, 7.00),
(157, 115, 3, 1, 20.00),
(158, 116, 15, 1, 12.00),
(159, 117, 8, 1, 6.00),
(160, 118, 17, 1, 4.00),
(161, 119, 22, 1, 6.50),
(162, 120, 1, 1, 7.50),
(163, 121, 2, 1, 10.00),
(164, 122, 10, 1, 8.00),
(165, 123, 12, 1, 6.50),
(166, 123, 11, 1, 10.00),
(167, 124, 10, 1, 8.00),
(168, 125, 6, 1, 25.25),
(169, 126, 6, 1, 25.25),
(170, 127, 6, 1, 25.25),
(171, 128, 1, 1, 7.50),
(172, 129, 20, 1, 8.00),
(173, 130, 18, 1, 5.50),
(174, 131, 5, 1, 55.00),
(175, 132, 20, 1, 8.00),
(176, 133, 20, 1, 8.00),
(177, 134, 6, 1, 25.25),
(178, 135, 2, 1, 10.00),
(179, 136, 23, 1, 15.00),
(180, 137, 6, 1, 25.25),
(181, 138, 24, 1, 7.00),
(182, 139, 20, 1, 8.00),
(183, 140, 6, 1, 25.25),
(184, 141, 4, 1, 12.31),
(185, 142, 17, 1, 4.00),
(186, 143, 6, 1, 25.25),
(187, 144, 5, 1, 55.00),
(188, 145, 36, 1, 10.50),
(189, 146, 17, 1, 4.00),
(190, 147, 4, 1, 12.31),
(191, 148, 2, 1, 10.00),
(192, 149, 2, 1, 10.00),
(193, 150, 5, 1, 55.00),
(194, 151, 2, 1, 10.00),
(195, 152, 6, 1, 25.25),
(196, 153, 23, 2, 15.00),
(197, 154, 5, 1, 55.00),
(198, 155, 4, 2, 12.31),
(199, 156, 5, 2, 55.00),
(200, 157, 6, 2, 25.25),
(201, 158, 18, 1, 5.50),
(202, 159, 2, 1, 10.00),
(203, 160, 6, 1, 25.25),
(204, 161, 6, 1, 25.25),
(205, 162, 6, 1, 25.25),
(206, 163, 24, 1, 7.00),
(207, 164, 21, 1, 100.00),
(208, 165, 3, 1, 20.00),
(209, 166, 15, 1, 12.00),
(210, 166, 14, 3, 7.00),
(211, 167, 11, 2, 10.00),
(212, 167, 13, 2, 15.00),
(213, 168, 5, 1, 55.00),
(214, 169, 4, 1, 12.31),
(215, 170, 3, 1, 20.00),
(216, 171, 6, 1, 25.25),
(217, 172, 17, 1, 4.00),
(218, 173, 2, 1, 10.00),
(219, 174, 4, 1, 12.31),
(220, 175, 2, 1, 10.00),
(221, 176, 17, 1, 4.00),
(222, 177, 5, 1, 55.00),
(223, 178, 20, 1, 8.00),
(224, 179, 13, 1, 15.00),
(225, 180, 6, 1, 25.25),
(226, 181, 6, 5, 25.25),
(227, 182, 6, 1, 25.25),
(228, 183, 36, 1, 10.50),
(229, 184, 17, 1, 4.00),
(230, 185, 1, 1, 7.50),
(231, 186, 21, 1, 100.00),
(232, 187, 6, 1, 25.25),
(233, 188, 21, 1, 100.00),
(234, 189, 4, 1, 12.31),
(235, 190, 24, 1, 7.00),
(236, 190, 23, 1, 15.00),
(237, 190, 22, 1, 6.50),
(238, 190, 21, 1, 100.00),
(239, 190, 20, 1, 8.00),
(240, 190, 19, 1, 5.00),
(241, 190, 18, 1, 5.50),
(242, 190, 17, 1, 4.00),
(243, 190, 16, 1, 9.00),
(244, 190, 14, 1, 7.00),
(245, 190, 13, 1, 15.00),
(246, 190, 12, 1, 6.50),
(247, 190, 11, 1, 10.00),
(248, 190, 9, 1, 5.00),
(249, 190, 8, 1, 6.00),
(250, 190, 6, 1, 25.25),
(251, 190, 5, 1, 55.00),
(252, 190, 3, 1, 20.00),
(253, 190, 2, 1, 10.00),
(254, 190, 1, 1, 7.50),
(255, 191, 5, 2, 55.00),
(256, 191, 36, 1, 10.50),
(257, 191, 1, 1, 7.50),
(258, 191, 2, 1, 10.00),
(259, 191, 3, 1, 20.00),
(260, 191, 4, 1, 12.31),
(261, 191, 6, 1, 25.25),
(262, 191, 8, 1, 6.00),
(263, 191, 9, 1, 5.00),
(264, 191, 10, 1, 8.00),
(265, 191, 11, 1, 10.00),
(266, 191, 12, 1, 6.50),
(267, 191, 13, 1, 15.00),
(268, 191, 14, 1, 7.00),
(269, 191, 15, 1, 12.00),
(270, 191, 16, 1, 9.00),
(271, 191, 17, 1, 4.00),
(272, 191, 18, 2, 5.50),
(273, 191, 19, 2, 5.00),
(274, 191, 20, 2, 8.00),
(275, 191, 21, 2, 100.00),
(276, 191, 22, 2, 6.50),
(277, 191, 23, 2, 15.00),
(278, 191, 24, 1, 7.00),
(279, 192, 6, 1, 25.25),
(280, 193, 36, 1, 10.50),
(281, 194, 20, 9, 8.00),
(282, 195, 22, 7, 6.50),
(283, 196, 22, 20, 6.50);

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
  `cash_amount` decimal(15,2) NOT NULL,
  `customer_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `transaction_date`, `user_id`, `payment_method`, `total_purchase`, `cash_amount`, `customer_id`) VALUES
(1, '2024-10-05', 3, 'Cash', 65.50, 0.00, 7),
(2, '2024-10-05', 3, 'Cash', 28.50, 0.00, 11),
(3, '2024-10-05', 3, 'Cash', 80.25, 0.00, 12),
(4, '2024-10-05', 3, 'Cash', 57.00, 0.00, 13),
(5, '2024-10-05', 3, 'Cash', 30.75, 0.00, 14),
(6, '2024-10-05', 3, 'Cash', 49.81, 0.00, 15),
(7, '2024-10-05', 3, 'Cash', 71.00, 0.00, NULL),
(8, '2024-10-05', 3, 'Cash', 38.00, 0.00, NULL),
(9, '2024-10-05', 3, 'Cash', 110.00, 0.00, NULL),
(10, '2024-10-05', 3, 'Cash', 40.04, 0.00, 16),
(11, '2024-10-05', 3, 'Cash', 157.75, 0.00, NULL),
(12, '2024-10-06', 3, 'Cash', 114.50, 0.00, NULL),
(13, '2024-10-06', 3, 'Cash', 45.32, 0.00, 17),
(14, '2024-10-06', 3, 'Cash', 113.00, 0.00, NULL),
(15, '2024-10-07', 3, 'Cash', 32.31, 0.00, NULL),
(16, '2024-10-10', 3, 'Cash', 105.50, 0.00, NULL),
(17, '2024-10-10', 3, 'Cash', 10.50, 0.00, NULL),
(18, '2024-10-10', 3, 'Cash', 30.00, 0.00, NULL),
(19, '2024-10-10', 3, 'Cash', 7.00, 0.00, NULL),
(20, '2024-10-10', 3, 'Cash', 7.00, 100.00, NULL),
(21, '2024-10-10', 3, 'Cash', 8.00, 10.00, NULL),
(22, '2024-10-10', 3, 'Cash', 100.00, 20.00, NULL),
(23, '2024-10-10', 3, 'Cash', 8.00, 10.00, NULL),
(24, '2024-10-10', 3, 'Cash', 7.00, 10.00, NULL),
(25, '2024-10-10', 3, 'Cash', 15.00, 20.00, NULL),
(26, '2024-10-12', 3, 'Cash', 108.00, 120.00, NULL),
(27, '2024-10-12', 3, 'Cash', 12.31, 10.00, NULL),
(28, '2024-10-12', 3, 'Cash', 6.00, 5.00, NULL),
(29, '2024-10-12', 3, 'Cash', 7.00, 3.00, NULL),
(30, '2024-10-12', 3, 'Cash', 200.00, 5.00, NULL),
(31, '2024-10-12', 3, 'Cash', 67.31, 67.00, NULL),
(32, '2024-10-12', 3, 'Cash', 22.00, 22.20, NULL),
(33, '2024-10-12', 3, 'Cash', 9.50, 10.00, NULL),
(34, '2024-10-13', 3, 'Cash', 7.50, 8.00, NULL),
(35, '2024-10-13', 3, 'Cash', 55.00, 60.00, NULL),
(36, '2024-10-13', 3, 'Cash', 22.00, 22.00, NULL),
(37, '2024-10-13', 3, 'Cash', 7.00, 7.00, NULL),
(38, '2024-10-13', 3, 'Cash', 7.00, 9.00, NULL),
(39, '2024-10-13', 3, 'Cash', 55.00, 60.00, NULL),
(40, '2024-10-13', 3, 'Cash', 7.00, 8.00, NULL),
(41, '2024-10-13', 3, 'Cash', 55.00, 60.00, NULL),
(42, '2024-10-13', 3, 'Cash', 7.00, 10.00, NULL),
(43, '2024-10-13', 3, 'Cash', 25.25, 26.00, NULL),
(44, '2024-10-13', 3, 'Cash', 7.00, 8.00, NULL),
(45, '2024-10-13', 3, 'Cash', 7.00, 8.00, NULL),
(46, '2024-10-13', 3, 'Cash', 9.50, 10.00, NULL),
(47, '2024-10-13', 3, 'Cash', 28.50, 30.00, NULL),
(48, '2024-10-13', 3, 'Cash', 31.25, 32.00, NULL),
(49, '2024-10-13', 3, 'Cash', 10.00, 11.00, NULL),
(50, '2024-10-13', 3, 'Cash', 15.00, 20.00, NULL),
(51, '2024-10-13', 3, 'Cash', 25.25, 26.00, NULL),
(52, '2024-10-13', 3, 'Cash', 7.00, 100.00, NULL),
(53, '2024-10-13', 3, 'Cash', 7.00, 100.00, NULL),
(54, '2024-10-13', 3, 'Cash', 15.00, 20.00, NULL),
(55, '2024-10-13', 3, 'Cash', 7.00, 10.00, NULL),
(56, '2024-10-13', 3, 'Cash', 6.50, 10.00, NULL),
(57, '2024-10-13', 3, 'Cash', 7.00, 10.00, NULL),
(58, '2024-10-13', 3, 'Cash', 20.00, 20.00, NULL),
(59, '2024-10-13', 3, 'Cash', 12.00, 12.00, NULL),
(60, '2024-10-13', 3, 'Cash', 6.00, 7.00, NULL),
(61, '2024-10-13', 3, 'Cash', 4.00, 5.00, NULL),
(62, '2024-10-13', 3, 'Cash', 6.50, 8.00, NULL),
(63, '2024-10-13', 3, 'Cash', 7.50, 10.00, NULL),
(64, '2024-10-13', 3, 'Cash', 10.00, 10.00, NULL),
(65, '2024-10-13', 3, 'Cash', 8.00, 10.00, NULL),
(66, '2024-10-13', 3, 'Cash', 16.50, 20.00, NULL),
(67, '2024-10-13', 3, 'Cash', 7.04, 10.00, NULL),
(68, '2024-10-13', 3, 'Cash', 25.25, 26.00, NULL),
(69, '2024-10-13', 3, 'Cash', 25.25, 26.00, NULL),
(70, '2024-10-13', 3, 'Cash', 25.25, 26.00, NULL),
(71, '2024-10-13', 3, 'Cash', 7.50, 10.00, NULL),
(72, '2024-10-13', 3, 'Cash', 8.00, 10.00, NULL),
(73, '2024-10-13', 3, 'Cash', 5.50, 6.00, NULL),
(74, '2024-10-13', 3, 'Cash', 55.00, 100.00, NULL),
(75, '2024-10-13', 3, 'Cash', 8.00, 10.00, NULL),
(76, '2024-10-13', 3, 'Cash', 8.00, 10.00, NULL),
(77, '2024-10-13', 3, 'Cash', 25.25, 26.00, NULL),
(78, '2024-10-13', 3, 'Cash', 10.00, 10.00, NULL),
(79, '2024-10-13', 3, 'Cash', 15.00, 20.00, NULL),
(80, '2024-10-13', 3, 'Cash', 25.25, 50.00, NULL),
(81, '2024-10-13', 3, 'Cash', 7.00, 7.00, NULL),
(82, '2024-10-13', 3, 'Cash', 8.00, 10.00, NULL),
(83, '2024-10-13', 3, 'Cash', 25.25, 26.00, NULL),
(84, '2024-10-13', 3, 'Cash', 12.31, 15.00, NULL),
(85, '2024-10-13', 3, 'Cash', 4.00, 5.00, NULL),
(86, '2024-10-13', 3, 'Cash', 25.25, 26.00, NULL),
(87, '2024-10-13', 3, 'Cash', 55.00, 100.00, NULL),
(88, '2024-10-13', 3, 'Cash', 10.50, 11.00, NULL),
(89, '2024-10-13', 3, 'Cash', 4.00, 5.00, NULL),
(90, '2024-10-13', 3, 'Cash', 12.31, 15.00, NULL),
(91, '2024-10-13', 3, 'Cash', 10.00, 11.00, NULL),
(92, '2024-10-13', 3, 'Cash', 10.00, 15.00, NULL),
(93, '2024-10-13', 3, 'Cash', 55.00, 100.00, NULL),
(94, '2024-10-13', 3, 'Cash', 10.00, 11.00, NULL),
(95, '2024-10-13', 3, 'Cash', 25.25, 26.00, NULL),
(96, '2024-10-13', 3, 'Cash', 30.00, 50.00, NULL),
(97, '2024-10-13', 3, 'Cash', 55.00, 68.00, NULL),
(98, '2024-10-13', 3, 'Cash', 24.62, 25.00, NULL),
(99, '2024-10-13', 3, 'Cash', 110.00, 120.00, NULL),
(100, '2024-10-13', 3, 'Cash', 50.50, 65.00, NULL),
(101, '2024-10-13', 3, 'Cash', 5.50, 10.00, NULL),
(102, '2024-10-13', 3, 'Cash', 10.00, 11.00, NULL),
(103, '2024-10-13', 3, 'Cash', 25.25, 26.00, NULL),
(104, '2024-10-13', 3, 'Cash', 25.25, 26.00, NULL),
(105, '2024-10-13', 3, 'Cash', 25.25, 26.00, NULL),
(106, '2024-10-13', 3, 'Cash', 7.00, 55.00, NULL),
(107, '2024-10-13', 3, 'Cash', 100.00, 120.00, NULL),
(108, '2024-10-13', 3, 'Cash', 20.00, 21.00, NULL),
(109, '2024-10-13', 3, 'Cash', 29.04, 30.00, NULL),
(110, '2024-10-13', 3, 'Cash', 50.00, 51.00, NULL),
(111, '2024-10-13', 3, 'Cash', 48.40, 50.00, NULL),
(112, '2024-10-13', 3, 'Cash', 10.83, 55.00, 18),
(113, '2024-10-13', 3, 'Cash', 20.00, 25.00, 19),
(114, '2024-10-13', 3, 'Cash', 25.25, 26.00, 20),
(115, '2024-10-13', 3, 'Cash', 4.00, 5.00, 21),
(116, '2024-10-13', 3, 'Cash', 10.00, 11.00, 22),
(117, '2024-10-13', 3, 'Cash', 12.31, 60.00, 23),
(118, '2024-10-13', 3, 'Cash', 10.00, 15.00, 24),
(119, '2024-10-13', 3, 'Cash', 4.00, 5.00, 25),
(120, '2024-10-13', 3, 'Cash', 55.00, 66.00, 26),
(121, '2024-10-13', 3, 'Cash', 8.00, 55.00, 27),
(122, '2024-10-13', 3, 'Cash', 15.00, 20.00, 28),
(123, '2024-10-13', 3, 'Cash', 25.25, 26.00, 29),
(124, '2024-10-13', 3, 'Cash', 126.25, 150.00, 30),
(125, '2024-10-13', 3, 'Cash', 25.25, 28.00, 31),
(126, '2024-10-13', 3, 'Cash', 10.50, 15.00, 32),
(127, '2024-10-13', 3, 'Cash', 4.00, 5.00, 33),
(128, '2024-10-13', 3, 'Cash', 6.60, 10.00, 34),
(129, '2024-10-13', 3, 'Cash', 100.00, 100.00, 35),
(130, '2024-10-13', 3, 'Cash', 25.25, 27.00, 36),
(131, '2024-10-13', 3, 'Cash', 100.00, 100.00, 37),
(132, '2024-10-13', 3, 'Cash', 12.31, 15.00, 38),
(133, '2024-10-13', 3, 'Cash', 327.25, 350.00, 39),
(134, '2024-10-13', 3, 'Cash', 565.06, 1000.00, 40),
(135, '2024-10-14', 3, 'Cash', 25.25, 26.00, 41),
(136, '2024-10-14', 4, 'Cash', 10.50, 11.00, 42),
(137, '2024-10-14', 3, 'Cash', 72.00, 100.00, 43),
(138, '2024-10-14', 3, 'Cash', 45.50, 50.00, 44),
(139, '2024-10-14', 3, 'Cash', 130.00, 150.00, 45);

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
(2, 'Bart', 'Mangum', NULL, '12312312345', 'bart@gmail.com', 'adminusername', 'adminpassword', 'Admin', 1),
(3, 'Paulo', 'Ledem', '2024-10-10', '90876578215', 'true.2356@gmail.com', 'usercashier', 'usercashier', 'User', 1),
(4, 'Paulo', 'Medel', NULL, '66666666677', '66666@gmail.com', 'userpharmacist', 'userpharmacist', 'User', 1),
(5, 'Andrea Nicole', 'Caparas', NULL, '14366891011', 'andreacaps17@gmail.com', 'andreacaps17', NULL, 'Admin', 0),
(6, 'Keanu', 'Reeves', '1998-02-23', '99999999999', 'breathtaking@gmail.com', 'superadmin', 'superadmin', 'Admin', 1),
(7, 'Blocked', 'User ', NULL, '11122233344', 'blocked+user@gmail.com', 'inactivelang', NULL, 'User', 0);

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
  ADD PRIMARY KEY (`product_history_id`),
  ADD KEY `product_history to product` (`prod_id`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`receipt_no`),
  ADD KEY `receipt to transaction` (`transaction_id`);

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
  ADD PRIMARY KEY (`user_history_id`),
  ADD KEY `user_history to user` (`user_id`);

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
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

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
  MODIFY `receipt_no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `sales_items`
--
ALTER TABLE `sales_items`
  MODIFY `sale_item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- Constraints for table `product_history`
--
ALTER TABLE `product_history`
  ADD CONSTRAINT `product_history to product` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `receipt to transaction` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Constraints for table `user_history`
--
ALTER TABLE `user_history`
  ADD CONSTRAINT `user_history to user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
