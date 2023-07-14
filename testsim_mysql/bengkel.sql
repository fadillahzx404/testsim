-- Adminer 4.8.1 MySQL 8.0.30 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id_carts` int NOT NULL AUTO_INCREMENT,
  `id_produk` int NOT NULL,
  `id_users` int NOT NULL,
  PRIMARY KEY (`id_carts`),
  KEY `id_produk` (`id_produk`),
  KEY `id_users` (`id_users`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  CONSTRAINT `carts_ibfk_3` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk` (
  `id_produk` int NOT NULL AUTO_INCREMENT,
  `id_kategori` int DEFAULT NULL,
  `nama_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_produk`),
  KEY `id_kategori` (`id_kategori`),
  CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `users` (`id`, `level`, `nama`, `email`, `password`) VALUES
(1,	'users',	'users1',	'users@gmail.com',	'12345678'),
(2,	'pelanggan',	'pelanggan1',	'pelanggan@gmail.com',	'12345678')
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `level` = VALUES(`level`), `nama` = VALUES(`nama`), `email` = VALUES(`email`), `password` = VALUES(`password`);

-- 2023-07-14 08:50:18
