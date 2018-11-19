-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.34-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for incube8
CREATE DATABASE IF NOT EXISTS `incube8` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `incube8`;

-- Dumping structure for table incube8.buses
CREATE TABLE IF NOT EXISTS `buses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table incube8.buses: ~2 rows (approximately)
/*!40000 ALTER TABLE `buses` DISABLE KEYS */;
INSERT INTO `buses` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Bus 1', NULL, NULL),
	(2, 'Bus 2', NULL, NULL),
	(3, 'Bus 3', NULL, NULL);
/*!40000 ALTER TABLE `buses` ENABLE KEYS */;

-- Dumping structure for table incube8.bus_stop
CREATE TABLE IF NOT EXISTS `bus_stop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) NOT NULL,
  `stop_id` int(11) NOT NULL,
  `arrival_time` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table incube8.bus_stop: ~2 rows (approximately)
/*!40000 ALTER TABLE `bus_stop` DISABLE KEYS */;
INSERT INTO `bus_stop` (`id`, `bus_id`, `stop_id`, `arrival_time`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2018-12-01 10:10:10', NULL, NULL),
	(2, 2, 4, '2018-12-01 10:10:10', NULL, NULL),
	(3, 3, 4, '2018-12-01 10:10:10', NULL, NULL);
/*!40000 ALTER TABLE `bus_stop` ENABLE KEYS */;

-- Dumping structure for table incube8.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table incube8.migrations: ~10 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(6, '2016_06_01_000004_create_oauth_clients_table', 1),
	(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(8, '2018_11_18_142456_create_stops_table', 2),
	(9, '2018_11_18_142943_create_buses_table', 2),
	(10, '2018_11_18_143254_create_bus_stop_table', 2),
	(11, '2018_11_18_234031_create_user_stop_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table incube8.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table incube8.oauth_access_tokens: ~7 rows (approximately)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('1cba3043c67c46d9565c5eda3d316ffb7915f523c2aecbde79d05faa163aa58cadbb1c0c87f5ebe2', 1, 3, NULL, '[]', 0, '2018-11-19 16:18:06', '2018-11-19 16:18:06', '2019-11-19 16:18:06'),
	('35afc69fdd0053aeef7320489b7f36a75e3b428ceac88d6827895aeb1731ab262a047d3f2ab82cd5', 1, 3, NULL, '[]', 0, '2018-11-18 20:41:26', '2018-11-18 20:41:26', '2019-11-18 20:41:26'),
	('3e04df038698441cb27b8c5186484534a16371532b0b7c17a363ceb718de15aaf78e9b9c7deeabd9', 1, 3, NULL, '[]', 0, '2018-11-18 17:44:36', '2018-11-18 17:44:36', '2019-11-18 17:44:36'),
	('7483488bdecbfd9cddefdf5bc098eed9d3e440226c24107e31f120ecc8caecac7287df57aa020b3b', 1, 3, NULL, '[]', 0, '2018-11-18 20:42:38', '2018-11-18 20:42:38', '2019-11-18 20:42:38'),
	('838322988d648319e780888f541f4cccc277b98e1dddede84c1d16c73c4ea8032d42e454d97572a6', 1, 3, NULL, '[]', 0, '2018-11-18 20:46:30', '2018-11-18 20:46:30', '2019-11-18 20:46:30'),
	('a696531d1708e24c1d537c5d9ee75c526d8c3794865e3776779f992d83fde2a4bed1c3f237a0fc4e', 1, 3, NULL, '[]', 0, '2018-11-18 20:53:07', '2018-11-18 20:53:07', '2019-11-18 20:53:07'),
	('afd67fd3ba90276eb4a95775b3a497f74cf5ae418b49f12a1053d48b9907f5e95743eca263645b29', 1, 3, NULL, '[]', 0, '2018-11-18 22:34:20', '2018-11-18 22:34:20', '2019-11-18 22:34:20');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table incube8.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table incube8.oauth_auth_codes: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Dumping structure for table incube8.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table incube8.oauth_clients: ~2 rows (approximately)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', '20iYibMCuTO3mudbXVGZrkgOxZGpaywBXKKnIlyI', 'http://localhost', 1, 0, 0, '2018-11-11 17:13:51', '2018-11-11 17:13:51'),
	(2, NULL, 'Laravel Password Grant Client', 'ii2ck1i7bi8pdOwCP51VzSmT9fZeU8GDF4fKEXlr', 'http://localhost', 0, 1, 0, '2018-11-11 17:13:51', '2018-11-11 17:13:51'),
	(3, 1, 'Waleed client', '5komrQWCJSd4PbB1mdUD2Ar0UGkzItpWuaaoSbDG', 'http://127.0.0.1:8000/home', 0, 0, 0, '2018-11-18 08:30:12', '2018-11-18 08:30:12');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table incube8.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table incube8.oauth_personal_access_clients: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2018-11-11 17:13:51', '2018-11-11 17:13:51');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table incube8.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table incube8.oauth_refresh_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Dumping structure for table incube8.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table incube8.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table incube8.stops
CREATE TABLE IF NOT EXISTS `stops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double(8,2) NOT NULL,
  `lng` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table incube8.stops: ~3 rows (approximately)
/*!40000 ALTER TABLE `stops` DISABLE KEYS */;
INSERT INTO `stops` (`id`, `name`, `lat`, `lng`, `created_at`, `updated_at`) VALUES
	(1, 'Lalpul', 31.56, 74.35, NULL, NULL),
	(2, 'Mughalpura', 31.57, 74.36, NULL, NULL),
	(3, 'Karachi', 24.86, 67.00, NULL, NULL),
	(4, 'Raiwand', 31.24, 74.21, NULL, NULL);
/*!40000 ALTER TABLE `stops` ENABLE KEYS */;

-- Dumping structure for table incube8.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table incube8.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Waleed', 'waleed.a.k@hotmail.com', NULL, '$2y$10$fMjGcZpInSPoJRBurjpHF.Mz3j/rWshMQOrpYyDt6L6JVdhwCLyIy', 'SsDgXWtH1jXz0oPoiM0UzpyL8NXzKt1tYM80viJIo2wRu7RAXdmChZmMdPpk', '2018-11-11 18:16:51', '2018-11-11 18:16:51');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table incube8.user_stop
CREATE TABLE IF NOT EXISTS `user_stop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `stop_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table incube8.user_stop: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_stop` DISABLE KEYS */;
INSERT INTO `user_stop` (`id`, `user_id`, `stop_id`, `created_at`, `updated_at`) VALUES
	(3, 1, 4, NULL, NULL),
	(4, 1, 2, NULL, NULL),
	(5, 1, 1, NULL, NULL);
/*!40000 ALTER TABLE `user_stop` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
