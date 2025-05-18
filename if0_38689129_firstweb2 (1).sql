-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql200.infinityfree.com
-- Generation Time: May 18, 2025 at 09:45 AM
-- Server version: 10.6.19-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_38689129_firstweb2`
--

-- --------------------------------------------------------

--
-- Table structure for table `email_verification`
--

CREATE TABLE `email_verification` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(6) NOT NULL,
  `expires_at` datetime NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `hashed_password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_verification`
--

INSERT INTO `email_verification` (`id`, `email`, `otp`, `expires_at`, `fullname`, `username`, `hashed_password`) VALUES
(1, 'railey.balde100@gmail.com', '203690', '2025-03-23 07:52:26', 'raileybalde', 'ra', '$2y$10$/gClKwR0uQCS/UIYFox9Quj5XenpBgxQps.Dp3Ng5OK2MQYph6jsq'),
(2, 'railey.balde100@gmail.com', '757718', '2025-03-23 07:52:54', 'raileybalde', 'ra', '$2y$10$UgaC3Ju5.xVnLsvA2LSTOeCPLOV.kwTvdj4CDDS9uijpVzdTTMpFW');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_accounts`
--

CREATE TABLE `fixed_accounts` (
  `id` int(11) NOT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `deposit_amount` decimal(10,2) DEFAULT NULL,
  `interest_rate` decimal(5,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fixed_accounts`
--

INSERT INTO `fixed_accounts` (`id`, `account_number`, `deposit_amount`, `interest_rate`, `start_date`) VALUES
(4, '103', '15000.00', '2.00', '2025-04-13');

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
(8, 2, '4.50', '101', 'das', 'Housing', '5000.00', 24, '218.24', '2025-04-15', '2027-04-15', NULL, '0.00', 'completed', 'ae', '2025-04-15 19:31:43', '2025-04-15 11:31:40', '2025-04-15 11:38:04'),
(9, 1, '5.00', '101', 'dfsfs', 'Housing', '10000.00', 60, '188.71', '2025-04-15', '2030-04-15', NULL, '0.00', 'completed', 'ae', '2025-04-15 19:39:26', '2025-04-15 11:39:23', '2025-04-15 11:54:52'),
(10, 3, '7.50', '103', 'hfghgf', 'Educational', '10000.00', 36, '311.06', '2025-04-15', '2028-04-15', NULL, '0.00', 'completed', 'ae', '2025-04-15 19:55:40', '2025-04-15 11:55:38', '2025-04-15 14:11:03'),
(11, 3, '7.50', '102', 'kjhk', 'Housing', '10000.00', 36, '311.06', '2025-04-15', '2028-04-15', NULL, '2100.00', 'active', 'ae', '2025-04-15 19:56:10', '2025-04-15 11:56:08', '2025-04-15 14:25:55'),
(12, 4, '9.00', '103', 'mnmbn', 'Housing', '5000.00', 24, '228.42', '2025-04-15', '2027-04-15', NULL, '0.00', 'completed', 'ae', '2025-04-15 22:11:50', '2025-04-15 14:11:47', '2025-04-15 14:12:14'),
(13, 4, '9.00', '103', 'tert', 'Housing', '5000.00', 24, '228.42', '2025-04-15', '2027-04-15', NULL, NULL, 'active', 'ae', '2025-04-15 22:15:02', '2025-04-15 14:14:59', '2025-04-15 14:15:02'),
(14, 4, '9.00', '101', 'dsa', 'Housing', '5000.00', 24, '228.42', '2025-04-15', '2027-04-15', NULL, '0.00', 'completed', 'ae', '2025-04-15 22:23:14', '2025-04-15 14:23:11', '2025-04-17 01:31:36'),
(15, 4, '9.00', '101', 'hgfhfgh', 'Housing', '12000.00', 1, '12090.00', '2025-04-17', '2025-05-17', NULL, NULL, 'active', 'aa', '2025-04-17 09:32:40', '2025-04-17 01:32:37', '2025-04-17 01:32:40');

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
(3, 8, '500.00', '2025-04-15 19:35:14', '500.00', '0.00', '4500.00', 'Cash', '', '2025-04-15 11:35:14', 'System'),
(4, 8, '500.00', '2025-04-15 19:36:17', '500.00', '0.00', '4000.00', 'Cash', '', '2025-04-15 11:36:17', 'System'),
(5, 8, '1000.00', '2025-04-15 19:36:26', '1000.00', '0.00', '3000.00', 'Cash', '', '2025-04-15 11:36:26', 'System'),
(6, 8, '1000.00', '2025-04-15 19:37:57', '1000.00', '0.00', '2000.00', 'Cash', '', '2025-04-15 11:37:57', 'System'),
(7, 8, '2000.00', '2025-04-15 19:38:04', '2000.00', '0.00', '0.00', 'Cash', '', '2025-04-15 11:38:04', 'System'),
(8, 9, '5000.00', '2025-04-15 19:40:01', '5000.00', '0.00', '5000.00', 'Cash', '', '2025-04-15 11:40:01', 'System'),
(12, 9, '5000.00', '2025-04-15 19:54:52', '5000.00', '0.00', '0.00', 'Cash', '', '2025-04-15 11:54:52', 'System'),
(13, 11, '5900.00', '2025-04-15 22:10:14', '5900.00', '0.00', '4100.00', 'Cash', 'dfsfd', '2025-04-15 14:10:14', 'System'),
(14, 10, '10000.00', '2025-04-15 22:11:03', '10000.00', '0.00', '0.00', 'Cash', '', '2025-04-15 14:11:03', 'System'),
(15, 12, '5000.00', '2025-04-15 22:12:14', '5000.00', '0.00', '0.00', 'Cash', '', '2025-04-15 14:12:14', 'System'),
(16, 14, '1000.00', '2025-04-15 22:23:40', '1000.00', '0.00', '4000.00', 'Cash', '', '2025-04-15 14:23:40', 'System'),
(17, 14, '2000.00', '2025-04-15 22:23:58', '2000.00', '0.00', '2000.00', 'Cash', '', '2025-04-15 14:23:58', 'System'),
(18, 11, '2000.00', '2025-04-15 22:25:55', '2000.00', '0.00', '2100.00', 'Cash', '', '2025-04-15 14:25:55', 'System'),
(19, 14, '2000.00', '2025-04-17 09:31:36', '2000.00', '0.00', '0.00', 'Cash', '', '2025-04-17 01:31:36', 'System');

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
(1, 'Educational Loan', 'For educational expenses such as tuition fees, books, etc.', '5.00', 'yearly', 60, '5000.00', '100000.00', '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(2, 'Calamity Loan', 'For recovery from natural disasters and emergencies', '4.50', 'yearly', 24, '3000.00', '50000.00', '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(3, 'Business Loan', 'For small business startup or expansion', '7.50', 'yearly', 36, '10000.00', '200000.00', '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(4, 'Personal Loan', 'For personal needs and expenses', '9.00', 'yearly', 24, '5000.00', '100000.00', '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(5, 'Housing Loan', 'For house construction, purchase or renovation', '6.50', 'yearly', 120, '50000.00', '500000.00', '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
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

INSERT INTO `members` (`id`, `profile_picture`, `lastname`, `firstname`, `middlename`, `sex`, `birthday`, `contact`, `address`, `account_type`, `created_at`, `updated_at`, `account_number`, `status`, `balance`) VALUES
(9, 'uploads/Rai.jpg', 'Balde', 'Railey', 'Lizarondo', 'Male', '2004-10-05', '09426994734', 'Marilao, Bulacan', 'Savings', '2025-04-13 01:43:37', '2025-05-18 13:38:41', '101', 'Active', '10000.00'),
(10, 'uploads/lans.jpg', 'Hermogenes', 'Lance', 'Batista', 'Male', '2004-10-30', '0942699463', 'Sta. Maria, Bulacan', 'Time Deposit', '2025-04-13 01:45:11', '2025-04-15 14:25:55', '102', 'Active', '3000.00'),
(11, 'uploads/rg.jpg', 'Gatmaitan', 'Ralf Gett', 'Bautsita', 'Male', '2004-10-08', '09428994734', 'San Rafael, Bulacan', 'Fixed', '2025-04-13 01:46:31', '2025-05-07 07:51:12', '103', 'Active', '15000.00');

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
(6, 1, 1, '2025-04-17 05:41:47'),
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
(44, 1, 7, '2025-04-17 06:33:05');

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
(5, '101', '10000.00', '2025-04-13');

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
  `maturity_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time_deposits`
--

INSERT INTO `time_deposits` (`id`, `account_number`, `deposit_amount`, `maturity_date`) VALUES
(4, '102', '3000.00', '2025-04-13');

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
(1, 3, '2.50', '5000.00', '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(2, 6, '3.25', '5000.00', '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(3, 12, '4.00', '10000.00', '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(4, 24, '4.50', '10000.00', '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active'),
(5, 36, '5.00', '20000.00', '2025-04-14 16:20:34', '2025-04-14 16:20:34', 'active');

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
(1, '101', 'Withdrawal', '50.00', NULL, NULL, '2025-04-14 05:32:10'),
(2, '101', 'Deposit', '50.00', NULL, NULL, '2025-04-14 10:48:42'),
(3, '101', 'Withdrawal', '100.00', NULL, NULL, '2025-04-14 10:49:10'),
(4, '101', 'Deposit', '50.00', '1050.00', '', '2025-04-14 15:37:25'),
(5, '102', 'Withdrawal', '100.00', '900.00', '', '2025-04-14 15:46:55'),
(6, '101', 'Deposit', '200.00', '1250.00', '', '2025-04-14 15:47:20'),
(7, '101', 'Loan Disbursement', '12.00', '1262.00', 'Loan approved by: ae', '2025-04-15 04:40:04'),
(8, '102', 'Loan Disbursement', '15000.00', '15900.00', 'Loan ID: 7 disbursement', '2025-04-15 04:56:04'),
(9, '101', 'Loan Payment', '1.00', '1261.00', 'Loan ID: 6', '2025-04-15 11:30:42'),
(10, '101', 'Loan Payment', '11.00', '1250.00', 'Loan ID: 6', '2025-04-15 11:31:00'),
(11, '101', 'Loan Disbursement', '5000.00', '6250.00', 'Loan ID: 8 disbursement', '2025-04-15 11:31:43'),
(12, '101', 'Loan Payment', '500.00', '6250.00', 'Loan ID: 8', '2025-04-15 11:35:14'),
(13, '101', 'Loan Payment', '500.00', '6250.00', 'Loan ID: 8', '2025-04-15 11:36:17'),
(14, '101', 'Loan Payment', '1000.00', '6250.00', 'Loan ID: 8', '2025-04-15 11:36:26'),
(15, '101', 'Loan Payment', '1000.00', '5250.00', 'Loan ID: 8', '2025-04-15 11:37:57'),
(16, '101', 'Loan Payment', '2000.00', '3250.00', 'Loan ID: 8', '2025-04-15 11:38:04'),
(17, '101', 'Loan Disbursement', '10000.00', '13250.00', 'Loan ID: 9 disbursement', '2025-04-15 11:39:26'),
(18, '101', 'Loan Payment', '5000.00', '8250.00', 'Loan ID: 9', '2025-04-15 11:40:01'),
(19, '102', 'Loan Payment', '10000.00', '5900.00', 'Loan ID: 7', '2025-04-15 11:51:21'),
(20, '102', 'Loan Payment', '2500.00', '3400.00', 'Loan ID: 7', '2025-04-15 11:51:33'),
(21, '102', 'Loan Payment', '2500.00', '900.00', 'Loan ID: 7', '2025-04-15 11:51:37'),
(22, '101', 'Loan Payment', '5000.00', '3250.00', 'Loan ID: 9', '2025-04-15 11:54:52'),
(23, '103', 'Loan Disbursement', '10000.00', '13000.00', 'Loan ID: 10 disbursement', '2025-04-15 11:55:40'),
(24, '102', 'Loan Disbursement', '10000.00', '10900.00', 'Loan ID: 11 disbursement', '2025-04-15 11:56:10'),
(25, '102', 'Loan Payment', '5900.00', '5000.00', 'dfsfd', '2025-04-15 14:10:14'),
(26, '103', 'Loan Payment', '10000.00', '3000.00', 'Loan ID: 10', '2025-04-15 14:11:03'),
(27, '103', 'Loan Disbursement', '5000.00', '8000.00', 'Loan ID: 12 disbursement', '2025-04-15 14:11:50'),
(28, '103', 'Loan Payment', '5000.00', '3000.00', 'Loan ID: 12', '2025-04-15 14:12:14'),
(29, '103', 'Loan Disbursement', '5000.00', '8000.00', 'Loan ID: 13 disbursement', '2025-04-15 14:15:02'),
(30, '101', 'Loan Disbursement', '5000.00', '8250.00', 'Loan ID: 14 disbursement', '2025-04-15 14:23:14'),
(31, '101', 'Loan Payment', '1000.00', '7250.00', 'Loan ID: 14', '2025-04-15 14:23:40'),
(32, '101', 'Loan Payment', '2000.00', '5250.00', 'Loan ID: 14', '2025-04-15 14:23:58'),
(33, '101', 'Withdrawal', '1000.00', '4250.00', '', '2025-04-15 14:24:25'),
(34, '102', 'Loan Payment', '2000.00', '3000.00', 'Loan ID: 11', '2025-04-15 14:25:55'),
(35, '101', 'Loan Payment', '2000.00', '2250.00', 'Loan ID: 14', '2025-04-17 01:31:36'),
(36, '101', 'Loan Disbursement', '12000.00', '14250.00', 'Loan ID: 15 disbursement', '2025-04-17 01:32:40'),
(37, '101', 'Withdrawal', '4200.00', '10050.00', '', '2025-04-17 15:46:57'),
(38, '103', 'Deposit', '2000.00', '10000.00', '', '2025-04-17 15:47:18'),
(39, '103', 'Deposit', '5000.00', '15000.00', '', '2025-05-07 07:51:12'),
(40, '101', 'Withdrawal', '50.00', '10000.00', '', '2025-05-18 13:38:41');

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
(15, 12, 'uploads/Rai.jpg', 'rar', 'rar', 'rar', 'Male', '2004-10-05', '323', 'rar', '2025-04-07 13:20:30'),
(25, 15, 'uploads/stglogo.jpg', 'ae', 'ae', 'ae', 'Male', '2003-10-07', '09426994745', 'Marilao, Bulacann', '2025-04-14 10:09:45'),
(26, 16, 'uploads/67fe71b057b52.jpg', 'Eusebio', 'Kurt', 'Yanzie', 'Male', '2006-10-05', '09426294634', 'Valenzuela City', '2025-04-15 14:48:16'),
(28, 18, 'uploads/68009474702f3.jpg', 'admin', 'admin', 'admin', 'Male', '2004-10-05', '09426994735', 'Marilao, Bulacan', '2025-04-17 05:41:08'),
(29, 20, 'uploads/681a1c85d3c66.jpg', 'hermogenes', 'lance', 'bautista', 'Male', '2025-05-06', '098709080', '3055 Km. 39 Gulod Pulong Buhangin', '2025-05-06 14:28:21'),
(30, 21, 'profile.jpg', 'gatmaitan', 'rg', 'r', 'Male', '2004-05-07', '09164140885', 'dyan lang sa tabi tabi', '2025-05-06 22:33:03'),
(31, 23, 'profile.jpg', 'lans', 'lans', '', 'Male', '2008-05-15', '123=456=789', 'lansworld', '2025-05-13 03:34:07');

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
  `profile_created` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usersignup`
--

INSERT INTO `usersignup` (`id`, `fullname`, `email`, `username`, `password`, `profile_created`) VALUES
(1, 'RaileyBalde', 'railey@gmail.com', 'sasas', '$2y$10$TUQY02iNO.OeSA5ZgGXLYuERatsnHkfKihWHcSz5ZZKNjkhpHtQ7y', 0),
(12, 'rar', 'railey.rarbalde100@gmail.com', 'rar', '$2y$10$m2KnVuMk8IntEoSIKo5CQeg6FA2rBWsbz/Qna/NsJe7RYELRO/Tpq', 1),
(15, 'Andrei', 'a@gmail.com', 'ae', '$2y$10$DOA.70srbEBUFw4Qa5f3GecLdLtNuLU1J4k8tMhC2Lp59JLEKx3Ma', 1),
(16, 'aa', 'aq@gmail.com', 'aa', '$2y$10$kEsj03mNj8fJWA0/5.xF2exCxsGw8sIUR1PwoxJEUF.LzyiGLrYPC', 1),
(18, 'password nito is admin123', 'admin@gmail.com', 'admin', '$2y$10$jLHrlUqbjkNHebrD2oqxd.uNx3p977NwLSZE0pkiHhLTifZfgGora', 1),
(20, 'lance hermogenes', 'lancebh28@gmail.com', 'Lance Hermogenes', '$2y$10$PSadpGmsrPUwtRrVJnq9m.rH0uJuWCAgR/whe5ofZwAkGHd1wONTS', 1),
(21, 'arji gatmaitan', 'rggatmaitan23@gmail.com', 'rg', '$2y$10$nQLSqvLzuBU9cCHWCLKJbeLpzP1DfNP.BGv.fYlhL4tD4xfvxCcem', 1),
(23, 'lans', 'lans@rmail.com', 'lans25', '$2y$10$sf6RqSFDvrwsPnx..h824exO1CES606.vMEKQ6OR4lnNQs7S2k0vK', 1);

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
(1, 18, 1, '2025-04-17 05:41:47');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `fixed_accounts`
--
ALTER TABLE `fixed_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `loan_payments`
--
ALTER TABLE `loan_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `loan_types`
--
ALTER TABLE `loan_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=845;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=474;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6462;

--
-- AUTO_INCREMENT for table `savings_accounts`
--
ALTER TABLE `savings_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `time_deposits`
--
ALTER TABLE `time_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `time_deposit_rates`
--
ALTER TABLE `time_deposit_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `useradd`
--
ALTER TABLE `useradd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `userprof`
--
ALTER TABLE `userprof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `usersignup`
--
ALTER TABLE `usersignup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

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
