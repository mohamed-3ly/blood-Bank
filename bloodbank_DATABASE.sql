-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2020 at 08:46 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blood_bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood_types`
--

CREATE TABLE `blood_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blood_types`
--

INSERT INTO `blood_types` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, NULL, NULL, 'B+'),
(2, NULL, NULL, 'A'),
(3, NULL, NULL, 'B'),
(4, NULL, NULL, 'O');

-- --------------------------------------------------------

--
-- Table structure for table `blood_type_client`
--

CREATE TABLE `blood_type_client` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `blood_type_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blood_type_client`
--

INSERT INTO `blood_type_client` (`id`, `created_at`, `updated_at`, `blood_type_id`, `client_id`) VALUES
(8, NULL, NULL, 2, 13),
(9, NULL, NULL, 1, 13),
(10, NULL, NULL, 2, 11),
(11, NULL, NULL, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, NULL, NULL, 'health'),
(2, NULL, NULL, 'medic'),
(3, NULL, NULL, 'baby'),
(4, '2019-12-21 16:35:05', '2019-12-21 16:39:19', 'Menn');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `governorate_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `created_at`, `updated_at`, `name`, `governorate_id`) VALUES
(1, NULL, '2019-12-20 20:48:29', 'ramsissss', 1),
(2, NULL, NULL, 'benha', 2),
(3, NULL, NULL, 'aswan', 3),
(4, '2019-12-20 20:18:36', '2019-12-20 20:18:36', 'tahrir', 1);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `blood_type_id` int(10) UNSIGNED NOT NULL,
  `last_donation_date` date NOT NULL,
  `pin_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `created_at`, `updated_at`, `phone`, `password`, `email`, `name`, `date_of_birth`, `blood_type_id`, `last_donation_date`, `pin_code`, `city_id`, `api_token`, `is_active`) VALUES
(9, '2019-12-06 21:38:47', '2019-12-22 08:32:52', '0114071260165', '$2y$10$rpELm5Hg6CenLJVIov5cweF/fqZSlKKc2qXk3t7B.pEMFcbv06SyG', 'm2m@m.com', 'mohamed', '1995-08-01', 1, '2019-05-01', NULL, 1, 'eoXhbDT1YaBtkM8sDtPhRFbpzKNuVj5OvGjEiyzEPL3qVfrQEuuVjbWfFQER', 1),
(10, '2019-12-06 21:42:05', '2019-12-22 08:32:55', '01140712601650', '$2y$10$3ZqOR5x4PxfQXivWJhnKse2St/vdDngX1iqObvxTreHsCdK9JGqc6', 'm22m@m.com', 'mohamed', '1995-08-01', 1, '2019-05-01', NULL, 1, 'nKnjkAMq1yo7X3qD4IXYRkFiPlu3MII4YkWNPGBzFjsR2oUzreZBFKp54moS', 1),
(11, '2019-12-06 21:48:03', '2019-12-22 08:38:11', '011407126000', '$2y$10$YCVABBLW3VFj4Kkl8ZpDUuB8VzND.gh0isPa0xnajsX8XpqDCRaiO', 'm222m@m.com', 'mohamed', '1995-08-01', 1, '2019-05-01', NULL, 1, 'VpK34zcjtxL1ShDgH8M8S0eSdxDi51W2yEB7XzwPsoFP9qcBWn3AymYO9T1M', 1),
(13, '2019-12-07 08:53:27', '2019-12-22 08:38:08', '01090023173', '$2y$10$6Kl1roW.pL/2.oUCc2Rfb.LFsUIIkVcuTBxhcexVcEBHYje1OH9n.', 'm232m@m.com', 'ahmed5', '1995-08-01', 1, '2019-05-01', NULL, 1, 'efSXYTKNPo5K1HGSZzYOQ1WgNivL9DjuOo3cnmm2i78RcwsdovDI00yfbmrl', 0);

-- --------------------------------------------------------

--
-- Table structure for table `client_governorate`
--

CREATE TABLE `client_governorate` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `governorate_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_governorate`
--

INSERT INTO `client_governorate` (`id`, `created_at`, `updated_at`, `client_id`, `governorate_id`) VALUES
(1, NULL, NULL, 13, 1),
(2, NULL, NULL, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `client_notification`
--

CREATE TABLE `client_notification` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `notification_id` int(10) UNSIGNED NOT NULL,
  `is_read` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_notification`
--

INSERT INTO `client_notification` (`id`, `created_at`, `updated_at`, `client_id`, `notification_id`, `is_read`) VALUES
(1, NULL, NULL, 11, 6, 1),
(2, NULL, NULL, 11, 7, NULL),
(3, NULL, NULL, 11, 8, NULL),
(4, NULL, NULL, 11, 9, NULL),
(5, NULL, NULL, 13, 10, NULL),
(6, NULL, NULL, 13, 11, NULL),
(7, NULL, NULL, 13, 12, NULL),
(8, NULL, NULL, 13, 13, NULL),
(9, NULL, NULL, 13, 14, NULL),
(10, NULL, NULL, 13, 15, NULL),
(11, NULL, NULL, 13, 16, NULL),
(12, NULL, NULL, 11, 17, NULL),
(13, NULL, NULL, 13, 18, NULL),
(14, NULL, NULL, 13, 19, NULL),
(15, NULL, NULL, 13, 20, NULL),
(16, NULL, NULL, 13, 21, NULL),
(17, NULL, NULL, 13, 22, NULL),
(18, NULL, NULL, 13, 23, NULL),
(19, NULL, NULL, 13, 24, NULL),
(20, NULL, NULL, 13, 25, NULL),
(21, NULL, NULL, 13, 26, NULL),
(22, NULL, NULL, 13, 27, NULL),
(23, NULL, NULL, 13, 28, NULL),
(24, NULL, NULL, 13, 29, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_post`
--

CREATE TABLE `client_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_post`
--

INSERT INTO `client_post` (`id`, `created_at`, `updated_at`, `client_id`, `post_id`) VALUES
(2, NULL, NULL, 13, 1),
(3, NULL, NULL, 13, 2);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donation_requests`
--

CREATE TABLE `donation_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `patient_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_age` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blood_type_id` int(10) UNSIGNED NOT NULL,
  `bags_num` int(11) NOT NULL,
  `hospital_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hospital_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(10,8) NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donation_requests`
--

INSERT INTO `donation_requests` (`id`, `created_at`, `updated_at`, `patient_name`, `patient_age`, `blood_type_id`, `bags_num`, `hospital_name`, `hospital_address`, `latitude`, `longitude`, `city_id`, `phone`, `notes`, `client_id`) VALUES
(1, '2019-12-11 07:42:33', '2019-12-11 07:42:33', 'mahmoud', '24', 2, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(2, '2019-12-11 07:45:00', '2019-12-11 07:45:00', 'mahmoud', '24', 2, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 2, '01090023173', 'عاجل', 13),
(3, '2019-12-11 07:45:33', '2019-12-11 07:45:33', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 2, '01090023173', 'عاجل', 13),
(4, '2019-12-11 07:45:42', '2019-12-11 07:45:42', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 2, '01090023173', 'عاجل', 13),
(5, '2019-12-11 08:02:36', '2019-12-11 08:02:36', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 2, '01090023173', 'عاجل', 13),
(6, '2019-12-11 08:03:18', '2019-12-11 08:03:18', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 2, '01090023173', 'عاجل', 13),
(7, '2019-12-11 08:04:15', '2019-12-11 08:04:15', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 2, '01090023173', 'عاجل', 13),
(8, '2019-12-11 08:05:23', '2019-12-11 08:05:23', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 2, '01090023173', 'عاجل', 13),
(9, '2019-12-11 08:10:59', '2019-12-11 08:10:59', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 2, '01090023173', 'عاجل', 13),
(10, '2019-12-11 08:12:16', '2019-12-11 08:12:16', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 2, '01090023173', 'عاجل', 13),
(11, '2019-12-11 08:13:03', '2019-12-11 08:13:03', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 2, '01090023173', 'عاجل', 13),
(12, '2019-12-11 08:14:29', '2019-12-11 08:14:29', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(13, '2019-12-11 08:15:17', '2019-12-11 08:15:17', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(14, '2019-12-11 08:16:19', '2019-12-11 08:16:19', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(15, '2019-12-11 08:17:30', '2019-12-11 08:17:30', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(16, '2019-12-11 08:17:43', '2019-12-11 08:17:43', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(17, '2019-12-11 08:19:15', '2019-12-11 08:19:15', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(18, '2019-12-11 08:20:38', '2019-12-11 08:20:38', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(19, '2019-12-11 08:28:25', '2019-12-11 08:28:25', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(20, '2019-12-11 08:28:53', '2019-12-11 08:28:53', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(21, '2019-12-11 08:29:03', '2019-12-11 08:29:03', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(22, '2019-12-11 08:37:18', '2019-12-11 08:37:18', 'mahmoud', '24', 3, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(23, '2019-12-11 08:37:50', '2019-12-11 08:37:50', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(24, '2019-12-11 08:38:22', '2019-12-11 08:38:22', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(25, '2019-12-11 08:38:40', '2019-12-11 08:38:40', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(26, '2019-12-11 08:42:32', '2019-12-11 08:42:32', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(27, '2019-12-11 08:42:58', '2019-12-11 08:42:58', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(28, '2019-12-11 08:45:19', '2019-12-11 08:45:19', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(29, '2019-12-11 08:46:08', '2019-12-11 08:46:08', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(30, '2019-12-11 09:23:23', '2019-12-11 09:23:23', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(31, '2019-12-11 09:23:48', '2019-12-11 09:23:48', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(32, '2019-12-11 09:24:54', '2019-12-11 09:24:54', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(33, '2019-12-11 09:26:43', '2019-12-11 09:26:43', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(34, '2019-12-11 09:29:18', '2019-12-11 09:29:18', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(35, '2019-12-11 09:32:26', '2019-12-11 09:32:26', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(36, '2019-12-11 09:34:11', '2019-12-11 09:34:11', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(37, '2019-12-11 09:35:17', '2019-12-11 09:35:17', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(38, '2019-12-11 09:35:51', '2019-12-11 09:35:51', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(39, '2019-12-11 09:57:57', '2019-12-11 09:57:57', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(40, '2019-12-11 11:58:51', '2019-12-11 11:58:51', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(41, '2019-12-11 11:58:58', '2019-12-11 11:58:58', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(42, '2019-12-13 20:26:20', '2019-12-13 20:26:20', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(43, '2019-12-13 21:48:39', '2019-12-13 21:48:39', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(44, '2019-12-13 21:51:32', '2019-12-13 21:51:32', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(45, '2019-12-13 21:52:37', '2019-12-13 21:52:37', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(46, '2019-12-13 21:52:52', '2019-12-13 21:52:52', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(47, '2019-12-13 22:04:24', '2019-12-13 22:04:24', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(48, '2019-12-14 14:28:15', '2019-12-14 14:28:15', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(49, '2019-12-15 07:01:58', '2019-12-15 07:01:58', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(50, '2019-12-15 07:33:18', '2019-12-15 07:33:18', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(51, '2019-12-15 07:47:20', '2019-12-15 07:47:20', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 13),
(52, '2019-12-15 08:56:13', '2019-12-15 08:56:13', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(53, '2019-12-15 08:56:38', '2019-12-15 08:56:38', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(54, '2019-12-15 08:57:02', '2019-12-15 08:57:02', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(55, '2019-12-15 08:57:14', '2019-12-15 08:57:14', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(56, '2019-12-15 08:59:57', '2019-12-15 08:59:57', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(57, '2019-12-15 09:00:36', '2019-12-15 09:00:36', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(58, '2019-12-15 09:00:57', '2019-12-15 09:00:57', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(59, '2019-12-15 09:01:06', '2019-12-15 09:01:06', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(60, '2019-12-15 09:01:21', '2019-12-15 09:01:21', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(61, '2019-12-15 09:01:54', '2019-12-15 09:01:54', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(62, '2019-12-15 09:17:31', '2019-12-15 09:17:31', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11),
(63, '2019-12-15 09:41:03', '2019-12-15 09:41:03', 'mahmoud', '24', 1, 2, 'el demerdash', 'el demerdash station', '30.11848580', '31.32377090', 1, '01090023173', 'عاجل', 11);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `governorates`
--

CREATE TABLE `governorates` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `governorates`
--

INSERT INTO `governorates` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, NULL, NULL, 'cairo'),
(2, NULL, NULL, 'qualubia'),
(3, NULL, NULL, 'aswan'),
(10, '2019-12-19 21:41:32', '2019-12-19 21:41:32', 'name'),
(11, '2019-12-19 21:41:35', '2019-12-19 21:41:35', 'name');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_04_083752_create_blood_type_client_table', 1),
(5, '2019_12_04_083752_create_blood_types_table', 1),
(6, '2019_12_04_083752_create_categories_table', 1),
(7, '2019_12_04_083752_create_cities_table', 1),
(8, '2019_12_04_083752_create_client_governorate_table', 1),
(9, '2019_12_04_083752_create_client_notification_table', 1),
(10, '2019_12_04_083752_create_client_post_table', 1),
(11, '2019_12_04_083752_create_clients_table', 1),
(12, '2019_12_04_083752_create_contacts_table', 1),
(13, '2019_12_04_083752_create_donation_requests_table', 1),
(14, '2019_12_04_083752_create_governorates_table', 1),
(15, '2019_12_04_083752_create_notifications_table', 1),
(16, '2019_12_04_083752_create_posts_table', 1),
(17, '2019_12_04_083752_create_settings_table', 1),
(18, '2019_12_04_083802_create_foreign_keys', 1),
(19, '2019_12_11_123509_user_tokens', 2),
(20, '2019_12_15_092635_create_admin_table', 3),
(21, '2019_12_22_100106_add_is_active_to_clients_table', 4),
(22, '2019_12_28_124848_create_permission_tables', 5);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(3, 'App\\User', 7),
(3, 'App\\User', 8),
(42, 'App\\User', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `donation_request_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `created_at`, `updated_at`, `title`, `content`, `donation_request_id`) VALUES
(1, '2019-12-11 09:29:18', '2019-12-11 09:29:18', 'يوجد حاله حرجه', 'ahmed5محتاج تبرع بالدم', 34),
(2, '2019-12-11 09:32:27', '2019-12-11 09:32:27', 'يوجد حاله حرجه', 'ahmed5محتاج تبرع بالدم', 35),
(3, '2019-12-11 09:34:11', '2019-12-11 09:34:11', 'يوجد حاله حرجه', 'ahmed5محتاج تبرع بالدم', 36),
(4, '2019-12-11 09:35:17', '2019-12-11 09:35:17', 'يوجد حاله حرجه', 'ahmed5محتاج تبرع بالدم', 37),
(5, '2019-12-11 09:35:51', '2019-12-11 09:35:51', 'يوجد حاله حرجه', 'ahmed5محتاج تبرع بالدم', 38),
(6, '2019-12-11 09:57:57', '2019-12-11 09:57:57', 'يوجد حاله حرجه', 'ahmed5محتاج تبرع بالدم', 39),
(7, '2019-12-11 11:58:51', '2019-12-11 11:58:51', 'يوجد حاله حرجه', 'ahmed5محتاج تبرع بالدم', 40),
(8, '2019-12-11 11:58:58', '2019-12-11 11:58:58', 'يوجد حاله حرجه', 'ahmed5محتاج تبرع بالدم', 41),
(9, '2019-12-13 20:26:21', '2019-12-13 20:26:21', 'يوجد حاله حرجه', 'ahmed5محتاج تبرع بالدم', 42),
(10, '2019-12-13 21:48:40', '2019-12-13 21:48:40', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 43),
(11, '2019-12-13 21:52:37', '2019-12-13 21:52:37', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 45),
(12, '2019-12-13 21:52:52', '2019-12-13 21:52:52', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 46),
(13, '2019-12-13 22:04:24', '2019-12-13 22:04:24', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 47),
(14, '2019-12-14 14:28:16', '2019-12-14 14:28:16', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 48),
(15, '2019-12-15 07:01:59', '2019-12-15 07:01:59', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 49),
(16, '2019-12-15 07:33:18', '2019-12-15 07:33:18', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 50),
(17, '2019-12-15 07:47:20', '2019-12-15 07:47:20', 'يوجد حاله حرجه', 'ahmed5محتاج تبرع بالدم', 51),
(18, '2019-12-15 08:56:13', '2019-12-15 08:56:13', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 52),
(19, '2019-12-15 08:56:38', '2019-12-15 08:56:38', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 53),
(20, '2019-12-15 08:57:03', '2019-12-15 08:57:03', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 54),
(21, '2019-12-15 08:57:14', '2019-12-15 08:57:14', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 55),
(22, '2019-12-15 08:59:57', '2019-12-15 08:59:57', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 56),
(23, '2019-12-15 09:00:37', '2019-12-15 09:00:37', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 57),
(24, '2019-12-15 09:00:57', '2019-12-15 09:00:57', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 58),
(25, '2019-12-15 09:01:06', '2019-12-15 09:01:06', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 59),
(26, '2019-12-15 09:01:21', '2019-12-15 09:01:21', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 60),
(27, '2019-12-15 09:01:54', '2019-12-15 09:01:54', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 61),
(28, '2019-12-15 09:17:31', '2019-12-15 09:17:31', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 62),
(29, '2019-12-15 09:41:03', '2019-12-15 09:41:03', 'يوجد حاله حرجه', 'mohamedمحتاج تبرع بالدم', 63);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `routes`, `created_at`, `updated_at`) VALUES
(1, 'create users', 'web', 'user.create,user.store', '2020-01-01 00:09:46', '2020-01-01 02:26:24'),
(2, 'show users', 'web', 'user.index', '2020-01-01 00:03:54', '2020-01-01 00:03:54'),
(3, 'edit users', 'web', 'user.edit,user.update', '2020-01-01 00:04:04', '2020-01-01 00:04:04'),
(5, 'delete users', 'web', 'user.destroy', '2020-01-01 00:04:31', '2020-01-01 00:04:31'),
(6, 'create rols', 'web', 'role.create,role.store', '2020-01-01 00:05:10', '2020-01-01 00:05:10'),
(7, 'show rols', 'web', 'role.index', '2020-01-01 00:05:23', '2020-01-01 00:05:23'),
(8, 'edit rols', 'web', 'role.edit,role.update', '2020-01-01 00:06:02', '2020-01-01 00:06:02'),
(9, 'delete rols', 'web', 'role.destroy', '2020-01-01 00:09:30', '2020-01-01 00:09:30'),
(12, 'create posts', 'web', 'post.create,post.store', '2020-01-01 00:15:48', '2020-01-01 00:15:48'),
(13, 'edit posts', 'web', 'post.edit,post.update', '2020-01-01 00:16:02', '2020-01-01 00:16:02'),
(14, 'show posts', 'web', 'post.index', '2020-01-01 00:16:25', '2020-01-01 00:16:25'),
(15, 'delete posts', 'web', 'post.destroy', '2020-01-01 00:16:37', '2020-01-01 00:16:37');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `created_at`, `updated_at`, `title`, `content`, `image`, `category_id`) VALUES
(1, NULL, NULL, 'lkjl', 'kkkkkkkkkkkkkk', 'kljljlk', 1),
(2, NULL, NULL, 'health', 'body health', 'klawfjklj', 1),
(15, '2019-12-23 12:41:45', '2020-01-05 08:24:53', 'baby', 'mmmmmmmmmmmmmmn', 'uploads/posts/157753226014422.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(3, 'writer23', 'web', '2019-12-31 20:57:26', '2020-01-01 03:10:20'),
(41, 'women', 'web', '2020-01-01 00:22:31', '2020-01-01 00:22:31'),
(42, 'admin', 'web', '2020-01-01 00:44:53', '2020-01-01 00:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 41),
(1, 42),
(2, 41),
(2, 42),
(3, 41),
(3, 42),
(5, 41),
(5, 42),
(6, 42),
(7, 42),
(8, 42),
(9, 42),
(12, 3),
(12, 42),
(13, 3),
(13, 42),
(14, 3),
(14, 42),
(15, 42);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notification_settings_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_app` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tw_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `insta_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `play_store_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_store_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` enum('android','ios') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `created_at`, `updated_at`, `client_id`, `token`, `platform`) VALUES
(1, '2019-12-11 21:08:34', '2019-12-11 21:08:34', 13, 'eNM43PTWqnY:APA91bHDhrqhHKzlbdXoHLuv1AETTNQp_8WMvDTYQaQy0zPJp2OZpseFwblUJrY3vd4GQynID7LojR9a-hASf8R5Ee3WgVrio7ZpvKi2zy9GnbLWBSzbD8eLBSefiOUeYiMfqOgF06k3', 'android'),
(2, '2019-12-13 20:23:46', '2019-12-13 20:23:46', 11, 'eNM43PTWqnY:APA91bHDhrqhHKzlbdXoHLuv1AETTNQp_8WMvDTYQaQy0zPJp2OZpseFwblUJrY3vd4GQynID7LojR9a-hASf8R5Ee3WgVrio7ZpvKi2zy9GnbLWBSzbD8eLBSefiOUeYiMfqOgF06k3', 'ios'),
(3, '2019-12-13 20:24:02', '2019-12-13 20:24:02', 11, 'eNM43PTWqnY:APA91bHDhrqhHKzlbdXoHLuv1AETTNQp_8WMvDTYQaQy0zPJp2OZpseFwblUJrY3vd4GQynID7LojR9a-hASf8R5Ee3WgVrio7ZpvKi2zy9GnbLWBSzbD8eLBSefiOUeYiMfqOgF06k3', 'android'),
(4, '2019-12-13 20:24:30', '2019-12-13 20:24:30', 10, 'eNM43PTWqnY:APA91bHDhrqhHKzlbdXoHLuv1AETTNQp_8WMvDTYQaQy0zPJp2OZpseFwblUJrY3vd4GQynID7LojR9a-hASf8R5Ee3WgVrio7ZpvKi2zy9GnbLWBSzbD8eLBSefiOUeYiMfqOgF06k3', 'android'),
(5, '2019-12-13 20:25:18', '2019-12-13 20:25:18', 9, 'eNM43PTWqnY:APA91bHDhrqhHKzlbdXoHLuv1AETTNQp_8WMvDTYQaQy0zPJp2OZpseFwblUJrY3vd4GQynID7LojR9a-hASf8R5Ee3WgVrio7ZpvKi2zy9GnbLWBSzbD8eLBSefiOUeYiMfqOgF06k3', 'android'),
(6, '2019-12-13 20:25:43', '2019-12-13 20:25:43', 8, 'eNM43PTWqnY:APA91bHDhrqhHKzlbdXoHLuv1AETTNQp_8WMvDTYQaQy0zPJp2OZpseFwblUJrY3vd4GQynID7LojR9a-hASf8R5Ee3WgVrio7ZpvKi2zy9GnbLWBSzbD8eLBSefiOUeYiMfqOgF06k3', 'android'),
(7, '2019-12-15 07:47:21', '2019-12-15 07:47:21', 8, 'eNM43PTWqnY:APA91bHDhrqhHKzlbdXoHLuv1AETTNQp_8WMvDTYQaQy0zPJp2OZpseFwblUJrY3vd4GQynID7LojR9a-hASf8R5Ee3WgVrio7ZpvKi2zy9GnbLWBSzbD8eLBSefiOUeYiMfqOgF06k3', 'android');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'mohamed ali', 'test@test.com', NULL, '$2y$10$v87GASc2jhC1csni0NtOGeB6poNIRnvdZRB.J5p2WXyg7y6LfO7Lq', 'kRuA6biv1wrNOi99yu5eVLYN5ciCvOyq2NvS27iyzXu8P9xSHhBCm4N90WVb', '2019-12-16 12:40:11', '2020-01-01 04:34:44'),
(7, 'name', 'test1@test.com', NULL, '$2y$10$YM4VKH9OUZER3VhdKhOyku3A4fuSqEhna7PlzetYHXDQt58OP.Ko.', NULL, '2019-12-17 10:31:40', '2020-01-01 04:32:30'),
(8, 'name2222', 'te2st@test.com', NULL, '$2y$10$v4y58Z2DVHSihjWjoYi9suRF8q7cnIXQqmnEybQ6ea.fmPkXR54uO', NULL, '2020-01-01 03:24:18', '2020-01-01 03:24:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood_types`
--
ALTER TABLE `blood_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_type_client`
--
ALTER TABLE `blood_type_client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blood_type_client_blood_type_id_foreign` (`blood_type_id`),
  ADD KEY `blood_type_client_client_id_foreign` (`client_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_governorate_id_foreign` (`governorate_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_email_unique` (`email`),
  ADD UNIQUE KEY `clients_api_token_unique` (`api_token`),
  ADD KEY `clients_blood_type_id_foreign` (`blood_type_id`),
  ADD KEY `clients_city_id_foreign` (`city_id`);

--
-- Indexes for table `client_governorate`
--
ALTER TABLE `client_governorate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_governorate_client_id_foreign` (`client_id`),
  ADD KEY `client_governorate_governorate_id_foreign` (`governorate_id`);

--
-- Indexes for table `client_notification`
--
ALTER TABLE `client_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_notification_client_id_foreign` (`client_id`),
  ADD KEY `client_notification_notification_id_foreign` (`notification_id`);

--
-- Indexes for table `client_post`
--
ALTER TABLE `client_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_post_client_id_foreign` (`client_id`),
  ADD KEY `client_post_post_id_foreign` (`post_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_client_id_foreign` (`client_id`);

--
-- Indexes for table `donation_requests`
--
ALTER TABLE `donation_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donation_requests_blood_type_id_foreign` (`blood_type_id`),
  ADD KEY `donation_requests_city_id_foreign` (`city_id`),
  ADD KEY `donation_requests_client_id_foreign` (`client_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `governorates`
--
ALTER TABLE `governorates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_donation_request_id_foreign` (`donation_request_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `blood_types`
--
ALTER TABLE `blood_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blood_type_client`
--
ALTER TABLE `blood_type_client`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `client_governorate`
--
ALTER TABLE `client_governorate`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `client_notification`
--
ALTER TABLE `client_notification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `client_post`
--
ALTER TABLE `client_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donation_requests`
--
ALTER TABLE `donation_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `governorates`
--
ALTER TABLE `governorates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blood_type_client`
--
ALTER TABLE `blood_type_client`
  ADD CONSTRAINT `blood_type_client_blood_type_id_foreign` FOREIGN KEY (`blood_type_id`) REFERENCES `blood_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `blood_type_client_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_governorate_id_foreign` FOREIGN KEY (`governorate_id`) REFERENCES `governorates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_blood_type_id_foreign` FOREIGN KEY (`blood_type_id`) REFERENCES `blood_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `clients_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `client_governorate`
--
ALTER TABLE `client_governorate`
  ADD CONSTRAINT `client_governorate_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `client_governorate_governorate_id_foreign` FOREIGN KEY (`governorate_id`) REFERENCES `governorates` (`id`);

--
-- Constraints for table `client_notification`
--
ALTER TABLE `client_notification`
  ADD CONSTRAINT `client_notification_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `client_notification_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`);

--
-- Constraints for table `client_post`
--
ALTER TABLE `client_post`
  ADD CONSTRAINT `client_post_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `client_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `donation_requests`
--
ALTER TABLE `donation_requests`
  ADD CONSTRAINT `donation_requests_blood_type_id_foreign` FOREIGN KEY (`blood_type_id`) REFERENCES `blood_types` (`id`),
  ADD CONSTRAINT `donation_requests_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `donation_requests_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_donation_request_id_foreign` FOREIGN KEY (`donation_request_id`) REFERENCES `donation_requests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
