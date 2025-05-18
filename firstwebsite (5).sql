-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2025 at 05:42 PM
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
-- Database: `firstwebsite`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_activity_log`
--

CREATE TABLE `admin_activity_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_type` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_activity_log`
--

INSERT INTO `admin_activity_log` (`id`, `user_id`, `activity_type`, `description`, `ip_address`, `timestamp`) VALUES
(1, 18, 'view_application', 'Viewed application details for application ID: 1', '::1', '2025-05-08 14:48:56'),
(2, 18, 'view_application', 'Viewed application details for application ID: 1', '::1', '2025-05-08 14:49:00'),
(3, 18, 'view_application', 'Viewed application details for application ID: 1', '::1', '2025-05-08 14:49:05'),
(4, 18, 'view_application', 'Viewed application details for application ID: 2', '::1', '2025-05-08 14:52:43'),
(5, 18, 'view_application', 'Viewed application details for application ID: 2', '::1', '2025-05-08 14:52:50'),
(6, 18, 'view_application', 'Viewed application details for application ID: 1', '::1', '2025-05-08 16:15:32'),
(7, 18, 'view_application', 'Viewed application details for application ID: 3', '::1', '2025-05-08 17:28:37'),
(8, 18, 'view_application', 'Viewed application details for application ID: 1', '::1', '2025-05-09 00:40:49'),
(9, 15, 'view_application', 'Viewed application details for application ID: 6', '::1', '2025-05-11 16:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `date_posted` timestamp NOT NULL DEFAULT current_timestamp(),
  `posted_by` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `date_posted`, `posted_by`, `is_active`) VALUES
(1, 'New Loan Program Available', 'We are pleased to announce a new special loan program with reduced interest rates for educational purposes. Apply today!', '2025-05-08 14:35:21', 'admin', 1),
(2, 'System Maintenance Notice', 'The system will be down for maintenance on Saturday, June 5, 2025 from 10pm to 2am. We apologize for any inconvenience.', '2025-05-08 14:35:21', 'admin', 1),
(3, 'Holiday Schedule', 'Please note that our offices will be closed during the upcoming holidays. Online services will remain available.', '2025-05-08 14:35:21', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fixed_accounts`
--

CREATE TABLE `fixed_accounts` (
  `id` int(11) NOT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `deposit_amount` decimal(10,2) DEFAULT NULL,
  `interest_rate` decimal(5,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `maturity_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fixed_accounts`
--

INSERT INTO `fixed_accounts` (`id`, `account_number`, `deposit_amount`, `interest_rate`, `start_date`, `maturity_date`) VALUES
(4, '103', 10000.00, 2.00, '2025-04-13', '2025-10-13'),
(5, '327', 11800.00, 2.00, '2025-05-08', '2025-11-08'),
(6, '137', 1600.00, 2.50, '2025-05-12', '2025-11-12'),
(7, '364', 5000.00, 2.00, '2025-05-14', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `loan_id` int(11) NOT NULL,
  `loan_type_id` int(11) DEFAULT NULL,
  `interest_rate` decimal(5,2) DEFAULT NULL,
  `account_number` varchar(20) NOT NULL,
  `loan_description` text DEFAULT NULL,
  `loan_type` enum('Housing','Calamity','Educational') DEFAULT NULL,
  `loan_amount` decimal(15,2) DEFAULT NULL,
  `loan_term` int(11) DEFAULT NULL,
  `monthly_payment` decimal(15,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_payable` decimal(15,2) DEFAULT NULL,
  `remaining_balance` decimal(15,2) DEFAULT NULL,
  `loan_status` enum('pending','approved','rejected','active','completed','defaulted') DEFAULT 'pending',
  `approved_by` varchar(50) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`loan_id`, `loan_type_id`, `interest_rate`, `account_number`, `loan_description`, `loan_type`, `loan_amount`, `loan_term`, `monthly_payment`, `start_date`, `end_date`, `total_payable`, `remaining_balance`, `loan_status`, `approved_by`, `approved_date`, `created_at`, `updated_at`) VALUES
(8, 2, 4.50, '101', 'das', 'Housing', 5000.00, 24, 218.24, '2025-04-15', '2027-04-15', NULL, 0.00, 'completed', 'ae', '2025-04-15 19:31:43', '2025-04-15 11:31:40', '2025-04-15 11:38:04'),
(9, 1, 5.00, '101', 'dfsfs', 'Housing', 10000.00, 60, 188.71, '2025-04-15', '2030-04-15', NULL, 0.00, 'completed', 'ae', '2025-04-15 19:39:26', '2025-04-15 11:39:23', '2025-04-15 11:54:52'),
(10, 3, 7.50, '103', 'hfghgf', 'Educational', 10000.00, 36, 311.06, '2025-04-15', '2028-04-15', NULL, 0.00, 'completed', 'ae', '2025-04-15 19:55:40', '2025-04-15 11:55:38', '2025-04-15 14:11:03'),
(11, 3, 7.50, '102', 'kjhk', 'Housing', 10000.00, 36, 311.06, '2025-04-15', '2028-04-15', NULL, 2100.00, 'active', 'ae', '2025-04-15 19:56:10', '2025-04-15 11:56:08', '2025-04-15 14:25:55'),
(12, 4, 9.00, '103', 'mnmbn', 'Housing', 5000.00, 24, 228.42, '2025-04-15', '2027-04-15', NULL, 0.00, 'completed', 'ae', '2025-04-15 22:11:50', '2025-04-15 14:11:47', '2025-04-15 14:12:14'),
(13, 4, 9.00, '103', 'tert', 'Housing', 5000.00, 24, 228.42, '2025-04-15', '2027-04-15', NULL, NULL, 'active', 'ae', '2025-04-15 22:15:02', '2025-04-15 14:14:59', '2025-04-15 14:15:02'),
(14, 4, 9.00, '101', 'dsa', 'Housing', 5000.00, 24, 228.42, '2025-04-15', '2027-04-15', NULL, 0.00, 'completed', 'ae', '2025-04-15 22:23:14', '2025-04-15 14:23:11', '2025-04-17 01:31:36'),
(15, 4, 9.00, '101', 'hgfhfgh', 'Housing', 12000.00, 1, 12090.00, '2025-04-17', '2025-05-17', NULL, NULL, 'active', 'aa', '2025-04-17 09:32:40', '2025-04-17 01:32:37', '2025-04-17 01:32:40'),
(16, 1, 5.00, '101', 'dsa', 'Housing', 20000.00, 60, 377.42, '2025-05-07', '2030-05-07', NULL, NULL, 'rejected', 'admin', '2025-05-07 20:43:40', '2025-05-07 12:40:25', '2025-05-07 12:43:40');

-- --------------------------------------------------------

--
-- Table structure for table `loan_payments`
--

CREATE TABLE `loan_payments` (
  `id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `payment_amount` decimal(12,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `principal_amount` decimal(12,2) NOT NULL,
  `interest_amount` decimal(12,2) NOT NULL,
  `remaining_balance` decimal(12,2) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_payments`
--

INSERT INTO `loan_payments` (`id`, `loan_id`, `payment_amount`, `payment_date`, `principal_amount`, `interest_amount`, `remaining_balance`, `payment_method`, `remarks`, `created_at`, `created_by`) VALUES
(3, 8, 500.00, '2025-04-15 19:35:14', 500.00, 0.00, 4500.00, 'Cash', '', '2025-04-15 11:35:14', 'System'),
(4, 8, 500.00, '2025-04-15 19:36:17', 500.00, 0.00, 4000.00, 'Cash', '', '2025-04-15 11:36:17', 'System'),
(5, 8, 1000.00, '2025-04-15 19:36:26', 1000.00, 0.00, 3000.00, 'Cash', '', '2025-04-15 11:36:26', 'System'),
(6, 8, 1000.00, '2025-04-15 19:37:57', 1000.00, 0.00, 2000.00, 'Cash', '', '2025-04-15 11:37:57', 'System'),
(7, 8, 2000.00, '2025-04-15 19:38:04', 2000.00, 0.00, 0.00, 'Cash', '', '2025-04-15 11:38:04', 'System'),
(8, 9, 5000.00, '2025-04-15 19:40:01', 5000.00, 0.00, 5000.00, 'Cash', '', '2025-04-15 11:40:01', 'System'),
(12, 9, 5000.00, '2025-04-15 19:54:52', 5000.00, 0.00, 0.00, 'Cash', '', '2025-04-15 11:54:52', 'System'),
(13, 11, 5900.00, '2025-04-15 22:10:14', 5900.00, 0.00, 4100.00, 'Cash', 'dfsfd', '2025-04-15 14:10:14', 'System'),
(14, 10, 10000.00, '2025-04-15 22:11:03', 10000.00, 0.00, 0.00, 'Cash', '', '2025-04-15 14:11:03', 'System'),
(15, 12, 5000.00, '2025-04-15 22:12:14', 5000.00, 0.00, 0.00, 'Cash', '', '2025-04-15 14:12:14', 'System'),
(16, 14, 1000.00, '2025-04-15 22:23:40', 1000.00, 0.00, 4000.00, 'Cash', '', '2025-04-15 14:23:40', 'System'),
(17, 14, 2000.00, '2025-04-15 22:23:58', 2000.00, 0.00, 2000.00, 'Cash', '', '2025-04-15 14:23:58', 'System'),
(18, 11, 2000.00, '2025-04-15 22:25:55', 2000.00, 0.00, 2100.00, 'Cash', '', '2025-04-15 14:25:55', 'System'),
(19, 14, 2000.00, '2025-04-17 09:31:36', 2000.00, 0.00, 0.00, 'Cash', '', '2025-04-17 01:31:36', 'System');

-- --------------------------------------------------------

--
-- Table structure for table `loan_types`
--

CREATE TABLE `loan_types` (
  `id` int(11) NOT NULL,
  `loan_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  `interest_type` enum('monthly','yearly') NOT NULL,
  `max_term` int(11) NOT NULL,
  `min_amount` decimal(12,2) NOT NULL,
  `max_amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_types`
--

INSERT INTO `loan_types` (`id`, `loan_name`, `description`, `interest_rate`, `interest_type`, `max_term`, `min_amount`, `max_amount`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Educational Loan', 'For educational expenses such as tuition fees, books, etc.', 5.00, 'yearly', 60, 5000.00, 100000.00, '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(2, 'Calamity Loan', 'For recovery from natural disasters and emergencies', 4.50, 'yearly', 24, 3000.00, 50000.00, '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(3, 'Business Loan', 'For small business startup or expansion', 7.50, 'yearly', 36, 10000.00, 200000.00, '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(4, 'Personal Loan', 'For personal needs and expenses', 9.00, 'yearly', 24, 5000.00, 100000.00, '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(5, 'Housing Loan', 'For house construction, purchase or renovation', 6.50, 'yearly', 120, 50000.00, 500000.00, '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `lastname` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `birthday` date NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `account_type` enum('Savings','Time Deposit','Fixed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `account_number` varchar(20) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `balance` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `user_id`, `profile_picture`, `lastname`, `firstname`, `middlename`, `sex`, `birthday`, `contact`, `address`, `account_type`, `created_at`, `updated_at`, `account_number`, `status`, `balance`) VALUES
(9, NULL, 'uploads/Rai.jpg', 'Balde', 'Railey', 'Lizarondo', 'Male', '2004-10-05', '09426994734', 'Marilao, Bulacan', 'Savings', '2025-04-13 01:43:37', '2025-04-17 15:46:57', '101', 'Active', 10050.00),
(10, NULL, 'uploads/lans.jpg', 'Hermogenes', 'Lance', 'Batista', 'Male', '2004-10-30', '0942699463', 'Sta. Maria, Bulacan', 'Time Deposit', '2025-04-13 01:45:11', '2025-04-15 14:25:55', '102', 'Active', 3000.00),
(11, NULL, 'uploads/rg.jpg', 'Gatmaitan', 'Ralf Gett', 'Bautsita', 'Male', '2004-10-08', '09428994734', 'San Rafael, Bulacan', 'Fixed', '2025-04-13 01:46:31', '2025-04-17 15:47:18', '103', 'Active', 10000.00),
(14, 16, 'uploads/67fe71b057b52.jpg', 'Eusebio', 'Kurt', 'Yanzie', 'Male', '2006-10-05', '09426294634', 'Valenzuela City', 'Fixed', '2025-05-08 14:09:32', '2025-05-14 05:59:18', '327', 'Active', 12800.00),
(16, 29, 'uploads/6820c2c15dc1d.png', 'az', 'az', 'az', 'Male', '2004-10-05', '09426994634', 'sasasas', 'Savings', '2025-05-11 15:31:42', '2025-05-14 06:00:43', '364', 'Active', 5095.00),
(29, 37, 'uploads/6820dcb036817.jpg', 'ax', 'ax', 'ax', 'Male', '2004-10-05', '32', 'dsdsds', 'Savings', '2025-05-11 17:22:04', '2025-05-14 14:58:07', '137', 'Active', 4650.00);

-- --------------------------------------------------------

--
-- Table structure for table `member_applications`
--

CREATE TABLE `member_applications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `birthday` date NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `account_type` enum('Savings','Time Deposit','Fixed') NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `remarks` text DEFAULT NULL,
  `date_applied` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_processed` timestamp NULL DEFAULT NULL,
  `processed_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_applications`
--

INSERT INTO `member_applications` (`id`, `user_id`, `account_number`, `lastname`, `firstname`, `middlename`, `sex`, `birthday`, `contact`, `address`, `account_type`, `status`, `remarks`, `date_applied`, `date_processed`, `processed_by`) VALUES
(5, 29, '364', 'az', 'az', 'az', 'Male', '2004-10-05', '09426994634', 'sasasas', 'Savings', 'Approved', '', '2025-05-11 15:31:28', '2025-05-11 15:31:42', 'admin'),
(13, 37, '137', 'ax', 'ax', 'ax', 'Male', '2004-10-05', '32', 'dsdsds', 'Savings', 'Approved', '', '2025-05-11 17:21:57', '2025-05-11 17:22:04', 'ae'),
(14, 38, '444', 'sasa', 'sasa', 'sasa', 'Male', '2004-10-05', '0942699463234', 'aww', 'Time Deposit', 'Pending', NULL, '2025-05-12 05:54:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `full_name`, `email`, `message`, `created_at`) VALUES
(1, 'Railey', 'railey.balde100@gmail.com', 'vfdg', '2025-03-12 13:51:44'),
(2, 'fsdf', 'sdfsdf@gmail.com', 'sdfsdf', '2025-04-13 15:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `notification_type` enum('payment_reminder','overdue_account','system_error') NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `account_number`, `notification_type`, `message`, `is_read`, `created_at`) VALUES
(2, '364', '', 'Welcome to our cooperative! Your membership application has been approved. Your account is now active.', 1, '2025-05-11 15:31:42'),
(3, '755', '', 'Welcome to our cooperative! Your membership application has been approved. Your account is now active.', 0, '2025-05-11 16:12:56'),
(4, '321', '', 'Welcome to our cooperative! Your membership application has been approved. Your account is now active.', 0, '2025-05-11 16:23:33'),
(5, '642', '', 'Welcome to our cooperative! Your membership application has been approved. Your account is now active.', 0, '2025-05-11 16:31:59'),
(6, '171', '', 'Welcome to our cooperative! Your membership application has been approved. Your account is now active.', 0, '2025-05-11 16:55:04'),
(7, '462', '', 'Welcome to our cooperative! Your membership application has been approved. Your account is now active.', 0, '2025-05-11 16:57:58'),
(8, '185', '', 'Welcome to our cooperative! Your membership application has been approved. Your account is now active.', 0, '2025-05-11 17:12:44'),
(9, '562', '', 'Welcome to our cooperative! Your membership application has been approved. Your account is now active.', 0, '2025-05-11 17:16:22'),
(10, '137', '', 'Welcome to our cooperative! Your membership application has been approved. Your account is now active.', 1, '2025-05-11 17:22:04'),
(11, '102', 'payment_reminder', 'Payment reminder: Your monthly loan payment of ₱311.06 is due on May 15, 2025 for Loan #11', 1, '2025-05-11 17:34:35'),
(12, '103', 'payment_reminder', 'Payment reminder: Your monthly loan payment of ₱228.42 is due on May 15, 2025 for Loan #13', 1, '2025-05-11 17:34:35'),
(13, '101', 'payment_reminder', 'Payment reminder: Your monthly loan payment of ₱12,090.00 is due on May 17, 2025 for Loan #15', 1, '2025-05-11 17:34:35'),
(14, 'ADMIN', 'system_error', 'Unauthorized access attempt to db_backup.php by user: ae', 0, '2025-05-12 01:50:34'),
(15, 'ADMIN', 'system_error', 'Unauthorized access attempt to db_backup.php by user: ae', 0, '2025-05-12 01:55:17'),
(16, '101', '', 'dsadsa', 0, '2025-05-12 02:22:05'),
(17, '102', '', 'dsadsa', 0, '2025-05-12 02:22:05'),
(18, '103', '', 'dsadsa', 0, '2025-05-12 02:22:05'),
(21, '364', '', 'dsadsa', 0, '2025-05-12 02:22:05'),
(34, 'ADMIN', 'system_error', 'Unauthorized access attempt to db_backup.php by user: ae', 0, '2025-05-12 04:06:22'),
(35, 'ADMIN', 'system_error', 'Unauthorized access attempt to db_backup.php by user: ae', 0, '2025-05-12 04:06:37'),
(36, '101', '', 'hi', 0, '2025-05-12 04:21:24'),
(41, '364', '', 'hi', 0, '2025-05-12 04:21:24'),
(42, '101', '', 'aa', 0, '2025-05-12 05:05:47'),
(43, '102', '', 'aa', 0, '2025-05-12 05:05:47'),
(44, '103', '', 'aa', 0, '2025-05-12 05:05:47'),
(45, '137', '', 'aa', 0, '2025-05-12 05:05:47'),
(47, '364', '', 'aa', 1, '2025-05-12 05:05:47'),
(48, 'ADMIN', 'system_error', 'Unauthorized access attempt to db_backup.php by user: ae', 0, '2025-05-12 10:09:07');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expiry` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permission_id` int(11) NOT NULL,
  `permission_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permission_id`, `permission_name`, `description`, `created_at`) VALUES
(1, 'user_management', 'Manage user accounts', '2025-04-17 05:41:47'),
(2, 'member_management', 'Manage member accounts', '2025-04-17 05:41:47'),
(3, 'transactions', 'Process financial transactions', '2025-04-17 05:41:47'),
(4, 'loans', 'Manage loan applications and approvals', '2025-04-17 05:41:47'),
(5, 'reports', 'Access and generate reports', '2025-04-17 05:41:47'),
(6, 'admin_system', 'Access system administration features', '2025-04-17 05:41:47'),
(7, 'user_view', 'View user accounts', '2025-04-17 05:42:27'),
(8, 'user_add', 'Add new user accounts', '2025-04-17 05:42:27'),
(9, 'user_edit', 'Edit user accounts', '2025-04-17 05:42:27'),
(10, 'user_delete', 'Delete user accounts', '2025-04-17 05:42:27'),
(11, 'member_view', 'View member accounts', '2025-04-17 05:42:27'),
(12, 'member_add', 'Add new member accounts', '2025-04-17 05:42:27'),
(13, 'member_edit', 'Edit member accounts', '2025-04-17 05:42:27'),
(14, 'member_delete', 'Delete member accounts', '2025-04-17 05:42:27'),
(15, 'transaction_view', 'View transactions', '2025-04-17 05:42:27'),
(16, 'transaction_deposit', 'Process deposits', '2025-04-17 05:42:27'),
(17, 'transaction_withdraw', 'Process withdrawals', '2025-04-17 05:42:27'),
(18, 'loan_view', 'View loan applications', '2025-04-17 05:42:27'),
(19, 'loan_add', 'Create loan applications', '2025-04-17 05:42:27'),
(20, 'loan_approve', 'Approve loan applications', '2025-04-17 05:42:27'),
(21, 'loan_reject', 'Reject loan applications', '2025-04-17 05:42:27'),
(22, 'loan_payment', 'Process loan payments', '2025-04-17 05:42:27'),
(23, 'report_view', 'View financial reports', '2025-04-17 05:42:27'),
(24, 'report_generate', 'Generate financial reports', '2025-04-17 05:42:27'),
(25, 'system_backup', 'Manage database backups', '2025-04-17 05:42:27'),
(26, 'system_settings', 'Manage system settings', '2025-04-17 05:42:27'),
(27, 'notification_manage', 'Manage notifications', '2025-04-17 05:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator with full access', '2025-04-17 05:41:47', '2025-04-17 05:41:47'),
(4, 'member', 'Basic member access', '2025-04-17 05:41:47', '2025-04-17 05:41:47');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`, `created_at`) VALUES
(1, 1, 6, '2025-04-17 05:41:47'),
(2, 1, 4, '2025-04-17 05:41:47'),
(3, 1, 2, '2025-04-17 05:41:47'),
(4, 1, 5, '2025-04-17 05:41:47'),
(5, 1, 3, '2025-04-17 05:41:47'),
(20, 1, 19, '2025-04-17 06:33:05'),
(21, 1, 20, '2025-04-17 06:33:05'),
(22, 1, 22, '2025-04-17 06:33:05'),
(23, 1, 21, '2025-04-17 06:33:05'),
(24, 1, 18, '2025-04-17 06:33:05'),
(25, 1, 12, '2025-04-17 06:33:05'),
(26, 1, 14, '2025-04-17 06:33:05'),
(27, 1, 13, '2025-04-17 06:33:05'),
(29, 1, 11, '2025-04-17 06:33:05'),
(30, 1, 27, '2025-04-17 06:33:05'),
(32, 1, 24, '2025-04-17 06:33:05'),
(33, 1, 23, '2025-04-17 06:33:05'),
(34, 1, 25, '2025-04-17 06:33:05'),
(35, 1, 26, '2025-04-17 06:33:05'),
(37, 1, 16, '2025-04-17 06:33:05'),
(38, 1, 15, '2025-04-17 06:33:05'),
(39, 1, 17, '2025-04-17 06:33:05'),
(40, 1, 8, '2025-04-17 06:33:05'),
(41, 1, 10, '2025-04-17 06:33:05'),
(42, 1, 9, '2025-04-17 06:33:05'),
(44, 1, 7, '2025-04-17 06:33:05'),
(13890, 1, 1, '2025-05-10 12:15:54');

-- --------------------------------------------------------

--
-- Table structure for table `savings_accounts`
--

CREATE TABLE `savings_accounts` (
  `id` int(11) NOT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `deposit_amount` decimal(10,2) DEFAULT NULL,
  `opening_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `savings_accounts`
--

INSERT INTO `savings_accounts` (`id`, `account_number`, `deposit_amount`, `opening_date`) VALUES
(5, '101', 10050.00, '2025-04-13'),
(8, '364', 95.00, '2025-05-11'),
(25, '137', 4650.00, '2025-05-12'),
(26, '327', 1000.00, '2025-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `time_slot` varchar(50) NOT NULL,
  `day` varchar(50) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `activity` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `time_slot`, `day`, `subject`, `activity`, `user_id`) VALUES
(1, '7:00AM-7:30AM', 'Monday', 'dsadas', 'dsadsa', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `time_deposits`
--

CREATE TABLE `time_deposits` (
  `id` int(11) NOT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `deposit_amount` decimal(10,2) DEFAULT NULL,
  `interest_rate` float NOT NULL,
  `maturity_date` date DEFAULT NULL,
  `start_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time_deposits`
--

INSERT INTO `time_deposits` (`id`, `account_number`, `deposit_amount`, `interest_rate`, `maturity_date`, `start_date`) VALUES
(4, '102', 3000.00, 0, '2025-04-13', '2025-05-12 23:06:24'),
(5, '137', 1100.00, 2.5, '2026-05-12', '2025-05-12 23:06:24');

-- --------------------------------------------------------

--
-- Table structure for table `time_deposit_rates`
--

CREATE TABLE `time_deposit_rates` (
  `id` int(11) NOT NULL,
  `term_months` int(11) NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  `min_amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time_deposit_rates`
--

INSERT INTO `time_deposit_rates` (`id`, `term_months`, `interest_rate`, `min_amount`, `created_at`, `updated_at`, `status`) VALUES
(1, 3, 2.50, 5000.00, '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(2, 6, 3.25, 5000.00, '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(3, 12, 4.00, 10000.00, '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(4, 24, 4.50, 10000.00, '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(5, 36, 5.00, 20000.00, '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `transaction_type` enum('Deposit','Withdrawal','Loan Payment','Loan Disbursement','Time Deposit') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `account_number`, `transaction_type`, `amount`, `balance`, `notes`, `transaction_date`) VALUES
(1, '101', 'Withdrawal', 50.00, NULL, NULL, '2025-04-14 05:32:10'),
(2, '101', 'Deposit', 50.00, NULL, NULL, '2025-04-14 10:48:42'),
(3, '101', 'Withdrawal', 100.00, NULL, NULL, '2025-04-14 10:49:10'),
(4, '101', 'Deposit', 50.00, 1050.00, '', '2025-04-14 15:37:25'),
(5, '102', 'Withdrawal', 100.00, 900.00, '', '2025-04-14 15:46:55'),
(6, '101', 'Deposit', 200.00, 1250.00, '', '2025-04-14 15:47:20'),
(7, '101', 'Loan Disbursement', 12.00, 1262.00, 'Loan approved by: ae', '2025-04-15 04:40:04'),
(8, '102', 'Loan Disbursement', 15000.00, 15900.00, 'Loan ID: 7 disbursement', '2025-04-15 04:56:04'),
(9, '101', 'Loan Payment', 1.00, 1261.00, 'Loan ID: 6', '2025-04-15 11:30:42'),
(10, '101', 'Loan Payment', 11.00, 1250.00, 'Loan ID: 6', '2025-04-15 11:31:00'),
(11, '101', 'Loan Disbursement', 5000.00, 6250.00, 'Loan ID: 8 disbursement', '2025-04-15 11:31:43'),
(12, '101', 'Loan Payment', 500.00, 6250.00, 'Loan ID: 8', '2025-04-15 11:35:14'),
(13, '101', 'Loan Payment', 500.00, 6250.00, 'Loan ID: 8', '2025-04-15 11:36:17'),
(14, '101', 'Loan Payment', 1000.00, 6250.00, 'Loan ID: 8', '2025-04-15 11:36:26'),
(15, '101', 'Loan Payment', 1000.00, 5250.00, 'Loan ID: 8', '2025-04-15 11:37:57'),
(16, '101', 'Loan Payment', 2000.00, 3250.00, 'Loan ID: 8', '2025-04-15 11:38:04'),
(17, '101', 'Loan Disbursement', 10000.00, 13250.00, 'Loan ID: 9 disbursement', '2025-04-15 11:39:26'),
(18, '101', 'Loan Payment', 5000.00, 8250.00, 'Loan ID: 9', '2025-04-15 11:40:01'),
(19, '102', 'Loan Payment', 10000.00, 5900.00, 'Loan ID: 7', '2025-04-15 11:51:21'),
(20, '102', 'Loan Payment', 2500.00, 3400.00, 'Loan ID: 7', '2025-04-15 11:51:33'),
(21, '102', 'Loan Payment', 2500.00, 900.00, 'Loan ID: 7', '2025-04-15 11:51:37'),
(22, '101', 'Loan Payment', 5000.00, 3250.00, 'Loan ID: 9', '2025-04-15 11:54:52'),
(23, '103', 'Loan Disbursement', 10000.00, 13000.00, 'Loan ID: 10 disbursement', '2025-04-15 11:55:40'),
(24, '102', 'Loan Disbursement', 10000.00, 10900.00, 'Loan ID: 11 disbursement', '2025-04-15 11:56:10'),
(25, '102', 'Loan Payment', 5900.00, 5000.00, 'dfsfd', '2025-04-15 14:10:14'),
(26, '103', 'Loan Payment', 10000.00, 3000.00, 'Loan ID: 10', '2025-04-15 14:11:03'),
(27, '103', 'Loan Disbursement', 5000.00, 8000.00, 'Loan ID: 12 disbursement', '2025-04-15 14:11:50'),
(28, '103', 'Loan Payment', 5000.00, 3000.00, 'Loan ID: 12', '2025-04-15 14:12:14'),
(29, '103', 'Loan Disbursement', 5000.00, 8000.00, 'Loan ID: 13 disbursement', '2025-04-15 14:15:02'),
(30, '101', 'Loan Disbursement', 5000.00, 8250.00, 'Loan ID: 14 disbursement', '2025-04-15 14:23:14'),
(31, '101', 'Loan Payment', 1000.00, 7250.00, 'Loan ID: 14', '2025-04-15 14:23:40'),
(32, '101', 'Loan Payment', 2000.00, 5250.00, 'Loan ID: 14', '2025-04-15 14:23:58'),
(33, '101', 'Withdrawal', 1000.00, 4250.00, '', '2025-04-15 14:24:25'),
(34, '102', 'Loan Payment', 2000.00, 3000.00, 'Loan ID: 11', '2025-04-15 14:25:55'),
(35, '101', 'Loan Payment', 2000.00, 2250.00, 'Loan ID: 14', '2025-04-17 01:31:36'),
(36, '101', 'Loan Disbursement', 12000.00, 14250.00, 'Loan ID: 15 disbursement', '2025-04-17 01:32:40'),
(37, '101', 'Withdrawal', 4200.00, 10050.00, '', '2025-04-17 15:46:57'),
(38, '103', 'Deposit', 2000.00, 10000.00, '', '2025-04-17 15:47:18'),
(44, '327', 'Deposit', 12000.00, 12000.00, '', '2025-05-08 14:09:41'),
(48, '327', 'Withdrawal', 200.00, 11800.00, '', '2025-05-08 16:14:49'),
(49, '364', 'Deposit', 100.00, 100.00, '', '2025-05-11 15:34:15'),
(50, '137', 'Deposit', 5.00, 4650.00, '', '2025-05-12 15:11:03'),
(51, '137', 'Deposit', 5.00, 4650.00, 'Savings Account Opening', '2025-05-12 15:12:59'),
(52, '137', '', 500.00, 4650.00, '', '2025-05-13 14:39:19'),
(53, '137', '', 5.00, 4650.00, '', '2025-05-13 17:13:03'),
(54, '137', '', 15.00, 4650.00, '', '2025-05-14 00:59:12'),
(55, '364', '', 5.00, 95.00, '', '2025-05-14 01:45:32'),
(56, '137', '', 10.00, 4650.00, '', '2025-05-14 02:00:38'),
(57, '137', '', 50.00, 4650.00, '', '2025-05-14 02:01:07'),
(58, '137', '', 40.00, 4650.00, '', '2025-05-14 02:16:29'),
(59, '137', '', 100.00, 4650.00, '', '2025-05-14 02:23:03'),
(60, '137', '', 100.00, 4650.00, '', '2025-05-14 02:27:46'),
(61, '137', '', 100.00, 4650.00, '', '2025-05-14 04:37:49'),
(62, '137', '', 100.00, 4650.00, '', '2025-05-14 07:18:35'),
(63, '137', '', 100.00, 4650.00, '', '2025-05-14 14:35:51'),
(64, '137', '', 50.00, 4650.00, '', '2025-05-14 14:36:37'),
(65, '137', '', 50.00, 4650.00, '', '2025-05-14 14:52:23'),
(66, '137', '', 50.00, 4650.00, '', '2025-05-14 14:53:13');

-- --------------------------------------------------------

--
-- Table structure for table `useradd`
--

CREATE TABLE `useradd` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `useradd`
--

INSERT INTO `useradd` (`id`, `full_name`, `email`, `username`, `password`, `user_id`) VALUES
(14, 'Railey Balde', 'railey.balde100@gmail.com', 'railiz123', '$2y$10$HthKhUCrC5KkI5zw2XevDeNeCOH9TgRRHmI0A5pGPJBwZtM3Bo2Hy', NULL),
(15, 'Lans Hermojins', 'lans@gmail.com', 'lans123', '$2y$10$6UDCOfjZkMISjBTWoStpMeuMiNoqXjEiK.bDasjJUVDCgv3XVdVmu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userprof`
--

CREATE TABLE `userprof` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT 'default.png',
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `birthday` date NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userprof`
--

INSERT INTO `userprof` (`id`, `user_id`, `profile_picture`, `lastname`, `firstname`, `middlename`, `sex`, `birthday`, `contact`, `address`, `created_at`) VALUES
(10, NULL, 'uploads/Rai.jpg', 'Balde', 'Raileyy', 'Lizarondo', 'Male', '2004-10-05', '09426994734', 'Marilao, Bulacan', '2025-03-12 13:35:34'),
(25, 15, 'uploads/stglogo.jpg', 'ae', 'ae', 'ae', 'Male', '2003-10-07', '09426994745', 'Marilao, Bulacann', '2025-04-14 10:09:45'),
(26, 16, 'uploads/67fe71b057b52.jpg', 'Eusebio', 'Kurt', 'Yanzie', 'Male', '2006-10-05', '09426294634', 'Valenzuela City', '2025-04-15 14:48:16'),
(28, 18, 'uploads/68009474702f3.jpg', 'admin', 'admin', 'admin', 'Male', '2004-10-05', '09426994735', 'Marilao, Bulacan', '2025-04-17 05:41:08'),
(35, 29, 'uploads/6820c2c15dc1d.png', 'az', 'az', 'az', 'Male', '2004-10-05', '09426994634', 'sasasas', '2025-05-11 15:31:13'),
(44, 37, 'uploads/6820dcb036817.jpg', 'ax', 'ax', 'ax', 'Male', '2004-10-05', '32', 'dsdsds', '2025-05-11 17:21:52'),
(45, 38, 'uploads/68218d16ac10c.png', 'sasa', 'sasa', 'sasa', 'Male', '2004-10-05', '0942699463234', 'aww', '2025-05-12 05:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `usersignup`
--

CREATE TABLE `usersignup` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_created` tinyint(1) DEFAULT 0,
  `member_created` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usersignup`
--

INSERT INTO `usersignup` (`id`, `fullname`, `email`, `username`, `password`, `profile_created`, `member_created`) VALUES
(1, 'RaileyBalde', 'railey@gmail.com', 'sasas', '$2y$10$TUQY02iNO.OeSA5ZgGXLYuERatsnHkfKihWHcSz5ZZKNjkhpHtQ7y', 0, 0),
(15, 'Andrei', 'a@gmail.com', 'ae', '$2y$10$DOA.70srbEBUFw4Qa5f3GecLdLtNuLU1J4k8tMhC2Lp59JLEKx3Ma', 1, 0),
(16, 'aa', 'aq@gmail.com', 'aa', '$2y$10$kEsj03mNj8fJWA0/5.xF2exCxsGw8sIUR1PwoxJEUF.LzyiGLrYPC', 1, 1),
(18, 'password nito is admin123', 'admin@gmail.com', 'admin', '$2y$10$jLHrlUqbjkNHebrD2oqxd.uNx3p977NwLSZE0pkiHhLTifZfgGora', 1, 1),
(29, 'az', 'malikhaingpinay@gmail.com', 'az', '$2y$10$XiGsLY/DxnDjII97/jLXJuiQlxtn4dXN.usLjUFhX45QUybFaC1WO', 1, 1),
(37, 'ax', 'shoestogo100@gmail.com', 'ax', '$2y$10$4bZimuTmE4Df9Tp/cK.HieuceCBWSAbAuQ5t9NG5J40f1xkPzZ6Sa', 1, 1),
(38, 'sdsds', 'railey.balde@gmail.com', 'sasa', '$2y$10$VJzB/CSdtVL3jq7uNKatA.zCx7kPsvfsXoWj.l6jBk2hCzMNfw8qK', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `user_id`, `role_id`, `created_at`) VALUES
(1, 18, 1, '2025-04-17 05:41:47'),
(266, 16, 4, '2025-05-08 13:51:33'),
(657, 29, 4, '2025-05-11 15:35:39'),
(763, 37, 4, '2025-05-11 17:23:03'),
(862, 15, 1, '2025-05-12 03:40:37'),
(1241, 38, 4, '2025-05-14 05:59:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_activity_log`
--
ALTER TABLE `admin_activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `activity_type` (`activity_type`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fixed_accounts`
--
ALTER TABLE `fixed_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_number` (`account_number`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`loan_id`),
  ADD KEY `account_number` (`account_number`),
  ADD KEY `loan_type_id` (`loan_type_id`);

--
-- Indexes for table `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_id` (`loan_id`);

--
-- Indexes for table `loan_types`
--
ALTER TABLE `loan_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_number_2` (`account_number`),
  ADD KEY `account_number` (`account_number`);

--
-- Indexes for table `member_applications`
--
ALTER TABLE `member_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_pending_user` (`user_id`,`status`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD UNIQUE KEY `permission_name` (`permission_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_permission_unique` (`role_id`,`permission_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `savings_accounts`
--
ALTER TABLE `savings_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_number` (`account_number`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `time_deposits`
--
ALTER TABLE `time_deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_number` (`account_number`);

--
-- Indexes for table `time_deposit_rates`
--
ALTER TABLE `time_deposit_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_number` (`account_number`);

--
-- Indexes for table `useradd`
--
ALTER TABLE `useradd`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `userprof`
--
ALTER TABLE `userprof`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact` (`contact`);

--
-- Indexes for table `usersignup`
--
ALTER TABLE `usersignup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_role_unique` (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_activity_log`
--
ALTER TABLE `admin_activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fixed_accounts`
--
ALTER TABLE `fixed_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `loan_payments`
--
ALTER TABLE `loan_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `loan_types`
--
ALTER TABLE `loan_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `member_applications`
--
ALTER TABLE `member_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7861;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2812;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38030;

--
-- AUTO_INCREMENT for table `savings_accounts`
--
ALTER TABLE `savings_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `time_deposits`
--
ALTER TABLE `time_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `time_deposit_rates`
--
ALTER TABLE `time_deposit_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `useradd`
--
ALTER TABLE `useradd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `userprof`
--
ALTER TABLE `userprof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `usersignup`
--
ALTER TABLE `usersignup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1320;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fixed_accounts`
--
ALTER TABLE `fixed_accounts`
  ADD CONSTRAINT `fixed_accounts_ibfk_1` FOREIGN KEY (`account_number`) REFERENCES `members` (`account_number`);

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`account_number`) REFERENCES `members` (`account_number`),
  ADD CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`loan_type_id`) REFERENCES `loan_types` (`id`);

--
-- Constraints for table `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD CONSTRAINT `loan_payments_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`loan_id`) ON DELETE CASCADE;

--
-- Constraints for table `member_applications`
--
ALTER TABLE `member_applications`
  ADD CONSTRAINT `member_applications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usersignup` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`) ON DELETE CASCADE;

--
-- Constraints for table `savings_accounts`
--
ALTER TABLE `savings_accounts`
  ADD CONSTRAINT `savings_accounts_ibfk_1` FOREIGN KEY (`account_number`) REFERENCES `members` (`account_number`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usersignup` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `time_deposits`
--
ALTER TABLE `time_deposits`
  ADD CONSTRAINT `time_deposits_ibfk_1` FOREIGN KEY (`account_number`) REFERENCES `members` (`account_number`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_number`) REFERENCES `members` (`account_number`) ON DELETE CASCADE;

--
-- Constraints for table `useradd`
--
ALTER TABLE `useradd`
  ADD CONSTRAINT `useradd_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usersignup` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usersignup` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
