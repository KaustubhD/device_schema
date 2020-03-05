CREATE DATABASE  IF NOT EXISTS `dbv3` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbv3`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: dbv3
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `address_type_id` int NOT NULL,
  `address` text NOT NULL,
  `city_id` int NOT NULL,
  `PIN` varchar(6) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `address_to_location_idx` (`city_id`),
  CONSTRAINT `address_to_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (15,1,'999 Sec 49',1,'121001'),(16,1,'01-T Sec 21',1,'121001'),(18,1,'4643-Terrace Sec 28',1,'121005'),(19,2,'9211,halwai ki dukan,main market',5,'262406'),(21,1,'123,Sec-10',1,'121001'),(22,2,'haveli no 420',10,'121987'),(23,1,'45-T,Sec 11',1,'121008');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_type`
--

DROP TABLE IF EXISTS `address_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_type` (
  `address_type_id` int NOT NULL AUTO_INCREMENT,
  `address_type` varchar(45) NOT NULL,
  PRIMARY KEY (`address_type_id`),
  UNIQUE KEY `address_type_UNIQUE` (`address_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_type`
--

LOCK TABLES `address_type` WRITE;
/*!40000 ALTER TABLE `address_type` DISABLE KEYS */;
INSERT INTO `address_type` VALUES (1,'Current'),(2,'Permanent'),(3,'Work');
/*!40000 ALTER TABLE `address_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_details`
--

DROP TABLE IF EXISTS `bank_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_details` (
  `bank_details_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `aadhar_number` varchar(224) DEFAULT NULL,
  `pan_number` varchar(224) NOT NULL,
  `bank_name` varchar(45) NOT NULL,
  `bank_branch_name` varchar(45) NOT NULL,
  `bank_account_number` varchar(224) NOT NULL,
  `ifsc_code` varchar(224) NOT NULL,
  PRIMARY KEY (`bank_details_id`),
  UNIQUE KEY `pan_number_UNIQUE` (`pan_number`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `bank_account_number_UNIQUE` (`bank_account_number`),
  UNIQUE KEY `ifsc_code_UNIQUE` (`ifsc_code`),
  UNIQUE KEY `aadhar_number_UNIQUE` (`aadhar_number`),
  CONSTRAINT `bank_details_to_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_details`
--

LOCK TABLES `bank_details` WRITE;
/*!40000 ALTER TABLE `bank_details` DISABLE KEYS */;
INSERT INTO `bank_details` VALUES (28,3,'3977c80c1be93aeadbf7cf2e2612203275cd48c2662e36dc704bd864','450ad7df0a28a63e90acbf83fd4219ae1cf455288c2b3bfd980eb230','Allahabad Bank','Sainik Colony','6130db74b91820489ece950ae53a4c627c70140dc93cd5a78da821a4','5f97726fdacc06e4b2c62dcbc2945f329f85fa755572336e09858c77'),(29,4,'990dbd1b7ed3691d8ac77f5a5d80c834beb16c120cdcb4657130742a','2a4f90618b37422798365584b444b5d0093e208c57f4c53ca7761e4d','Allahabad Bank','Sec 21','cb4bea2c53852fcd931a5b72c81f2b104aa1ee32d626972cae9bc4b4','c6da21034a1e8d167ea38326fac6de9e3313ae0f9f5297c0983eb513'),(33,8,'0eddb2b4ef5b7db707ff86aa51c07bc3a6e8ac7fa713b158464b3f99','86db4de9d4df56f35cb7d4fe4e231abc720eafa2403ebc3352173ee3','Citi Bank','New Delhi','67e2943049a0c5a62be8857192f090277e1ec69d3543d5bdacc04504','eee29173fab2d945cfbe03f841e1bbe1f0078a8c0535bcdbe3148d08'),(36,11,'fd135afab1c4add51a929206be279cf8c3258198a5b9e1c6bd573e48','414116c3f3f46126138e4434d7d0d225d33979aacc18694f2a16dbed','Citi Bank','New Delhi','4d45562778474597beba17f063dcd62d606b6569ca03e1b85eeea4b6','2de20d50ab7dc7818e28c28c442271a217f8384c015a3510dcfd9212'),(39,14,'96bbc1bd683a7bec15cfc46b095af2125e9be8badea78ad61e9252e0','58f478b13f788d1e5d9245e0e2edf791c4bc1168fc0326c5a8ac395c','Axis Bank','Sec 16','9b765e1717545fa2e4951025cba84cc48705bd5144357cbe9dae48b6','83df793ffca2f6f2ea62dec698b801a72741e95c43667a54f471bafb');
/*!40000 ALTER TABLE `bank_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) NOT NULL,
  `state_id` int NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_id_UNIQUE` (`city_id`),
  KEY `city_to_state_idx` (`state_id`),
  CONSTRAINT `city_to_state` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Faridabad',1),(2,'Panipat',1),(3,'Delhi',2),(4,'Gurgaon',1),(5,'Bareilly',3),(10,'Sirsa',1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_number`
--

DROP TABLE IF EXISTS `contact_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_number` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `contact_type_id` int NOT NULL,
  `country_id` int NOT NULL,
  `number` varchar(11) NOT NULL,
  `extension` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `contact_to_country_idx` (`country_id`),
  KEY `contact_to_type_idx` (`contact_type_id`),
  CONSTRAINT `contact_to_type` FOREIGN KEY (`contact_type_id`) REFERENCES `contact_type` (`contact_type_id`),
  CONSTRAINT `country_to_contact` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_number`
--

LOCK TABLES `contact_number` WRITE;
/*!40000 ALTER TABLE `contact_number` DISABLE KEYS */;
INSERT INTO `contact_number` VALUES (1,1,1,'4234846765',NULL),(2,3,1,'4234843988','01'),(6,1,1,'4564843278',NULL),(9,1,1,'2756404032',NULL),(12,1,1,'2778746036',NULL);
/*!40000 ALTER TABLE `contact_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_type`
--

DROP TABLE IF EXISTS `contact_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_type` (
  `contact_type_id` int NOT NULL AUTO_INCREMENT,
  `contact_type` varchar(45) NOT NULL,
  PRIMARY KEY (`contact_type_id`),
  UNIQUE KEY `contact_type_id_UNIQUE` (`contact_type_id`),
  UNIQUE KEY `contact_type_UNIQUE` (`contact_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_type`
--

LOCK TABLES `contact_type` WRITE;
/*!40000 ALTER TABLE `contact_type` DISABLE KEYS */;
INSERT INTO `contact_type` VALUES (2,'Home'),(1,'Mobile'),(3,'Work');
/*!40000 ALTER TABLE `contact_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(45) NOT NULL,
  `country_code` varchar(45) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_name_UNIQUE` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'India','91'),(2,'Afghanistan','93'),(3,'Algeria','213'),(4,'Albania','355');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(45) NOT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_name_UNIQUE` (`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Accounts and Finance'),(6,'Administration'),(7,'Engineering'),(2,'HR'),(4,'Research and development'),(3,'Sales and marketing'),(5,'Security and transport.');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `dependent_id` int NOT NULL AUTO_INCREMENT,
  `name_id` int NOT NULL,
  `contact_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`dependent_id`),
  UNIQUE KEY `dependant_id_UNIQUE` (`dependent_id`),
  KEY `dependant_to_name_idx` (`name_id`),
  KEY `dependant_to_contact_idx` (`contact_id`),
  KEY `dependant_to_address_idx` (`address_id`),
  CONSTRAINT ` dependent_to_name` FOREIGN KEY (`name_id`) REFERENCES `name` (`name_id`),
  CONSTRAINT `dependent_to_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `dependent_to_contact` FOREIGN KEY (`contact_id`) REFERENCES `contact_number` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `device` VALUES (1,1,NULL,_binary '','2019-04-04',13000,NULL),(2,2,NULL,_binary '','2019-04-04',12000,NULL),(3,3,NULL,_binary '','2018-02-04',11000,NULL),(4,4,NULL,_binary '','2019-09-04',50000,NULL),(5,1,NULL,_binary '','2019-08-16',12000,NULL);
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
-- Table structure for table `education_details`
--

DROP TABLE IF EXISTS `education_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education_details` (
  `education_details_id` int NOT NULL AUTO_INCREMENT,
  `institution_name` varchar(100) NOT NULL,
  `education_level_id` int NOT NULL,
  `field_id` int NOT NULL,
  `starting_date` date NOT NULL,
  `finishing_date` date NOT NULL,
  PRIMARY KEY (`education_details_id`),
  KEY `edu_details_to_level_idx` (`education_level_id`),
  KEY `edu_details_to_field_idx` (`field_id`),
  CONSTRAINT `edu_details_to_field` FOREIGN KEY (`field_id`) REFERENCES `study_field` (`study_field_id`),
  CONSTRAINT `edu_details_to_level` FOREIGN KEY (`education_level_id`) REFERENCES `study_level` (`study_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_details`
--

LOCK TABLES `education_details` WRITE;
/*!40000 ALTER TABLE `education_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `education_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `gender_id` int NOT NULL AUTO_INCREMENT,
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`gender_id`),
  UNIQUE KEY `gender_UNIQUE` (`gender`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (2,'Female'),(1,'Male'),(3,'Other');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_return`
--

DROP TABLE IF EXISTS `issue_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_return` (
  `issue_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `device_id` int NOT NULL,
  `request_id` int NOT NULL,
  `issue_date` timestamp NOT NULL,
  `due_date` timestamp NOT NULL,
  `return_date` datetime DEFAULT NULL,
  `fault` text,
  PRIMARY KEY (`issue_id`),
  KEY `issue_to_emp_idx` (`user_id`),
  KEY `issue_to_device_idx` (`device_id`),
  KEY `issue_to_request_idx` (`request_id`),
  CONSTRAINT `issue_to_device` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`),
  CONSTRAINT `issue_to_request` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`),
  CONSTRAINT `issue_to_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_return`
--

LOCK TABLES `issue_return` WRITE;
/*!40000 ALTER TABLE `issue_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `name`
--

DROP TABLE IF EXISTS `name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `name` (
  `name_id` int NOT NULL AUTO_INCREMENT,
  `salutation_id` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  PRIMARY KEY (`name_id`),
  KEY `name_to_salutation_idx` (`salutation_id`),
  CONSTRAINT `name_to_salutation` FOREIGN KEY (`salutation_id`) REFERENCES `salutation` (`salutation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name`
--

LOCK TABLES `name` WRITE;
/*!40000 ALTER TABLE `name` DISABLE KEYS */;
INSERT INTO `name` VALUES (1,1,'Kaustubh',NULL,'Dhasmana'),(2,1,'Namit',NULL,'Chauhan'),(6,1,'Animash',NULL,'Das'),(8,1,'Sagar',NULL,'Jangra'),(11,3,'Prakshee',NULL,'Rajpurohit');
/*!40000 ALTER TABLE `name` ENABLE KEYS */;
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
-- Table structure for table `personal_details`
--

DROP TABLE IF EXISTS `personal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_details` (
  `personal_details_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `gender_id` int NOT NULL,
  `is_married` bit(1) DEFAULT NULL,
  `alternate_email` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`personal_details_id`),
  UNIQUE KEY `personal_details_id_UNIQUE` (`personal_details_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `personal_details_to_gender_idx` (`gender_id`),
  CONSTRAINT `personal_details_to_gender` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`),
  CONSTRAINT `personal_details_to_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_details`
--

LOCK TABLES `personal_details` WRITE;
/*!40000 ALTER TABLE `personal_details` DISABLE KEYS */;
INSERT INTO `personal_details` VALUES (1,3,1,_binary '\0',NULL),(2,4,1,_binary '\0',NULL),(4,8,1,_binary '\0','animash123@gmail.com'),(6,11,1,_binary '\0',NULL),(7,14,2,_binary '\0','prakshee11@gmail.com');
/*!40000 ALTER TABLE `personal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_list`
--

DROP TABLE IF EXISTS `purchase_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_list` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `device_type` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `purchase_status` enum('Pending','Purchased','Rejected') NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`order_id`),
  KEY `purchase_emp_to_emp_idx` (`user_id`),
  CONSTRAINT `purchase_user_to_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_list`
--

LOCK TABLES `purchase_list` WRITE;
/*!40000 ALTER TABLE `purchase_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation`
--

DROP TABLE IF EXISTS `relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relation` (
  `relation_id` int NOT NULL AUTO_INCREMENT,
  `relation_name` varchar(45) NOT NULL,
  PRIMARY KEY (`relation_id`),
  UNIQUE KEY `relation_id_UNIQUE` (`relation_id`),
  UNIQUE KEY `relation_name_UNIQUE` (`relation_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation`
--

LOCK TABLES `relation` WRITE;
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;
INSERT INTO `relation` VALUES (3,'Father'),(4,'Husband'),(2,'Mother'),(5,'Wife');
/*!40000 ALTER TABLE `relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `specs_id` int NOT NULL,
  `request_date` timestamp NOT NULL,
  `expected_return` timestamp NOT NULL,
  `request_status` enum('Pending','Accepted','Rejected') NOT NULL DEFAULT 'Pending',
  `priority` enum('Low','Medium','High') NOT NULL DEFAULT 'Low',
  PRIMARY KEY (`request_id`),
  KEY `req_emp_to_emp_idx` (`user_id`),
  KEY `req_to_specs_idx` (`specs_id`),
  CONSTRAINT `req_to_specs` FOREIGN KEY (`specs_id`) REFERENCES `specifications` (`specs_id`),
  CONSTRAINT `req_to_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='							';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
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
-- Table structure for table `salutation`
--

DROP TABLE IF EXISTS `salutation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salutation` (
  `salutation_id` int NOT NULL AUTO_INCREMENT,
  `salutation` varchar(45) NOT NULL,
  PRIMARY KEY (`salutation_id`),
  UNIQUE KEY `salutation_UNIQUE` (`salutation`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salutation`
--

LOCK TABLES `salutation` WRITE;
/*!40000 ALTER TABLE `salutation` DISABLE KEYS */;
INSERT INTO `salutation` VALUES (4,'Dr'),(1,'Mr'),(2,'Mrs'),(3,'Ms');
/*!40000 ALTER TABLE `salutation` ENABLE KEYS */;
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
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `state_id` int NOT NULL AUTO_INCREMENT,
  `state_name` varchar(45) NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`state_id`),
  UNIQUE KEY `state_id_UNIQUE` (`state_id`),
  UNIQUE KEY `state_name_UNIQUE` (`state_name`),
  KEY `state_to_country_idx` (`country_id`),
  CONSTRAINT `state_to_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Haryana',1),(2,'New Delhi',1),(3,'Uttar Pradesh',1);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_field`
--

DROP TABLE IF EXISTS `study_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_field` (
  `study_field_id` int NOT NULL AUTO_INCREMENT,
  `study_field` varchar(45) NOT NULL,
  PRIMARY KEY (`study_field_id`),
  UNIQUE KEY `study_field_UNIQUE` (`study_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_field`
--

LOCK TABLES `study_field` WRITE;
/*!40000 ALTER TABLE `study_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `study_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_level`
--

DROP TABLE IF EXISTS `study_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_level` (
  `study_level_id` int NOT NULL AUTO_INCREMENT,
  `study_level_name` varchar(45) NOT NULL,
  PRIMARY KEY (`study_level_id`),
  UNIQUE KEY `study_level_name_UNIQUE` (`study_level_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_level`
--

LOCK TABLES `study_level` WRITE;
/*!40000 ALTER TABLE `study_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `study_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name_id` int NOT NULL,
  `department_id` int NOT NULL,
  `designation_id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(224) NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_joining` date NOT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `user_to_designation_idx` (`designation_id`),
  KEY `user_to_department_idx` (`department_id`),
  KEY `user_to_name_idx` (`name_id`),
  CONSTRAINT `user_to_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `user_to_designation` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`designation_id`),
  CONSTRAINT `user_to_name` FOREIGN KEY (`name_id`) REFERENCES `name` (`name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,1,7,1,'kdhasmanan@ex2india.com','5a9e21b4d11d7974849fa8e4fe2a2d61630018511ebf67c5e0979204','1998-08-10','2020-02-03',_binary ''),(4,2,7,1,'nchauhan@ex2india.com','c6b843a09829295303844eb312e7fed148e6cf8cc46d59b6fc66411a','1998-01-10','2020-02-03',_binary ''),(8,6,7,1,'adas@ex2india.com','9c0cbfb0bab253473aaf97b158da49eb29db0462b459404662f515ee','1998-06-06','2020-02-03',_binary ''),(11,8,7,1,'sjangra@ex2india.com','7247032449188a048603a8961a8bf7a41ec5a91036da06e2605b60a1','1998-12-05','2020-01-15',_binary ''),(14,11,7,1,'prajpurohit@ex2india.com','edcba64d8b400947af53c68e95d75967db16b43fc14374e8e55addc8','1998-03-06','2020-01-15',_binary '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_address`
--

DROP TABLE IF EXISTS `user_to_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_to_address` (
  `user_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`address_id`),
  KEY `address_map_address_idx` (`address_id`),
  CONSTRAINT `address_map_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `user_map_address_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_address`
--

LOCK TABLES `user_to_address` WRITE;
/*!40000 ALTER TABLE `user_to_address` DISABLE KEYS */;
INSERT INTO `user_to_address` VALUES (3,15),(4,16),(8,18),(8,19),(11,21),(11,22),(14,23);
/*!40000 ALTER TABLE `user_to_address` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_to_address_BEFORE_INSERT` BEFORE INSERT ON `user_to_address` FOR EACH ROW BEGIN
	declare row_count int;
    select count(*) into row_count from user_to_address where user_to_address.user_id=NEW.user_id;
    if row_count = 2 then
		signal sqlstate '23000';
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_to_contact`
--

DROP TABLE IF EXISTS `user_to_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_to_contact` (
  `user_id` int NOT NULL,
  `contact_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`contact_id`),
  CONSTRAINT `user_map_user_to_contact` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_contact`
--

LOCK TABLES `user_to_contact` WRITE;
/*!40000 ALTER TABLE `user_to_contact` DISABLE KEYS */;
INSERT INTO `user_to_contact` VALUES (3,1),(4,2),(8,6),(11,9),(14,12);
/*!40000 ALTER TABLE `user_to_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_dependent`
--

DROP TABLE IF EXISTS `user_to_dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_to_dependent` (
  `user_to_dependent_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `relation_id` int NOT NULL,
  `dependent_id` int NOT NULL,
  PRIMARY KEY (`user_to_dependent_id`),
  KEY `user_map_user_to_dependent_idx` (`user_id`),
  KEY `relation_map_user_to_dependent_idx` (`relation_id`),
  KEY `dependent_map_user_to_dependent_idx` (`dependent_id`),
  CONSTRAINT `dependent_map_user_to_dependent` FOREIGN KEY (`dependent_id`) REFERENCES `dependent` (`dependent_id`),
  CONSTRAINT `relation_map_user_to_dependent` FOREIGN KEY (`relation_id`) REFERENCES `relation` (`relation_id`),
  CONSTRAINT `user_map_user_to_dependent` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_dependent`
--

LOCK TABLES `user_to_dependent` WRITE;
/*!40000 ALTER TABLE `user_to_dependent` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_to_dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_education`
--

DROP TABLE IF EXISTS `user_to_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_to_education` (
  `user_id` int NOT NULL,
  `education_id` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`,`education_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_education`
--

LOCK TABLES `user_to_education` WRITE;
/*!40000 ALTER TABLE `user_to_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_to_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_role`
--

DROP TABLE IF EXISTS `user_to_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_to_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `role_id_to_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `user_to_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_role`
--

LOCK TABLES `user_to_role` WRITE;
/*!40000 ALTER TABLE `user_to_role` DISABLE KEYS */;
INSERT INTO `user_to_role` VALUES (3,1),(4,1),(8,1),(11,1),(14,1);
/*!40000 ALTER TABLE `user_to_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbv3'
--

--
-- Dumping routines for database 'dbv3'
--
/*!50003 DROP FUNCTION IF EXISTS `insert_address` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `insert_address`(
addres text,
addres_type varchar(15),
city_n varchar(45),
state_n varchar(45),
country_n varchar(45),
pin varchar(6)) RETURNS int
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	declare city_id int;
    declare adrss_id int;
    declare add_type_id int;
    
	SELECT address_type_id INTO add_type_id FROM address_type WHERE address_type.address_type = addres_type;

    select city.city_id into city_id from city, state, country where country.country_name=country_n and state.state_name=state_n and city.city_name=city_n and state.state_id=city.state_id and country.country_id=state.country_id;
    
    INSERT INTO `dbv3`.`address`(`address_type_id`,`address`, `city_id`, `PIN`)
	VALUES
	(add_type_id, addres, city_id, pin);
    set adrss_id:=last_insert_id();
RETURN adrss_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_user_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user_data`(
in salut varchar(45),
in f_name varchar(20),
in m_name varchar(20),
in l_name varchar(20),
in dept_name varchar(45),
in desig varchar(30),
in email varchar(50),
in a_email varchar(50),
in pass varchar(50),
in dob date,
in is_m bit(1),
in gend varchar(45),
in doj date,
in ph_num_type varchar(45),
in ph_number varchar(45),
in ph_ext varchar(15),
in addres text,
in city varchar(45),
in state varchar(45),
in country varchar(45),
in pin varchar(6),
in addres2 text,
in city2 varchar(45),
in state2 varchar(45),
in country2 varchar(45),
in pin2 varchar(6),
in aadhar varchar(12),
in pan varchar(10),
in bank_name varchar(45),
in branch_name varchar(45),
in account_number varchar(45),
in ifsc varchar(45),
in is_ac bit(1)
)
BEGIN 
	
    declare nam_id int;
	declare sal_id int;
    declare dept_id int;
    declare des_id int;
    declare add_type_id int;
    declare city_id int;
    declare state_id int;
    declare ctry_id int;
    declare ph_id int;
    declare empl_id int;
    declare adrss_id int;
    declare user_role int;
    declare id_details int;
    declare contact_id int;
    declare g_id int;
    
    declare exit handler for sqlexception
    begin
		rollback;
	end;
    
	SELECT salutation_id INTO sal_id FROM salutation WHERE salutation = salut;
    SELECT department_id INTO dept_id FROM department WHERE department_name = dept_name;
	SELECT designation_id INTO des_id FROM designation WHERE designation = desig;
	SELECT country_id INTO ctry_id FROM country WHERE country_name = country;
	SELECT role_id INTO user_role FROM role WHERE role_name = 'user';
    SELECT contact_type_id INTO contact_id FROM contact_type WHERE contact_type.contact_type = ph_num_type;
    SELECT gender_id INTO g_id FROM gender WHERE gender.gender = gend;
    
    
     start transaction;
		INSERT INTO `dbv3`.`name`(`salutation_id`,`first_name`,`middle_name`,`last_name`)
		VALUES(sal_id,f_name,m_name,l_name);
		set nam_id:=last_insert_id();
        
        INSERT INTO `dbv3`.`user`
		(`name_id`,`department_id`,`designation_id`,`email`,`password`,`date_of_birth`,`date_of_joining`,`is_active`)
		VALUES
		(nam_id, dept_id,des_id,email,SHA2(pass, 224),dob,doj,is_ac);
		set empl_id:=last_insert_id();

   
		INSERT INTO `dbv3`.`contact_number`(`contact_type_id`,`country_id`,`number`,`extension`)
		VALUES(contact_id, ctry_id, ph_number, ph_ext);
		set ph_id:=last_insert_id();
	
    
		INSERT INTO `dbv3`.`bank_details`(`user_id`,`aadhar_number`,`pan_number`,`bank_name`,`bank_branch_name`,`bank_account_number`,`ifsc_code`)
		VALUES(empl_id,SHA2(aadhar, 224),SHA2(pan, 224),bank_name,branch_name,SHA2(account_number, 224),SHA2(ifsc, 224));
		set id_details:=last_insert_id();

    
		INSERT INTO `dbv3`.`personal_details`(`user_id`,`gender_id`,`is_married`,`alternate_email`)
		VALUES(empl_id,g_id,is_m,a_email);
    
    	
		set adrss_id:=insert_address(addres, 'Current', city, state, country, pin);
		insert into user_to_address values(empl_id, adrss_id);
		if addres2 is not null then
			set adrss_id:=insert_address(addres2, 'Permanent', city2, state2, country2, pin2);
			insert into user_to_address values(empl_id, adrss_id);
		end if;
		
		insert into user_to_contact values(empl_id, ph_id);
   
		insert into user_to_role values(empl_id, user_role);
	commit;
		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-05 12:10:45
