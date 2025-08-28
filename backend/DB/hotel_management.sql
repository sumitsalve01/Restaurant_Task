-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2025 at 09:14 AM
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
-- Database: `hotel_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_28_064411_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `order_amount` int(11) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `restaurant_id`, `order_amount`, `order_time`) VALUES
(1, 102, 996, '2025-06-24 15:00:00'),
(2, 104, 980, '2025-06-25 18:45:00'),
(3, 103, 986, '2025-06-23 17:00:00'),
(4, 102, 462, '2025-06-27 17:30:00'),
(5, 101, 702, '2025-06-26 15:45:00'),
(6, 104, 543, '2025-06-25 16:15:00'),
(7, 103, 467, '2025-06-28 17:45:00'),
(8, 101, 695, '2025-06-26 11:30:00'),
(9, 103, 613, '2025-06-27 17:45:00'),
(10, 103, 496, '2025-06-24 20:15:00'),
(11, 104, 392, '2025-06-28 10:15:00'),
(12, 104, 900, '2025-06-23 18:15:00'),
(13, 102, 891, '2025-06-22 19:15:00'),
(14, 101, 363, '2025-06-27 11:45:00'),
(15, 102, 462, '2025-06-23 15:45:00'),
(16, 102, 604, '2025-06-25 22:30:00'),
(17, 101, 440, '2025-06-28 10:45:00'),
(18, 101, 907, '2025-06-26 19:45:00'),
(19, 102, 277, '2025-06-25 16:30:00'),
(20, 103, 401, '2025-06-25 10:15:00'),
(21, 101, 493, '2025-06-22 19:30:00'),
(22, 103, 844, '2025-06-22 10:45:00'),
(23, 102, 812, '2025-06-28 11:15:00'),
(24, 101, 912, '2025-06-27 14:15:00'),
(25, 104, 919, '2025-06-24 10:30:00'),
(26, 102, 598, '2025-06-23 13:00:00'),
(27, 104, 627, '2025-06-26 21:45:00'),
(28, 104, 937, '2025-06-26 20:45:00'),
(29, 104, 688, '2025-06-26 18:45:00'),
(30, 101, 564, '2025-06-28 14:00:00'),
(31, 104, 397, '2025-06-25 20:00:00'),
(32, 103, 536, '2025-06-24 17:45:00'),
(33, 104, 495, '2025-06-23 12:00:00'),
(34, 103, 200, '2025-06-27 10:15:00'),
(35, 103, 244, '2025-06-27 19:45:00'),
(36, 101, 234, '2025-06-25 15:30:00'),
(37, 104, 671, '2025-06-26 10:30:00'),
(38, 102, 804, '2025-06-27 15:30:00'),
(39, 104, 549, '2025-06-26 17:30:00'),
(40, 103, 522, '2025-06-28 20:30:00'),
(41, 102, 203, '2025-06-23 14:15:00'),
(42, 102, 841, '2025-06-26 11:15:00'),
(43, 104, 407, '2025-06-26 13:00:00'),
(44, 102, 651, '2025-06-22 19:15:00'),
(45, 101, 546, '2025-06-23 13:30:00'),
(46, 103, 551, '2025-06-22 20:15:00'),
(47, 102, 720, '2025-06-25 20:45:00'),
(48, 103, 929, '2025-06-24 10:15:00'),
(49, 103, 966, '2025-06-22 19:15:00'),
(50, 102, 557, '2025-06-27 14:15:00'),
(51, 104, 963, '2025-06-22 17:30:00'),
(52, 103, 684, '2025-06-25 12:30:00'),
(53, 104, 762, '2025-06-23 16:15:00'),
(54, 103, 310, '2025-06-26 10:15:00'),
(55, 104, 764, '2025-06-23 21:30:00'),
(56, 101, 788, '2025-06-25 21:00:00'),
(57, 104, 946, '2025-06-24 12:15:00'),
(58, 103, 745, '2025-06-24 15:45:00'),
(59, 102, 299, '2025-06-23 11:45:00'),
(60, 103, 580, '2025-06-27 11:30:00'),
(61, 102, 750, '2025-06-22 13:30:00'),
(62, 102, 229, '2025-06-24 21:15:00'),
(63, 104, 265, '2025-06-22 19:45:00'),
(64, 101, 548, '2025-06-22 10:00:00'),
(65, 104, 623, '2025-06-26 15:00:00'),
(66, 102, 314, '2025-06-25 17:00:00'),
(67, 103, 348, '2025-06-22 17:00:00'),
(68, 104, 646, '2025-06-24 19:30:00'),
(69, 104, 901, '2025-06-22 10:45:00'),
(70, 102, 910, '2025-06-23 19:00:00'),
(71, 103, 653, '2025-06-22 12:15:00'),
(72, 104, 328, '2025-06-23 16:00:00'),
(73, 102, 963, '2025-06-23 12:45:00'),
(74, 102, 716, '2025-06-28 12:15:00'),
(75, 101, 316, '2025-06-26 13:45:00'),
(76, 101, 202, '2025-06-26 14:15:00'),
(77, 102, 717, '2025-06-24 10:30:00'),
(78, 104, 964, '2025-06-23 16:30:00'),
(79, 104, 248, '2025-06-22 21:30:00'),
(80, 103, 271, '2025-06-26 21:15:00'),
(81, 104, 707, '2025-06-26 21:00:00'),
(82, 103, 236, '2025-06-26 20:00:00'),
(83, 101, 961, '2025-06-26 16:00:00'),
(84, 104, 443, '2025-06-28 15:00:00'),
(85, 101, 609, '2025-06-28 19:15:00'),
(86, 102, 859, '2025-06-26 14:45:00'),
(87, 102, 266, '2025-06-25 14:15:00'),
(88, 101, 326, '2025-06-22 20:00:00'),
(89, 104, 257, '2025-06-22 19:00:00'),
(90, 101, 301, '2025-06-27 12:15:00'),
(91, 103, 201, '2025-06-25 16:00:00'),
(92, 102, 212, '2025-06-27 14:30:00'),
(93, 104, 368, '2025-06-25 15:45:00'),
(94, 102, 685, '2025-06-22 16:30:00'),
(95, 101, 695, '2025-06-22 14:45:00'),
(96, 102, 305, '2025-06-24 19:00:00'),
(97, 103, 744, '2025-06-25 14:45:00'),
(98, 102, 240, '2025-06-26 21:00:00'),
(99, 104, 578, '2025-06-27 20:30:00'),
(100, 102, 602, '2025-06-27 14:15:00'),
(101, 101, 308, '2025-06-26 14:00:00'),
(102, 102, 800, '2025-06-23 15:45:00'),
(103, 103, 709, '2025-06-23 22:15:00'),
(104, 102, 343, '2025-06-24 18:00:00'),
(105, 104, 855, '2025-06-25 22:30:00'),
(106, 103, 905, '2025-06-26 15:15:00'),
(107, 104, 953, '2025-06-25 17:00:00'),
(108, 102, 840, '2025-06-24 10:30:00'),
(109, 103, 451, '2025-06-27 17:30:00'),
(110, 104, 335, '2025-06-27 21:15:00'),
(111, 101, 463, '2025-06-28 17:15:00'),
(112, 101, 983, '2025-06-22 18:15:00'),
(113, 103, 422, '2025-06-25 18:00:00'),
(114, 104, 907, '2025-06-24 12:15:00'),
(115, 101, 478, '2025-06-28 15:00:00'),
(116, 102, 297, '2025-06-28 15:00:00'),
(117, 101, 522, '2025-06-28 13:30:00'),
(118, 101, 613, '2025-06-28 18:45:00'),
(119, 102, 908, '2025-06-25 12:30:00'),
(120, 102, 979, '2025-06-22 13:15:00'),
(121, 102, 869, '2025-06-26 13:45:00'),
(122, 102, 607, '2025-06-27 18:00:00'),
(123, 101, 240, '2025-06-27 16:30:00'),
(124, 103, 659, '2025-06-25 21:45:00'),
(125, 102, 815, '2025-06-28 19:00:00'),
(126, 103, 597, '2025-06-27 16:15:00'),
(127, 101, 974, '2025-06-28 15:30:00'),
(128, 104, 821, '2025-06-26 14:45:00'),
(129, 102, 382, '2025-06-28 15:15:00'),
(130, 104, 737, '2025-06-28 14:30:00'),
(131, 103, 811, '2025-06-25 16:30:00'),
(132, 104, 750, '2025-06-25 19:15:00'),
(133, 103, 912, '2025-06-27 14:45:00'),
(134, 102, 282, '2025-06-24 11:15:00'),
(135, 101, 753, '2025-06-25 19:45:00'),
(136, 103, 620, '2025-06-25 19:45:00'),
(137, 102, 662, '2025-06-24 21:45:00'),
(138, 103, 712, '2025-06-25 21:45:00'),
(139, 104, 743, '2025-06-27 15:30:00'),
(140, 101, 272, '2025-06-22 18:00:00'),
(141, 103, 705, '2025-06-24 17:30:00'),
(142, 104, 292, '2025-06-26 22:15:00'),
(143, 102, 677, '2025-06-27 12:45:00'),
(144, 103, 400, '2025-06-26 21:15:00'),
(145, 103, 215, '2025-06-28 14:15:00'),
(146, 102, 266, '2025-06-26 12:00:00'),
(147, 101, 970, '2025-06-26 16:00:00'),
(148, 101, 450, '2025-06-26 21:45:00'),
(149, 101, 354, '2025-06-22 10:45:00'),
(150, 101, 885, '2025-06-27 19:15:00'),
(151, 104, 552, '2025-06-25 15:00:00'),
(152, 101, 576, '2025-06-27 10:00:00'),
(153, 102, 217, '2025-06-24 12:00:00'),
(154, 102, 429, '2025-06-22 18:00:00'),
(155, 102, 661, '2025-06-22 10:45:00'),
(156, 102, 416, '2025-06-22 10:30:00'),
(157, 104, 558, '2025-06-22 11:30:00'),
(158, 104, 245, '2025-06-22 22:45:00'),
(159, 104, 855, '2025-06-26 11:45:00'),
(160, 103, 818, '2025-06-25 13:15:00'),
(161, 101, 448, '2025-06-28 12:00:00'),
(162, 101, 300, '2025-06-28 19:30:00'),
(163, 103, 374, '2025-06-24 16:15:00'),
(164, 101, 684, '2025-06-24 18:45:00'),
(165, 103, 509, '2025-06-23 20:00:00'),
(166, 102, 302, '2025-06-22 13:00:00'),
(167, 101, 590, '2025-06-23 22:45:00'),
(168, 101, 453, '2025-06-22 15:45:00'),
(169, 101, 837, '2025-06-25 11:45:00'),
(170, 103, 819, '2025-06-25 14:30:00'),
(171, 104, 935, '2025-06-25 11:30:00'),
(172, 102, 548, '2025-06-22 19:15:00'),
(173, 102, 626, '2025-06-25 13:30:00'),
(174, 103, 967, '2025-06-22 22:30:00'),
(175, 103, 713, '2025-06-27 18:15:00'),
(176, 104, 241, '2025-06-28 21:45:00'),
(177, 103, 234, '2025-06-23 18:00:00'),
(178, 102, 667, '2025-06-22 20:30:00'),
(179, 102, 437, '2025-06-27 12:30:00'),
(180, 104, 967, '2025-06-25 15:00:00'),
(181, 101, 565, '2025-06-25 18:15:00'),
(182, 102, 483, '2025-06-23 12:15:00'),
(183, 102, 936, '2025-06-28 16:45:00'),
(184, 103, 342, '2025-06-24 10:45:00'),
(185, 102, 621, '2025-06-22 21:30:00'),
(186, 101, 360, '2025-06-28 17:30:00'),
(187, 101, 203, '2025-06-25 11:45:00'),
(188, 103, 888, '2025-06-23 20:45:00'),
(189, 101, 624, '2025-06-22 17:45:00'),
(190, 103, 501, '2025-06-28 18:15:00'),
(191, 103, 466, '2025-06-26 15:45:00'),
(192, 102, 720, '2025-06-23 21:00:00'),
(193, 101, 382, '2025-06-22 18:45:00'),
(194, 101, 551, '2025-06-26 22:15:00'),
(195, 101, 347, '2025-06-28 16:15:00'),
(196, 103, 601, '2025-06-23 12:30:00'),
(197, 101, 255, '2025-06-25 22:45:00'),
(198, 102, 502, '2025-06-23 18:15:00'),
(199, 102, 752, '2025-06-26 22:45:00'),
(200, 103, 393, '2025-06-22 11:30:00');

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `cuisine` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `location`, `cuisine`) VALUES
(101, 'Tandoori Treats', 'Bangalore', 'North Indian'),
(102, 'Sushi Bay', 'Mumbai', 'Japanese'),
(103, 'Pasta Palace', 'Delhi', 'Italian'),
(104, 'Burger Hub', 'Hyderabad', 'American');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('a7p3uPNJuyBxyBygdeW6vWFSYn4FScDQERuC4a0A', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjVMMnZaMXVadW9DejBmSkJqRzVYTTBTZnFwMXQ1T0V4VGdVS0MyWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756363594);

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
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
