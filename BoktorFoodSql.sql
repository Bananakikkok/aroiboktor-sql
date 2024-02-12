
CREATE DATABASE IF NOT EXISTS `projectweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `projectweb`;

-- Dumping structure for table projectweb.members
CREATE TABLE IF NOT EXISTS `members` (
  `Id_Member` int(11) NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(30) NOT NULL,
  `Lastname` varchar(30) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password_Member` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_Member`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectweb.members: ~1 rows (approximately)
INSERT INTO `members` (`Id_Member`, `Firstname`, `Lastname`, `Email`, `Password_Member`) VALUES
	(1, 'ohmmy', 'the cat', 'thecatinthejungle@gmail.com', 'catcatcat');

-- Dumping structure for table projectweb.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `Id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `M_picture` varchar(255) DEFAULT NULL,
  `R_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id_menu`),
  KEY `R_Id` (`R_Id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`R_Id`) REFERENCES `restaurant` (`R_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectweb.menu: ~1 rows (approximately)
INSERT INTO `menu` (`Id_menu`, `M_picture`, `R_Id`) VALUES
	(1, '', 1);

-- Dumping structure for table projectweb.phone
CREATE TABLE IF NOT EXISTS `phone` (
  `R_Phone` char(11) NOT NULL,
  `R_Id` int(11) NOT NULL,
  PRIMARY KEY (`R_Phone`),
  KEY `R_Id` (`R_Id`),
  CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`R_Id`) REFERENCES `restaurant` (`R_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectweb.phone: ~1 rows (approximately)
INSERT INTO `phone` (`R_Phone`, `R_Id`) VALUES
	('0878772191', 1);

-- Dumping structure for table projectweb.restaurant
CREATE TABLE IF NOT EXISTS `restaurant` (
  `R_Id` int(11) NOT NULL AUTO_INCREMENT,
  `R_Name` varchar(50) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `R_Date` varchar(255) DEFAULT NULL,
  `R_Time` time DEFAULT NULL,
  `Cost` int(11) DEFAULT NULL,
  `R_Picture` varchar(255) DEFAULT NULL,
  `Note` varchar(255) DEFAULT NULL,
  `Id_Type` int(11) NOT NULL,
  PRIMARY KEY (`R_Id`),
  KEY `Id_Type` (`Id_Type`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`Id_Type`) REFERENCES `restaurant_type` (`Id_Type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectweb.restaurant: ~1 rows (approximately)
INSERT INTO `restaurant` (`R_Id`, `R_Name`, `Address`, `R_Date`, `R_Time`, `Cost`, `R_Picture`, `Note`, `Id_Type`) VALUES
	(1, 'Food', 'พะเยา', 'จ-ศ', '08:00:00', 50, 'ddd', 'อร่อย', 1);

-- Dumping structure for table projectweb.restaurant_type
CREATE TABLE IF NOT EXISTS `restaurant_type` (
  `Id_Type` int(11) NOT NULL AUTO_INCREMENT,
  `R_Type` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectweb.restaurant_type: ~1 rows (approximately)
INSERT INTO `restaurant_type` (`Id_Type`, `R_Type`) VALUES
	(1, 'ก๋วยเตี๋ยว');

-- Dumping structure for table projectweb.review
CREATE TABLE IF NOT EXISTS `review` (
  `R_Id` int(11) NOT NULL,
  `Id_Member` int(11) NOT NULL,
  `Review_Score` decimal(3,2) DEFAULT NULL,
  `R_Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Member`,`R_Id`),
  KEY `R_Id` (`R_Id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`R_Id`) REFERENCES `restaurant` (`R_Id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`Id_Member`) REFERENCES `members` (`Id_Member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectweb.review: ~1 rows (approximately)
INSERT INTO `review` (`R_Id`, `Id_Member`, `Review_Score`, `R_Comment`) VALUES
	(1, 1, 3.70, 'อร่อยมักๆคับจากใจเด้กช่าง');