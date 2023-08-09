-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2023 at 10:13 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_weather_app`
--

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2023_08_08_074515_create_weather_data_table', 2),
(11, '2023_08_08_152921_add_column_name_to_weather_data', 3),
(12, '2023_08_09_060310_add_index_to_weather_data', 4);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Neel Banerjee', 'igi223@goigi.in', NULL, '$2y$10$dW5n6RgZK.576dGUnauPx.SbGH0QtZMWiusVYZFfykDitcjZjPLFe', NULL, '2023-08-08 06:05:32', '2023-08-08 06:05:32');

-- --------------------------------------------------------

--
-- Table structure for table `weather_data`
--

CREATE TABLE `weather_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city` varchar(255) NOT NULL,
  `weather` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `temperature` varchar(255) NOT NULL,
  `humidity` varchar(255) DEFAULT NULL,
  `pressure` varchar(255) NOT NULL,
  `wind_speed` varchar(255) DEFAULT NULL,
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weather_data`
--

INSERT INTO `weather_data` (`id`, `city`, `weather`, `description`, `temperature`, `humidity`, `pressure`, `wind_speed`, `response`, `created_at`, `updated_at`) VALUES
(1, 'Kolkata', 'Haze', 'haze', '31', '79', '1005', '3.09', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:88.3697;s:3:\"lat\";d:22.5697;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:721;s:4:\"main\";s:4:\"Haze\";s:11:\"description\";s:4:\"haze\";s:4:\"icon\";s:3:\"50d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:6:{s:4:\"temp\";d:30.97;s:10:\"feels_like\";d:37.97;s:8:\"temp_min\";d:30.97;s:8:\"temp_max\";d:30.97;s:8:\"pressure\";i:1005;s:8:\"humidity\";i:79;}s:10:\"visibility\";i:3200;s:4:\"wind\";a:2:{s:5:\"speed\";d:3.09;s:3:\"deg\";i:260;}s:6:\"clouds\";a:1:{s:3:\"all\";i:75;}s:2:\"dt\";i:1691558019;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:9114;s:7:\"country\";s:2:\"IN\";s:7:\"sunrise\";i:1691538059;s:6:\"sunset\";i:1691585000;}s:8:\"timezone\";i:19800;s:2:\"id\";i:1275004;s:4:\"name\";s:7:\"Kolkata\";s:3:\"cod\";i:200;}', '2023-08-08 10:31:59', '2023-08-08 23:52:33'),
(2, 'Durgapur', 'Clouds', 'overcast clouds', '27', '81', '1003', '2.41', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:87.3167;s:3:\"lat\";d:23.4833;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:804;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:15:\"overcast clouds\";s:4:\"icon\";s:3:\"04n\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";d:26.95;s:10:\"feels_like\";d:29.72;s:8:\"temp_min\";d:26.95;s:8:\"temp_max\";d:26.95;s:8:\"pressure\";i:1003;s:8:\"humidity\";i:81;s:9:\"sea_level\";i:1003;s:10:\"grnd_level\";i:995;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:3:{s:5:\"speed\";d:2.41;s:3:\"deg\";i:246;s:4:\"gust\";d:3.51;}s:6:\"clouds\";a:1:{s:3:\"all\";i:100;}s:2:\"dt\";i:1691510091;s:3:\"sys\";a:3:{s:7:\"country\";s:2:\"IN\";s:7:\"sunrise\";i:1691451809;s:6:\"sunset\";i:1691498969;}s:8:\"timezone\";i:19800;s:2:\"id\";i:1272175;s:4:\"name\";s:8:\"Durgapur\";s:3:\"cod\";i:200;}', '2023-08-08 10:32:17', '2023-08-08 10:32:17'),
(3, 'London', 'Clouds', 'overcast clouds', '17', '92', '1012', '6.17', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:-0.1257;s:3:\"lat\";d:51.5085;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:804;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:15:\"overcast clouds\";s:4:\"icon\";s:3:\"04d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:6:{s:4:\"temp\";d:16.83;s:10:\"feels_like\";d:16.97;s:8:\"temp_min\";d:15.87;s:8:\"temp_max\";d:17.93;s:8:\"pressure\";i:1012;s:8:\"humidity\";i:92;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:2:{s:5:\"speed\";d:6.17;s:3:\"deg\";i:240;}s:6:\"clouds\";a:1:{s:3:\"all\";i:100;}s:2:\"dt\";i:1691509781;s:3:\"sys\";a:5:{s:4:\"type\";i:2;s:2:\"id\";i:2075535;s:7:\"country\";s:2:\"GB\";s:7:\"sunrise\";i:1691469261;s:6:\"sunset\";i:1691523486;}s:8:\"timezone\";i:3600;s:2:\"id\";i:2643743;s:4:\"name\";s:6:\"London\";s:3:\"cod\";i:200;}', '2023-08-08 10:32:24', '2023-08-08 10:32:24'),
(4, 'Dubai', 'Clouds', 'few clouds', '33', '74', '997', '4.05', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:55.3047;s:3:\"lat\";d:25.2582;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:801;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:10:\"few clouds\";s:4:\"icon\";s:3:\"02n\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";d:33.37;s:10:\"feels_like\";d:40.37;s:8:\"temp_min\";d:33.37;s:8:\"temp_max\";d:33.37;s:8:\"pressure\";i:997;s:8:\"humidity\";i:74;s:9:\"sea_level\";i:997;s:10:\"grnd_level\";i:996;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:3:{s:5:\"speed\";d:4.05;s:3:\"deg\";i:241;s:4:\"gust\";d:5.25;}s:6:\"clouds\";a:1:{s:3:\"all\";i:11;}s:2:\"dt\";i:1691510528;s:3:\"sys\";a:3:{s:7:\"country\";s:2:\"AE\";s:7:\"sunrise\";i:1691459340;s:6:\"sunset\";i:1691506803;}s:8:\"timezone\";i:14400;s:2:\"id\";i:292223;s:4:\"name\";s:5:\"Dubai\";s:3:\"cod\";i:200;}', '2023-08-08 10:32:30', '2023-08-08 10:32:30'),
(5, 'Mumbai', 'Clouds', 'broken clouds', '29', '84', '1009', '5.14', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:72.8479;s:3:\"lat\";d:19.0144;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:803;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:13:\"broken clouds\";s:4:\"icon\";s:3:\"04n\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:6:{s:4:\"temp\";d:28.99;s:10:\"feels_like\";d:35.61;s:8:\"temp_min\";d:28.99;s:8:\"temp_max\";d:28.99;s:8:\"pressure\";i:1009;s:8:\"humidity\";i:84;}s:10:\"visibility\";i:2200;s:4:\"wind\";a:2:{s:5:\"speed\";d:5.14;s:3:\"deg\";i:230;}s:6:\"clouds\";a:1:{s:3:\"all\";i:75;}s:2:\"dt\";i:1691509956;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:9052;s:7:\"country\";s:2:\"IN\";s:7:\"sunrise\";i:1691455654;s:6:\"sunset\";i:1691502069;}s:8:\"timezone\";i:19800;s:2:\"id\";i:1275339;s:4:\"name\";s:6:\"Mumbai\";s:3:\"cod\";i:200;}', '2023-08-08 10:34:36', '2023-08-08 10:34:36'),
(11, 'Delhi', 'Clouds', 'broken clouds', '32', '55', '1002', '5.09', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:77.2167;s:3:\"lat\";d:28.6667;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:803;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:13:\"broken clouds\";s:4:\"icon\";s:3:\"04d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";d:31.79;s:10:\"feels_like\";d:35.21;s:8:\"temp_min\";d:31.79;s:8:\"temp_max\";d:31.79;s:8:\"pressure\";i:1002;s:8:\"humidity\";i:55;s:9:\"sea_level\";i:1002;s:10:\"grnd_level\";i:978;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:3:{s:5:\"speed\";d:5.09;s:3:\"deg\";i:271;s:4:\"gust\";d:7.13;}s:6:\"clouds\";a:1:{s:3:\"all\";i:79;}s:2:\"dt\";i:1691550799;s:3:\"sys\";a:3:{s:7:\"country\";s:2:\"IN\";s:7:\"sunrise\";i:1691540201;s:6:\"sunset\";i:1691588211;}s:8:\"timezone\";i:19800;s:2:\"id\";i:1273294;s:4:\"name\";s:5:\"Delhi\";s:3:\"cod\";i:200;}', '2023-08-08 21:52:54', '2023-08-08 21:52:54'),
(13, 'Liverpool', 'Clouds', 'broken clouds', '11', '86', '1013', '1.54', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:-2.9779;s:3:\"lat\";d:53.4106;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:803;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:13:\"broken clouds\";s:4:\"icon\";s:3:\"04n\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:6:{s:4:\"temp\";d:10.77;s:10:\"feels_like\";d:10.15;s:8:\"temp_min\";d:8.19;s:8:\"temp_max\";d:12.01;s:8:\"pressure\";i:1013;s:8:\"humidity\";i:86;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:2:{s:5:\"speed\";d:1.54;s:3:\"deg\";i:220;}s:6:\"clouds\";a:1:{s:3:\"all\";i:65;}s:2:\"dt\";i:1691553042;s:3:\"sys\";a:5:{s:4:\"type\";i:2;s:2:\"id\";i:2008599;s:7:\"country\";s:2:\"GB\";s:7:\"sunrise\";i:1691556042;s:6:\"sunset\";i:1691610860;}s:8:\"timezone\";i:3600;s:2:\"id\";i:2644210;s:4:\"name\";s:9:\"Liverpool\";s:3:\"cod\";i:200;}', '2023-08-08 22:24:33', '2023-08-08 22:24:33'),
(14, 'Washington', 'Clouds', 'scattered clouds', '23', '59', '1009', '2.51', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:-120.5015;s:3:\"lat\";d:47.5001;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:802;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:16:\"scattered clouds\";s:4:\"icon\";s:3:\"03n\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";d:23.09;s:10:\"feels_like\";i:23;s:8:\"temp_min\";d:20.36;s:8:\"temp_max\";d:26.22;s:8:\"pressure\";i:1009;s:8:\"humidity\";i:59;s:9:\"sea_level\";i:1009;s:10:\"grnd_level\";i:953;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:3:{s:5:\"speed\";d:2.51;s:3:\"deg\";i:288;s:4:\"gust\";d:2.21;}s:6:\"clouds\";a:1:{s:3:\"all\";i:31;}s:2:\"dt\";i:1691552411;s:3:\"sys\";a:5:{s:4:\"type\";i:2;s:2:\"id\";i:2003593;s:7:\"country\";s:2:\"US\";s:7:\"sunrise\";i:1691498921;s:6:\"sunset\";i:1691551603;}s:8:\"timezone\";i:-25200;s:2:\"id\";i:5815135;s:4:\"name\";s:10:\"Washington\";s:3:\"cod\";i:200;}', '2023-08-08 22:25:03', '2023-08-08 22:25:03'),
(17, 'Madrid', 'Clear', 'clear sky', '26', '38', '1018', '1.03', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:-3.7026;s:3:\"lat\";d:40.4165;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:800;s:4:\"main\";s:5:\"Clear\";s:11:\"description\";s:9:\"clear sky\";s:4:\"icon\";s:3:\"01n\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:6:{s:4:\"temp\";d:25.58;s:10:\"feels_like\";d:25.19;s:8:\"temp_min\";d:23.53;s:8:\"temp_max\";d:26.88;s:8:\"pressure\";i:1018;s:8:\"humidity\";i:38;}s:10:\"visibility\";i:9000;s:4:\"wind\";a:2:{s:5:\"speed\";d:1.03;s:3:\"deg\";i:0;}s:6:\"clouds\";a:1:{s:3:\"all\";i:0;}s:2:\"dt\";i:1691557265;s:3:\"sys\";a:5:{s:4:\"type\";i:2;s:2:\"id\";i:2007545;s:7:\"country\";s:2:\"ES\";s:7:\"sunrise\";i:1691558365;s:6:\"sunset\";i:1691608884;}s:8:\"timezone\";i:7200;s:2:\"id\";i:3117735;s:4:\"name\";s:6:\"Madrid\";s:3:\"cod\";i:200;}', '2023-08-08 23:33:48', '2023-08-08 23:33:48'),
(19, 'Bali', 'Clouds', 'scattered clouds', '27', '56', '1014', '6.56', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";i:115;s:3:\"lat\";d:-8.5;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:802;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:16:\"scattered clouds\";s:4:\"icon\";s:3:\"03d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";d:27.35;s:10:\"feels_like\";d:28.21;s:8:\"temp_min\";d:27.35;s:8:\"temp_max\";d:27.54;s:8:\"pressure\";i:1014;s:8:\"humidity\";i:56;s:9:\"sea_level\";i:1014;s:10:\"grnd_level\";i:1006;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:3:{s:5:\"speed\";d:6.56;s:3:\"deg\";i:141;s:4:\"gust\";d:7.02;}s:6:\"clouds\";a:1:{s:3:\"all\";i:42;}s:2:\"dt\";i:1691557881;s:3:\"sys\";a:5:{s:4:\"type\";i:2;s:2:\"id\";i:2020640;s:7:\"country\";s:2:\"ID\";s:7:\"sunrise\";i:1691533920;s:6:\"sunset\";i:1691576358;}s:8:\"timezone\";i:28800;s:2:\"id\";i:1650535;s:4:\"name\";s:4:\"Bali\";s:3:\"cod\";i:200;}', '2023-08-08 23:41:21', '2023-08-08 23:41:21'),
(20, 'Indonesia', 'Clouds', 'broken clouds', '30', '66', '1014', '3.34', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";i:120;s:3:\"lat\";i:-5;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:803;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:13:\"broken clouds\";s:4:\"icon\";s:3:\"04d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";d:30.41;s:10:\"feels_like\";d:35.03;s:8:\"temp_min\";d:30.41;s:8:\"temp_max\";d:30.41;s:8:\"pressure\";i:1014;s:8:\"humidity\";i:66;s:9:\"sea_level\";i:1014;s:10:\"grnd_level\";i:968;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:3:{s:5:\"speed\";d:3.34;s:3:\"deg\";i:118;s:4:\"gust\";d:3.52;}s:6:\"clouds\";a:1:{s:3:\"all\";i:74;}s:2:\"dt\";i:1691557891;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:9325;s:7:\"country\";s:2:\"ID\";s:7:\"sunrise\";i:1691532477;s:6:\"sunset\";i:1691575401;}s:8:\"timezone\";i:28800;s:2:\"id\";i:1643084;s:4:\"name\";s:9:\"Indonesia\";s:3:\"cod\";i:200;}', '2023-08-08 23:41:34', '2023-08-08 23:41:34'),
(22, 'Adelaide', 'Clear', 'clear sky', '19', '46', '1017', '8.23', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:138.6;s:3:\"lat\";d:-34.9333;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:800;s:4:\"main\";s:5:\"Clear\";s:11:\"description\";s:9:\"clear sky\";s:4:\"icon\";s:3:\"01d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:6:{s:4:\"temp\";i:19;s:10:\"feels_like\";d:18.16;s:8:\"temp_min\";d:17.94;s:8:\"temp_max\";d:22.14;s:8:\"pressure\";i:1017;s:8:\"humidity\";i:46;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:2:{s:5:\"speed\";d:8.23;s:3:\"deg\";i:350;}s:6:\"clouds\";a:1:{s:3:\"all\";i:0;}s:2:\"dt\";i:1691557675;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:9566;s:7:\"country\";s:2:\"AU\";s:7:\"sunrise\";i:1691530400;s:6:\"sunset\";i:1691568550;}s:8:\"timezone\";i:34200;s:2:\"id\";i:2078025;s:4:\"name\";s:8:\"Adelaide\";s:3:\"cod\";i:200;}', '2023-08-08 23:42:26', '2023-08-08 23:42:26'),
(23, 'Egypt', 'Clear', 'clear sky', '19', '83', '1008', '2.57', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:-75.5299;s:3:\"lat\";d:40.6801;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:800;s:4:\"main\";s:5:\"Clear\";s:11:\"description\";s:9:\"clear sky\";s:4:\"icon\";s:3:\"01n\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:6:{s:4:\"temp\";d:18.86;s:10:\"feels_like\";d:18.97;s:8:\"temp_min\";d:17.24;s:8:\"temp_max\";d:20.2;s:8:\"pressure\";i:1008;s:8:\"humidity\";i:83;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:2:{s:5:\"speed\";d:2.57;s:3:\"deg\";i:230;}s:6:\"clouds\";a:1:{s:3:\"all\";i:0;}s:2:\"dt\";i:1691564141;s:3:\"sys\";a:5:{s:4:\"type\";i:2;s:2:\"id\";i:2045998;s:7:\"country\";s:2:\"US\";s:7:\"sunrise\";i:1691575582;s:6:\"sunset\";i:1691626142;}s:8:\"timezone\";i:-14400;s:2:\"id\";i:5188351;s:4:\"name\";s:5:\"Egypt\";s:3:\"cod\";i:200;}', '2023-08-08 23:49:30', '2023-08-09 01:30:19'),
(24, 'Mexico City', 'Thunderstorm', 'thunderstorm', '19', '68', '1019', '5.66', 'a:14:{s:5:\"coord\";a:2:{s:3:\"lon\";d:-99.1277;s:3:\"lat\";d:19.4285;}s:7:\"weather\";a:2:{i:0;a:4:{s:2:\"id\";i:211;s:4:\"main\";s:12:\"Thunderstorm\";s:11:\"description\";s:12:\"thunderstorm\";s:4:\"icon\";s:3:\"11n\";}i:1;a:4:{s:2:\"id\";i:502;s:4:\"main\";s:4:\"Rain\";s:11:\"description\";s:20:\"heavy intensity rain\";s:4:\"icon\";s:3:\"10n\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:6:{s:4:\"temp\";d:18.9;s:10:\"feels_like\";d:18.62;s:8:\"temp_min\";d:15.25;s:8:\"temp_max\";d:19.96;s:8:\"pressure\";i:1019;s:8:\"humidity\";i:68;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:2:{s:5:\"speed\";d:5.66;s:3:\"deg\";i:290;}s:4:\"rain\";a:1:{s:2:\"1h\";d:4.57;}s:6:\"clouds\";a:1:{s:3:\"all\";i:75;}s:2:\"dt\";i:1691557976;s:3:\"sys\";a:5:{s:4:\"type\";i:2;s:2:\"id\";i:2040357;s:7:\"country\";s:2:\"MX\";s:7:\"sunrise\";i:1691496904;s:6:\"sunset\";i:1691543360;}s:8:\"timezone\";i:-21600;s:2:\"id\";i:3530597;s:4:\"name\";s:11:\"Mexico City\";s:3:\"cod\";i:200;}', '2023-08-08 23:50:05', '2023-08-08 23:50:05'),
(25, 'Chennai', 'Clouds', 'few clouds', '33', '72', '1014', '4.12', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:80.2785;s:3:\"lat\";d:13.0878;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:801;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:10:\"few clouds\";s:4:\"icon\";s:3:\"02d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:6:{s:4:\"temp\";d:32.76;s:10:\"feels_like\";d:39.76;s:8:\"temp_min\";d:32.76;s:8:\"temp_max\";d:33.99;s:8:\"pressure\";i:1014;s:8:\"humidity\";i:72;}s:10:\"visibility\";i:6000;s:4:\"wind\";a:2:{s:5:\"speed\";d:4.12;s:3:\"deg\";i:280;}s:6:\"clouds\";a:1:{s:3:\"all\";i:20;}s:2:\"dt\";i:1691558966;s:3:\"sys\";a:5:{s:4:\"type\";i:2;s:2:\"id\";i:2012809;s:7:\"country\";s:2:\"IN\";s:7:\"sunrise\";i:1691540740;s:6:\"sunset\";i:1691586202;}s:8:\"timezone\";i:19800;s:2:\"id\";i:1264527;s:4:\"name\";s:7:\"Chennai\";s:3:\"cod\";i:200;}', '2023-08-09 00:00:33', '2023-08-09 00:00:33'),
(26, 'Goa', 'Rain', 'light rain', '28', '69', '1012', '2.62', 'a:14:{s:5:\"coord\";a:2:{s:3:\"lon\";d:74.0833;s:3:\"lat\";d:15.3333;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:500;s:4:\"main\";s:4:\"Rain\";s:11:\"description\";s:10:\"light rain\";s:4:\"icon\";s:3:\"10d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";d:28.21;s:10:\"feels_like\";d:30.94;s:8:\"temp_min\";d:28.21;s:8:\"temp_max\";d:28.21;s:8:\"pressure\";i:1012;s:8:\"humidity\";i:69;s:9:\"sea_level\";i:1012;s:10:\"grnd_level\";i:998;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:3:{s:5:\"speed\";d:2.62;s:3:\"deg\";i:268;s:4:\"gust\";d:4.31;}s:4:\"rain\";a:1:{s:2:\"1h\";i:1;}s:6:\"clouds\";a:1:{s:3:\"all\";i:100;}s:2:\"dt\";i:1691563264;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:9233;s:7:\"country\";s:2:\"IN\";s:7:\"sunrise\";i:1691542060;s:6:\"sunset\";i:1691587856;}s:8:\"timezone\";i:19800;s:2:\"id\";i:1271157;s:4:\"name\";s:3:\"Goa\";s:3:\"cod\";i:200;}', '2023-08-09 01:14:27', '2023-08-09 01:14:27'),
(27, 'Raniganj', 'Haze', 'haze', '31', '74', '1004', '3.6', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:87.1333;s:3:\"lat\";d:23.6167;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:721;s:4:\"main\";s:4:\"Haze\";s:11:\"description\";s:4:\"haze\";s:4:\"icon\";s:3:\"50d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:6:{s:4:\"temp\";d:30.91;s:10:\"feels_like\";d:37.91;s:8:\"temp_min\";d:30.91;s:8:\"temp_max\";d:30.91;s:8:\"pressure\";i:1004;s:8:\"humidity\";i:74;}s:10:\"visibility\";i:4800;s:4:\"wind\";a:2:{s:5:\"speed\";d:3.6;s:3:\"deg\";i:240;}s:6:\"clouds\";a:1:{s:3:\"all\";i:75;}s:2:\"dt\";i:1691563494;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:9144;s:7:\"country\";s:2:\"IN\";s:7:\"sunrise\";i:1691538268;s:6:\"sunset\";i:1691585384;}s:8:\"timezone\";i:19800;s:2:\"id\";i:1258470;s:4:\"name\";s:8:\"Raniganj\";s:3:\"cod\";i:200;}', '2023-08-09 01:14:54', '2023-08-09 01:14:54'),
(28, 'Bankura', 'Clouds', 'broken clouds', '31', '59', '1003', '4.17', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:87.0667;s:3:\"lat\";d:23.25;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:803;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:13:\"broken clouds\";s:4:\"icon\";s:3:\"04d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";d:31.05;s:10:\"feels_like\";d:34.7;s:8:\"temp_min\";d:31.05;s:8:\"temp_max\";d:31.05;s:8:\"pressure\";i:1003;s:8:\"humidity\";i:59;s:9:\"sea_level\";i:1003;s:10:\"grnd_level\";i:994;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:3:{s:5:\"speed\";d:4.17;s:3:\"deg\";i:293;s:4:\"gust\";d:5.54;}s:6:\"clouds\";a:1:{s:3:\"all\";i:71;}s:2:\"dt\";i:1691563834;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:9144;s:7:\"country\";s:2:\"IN\";s:7:\"sunrise\";i:1691538315;s:6:\"sunset\";i:1691585369;}s:8:\"timezone\";i:19800;s:2:\"id\";i:1277264;s:4:\"name\";s:8:\"Bānkura\";s:3:\"cod\";i:200;}', '2023-08-09 01:23:02', '2023-08-09 01:23:02'),
(29, 'Adra', 'Clear', 'clear sky', '24', '79', '1018', '1.64', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:-3.0206;s:3:\"lat\";d:36.7496;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:800;s:4:\"main\";s:5:\"Clear\";s:11:\"description\";s:9:\"clear sky\";s:4:\"icon\";s:3:\"01d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";d:24.47;s:10:\"feels_like\";d:25.04;s:8:\"temp_min\";d:24.47;s:8:\"temp_max\";d:24.47;s:8:\"pressure\";i:1018;s:8:\"humidity\";i:79;s:9:\"sea_level\";i:1018;s:10:\"grnd_level\";i:1015;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:3:{s:5:\"speed\";d:1.64;s:3:\"deg\";i:268;s:4:\"gust\";d:1.81;}s:6:\"clouds\";a:1:{s:3:\"all\";i:6;}s:2:\"dt\";i:1691564407;s:3:\"sys\";a:3:{s:7:\"country\";s:2:\"ES\";s:7:\"sunrise\";i:1691558641;s:6:\"sunset\";i:1691608282;}s:8:\"timezone\";i:7200;s:2:\"id\";i:2522430;s:4:\"name\";s:4:\"Adra\";s:3:\"cod\";i:200;}', '2023-08-09 01:30:07', '2023-08-09 01:30:07'),
(30, 'Dhaka', 'Haze', 'haze', '32', '66', '1003', '2.06', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:90.4074;s:3:\"lat\";d:23.7104;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:721;s:4:\"main\";s:4:\"Haze\";s:11:\"description\";s:4:\"haze\";s:4:\"icon\";s:3:\"50d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:6:{s:4:\"temp\";d:31.99;s:10:\"feels_like\";d:38.97;s:8:\"temp_min\";d:31.99;s:8:\"temp_max\";d:31.99;s:8:\"pressure\";i:1003;s:8:\"humidity\";i:66;}s:10:\"visibility\";i:4000;s:4:\"wind\";a:2:{s:5:\"speed\";d:2.06;s:3:\"deg\";i:230;}s:6:\"clouds\";a:1:{s:3:\"all\";i:75;}s:2:\"dt\";i:1691566775;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:9145;s:7:\"country\";s:2:\"BD\";s:7:\"sunrise\";i:1691537474;s:6:\"sunset\";i:1691584607;}s:8:\"timezone\";i:21600;s:2:\"id\";i:1185241;s:4:\"name\";s:5:\"Dhaka\";s:3:\"cod\";i:200;}', '2023-08-09 02:15:52', '2023-08-09 02:15:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `weather_data`
--
ALTER TABLE `weather_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_city` (`city`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `weather_data`
--
ALTER TABLE `weather_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
