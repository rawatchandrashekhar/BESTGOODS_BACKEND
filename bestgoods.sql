-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: bestgoods
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `emailid` varchar(100) NOT NULL,
  `adminname` text,
  `password` text,
  `picture` text,
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('chandrashekharrawat@gmail.com','Chandra Shekhar Rawat','12345','1.jpg');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `bannerid` int NOT NULL AUTO_INCREMENT,
  `priority` int DEFAULT NULL,
  `description` text,
  `image` text,
  PRIMARY KEY (`bannerid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (3,1,'bbbbbbb','banner1.jpg'),(4,2,'aaaaaaaa','banner2.jpg'),(5,3,'bbbbbbb','banner3.jpg'),(6,4,'hhhhhhhhh','banner4.jpg'),(7,5,'yyyyyyy','banner5.jpg');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `categoryid` int NOT NULL AUTO_INCREMENT,
  `categoryname` text,
  `icon` text,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (13,'Electronic','electronics.png'),(14,'Accessory','Accesories.png'),(15,'Home & Living','home.jpg'),(16,'Fragrance','Fragrances.png'),(18,'Home Decor','homedecor.png'),(19,'Gimbal','gimbals.png'),(20,'Security','cctv.jpg'),(21,'Drone','drone.png'),(22,'Footwear','shoes.png'),(23,'Mobile Cover','mobilecases.png'),(24,'Power Bank','power_banks.png'),(25,'Air Purifier','air.png');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `colorid` int NOT NULL AUTO_INCREMENT,
  `categoryid` int DEFAULT NULL,
  `subcategoryid` int DEFAULT NULL,
  `companyid` int DEFAULT NULL,
  `productid` int DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `icon` text,
  PRIMARY KEY (`colorid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (9,13,14,8,15,'Black','rma207-android-realme-original-imafy2fxtuzghm5m.jpeg'),(10,13,12,8,16,'Black','rma2007-realme-original-imag6zdn8gezjky5.jpeg'),(11,14,18,8,17,'White','realme-3-1-amp-original-imafvgcgvp3hngsq.jpeg'),(12,13,15,8,18,'Black','realme-buds-original-imafhzf2yxgn8hyh.jpeg');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `companyid` int NOT NULL AUTO_INCREMENT,
  `companyname` varchar(100) DEFAULT NULL,
  `contactperson` varchar(100) DEFAULT NULL,
  `mobileno` varchar(45) DEFAULT NULL,
  `emailid` varchar(45) DEFAULT NULL,
  `addressone` text,
  `addresstwo` text,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zipcode` int DEFAULT NULL,
  `description` text,
  `icon` text,
  PRIMARY KEY (`companyid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (8,'Realme','Jay Singh','9009785678','jaysingh@gmail.com','Phoolbagh','Chetakpuri','IN','MP','Gwalior',474001,'This company manufacture many products related to daily needs. ','download.png');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finalproducts`
--

DROP TABLE IF EXISTS `finalproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finalproducts` (
  `finalproductid` int NOT NULL AUTO_INCREMENT,
  `categoryid` int DEFAULT NULL,
  `subcategoryid` int DEFAULT NULL,
  `companyid` int DEFAULT NULL,
  `productid` int DEFAULT NULL,
  `colorid` int DEFAULT NULL,
  `modelid` int DEFAULT NULL,
  `sizeid` int DEFAULT NULL,
  `price` text,
  `stock` text,
  `offerprice` text,
  `description` text,
  `icon` text,
  `productstatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`finalproductid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finalproducts`
--

LOCK TABLES `finalproducts` WRITE;
/*!40000 ALTER TABLE `finalproducts` DISABLE KEYS */;
INSERT INTO `finalproducts` VALUES (13,13,14,8,15,9,11,11,'7999','3','0','Smart-Watch','rma207-android-realme-original-imafy2fxtuzghm5m.jpeg','Trending'),(14,13,14,8,16,10,12,12,'1499','678','799','Speaker','rma2007-realme-original-imag6zdn8gezjky5.jpeg','Trending'),(15,14,14,8,17,11,13,13,'999','678','499','Realme Charger','realme-3-1-amp-original-imafvgcgvp3hngsq.jpeg','Trending'),(16,13,14,8,18,12,14,14,'1999','0','1799','Bluetooth Headset','realme-buds-original-imafhzf2yxgn8hyh.jpeg','Trending'),(18,13,12,8,16,10,12,12,'1233','567','34','xxxxxxxxxxxxxxxxxxxxxxxx','rma2007-realme-original-imag6zdn8gezjky5.jpeg','Trending');
/*!40000 ALTER TABLE `finalproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `models` (
  `modelid` int NOT NULL AUTO_INCREMENT,
  `categoryid` int DEFAULT NULL,
  `subcategoryid` int DEFAULT NULL,
  `companyid` int DEFAULT NULL,
  `productid` int DEFAULT NULL,
  `modelname` text,
  `modelsize` varchar(45) DEFAULT NULL,
  `modelweight` varchar(45) DEFAULT NULL,
  `icon` text,
  PRIMARY KEY (`modelid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (11,13,14,8,15,'Realme Watch S','1.3 inch','48 g','rma207-android-realme-original-imafy2fxtuzghm5m.jpeg'),(12,13,12,8,16,'Realme Pocket Speaker','6.09 cm','50 g','rma2007-realme-original-imag6zdn8gezjky5.jpeg'),(13,14,18,8,17,'ASWORLD Fast Charger','1 cm','45 g','realme-3-1-amp-original-imafvgcgvp3hngsq.jpeg'),(14,13,15,8,18,'Buds Wireless Bluetooth Headset','1.5 m','20 gm','realme-buds-original-imafhzf2yxgn8hyh.jpeg');
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `morepictures`
--

DROP TABLE IF EXISTS `morepictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `morepictures` (
  `pictureid` int NOT NULL AUTO_INCREMENT,
  `finalproductid` int DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`pictureid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `morepictures`
--

LOCK TABLES `morepictures` WRITE;
/*!40000 ALTER TABLE `morepictures` DISABLE KEYS */;
INSERT INTO `morepictures` VALUES (1,12,'UML Class Diagram.jpg'),(2,12,'Untitled (4).jpg'),(3,12,'Untitled (3).jpg'),(4,12,'Untitled (2).jpg'),(5,12,'Untitled (1).jpg'),(6,12,'Untitled.jpg');
/*!40000 ALTER TABLE `morepictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productid` int NOT NULL AUTO_INCREMENT,
  `categoryid` int NOT NULL,
  `subcategoryid` int NOT NULL,
  `companyid` int NOT NULL,
  `productname` text,
  `description` text,
  `continueordiscontinue` varchar(45) DEFAULT NULL,
  `icon` text,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (15,13,14,8,'Realme Smart-Watch','Smart-watch','continue','rma207-android-realme-original-imafy2fxtuzghm5m.jpeg'),(16,13,12,8,'Realme Speaker','Speaker','continue','rma2007-realme-original-imag6zdn8gezjky5.jpeg'),(17,14,18,8,'Realme Charger','Charger','continue','realme-3-1-amp-original-imafvgcgvp3hngsq.jpeg'),(18,13,15,8,'Realme Bluetooth Headset','Bluetooth Headset','continue','realme-buds-original-imafhzf2yxgn8hyh.jpeg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subbannermorepictures`
--

DROP TABLE IF EXISTS `subbannermorepictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subbannermorepictures` (
  `subbannermorepicturesid` int NOT NULL AUTO_INCREMENT,
  `subbannerid` int DEFAULT NULL,
  `images` text,
  PRIMARY KEY (`subbannermorepicturesid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subbannermorepictures`
--

LOCK TABLES `subbannermorepictures` WRITE;
/*!40000 ALTER TABLE `subbannermorepictures` DISABLE KEYS */;
INSERT INTO `subbannermorepictures` VALUES (7,37,'2ndreceipt.png'),(8,37,'1streceipt.png'),(9,37,'sem3.png'),(10,37,'sem4.png'),(11,37,'realme-buds-original-imafhzf2yxgn8hyh.jpeg'),(12,37,'realme-3-1-amp-original-imafvgcgvp3hngsq.jpeg');
/*!40000 ALTER TABLE `subbannermorepictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subbanners`
--

DROP TABLE IF EXISTS `subbanners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subbanners` (
  `subbannerid` int NOT NULL AUTO_INCREMENT,
  `categoryid` int DEFAULT NULL,
  `subcategoryid` int DEFAULT NULL,
  `images` text,
  PRIMARY KEY (`subbannerid`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subbanners`
--

LOCK TABLES `subbanners` WRITE;
/*!40000 ALTER TABLE `subbanners` DISABLE KEYS */;
INSERT INTO `subbanners` VALUES (53,13,14,'spk1.jpg'),(54,13,14,'spk2.jpg'),(55,13,14,'spk3.jpg'),(56,13,14,'spk5.jpg'),(57,13,14,'spk6.jpg');
/*!40000 ALTER TABLE `subbanners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
  `subcategoryid` int NOT NULL AUTO_INCREMENT,
  `categoryid` int NOT NULL,
  `subcategoryname` text,
  `description` text,
  `icon` text,
  PRIMARY KEY (`subcategoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (12,13,'Speakers','Take The Party Wherever You Go ','speakers.jpg'),(13,13,'Projectors','HD Projectors With Great Sound Effects','projector.jpg'),(14,13,'Smart-Watches','Perfect Workout Buddy','smartwatch.jpg'),(15,13,'Headphones','Skip The Hassel of Wires','headphone.jpg'),(16,14,'Mouse','Compact & Wireless','mouse.jpg'),(17,14,'KeyBoards','Compact & Wireless','keyboard.jpg'),(18,14,'Mobile Chargers','Best Mobile Chargers','mobilecharger.jpg');
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testing`
--

DROP TABLE IF EXISTS `testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing` (
  `testingid` int NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(45) DEFAULT NULL,
  `subcategoryname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`testingid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testing`
--

LOCK TABLES `testing` WRITE;
/*!40000 ALTER TABLE `testing` DISABLE KEYS */;
INSERT INTO `testing` VALUES (1,NULL,NULL),(2,NULL,NULL),(3,'sdsds','jhbjkb');
/*!40000 ALTER TABLE `testing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `mobileno` varchar(30) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `password` text,
  PRIMARY KEY (`mobileno`,`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('+918989284298','moonisali@gmail.com','Moonis ','Ali','12345'),('+919009574613','chandrashekhar@gmail.com','Chandra Shekhar','Rawat','12345');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersaddress`
--

DROP TABLE IF EXISTS `usersaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersaddress` (
  `addressid` int NOT NULL AUTO_INCREMENT,
  `mobileno` varchar(45) DEFAULT NULL,
  `addressone` text,
  `addresstwo` text,
  `state` text,
  `city` text,
  `zipcode` text,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `usermobileno` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`addressid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersaddress`
--

LOCK TABLES `usersaddress` WRITE;
/*!40000 ALTER TABLE `usersaddress` DISABLE KEYS */;
INSERT INTO `usersaddress` VALUES (5,'+919009574613','Anand Nagar','Phoolbagh','Madhya Pradesh','Gwalior','474001','Chandra Shekhar','Rawat','+919009574613'),(6,'7869879908','Nehru Colony','Thathipur','Madhya Pradesh','Gwalior','454001','Satyam','Rawat','+919009574613'),(7,'+918989284298','trytujvh','','cghjgi','bujujk','uhvvhihk','Moonis ','Ali','+918989284298');
/*!40000 ALTER TABLE `usersaddress` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-14 16:54:42
