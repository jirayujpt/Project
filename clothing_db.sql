-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2024 at 03:04 PM
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
-- Database: `clothing_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessrights`
--

CREATE TABLE `accessrights` (
  `AccessRights_ID` varchar(10) NOT NULL,
  `AccessRightsName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` varchar(10) NOT NULL,
  `CustomerName` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Customer_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Department_ID` varchar(10) NOT NULL,
  `DepartmentName` varchar(100) DEFAULT NULL,
  `AccessRights_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_ID` varchar(10) NOT NULL,
  `EmployeeName` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Department_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `firsttimepromotion`
--

CREATE TABLE `firsttimepromotion` (
  `Promotion_ID` varchar(10) NOT NULL,
  `PromotionName` varchar(100) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `Discount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generalcustomer`
--

CREATE TABLE `generalcustomer` (
  `UsageRights` varchar(100) DEFAULT NULL,
  `Customer_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `MemberPoints` int(11) DEFAULT NULL,
  `Level_ID` varchar(10) DEFAULT NULL,
  `Customer_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `membershiplevel`
--

CREATE TABLE `membershiplevel` (
  `Level_ID` varchar(10) NOT NULL,
  `LevelName` varchar(100) DEFAULT NULL,
  `StartPoints` int(11) DEFAULT NULL,
  `EndPoints` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `membershippromotion`
--

CREATE TABLE `membershippromotion` (
  `Promotion_ID` varchar(10) NOT NULL,
  `Discount` decimal(10,2) DEFAULT NULL,
  `ShirtType_ID` varchar(10) DEFAULT NULL,
  `Level_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentnotification`
--

CREATE TABLE `paymentnotification` (
  `PaymentNotification_ID` varchar(10) NOT NULL,
  `PaymentDate` date DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `ReceiptNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentstatus`
--

CREATE TABLE `paymentstatus` (
  `PaymentStatus_ID` varchar(10) NOT NULL,
  `PaymentStatusName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` varchar(10) NOT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `ProductPicture` varchar(255) DEFAULT NULL,
  `ShirtType_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productlot`
--

CREATE TABLE `productlot` (
  `LotNumber` varchar(50) NOT NULL,
  `CostPrice` decimal(10,2) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Size_ID` varchar(10) DEFAULT NULL,
  `Color_ID` varchar(10) DEFAULT NULL,
  `Product_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productprice`
--

CREATE TABLE `productprice` (
  `Price` decimal(10,2) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Size_ID` varchar(10) DEFAULT NULL,
  `Color_ID` varchar(10) DEFAULT NULL,
  `Product_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `ReceiptNumber` int(11) NOT NULL,
  `ReceiptDate` date DEFAULT NULL,
  `ReceivedAmount` decimal(10,2) DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  `ChangeAmount` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(10,2) DEFAULT NULL,
  `Employee_ID` varchar(10) DEFAULT NULL,
  `Customer_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `SaleID` int(11) NOT NULL,
  `Sequence` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  `ReceiptNumber` int(11) DEFAULT NULL,
  `Size_ID` varchar(10) DEFAULT NULL,
  `Color_ID` varchar(10) DEFAULT NULL,
  `Product_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shirtcolor`
--

CREATE TABLE `shirtcolor` (
  `Color_ID` varchar(10) NOT NULL,
  `ColorName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shirtsize`
--

CREATE TABLE `shirtsize` (
  `Size_ID` varchar(10) NOT NULL,
  `SizeName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shirttype`
--

CREATE TABLE `shirttype` (
  `ShirtType_ID` varchar(10) NOT NULL,
  `ShirtTypeName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', NULL, '$2y$12$BVP6hnlVXNGQ.9O5FEo6S.Ii1BudInNFDEHm3.YcXJF.K.nvuF8ze', NULL, '2024-01-27 03:12:45', '2024-01-27 03:12:45'),
(2, 'big', 'big@gmail.com', NULL, '$2y$12$lS69VuiOfdP.jCVWWCN1QOxaK7bP/CHkKs1a/95B4/DeNUvV4Ura2', NULL, '2024-02-05 09:03:25', '2024-02-05 09:03:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessrights`
--
ALTER TABLE `accessrights`
  ADD PRIMARY KEY (`AccessRights_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Department_ID`),
  ADD KEY `AccessRights_ID` (`AccessRights_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_ID`),
  ADD KEY `Department_ID` (`Department_ID`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `firsttimepromotion`
--
ALTER TABLE `firsttimepromotion`
  ADD PRIMARY KEY (`Promotion_ID`);

--
-- Indexes for table `generalcustomer`
--
ALTER TABLE `generalcustomer`
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD KEY `Level_ID` (`Level_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `membershiplevel`
--
ALTER TABLE `membershiplevel`
  ADD PRIMARY KEY (`Level_ID`);

--
-- Indexes for table `membershippromotion`
--
ALTER TABLE `membershippromotion`
  ADD PRIMARY KEY (`Promotion_ID`),
  ADD KEY `ShirtType_ID` (`ShirtType_ID`),
  ADD KEY `Level_ID` (`Level_ID`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `paymentnotification`
--
ALTER TABLE `paymentnotification`
  ADD PRIMARY KEY (`PaymentNotification_ID`),
  ADD KEY `ReceiptNumber` (`ReceiptNumber`);

--
-- Indexes for table `paymentstatus`
--
ALTER TABLE `paymentstatus`
  ADD PRIMARY KEY (`PaymentStatus_ID`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `ShirtType_ID` (`ShirtType_ID`);

--
-- Indexes for table `productlot`
--
ALTER TABLE `productlot`
  ADD PRIMARY KEY (`LotNumber`),
  ADD KEY `Size_ID` (`Size_ID`),
  ADD KEY `Color_ID` (`Color_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `productprice`
--
ALTER TABLE `productprice`
  ADD KEY `Size_ID` (`Size_ID`),
  ADD KEY `Color_ID` (`Color_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`ReceiptNumber`),
  ADD KEY `Employee_ID` (`Employee_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`SaleID`),
  ADD KEY `ReceiptNumber` (`ReceiptNumber`),
  ADD KEY `Size_ID` (`Size_ID`),
  ADD KEY `Color_ID` (`Color_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `shirtcolor`
--
ALTER TABLE `shirtcolor`
  ADD PRIMARY KEY (`Color_ID`);

--
-- Indexes for table `shirtsize`
--
ALTER TABLE `shirtsize`
  ADD PRIMARY KEY (`Size_ID`);

--
-- Indexes for table `shirttype`
--
ALTER TABLE `shirttype`
  ADD PRIMARY KEY (`ShirtType_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `SaleID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`AccessRights_ID`) REFERENCES `accessrights` (`AccessRights_ID`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`);

--
-- Constraints for table `generalcustomer`
--
ALTER TABLE `generalcustomer`
  ADD CONSTRAINT `generalcustomer_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`Level_ID`) REFERENCES `membershiplevel` (`Level_ID`),
  ADD CONSTRAINT `member_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `membershippromotion`
--
ALTER TABLE `membershippromotion`
  ADD CONSTRAINT `membershippromotion_ibfk_1` FOREIGN KEY (`ShirtType_ID`) REFERENCES `shirttype` (`ShirtType_ID`),
  ADD CONSTRAINT `membershippromotion_ibfk_2` FOREIGN KEY (`Level_ID`) REFERENCES `membershiplevel` (`Level_ID`);

--
-- Constraints for table `paymentnotification`
--
ALTER TABLE `paymentnotification`
  ADD CONSTRAINT `paymentnotification_ibfk_1` FOREIGN KEY (`ReceiptNumber`) REFERENCES `receipt` (`ReceiptNumber`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ShirtType_ID`) REFERENCES `shirttype` (`ShirtType_ID`);

--
-- Constraints for table `productlot`
--
ALTER TABLE `productlot`
  ADD CONSTRAINT `productlot_ibfk_1` FOREIGN KEY (`Size_ID`) REFERENCES `productprice` (`Size_ID`),
  ADD CONSTRAINT `productlot_ibfk_2` FOREIGN KEY (`Color_ID`) REFERENCES `productprice` (`Color_ID`),
  ADD CONSTRAINT `productlot_ibfk_3` FOREIGN KEY (`Product_ID`) REFERENCES `productprice` (`Product_ID`);

--
-- Constraints for table `productprice`
--
ALTER TABLE `productprice`
  ADD CONSTRAINT `productprice_ibfk_1` FOREIGN KEY (`Size_ID`) REFERENCES `shirtsize` (`Size_ID`),
  ADD CONSTRAINT `productprice_ibfk_2` FOREIGN KEY (`Color_ID`) REFERENCES `shirtcolor` (`Color_ID`),
  ADD CONSTRAINT `productprice_ibfk_3` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`),
  ADD CONSTRAINT `receipt_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`ReceiptNumber`) REFERENCES `receipt` (`ReceiptNumber`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`Size_ID`) REFERENCES `productprice` (`Size_ID`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`Color_ID`) REFERENCES `productprice` (`Color_ID`),
  ADD CONSTRAINT `sales_ibfk_4` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
