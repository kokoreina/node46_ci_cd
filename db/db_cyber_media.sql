/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `car_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `passengers` int DEFAULT NULL,
  `max_speed` varchar(255) DEFAULT NULL,
  `gearbox_type` varchar(255) DEFAULT NULL,
  `fuel_type` varchar(255) DEFAULT NULL,
  `price_per_day` double DEFAULT NULL,
  `discount_percentage` int DEFAULT '0',
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (
  `chat_id` int NOT NULL AUTO_INCREMENT,
  `message` text,
  `user_id_sender` int NOT NULL,
  `user_id_recipient` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`chat_id`),
  KEY `user_id_sender` (`user_id_sender`),
  KEY `user_id_recipient` (`user_id_recipient`),
  CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`user_id_sender`) REFERENCES `users` (`user_id`),
  CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`user_id_recipient`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `endpoint` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions` (
  `role_permissions_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_permissions_id`),
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `goole_id` varchar(255) DEFAULT NULL,
  `face_app_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_id` int NOT NULL DEFAULT '2',
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `video_type`;
CREATE TABLE `video_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `video_id` int NOT NULL AUTO_INCREMENT,
  `video_name` varchar(255) DEFAULT NULL,
  `description` text,
  `thumbnail` varchar(255) DEFAULT NULL,
  `views` int DEFAULT '0',
  `source` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'Tesla Model S', 'Free recharge at any station', 4, '100 km/h in 4 seconds', 'Automatic gearbox', 'Electric', 168, 25, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(2, 'BMW i8', 'Hybrid electric sports car', 2, '120 km/h in 4.2 seconds', 'Automatic gearbox', 'Hybrid', 190, 15, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(3, 'Audi e-tron', 'Luxury electric SUV', 5, '110 km/h in 5.7 seconds', 'Automatic gearbox', 'Electric', 200, 20, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(4, 'Mercedes-Benz EQC', 'Electric SUV with long range', 5, '100 km/h in 5.1 seconds', 'Automatic gearbox', 'Electric', 210, 10, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(5, 'Porsche Taycan', 'Electric performance sedan', 4, '125 km/h in 3.5 seconds', 'Automatic gearbox', 'Electric', 250, 18, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(6, 'Chevrolet Bolt', 'Affordable electric hatchback', 4, '90 km/h in 6.5 seconds', 'Automatic gearbox', 'Electric', 95, 5, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(7, 'Nissan Leaf', 'Popular electric car', 4, '80 km/h in 7 seconds', 'Automatic gearbox', 'Electric', 80, 12, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(8, 'Ford Mustang Mach-E', 'Electric SUV with muscle car spirit', 5, '105 km/h in 5.0 seconds', 'Automatic gearbox', 'Electric', 185, 8, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(9, 'Jaguar I-PACE', 'Luxury electric SUV', 5, '110 km/h in 4.8 seconds', 'Automatic gearbox', 'Electric', 220, 20, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(10, 'Hyundai Kona Electric', 'Compact electric SUV', 5, '90 km/h in 7.2 seconds', 'Automatic gearbox', 'Electric', 120, 5, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(11, 'Tesla Model X', 'Family-friendly electric SUV', 7, '105 km/h in 4.4 seconds', 'Automatic gearbox', 'Electric', 260, 22, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(12, 'Kia Soul EV', 'Compact and quirky electric car', 5, '85 km/h in 8.0 seconds', 'Automatic gearbox', 'Electric', 100, 7, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(13, 'Volkswagen ID.4', 'All-electric compact SUV', 5, '95 km/h in 6.8 seconds', 'Automatic gearbox', 'Electric', 130, 10, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(14, 'Mazda MX-30', 'Stylish electric crossover', 4, '80 km/h in 9.1 seconds', 'Automatic gearbox', 'Electric', 90, 6, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(15, 'Honda e', 'Compact city electric car', 4, '75 km/h in 8.3 seconds', 'Automatic gearbox', 'Electric', 85, 3, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(16, 'Lucid Air', 'High-performance electric sedan', 5, '120 km/h in 3.0 seconds', 'Automatic gearbox', 'Electric', 290, 20, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(17, 'Rivian R1T', 'Electric adventure truck', 5, '105 km/h in 3.2 seconds', 'Automatic gearbox', 'Electric', 280, 18, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(18, 'BYD Tang EV', 'Affordable electric SUV', 7, '90 km/h in 6.5 seconds', 'Automatic gearbox', 'Electric', 150, 12, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(19, 'Peugeot e-208', 'Compact electric hatchback', 5, '85 km/h in 7.8 seconds', 'Automatic gearbox', 'Electric', 95, 10, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(20, 'Renault Zoe', 'Popular electric city car', 5, '80 km/h in 8.5 seconds', 'Automatic gearbox', 'Electric', 80, 8, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(21, 'Tesla Model 3', 'Electric sedan with long range', 5, '110 km/h in 3.5 seconds', 'Automatic gearbox', 'Electric', 170, 20, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(22, 'Volvo XC40 Recharge', 'Electric luxury SUV', 5, '100 km/h in 4.9 seconds', 'Automatic gearbox', 'Electric', 225, 15, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(23, 'BMW X3 Electric', 'Luxury compact electric SUV', 5, '105 km/h in 5.2 seconds', 'Automatic gearbox', 'Electric', 210, 10, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(24, 'Mini Cooper SE', 'Compact electric hatchback', 4, '80 km/h in 7.0 seconds', 'Automatic gearbox', 'Electric', 90, 5, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(25, 'Skoda Enyaq iV', 'Practical electric SUV', 5, '95 km/h in 6.9 seconds', 'Automatic gearbox', 'Electric', 135, 12, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(26, 'Fiat 500 Electric', 'Stylish city electric car', 4, '75 km/h in 9.0 seconds', 'Automatic gearbox', 'Electric', 80, 5, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(27, 'Opel Mokka-e', 'Compact electric SUV', 5, '85 km/h in 8.5 seconds', 'Automatic gearbox', 'Electric', 95, 7, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(28, 'Toyota bZ4X', 'Toyota\'s first all-electric SUV', 5, '90 km/h in 7.5 seconds', 'Automatic gearbox', 'Electric', 150, 13, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(29, 'Ford F-150 Lightning', 'Electric version of classic truck', 5, '100 km/h in 4.5 seconds', 'Automatic gearbox', 'Electric', 250, 17, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `cars` (`car_id`, `name`, `description`, `passengers`, `max_speed`, `gearbox_type`, `fuel_type`, `price_per_day`, `discount_percentage`, `image_url`, `created_at`, `updated_at`) VALUES
(30, 'GMC Hummer EV', 'Electric off-road SUV', 5, '100 km/h in 3.5 seconds', 'Automatic gearbox', 'Electric', 350, 22, 'https://i.imgur.com/ZL52Q2D.png', NULL, NULL);
INSERT INTO `chats` (`chat_id`, `message`, `user_id_sender`, `user_id_recipient`, `created_at`, `updated_at`) VALUES
(1, 'yyy', 18, 17, '2025-02-21 12:20:15', '2025-02-21 12:20:15');
INSERT INTO `chats` (`chat_id`, `message`, `user_id_sender`, `user_id_recipient`, `created_at`, `updated_at`) VALUES
(2, 'sadsada', 17, 18, '2025-02-21 12:20:24', '2025-02-21 12:20:24');
INSERT INTO `chats` (`chat_id`, `message`, `user_id_sender`, `user_id_recipient`, `created_at`, `updated_at`) VALUES
(3, 'ádsadsad', 18, 17, '2025-02-21 12:20:27', '2025-02-21 12:20:27');
INSERT INTO `chats` (`chat_id`, `message`, `user_id_sender`, `user_id_recipient`, `created_at`, `updated_at`) VALUES
(4, 'ádsadsa', 18, 17, '2025-02-21 12:20:40', '2025-02-21 12:20:40');
INSERT INTO `chats` (`chat_id`, `message`, `user_id_sender`, `user_id_recipient`, `created_at`, `updated_at`) VALUES
(5, 'dsadsad', 17, 18, '2025-02-21 12:20:52', '2025-02-21 12:20:52');
INSERT INTO `chats` (`chat_id`, `message`, `user_id_sender`, `user_id_recipient`, `created_at`, `updated_at`) VALUES
(6, 'em ơi', 18, 17, '2025-02-21 12:21:00', '2025-02-21 12:21:00');
INSERT INTO `chats` (`chat_id`, `message`, `user_id_sender`, `user_id_recipient`, `created_at`, `updated_at`) VALUES
(7, 'em đây', 17, 18, '2025-02-21 12:21:03', '2025-02-21 12:21:03');
INSERT INTO `permissions` (`permission_id`, `name`, `endpoint`, `method`, `module`, `created_at`, `updated_at`) VALUES
(1, 'READ VIDEO', '/video/video-list', 'GET', 'videos', '2025-02-11 10:35:21', '2025-02-11 10:35:21');
INSERT INTO `permissions` (`permission_id`, `name`, `endpoint`, `method`, `module`, `created_at`, `updated_at`) VALUES
(2, 'CREATE VIDEO', '/video/video-create', 'GET', 'videos', '2025-02-11 10:35:21', '2025-02-11 10:35:21');
INSERT INTO `role_permissions` (`role_permissions_id`, `role_id`, `permission_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, '2025-02-11 10:38:22', '2025-02-17 04:34:49');
INSERT INTO `role_permissions` (`role_permissions_id`, `role_id`, `permission_id`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 1, '2025-02-11 10:41:22', '2025-02-17 04:34:53');
INSERT INTO `role_permissions` (`role_permissions_id`, `role_id`, `permission_id`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 1, '2025-02-12 11:03:54', '2025-02-13 03:52:20');
INSERT INTO `role_permissions` (`role_permissions_id`, `role_id`, `permission_id`, `is_active`, `created_at`, `updated_at`) VALUES
(4, 1, 2, 1, '2025-02-12 11:03:56', '2025-02-13 03:52:23');
INSERT INTO `roles` (`role_id`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'ROLE_ADMIN', 'Quản trị', 1, '2025-02-11 10:22:17', '2025-02-11 10:22:17');
INSERT INTO `roles` (`role_id`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'ROLE_USER', 'Người dùng hệ thống', 1, '2025-02-11 10:22:58', '2025-02-11 10:22:58');
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(1, 'long@gmail.com', '1234', 'long', NULL, NULL, NULL, '2024-12-10 15:32:57', '2024-12-10 15:32:57', 2);
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(2, 'long1@gmail.com', '1234', 'huyhuy', NULL, NULL, NULL, '2025-01-15 02:28:17', '2025-01-15 02:28:17', 2);
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(3, 'long2@gmail.com', '$2b$10$eL9KhMxmreKksNxOuVUf6OwV/lZZBJEklMOWBytrhe.YPgM8prKbq', 'huyhuy', 'local-avatar-1740310583414-20606931.jpg', NULL, NULL, '2025-01-15 02:44:50', '2025-02-23 11:36:23', 2);
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(4, 'long3@gmail.com', '$2b$10$IhIl/zcO2/preb10fsJFauhXGdvQ/46V5UX8s5XcnHUqpoZEFFLRW', 'huyhuy', NULL, NULL, NULL, '2025-01-15 04:17:10', '2025-01-15 04:17:10', 2);
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(5, 'long20@gmail.com', '$2b$10$iIy2POnP365UWCUBp70IOuUe4/tS3eTlagjoZJdS6WIpwTIbpOpdu', 'huyhuy', NULL, NULL, NULL, '2025-01-15 04:29:57', '2025-01-15 04:29:57', 2);
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(6, 'huy2005@gmail.com', '$2b$10$PfCkT4hKMKD2Ogq.ilZJXunoCSb3u6z52PUThNHL4aVixLQrTXhBy', 'huy', NULL, NULL, NULL, '2025-01-15 04:34:13', '2025-01-15 04:34:13', 2);
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(8, 'giang761967@gmail.com', '$2b$10$lwTmWe8qj4re3QDVDMZwHOixtNUc3fOZjkeEXPlWNDPFT5O9poqha', 'huyhuy', NULL, NULL, NULL, '2025-01-15 05:01:14', '2025-01-15 05:01:14', 2);
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(9, 'kokoreina25@gmail.com', '$2b$10$rdAjt.scED.MRCWY61yDZuUi2wWf0EPvov/yYwTVqj2yIvz5yq7.2', 'huyhuy', NULL, NULL, NULL, '2025-01-15 05:02:15', '2025-01-15 05:02:15', 2);
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(10, 'kokoreina1999@gmail.com', '$2b$10$cdtRA4ZLZXmRP/1IIcnFI./UeLJUDE.gHGdvn4Ur0BwOghcx7n51m', 'huyhuy', NULL, NULL, NULL, '2025-02-15 11:24:06', '2025-02-15 11:24:06', 2);
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(11, 'hang30071967@gmail.com', '$2b$10$HHWIKXeGJbMjFw9ewYxNRuk3gYUBwqtSGn2jz0YtNSio9K5pYgmk.', 'mommom', NULL, NULL, NULL, '2025-02-15 11:30:28', '2025-02-15 11:30:28', 2);
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(13, 'kokoreina2005@gmail.com', '$2b$10$I1E.wEZoIofyWoZB9sIrx.50KITjEXC8r2O8wOC6c3mtdtj9tbhYO', 'huyhuy', 'https://res.cloudinary.com/dardckskk/image/upload/v1740401899/images/ghme5nfjcvooytdgdkvz.png', NULL, NULL, '2025-02-15 12:01:49', '2025-02-24 12:58:25', 2);
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(14, 'khanhbadao115@gmail.com', '$2b$10$EVGDPrEyFMU7r.z1ZHK8mObe3QWdDjQ4EN7kYez.qRxKoxdzrY9A2', 'khanh', NULL, NULL, NULL, '2025-02-15 12:07:55', '2025-02-15 12:07:55', 2);
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(16, 'nguyenvana@gmail.com', '$2b$10$TtoMA4LFXwhmpBIuCSSVV.s3eYU403eR96.HqDkEycLoGeCGcJjCC', 'nguyenvana', NULL, NULL, NULL, '2025-02-19 08:16:59', '2025-02-19 08:16:59', 2);
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(17, 'huy11@gmail.com', '$2b$10$az5NIfSsDrr73rdKxN/2feuv/Vfhw9o8dIGTZDjYni8MZ8.o1eZm.', 'huy11', NULL, NULL, NULL, '2025-02-20 11:05:16', '2025-02-20 11:05:16', 2);
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `goole_id`, `face_app_id`, `created_at`, `updated_at`, `role_id`) VALUES
(18, 'huy22@gmail.com', '$2b$10$v74eBmVDnB.dRYuygdKAfORkUHxPlZ9zk9czxqCeIBJv1WZTLcVaK', 'huy22', NULL, NULL, NULL, '2025-02-20 11:05:54', '2025-02-20 11:05:54', 2);
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'New', 'IconNews', '2024-12-07 17:16:22', '2024-12-07 17:16:22');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(2, 'Coding', 'IconCode', '2024-12-07 17:16:22', '2024-12-07 17:16:22');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(3, 'Music', 'IconMusic', '2024-12-07 17:16:22', '2024-12-07 17:16:22');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(4, 'Movie', 'IconVideo', '2024-12-07 17:16:22', '2024-12-07 17:16:22');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(5, 'Gaming', 'IconDeviceGamepad', '2024-12-07 17:16:22', '2024-12-07 17:16:22');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(6, 'Sport', 'IconBallBaseball', '2024-12-07 17:16:22', '2024-12-07 17:16:22');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(7, 'Fashion', 'IconShirt', '2024-12-07 17:16:22', '2024-12-07 17:16:22');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(8, 'Gym', 'IconUmbrella', '2024-12-07 17:16:22', '2024-12-07 17:16:22');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(9, 'Crypto', 'IconDiamond', '2024-12-07 17:16:22', '2024-12-07 17:16:22');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(10, 'hello type name', NULL, '2025-03-19 10:38:07', '2025-03-19 10:38:07');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`, `created_at`, `updated_at`) VALUES
(11, 'hello word', NULL, '2025-03-19 11:01:33', '2025-03-19 11:01:33');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'SƠN TÙNG M-TP | ĐỪNG LÀM TRÁI TIM ANH ĐAU | OFFICIAL TEASER', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 'https://img.youtube.com/vi/CQXQKr_3vKE/maxresdefault.jpg', 1500, 'https://www.youtube.com/watch?v=CQXQKr_3vKE', 2, 1, '2024-10-07 07:08:26', '2024-10-07 08:00:00');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'SƠN TÙNG M-TP | ĐỪNG LÀM TRÁI TIM ANH ĐAU | OFFICIAL', 'Highlights from a live music concert', 'https://img.youtube.com/vi/abPmZCZZrFA/maxresdefault.jpg', 800, 'https://www.youtube.com/watch?v=abPmZCZZrFA', 3, 1, '2024-10-08 09:00:00', '2024-10-08 09:30:00');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 'SƠN TÙNG M-TP | CHÚNG TA CỦA TƯƠNG LAI | OFFICIAL MUSIC VIDEO', 'First episode of a gaming adventure', 'https://img.youtube.com/vi/zoEtcR5EW08/maxresdefault.jpg', 2500, 'https://www.youtube.com/watch?v=zoEtcR5EW08', 5, 1, '2024-10-09 10:10:10', '2024-10-09 10:30:30');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 'SƠN TÙNG M-TP | 7-MINUTE STAGE | ĐỪNG LÀM TRÁI TIM ANH ĐAU', 'Latest fashion trends for the spring season', 'https://img.youtube.com/vi/FEmnnU-HhnQ/maxresdefault.jpg', 1200, 'https://www.youtube.com/watch?v=FEmnnU-HhnQ', 7, 1, '2024-10-10 11:15:20', '2024-10-10 11:45:00');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(5, '(Synthwave Disco 80s) Em Đừng Đi - Sơn Tùng M-TP | Prod. by SenTfour', 'Understanding the basics of cryptocurrency', 'https://img.youtube.com/vi/kMg3wTAhNsY/maxresdefault.jpg', 300, 'https://www.youtube.com/watch?v=kMg3wTAhNsY', 9, 1, '2024-10-11 12:20:00', '2024-10-11 12:50:00');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(6, 'SƠN TÙNG M-TP | MUỘN RỒI MÀ SAO CÒN | OFFICIAL MUSIC VIDEO', 'Complete guide to full stack web development', 'https://img.youtube.com/vi/xypzmu5mMPY/maxresdefault.jpg', 1200, 'https://www.youtube.com/watch?v=xypzmu5mMPY', 2, 1, '2024-10-12 13:30:00', '2024-10-12 13:45:00');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(7, 'NƠI NÀY CÓ ANH | OFFICIAL MUSIC VIDEO | SƠN TÙNG M-TP', 'Soulful acoustic guitar performance', 'https://img.youtube.com/vi/FN7ALfpGxiI/maxresdefault.jpg', 650, 'https://www.youtube.com/watch?v=FN7ALfpGxiI', 3, 1, '2024-10-14 14:00:00', '2024-10-14 14:30:00');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(8, 'SƠN TÙNG M-TP | CHÚNG TA CỦA HIỆN TẠI | OFFICIAL MUSIC VIDEO', 'Compilation of epic gaming moments', 'https://img.youtube.com/vi/psZ1g9fMfeo/maxresdefault.jpg', 3500, 'https://www.youtube.com/watch?v=psZ1g9fMfeo', 5, 1, '2024-10-15 15:10:00', '2024-10-15 15:20:00');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(9, 'SƠN TÙNG M-TP | HÃY TRAO CHO ANH ft. Snoop Dogg | Official MV\n', 'Effective fitness workout routine', 'https://img.youtube.com/vi/knW7-x7Y7RE/maxresdefault.jpg', 900, 'https://www.youtube.com/watch?v=knW7-x7Y7RE', 1, 8, '2024-10-16 08:15:30', '2024-10-16 09:45:30');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(10, 'Em Là Mầm Non Của Đảng (Thu thanh trước 1975) | Hà Nội Vi Vu', 'Effective fitness workout routine', 'https://img.youtube.com/vi/vfWTt905FUI/maxresdefault.jpg', 900, 'https://www.youtube.com/watch?v=vfWTt905FUI', 1, 8, '2024-10-17 14:20:45', '2024-10-17 15:30:10');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(11, 'SƠN TÙNG M-TP x BOMATELA | CÓ CHẮC YÊU LÀ ĐÂY (REMIX) | SHOW RECAP', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 'https://img.youtube.com/vi/EhJqekMVxTc/maxresdefault.jpg', 299, 'https://www.youtube.com/watch?v=EhJqekMVxTc', 1, 1, '2024-10-18 10:00:00', '2024-10-18 12:00:00');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(12, 'SƠN TÙNG M-TP | LẠC TRÔI MOVINGTOON | PHOTOSHOOT | OFFICIAL EPISODE 36', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. ', 'https://img.youtube.com/vi/phknRB6-f4U/maxresdefault.jpg', 408, 'https://www.youtube.com/watch?v=phknRB6-f4U', 1, 1, '2024-10-19 09:30:25', '2024-10-19 11:45:00');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(13, 'SƠN TÙNG M-TP | LẠC TRÔI MOVINGTOON | TÙNG FAKE TÙNG REAL | OFFICIAL EPISODE 30', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. ', 'https://img.youtube.com/vi/kgeiiJNewZc/maxresdefault.jpg', 199, 'https://www.youtube.com/watch?v=kgeiiJNewZc', 1, 4, '2024-10-20 08:00:00', '2024-10-20 09:00:00');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(14, 'SON TUNG M-TP | MAKING MY WAY | OFFICIAL VISUALIZER', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. ', 'https://img.youtube.com/vi/niPkap1ozUA/maxresdefault.jpg', 120, 'https://www.youtube.com/watch?v=niPkap1ozUA', 1, 6, '2024-10-21 16:30:00', '2024-10-21 17:00:00');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(15, 'SƠN TÙNG M-TP | THERES NO ONE AT ALL (ANOTHER VERSION) | OFFICIAL MUSIC VIDEO', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 'https://img.youtube.com/vi/JHSRTU31T14/maxresdefault.jpg', 1000, 'https://www.youtube.com/watch?v=JHSRTU31T14', 1, 4, '2024-10-22 10:10:10', '2024-10-22 11:30:45');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(16, 'SƠN TÙNG M-TP | LẠC TRÔI MOVINGTOON | KÝ HỢP ĐỒNG | OFFICIAL EPISODE 32', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 'https://img.youtube.com/vi/MaI7JCybK3s/maxresdefault.jpg', 999, 'https://www.youtube.com/watch?v=MaI7JCybK3s', 1, 6, '2024-10-24 08:45:30', '2024-10-24 10:15:00');
INSERT INTO `videos` (`video_id`, `video_name`, `description`, `thumbnail`, `views`, `source`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(17, 'Bản tình ca của Đá - [Official Audio] - HwangCho - Đường anh đi toàn ke với đá…', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. ', 'https://img.youtube.com/vi/ZyYmIiYEK7I/maxresdefault.jpg', 1500, 'https://www.youtube.com/watch?v=ZyYmIiYEK7I', 1, 6, '2024-10-25 18:00:00', '2024-10-25 19:00:00');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;