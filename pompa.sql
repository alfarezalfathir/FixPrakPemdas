-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.44 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for pompa
CREATE DATABASE IF NOT EXISTS `pompa` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pompa`;

-- Dumping structure for table pompa.moisture
CREATE TABLE IF NOT EXISTS `moisture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moisture` float DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table pompa.moisture: ~4 rows (approximately)
INSERT INTO `moisture` (`id`, `moisture`, `created_at`) VALUES
	(1, 57.6, '2026-01-03'),
	(2, 67.1, '2026-01-03'),
	(3, 41.7, '2026-01-03'),
	(4, 46.6, '2026-01-03');

-- Dumping structure for table pompa.soil_sensor
CREATE TABLE IF NOT EXISTS `soil_sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moisture` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pompa.soil_sensor: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
