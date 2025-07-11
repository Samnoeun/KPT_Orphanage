-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2025 at 05:09 AM
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
-- Database: `kpt_orphanage`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(3, 'Welcome to', 'A sanctuary of hope, education, and endless possibilities for children in need', 'banners/oEI2DdULWjG1jGKfuVfN1xJ64Q6pf8QfxdPmDQuw.jpg', '2025-07-08 09:40:53', '2025-07-08 20:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `cta_sections`
--

CREATE TABLE `cta_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cta_sections`
--

INSERT INTO `cta_sections` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'cta_sections/AetGAoDmAh1Dk9rBln0mKxzWXQpt0gyBVrLYhkOr.jpg', '2025-07-09 04:16:55', '2025-07-09 04:20:28');

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `bankName` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `home_contents`
--

CREATE TABLE `home_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `impacts`
--

CREATE TABLE `impacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `impacts`
--

INSERT INTO `impacts` (`id`, `label`, `value`, `created_at`, `updated_at`) VALUES
(1, '150+', 'Children Helped', '2025-07-09 05:41:02', '2025-07-09 05:41:02'),
(2, '23+', 'Years of Service', '2025-07-09 05:48:58', '2025-07-09 05:48:58'),
(3, '50+', 'Graduates', '2025-07-09 05:49:19', '2025-07-09 05:49:19'),
(4, '100%', 'Love & Care', '2025-07-09 05:49:44', '2025-07-09 05:49:44');

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_07_03_061803_create_staff_table', 1),
(6, '2025_07_03_081853_create_home_contents_table', 2),
(7, '2025_07_04_032042_create_user_tests_table', 3),
(8, '2025_07_04_032552_create_students_table', 4),
(9, '2025_07_04_040240_create_staff_table', 5),
(10, '2025_07_04_074538_create_donors_table', 6),
(11, '2025_07_07_010451_create_testimonials_table', 6),
(12, '2025_07_07_010602_create_testimonials_table', 7),
(13, '2025_07_01_003705_create_items_table', 8),
(14, '2025_07_08_023409_create_banners_table', 9),
(15, '2025_07_09_034444_create_partners_table', 10),
(16, '2025_07_09_110959_create_cta_sections_table', 11),
(17, '2025_07_09_121811_create_stats_table', 12),
(18, '2025_07_09_122446_create_impacts_table', 12),
(19, '2025_07_09_125615_create_wwds_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `logo`, `link`, `created_at`, `updated_at`) VALUES
(1, 'partners/IKq6d5lrVzO6eSUxiqAYaIo2XQh42Oc7nLzilt81.jpg', 'https://www.sophalproject.org/', '2025-07-08 20:55:49', '2025-07-08 21:00:09'),
(2, 'partners/ImqPmCxSfHlMe9H6UQcc6HXVDjtmGa6dHDYchqv6.jpg', 'https://www.ilnodoonlus.org/en/who-we-are/', '2025-07-08 21:07:45', '2025-07-08 21:07:45'),
(3, 'partners/ftJhviJ8knqyUZKNbGqJqhmYvpREBNEvmE6FflqX.jpg', 'https://www.ccc-cambodia.org/en/ngodb/ngo-information/40', '2025-07-08 21:09:31', '2025-07-08 21:16:00'),
(4, 'partners/7PBjhgnZUznjftfa9U6Du1yHEYlhZTAgR2oKW8Pf.png', 'https://intercampus.inter.it/?lang=en', '2025-07-08 21:13:00', '2025-07-08 21:13:00'),
(5, 'partners/RDPegxR87se1i0gLqwnc1TZdNV1hhcVpN5puosJI.jpg', 'https://kampongthom.gov.kh/%E1%9E%9A%E1%9E%85%E1%9E%93%E1%9E%B6%E1%9E%9F%E1%9E%98%E1%9F%92%E1%9E%96%E1%9F%90%E1%9E%93%E1%9F%92%E1%9E%92%E1%9E%81%E1%9F%81%E1%9E%8F%E1%9F%92%E1%9E%8F/', '2025-07-08 21:18:40', '2025-07-08 21:18:40'),
(6, 'partners/OO31PBW4C1Wn9aB0Zqa5NMYjvRg2EzvHGr2Z0e6o.jpg', 'https://mosvy.gov.kh/', '2025-07-08 21:20:53', '2025-07-08 21:20:53');

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
-- Table structure for table `stats`
--

CREATE TABLE `stats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `program` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `full_testimonial` text NOT NULL,
  `background` text NOT NULL,
  `current_status` varchar(255) NOT NULL,
  `future_goals` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `program`, `year`, `short_description`, `full_testimonial`, `background`, `current_status`, `future_goals`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Bunny Chor', 'Web Development', '2025', 'An enthusiastic developer eager to build meaningful digital solutions.', 'My journey at Passerelles Numériques Cambodia has been a transformative experience. From mastering development tools to participating in real-world workshops and coding events, I’ve grown not only as a developer but also as a team player and critical thinker. The mentorship, hands-on projects, and collaborative learning have prepared me to tackle complex problems and contribute effectively to the tech industry.', 'I come from Cambodia and have always been passionate about technology and innovation. At PNC, I’ve built a strong foundation in full-stack web development, sharpened my soft skills, and gained experience in using industry-standard tools like GitHub, Figma, Jira, and Postman.', 'Actively involved in capstone projects and collaborative tech events, while refining UI/UX skills and quality assurance knowledge through professional workshops.', 'To become a Product Owner or a Full-Stack Developer who drives impactful solutions and mentors the next generation of digital changemakers.', 'testimonials/1752076058_photo_2025-01-27_10-22-21.jpg', '2025-07-06 19:50:43', '2025-07-09 08:47:38'),
(3, 'Bunny Chor', 'Web Development', '2025', 'A passionate learner from PNC.', 'My journey at PNC...', 'I come from Battambang...', 'Currently interning at Vattanac Bank.', 'Senior Developer', 'testimonials/1751865429_photo_2025-06-22_10-41-12.jpg', '2025-07-06 22:17:09', '2025-07-06 22:17:09'),
(5, 'Sreyneang Loeun', 'Web Development', '2025', 'A passionate learner from PNC.', 'My journey at PNC...', 'I come from Battambang...', 'Currently interning at Vattanac Bank.', 'Senior Developer', 'testimonials/1752032161_photo_2025-01-06_13-01-55.jpg', '2025-07-08 00:14:45', '2025-07-08 20:36:01');

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

-- --------------------------------------------------------

--
-- Table structure for table `user_tests`
--

CREATE TABLE `user_tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wwds`
--

CREATE TABLE `wwds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wwds`
--

INSERT INTO `wwds` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'wwd_images/80RfE6iKdgznpvxvfmYqzHmdnhMGRt95BoXhskMi.jpg', '2025-07-09 06:13:45', '2025-07-09 06:33:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cta_sections`
--
ALTER TABLE `cta_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_contents`
--
ALTER TABLE `home_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `impacts`
--
ALTER TABLE `impacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_tests`
--
ALTER TABLE `user_tests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_tests_email_unique` (`email`);

--
-- Indexes for table `wwds`
--
ALTER TABLE `wwds`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cta_sections`
--
ALTER TABLE `cta_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `donors`
--
ALTER TABLE `donors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_contents`
--
ALTER TABLE `home_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `impacts`
--
ALTER TABLE `impacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stats`
--
ALTER TABLE `stats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wwds`
--
ALTER TABLE `wwds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
