CREATE DATABASE  IF NOT EXISTS `newdbb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `newdbb`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: newdbb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designation` (
  `designation_id` int NOT NULL AUTO_INCREMENT,
  `designation` varchar(30) NOT NULL,
  PRIMARY KEY (`designation_id`),
  UNIQUE KEY `designation_UNIQUE` (`designation`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (7,'General Manager'),(1,'Intern'),(4,'Jr. Software Engineer I'),(6,'Jr. Software Engineer II'),(2,'Project Manager'),(3,'Sr. Software Engineer I'),(5,'Sr. Software Engineer II');
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `device_id` int NOT NULL AUTO_INCREMENT,
  `specs_id` int NOT NULL,
  `issue_id` int DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `purchase_date` date NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `fault` text,
  PRIMARY KEY (`device_id`),
  KEY `device_to_specs_idx` (`specs_id`),
  KEY `device_to_issue_idx` (`issue_id`),
  CONSTRAINT `device_to_issue` FOREIGN KEY (`issue_id`) REFERENCES `issue_return` (`issue_id`),
  CONSTRAINT `device_to_specs` FOREIGN KEY (`specs_id`) REFERENCES `specifications` (`specs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,1,1,_binary '','2019-04-04',13000,NULL),(2,2,2,_binary '','2019-04-04',12000,NULL),(3,3,NULL,_binary '','2018-02-04',11000,NULL),(4,4,NULL,_binary '','2019-09-04',50000,NULL),(5,1,NULL,_binary '','2019-08-16',12000,NULL);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_ports`
--

DROP TABLE IF EXISTS `device_ports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_ports` (
  `port_id` int NOT NULL AUTO_INCREMENT,
  `ethernet` bit(1) NOT NULL,
  `hdmi` bit(1) NOT NULL,
  `vga` bit(1) NOT NULL,
  `dvi` bit(1) NOT NULL,
  `sd_card` bit(1) NOT NULL,
  `audio_in` bit(1) NOT NULL,
  `audio_out` bit(1) NOT NULL,
  `thunderbolt` bit(1) NOT NULL,
  `lightning` bit(1) NOT NULL,
  `usb_a` bit(1) NOT NULL,
  `usb_b` bit(1) NOT NULL,
  `usb_c` bit(1) NOT NULL,
  `micro_usb` bit(1) NOT NULL,
  PRIMARY KEY (`port_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_ports`
--

LOCK TABLES `device_ports` WRITE;
/*!40000 ALTER TABLE `device_ports` DISABLE KEYS */;
INSERT INTO `device_ports` VALUES (1,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0'),(2,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary ''),(3,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(4,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(5,_binary '',_binary '',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0'),(6,_binary '',_binary '',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '',_binary '',_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0'),(7,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0');
/*!40000 ALTER TABLE `device_ports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_return`
--

DROP TABLE IF EXISTS `issue_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_return` (
  `issue_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `device_id` int NOT NULL,
  `request_id` int NOT NULL,
  `issue_date` timestamp NOT NULL,
  `due_date` timestamp NOT NULL,
  `return_date` datetime DEFAULT NULL,
  `fault` text,
  PRIMARY KEY (`issue_id`),
  KEY `issue_to_emp_idx` (`emp_id`),
  KEY `issue_to_device_idx` (`device_id`),
  KEY `issue_to_request_idx` (`request_id`),
  CONSTRAINT `issue_to_device` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`),
  CONSTRAINT `issue_to_emp` FOREIGN KEY (`emp_id`) REFERENCES `user` (`emp_id`),
  CONSTRAINT `issue_to_request` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_return`
--

LOCK TABLES `issue_return` WRITE;
/*!40000 ALTER TABLE `issue_return` DISABLE KEYS */;
INSERT INTO `issue_return` VALUES (1,1,1,1,'2020-02-27 10:15:42','2020-03-01 10:15:42',NULL,NULL),(2,2,2,2,'2020-02-28 05:38:51','2020-03-02 05:38:51',NULL,NULL);
/*!40000 ALTER TABLE `issue_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'faridabad','haryana','india'),(2,'panipat','haryana','india'),(3,'gurgaon','haryana','india');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(45) NOT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'read_user'),(2,'write_user'),(3,'read_device'),(4,'write_device'),(5,'request_device');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone` (
  `phone_id` int NOT NULL AUTO_INCREMENT,
  `number_type` varchar(45) NOT NULL,
  `country_id` int NOT NULL,
  `number` varchar(11) NOT NULL,
  `extension` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`phone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_list`
--

DROP TABLE IF EXISTS `purchase_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_list` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `device_type` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `purchase_status` enum('Pending','Purchased','Rejected') NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`order_id`),
  KEY `purchase_emp_to_emp_idx` (`emp_id`),
  CONSTRAINT `purchase_emp_to_emp` FOREIGN KEY (`emp_id`) REFERENCES `user` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_list`
--

LOCK TABLES `purchase_list` WRITE;
/*!40000 ALTER TABLE `purchase_list` DISABLE KEYS */;
INSERT INTO `purchase_list` VALUES (1,3,'Mobile','OnePlus 7T Pro (Haze Blue, 8GB RAM, Fluid AMOLED Display, 256GB Storage, 4085mAH Battery)','Pending');
/*!40000 ALTER TABLE `purchase_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `specs_id` int NOT NULL,
  `request_date` timestamp NOT NULL,
  `expected_return` timestamp NOT NULL,
  `request_status` enum('Pending','Accepted','Rejected') NOT NULL DEFAULT 'Pending',
  `priority` enum('Low','Medium','High') NOT NULL DEFAULT 'Low',
  PRIMARY KEY (`request_id`),
  KEY `req_emp_to_emp_idx` (`emp_id`),
  KEY `req_to_specs_idx` (`specs_id`),
  CONSTRAINT `req_to_emp` FOREIGN KEY (`emp_id`) REFERENCES `user` (`emp_id`),
  CONSTRAINT `req_to_specs` FOREIGN KEY (`specs_id`) REFERENCES `specifications` (`specs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='							';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,1,1,'2020-02-27 10:11:11','2020-03-01 10:11:11','Accepted','Medium'),(2,2,2,'2020-02-27 10:11:11','2020-03-01 10:11:11','Accepted','High');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name_UNIQUE` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (2,'admin'),(3,'superadmin'),(1,'user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_to_permission`
--

DROP TABLE IF EXISTS `role_to_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_to_permission` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `permission_to_permission_idx` (`permission_id`),
  CONSTRAINT `permission_to_permission` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`),
  CONSTRAINT `role_to_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_to_permission`
--

LOCK TABLES `role_to_permission` WRITE;
/*!40000 ALTER TABLE `role_to_permission` DISABLE KEYS */;
INSERT INTO `role_to_permission` VALUES (2,1),(3,1),(3,2),(1,3),(2,3),(3,3),(2,4),(1,5);
/*!40000 ALTER TABLE `role_to_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specifications`
--

DROP TABLE IF EXISTS `specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specifications` (
  `specs_id` int NOT NULL AUTO_INCREMENT,
  `device_name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `operating_system` varchar(45) DEFAULT NULL,
  `processor` varchar(45) DEFAULT NULL,
  `ram` varchar(20) DEFAULT NULL,
  `storage` varchar(20) DEFAULT NULL,
  `solid_state_drive` varchar(20) DEFAULT NULL,
  `connection_type` varchar(45) DEFAULT NULL,
  `battery_capacity` varchar(45) DEFAULT NULL,
  `port_id` int NOT NULL,
  `additional_info` text,
  PRIMARY KEY (`specs_id`),
  KEY `specs_to_port_idx` (`port_id`),
  CONSTRAINT `specs_to_port` FOREIGN KEY (`port_id`) REFERENCES `device_ports` (`port_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specifications`
--

LOCK TABLES `specifications` WRITE;
/*!40000 ALTER TABLE `specifications` DISABLE KEYS */;
INSERT INTO `specifications` VALUES (1,'Moto g6','mobile','Android 9','Snapdragon 450','4gb','64gb',NULL,NULL,'4000mah',1,'1080p FHD display'),(2,'Samsung m30','mobile','Android 10','Exynos 950','4gb','64gb',NULL,NULL,'5000mah',1,'1080p amoled display'),(3,'Asus Zenmax M1 Pro','mobile','Android 9','Snapdragon 652','6gb','128gb',NULL,NULL,'5000mah',1,'1080p FHD display'),(4,'Asus VivoBook 14','laptop','Windows 10 Pro','Intel Core i5 8250U','8gb ddr3',NULL,'256gb',NULL,'4400mah',7,'14.0\" (16:9) LED-backlit FHD (1920x1080) 60Hz Anti-Glare IPS-level Panel\nChiclet backlit keyboard\nFingerprint sensor\n17.7mm 1.4kg');
/*!40000 ALTER TABLE `specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `salutation_id` int NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) NOT NULL,
  `designation_id` int NOT NULL,
  `phone_id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` binary(64) NOT NULL,
  `date_of_birth` date NOT NULL,
  `is_married` bit(1) NOT NULL,
  `gender` enum('m','f','o') NOT NULL,
  `address` text NOT NULL,
  `location_id` int NOT NULL,
  `PIN` int NOT NULL,
  `date_of_joining` date NOT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `user_to_location_idx` (`location_id`),
  KEY `user_to_designation_idx` (`designation_id`),
  CONSTRAINT `user_to_designation` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`designation_id`),
  CONSTRAINT `user_to_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_role`
--

DROP TABLE IF EXISTS `user_to_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_to_role` (
  `emp_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`emp_id`,`role_id`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `emp_to_emp` FOREIGN KEY (`emp_id`) REFERENCES `user` (`emp_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_role`
--

LOCK TABLES `user_to_role` WRITE;
/*!40000 ALTER TABLE `user_to_role` DISABLE KEYS */;
INSERT INTO `user_to_role` VALUES (1,1),(2,1),(3,1),(4,1);
/*!40000 ALTER TABLE `user_to_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'newdbb'
--

--
-- Dumping routines for database 'newdbb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-28 16:28:59
