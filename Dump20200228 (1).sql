CREATE DATABASE  IF NOT EXISTS `db_final` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_final`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: db_final
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (40,4,'123,sec 28',1,'121001'),(41,5,'123,sec 28',1,'121001');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_type`
--

LOCK TABLES `address_type` WRITE;
/*!40000 ALTER TABLE `address_type` DISABLE KEYS */;
INSERT INTO `address_type` VALUES (4,'Current'),(5,'Permanant');
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
INSERT INTO `city` VALUES (1,'Faridabad',1);
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
  `area_code` varchar(6) DEFAULT NULL,
  `number` varchar(11) NOT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `contact_to_country_idx` (`country_id`),
  KEY `contact_to_type_idx` (`contact_type_id`),
  CONSTRAINT `contact_to_type` FOREIGN KEY (`contact_type_id`) REFERENCES `contact_type` (`contact_type_id`),
  CONSTRAINT `country_to_contact` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_number`
--

LOCK TABLES `contact_number` WRITE;
/*!40000 ALTER TABLE `contact_number` DISABLE KEYS */;
INSERT INTO `contact_number` VALUES (21,4,1,'','9898765478');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_type`
--

LOCK TABLES `contact_type` WRITE;
/*!40000 ALTER TABLE `contact_type` DISABLE KEYS */;
INSERT INTO `contact_type` VALUES (6,'Home'),(4,'Mobile'),(5,'Work');
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
INSERT INTO `country` VALUES (1,'India','91');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `study_level_name_UNIQUE` (`course_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (8,'Engineering');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_designation`
--

DROP TABLE IF EXISTS `department_designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_designation` (
  `department_designation_id` int NOT NULL AUTO_INCREMENT,
  `department_id` int NOT NULL,
  `designation_id` int NOT NULL,
  PRIMARY KEY (`department_id`,`designation_id`),
  UNIQUE KEY `department_designation_id_UNIQUE` (`department_designation_id`),
  KEY `designation_map_department_designation_idx` (`designation_id`),
  CONSTRAINT `department_map_department_designation` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `designation_map_department_designation` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`designation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_designation`
--

LOCK TABLES `department_designation` WRITE;
/*!40000 ALTER TABLE `department_designation` DISABLE KEYS */;
INSERT INTO `department_designation` VALUES (1,8,8);
/*!40000 ALTER TABLE `department_designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `dependent_id` int NOT NULL AUTO_INCREMENT,
  `relation_id` int DEFAULT NULL,
  `salutation_id` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `contact_id` int NOT NULL,
  PRIMARY KEY (`dependent_id`),
  UNIQUE KEY `dependant_id_UNIQUE` (`dependent_id`),
  KEY `dependant_to_contact_idx` (`contact_id`),
  KEY `dependent_to_relation_idx` (`relation_id`),
  KEY `dependent_to_salutation_idx` (`salutation_id`),
  CONSTRAINT `dependent_to_contact` FOREIGN KEY (`contact_id`) REFERENCES `contact_number` (`contact_id`),
  CONSTRAINT `dependent_to_relation` FOREIGN KEY (`relation_id`) REFERENCES `relation` (`relation_id`),
  CONSTRAINT `dependent_to_salutation` FOREIGN KEY (`salutation_id`) REFERENCES `salutation` (`salutation_id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (8,'Intern');
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
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
  `course_id` int NOT NULL,
  `stream_id` int NOT NULL,
  `starting_date` date NOT NULL,
  `finishing_date` date NOT NULL,
  `board_university` varchar(45) DEFAULT NULL,
  `percentage_gpa` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`education_details_id`),
  KEY `edu_details_to_level_idx` (`course_id`),
  KEY `edu_details_to_field_idx` (`stream_id`),
  CONSTRAINT `edu_details_to_field` FOREIGN KEY (`stream_id`) REFERENCES `education_streams` (`education_streams_id`),
  CONSTRAINT `edu_details_to_level` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
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
-- Table structure for table `education_streams`
--

DROP TABLE IF EXISTS `education_streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education_streams` (
  `education_streams_id` int NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(45) NOT NULL,
  PRIMARY KEY (`education_streams_id`),
  UNIQUE KEY `study_field_UNIQUE` (`stream_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_streams`
--

LOCK TABLES `education_streams` WRITE;
/*!40000 ALTER TABLE `education_streams` DISABLE KEYS */;
/*!40000 ALTER TABLE `education_streams` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (2,'Female'),(1,'Male'),(6,'Others');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `relation` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salutation`
--

LOCK TABLES `salutation` WRITE;
/*!40000 ALTER TABLE `salutation` DISABLE KEYS */;
INSERT INTO `salutation` VALUES (8,'Dr'),(5,'Mr'),(7,'Mrs'),(6,'Ms');
/*!40000 ALTER TABLE `salutation` ENABLE KEYS */;
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
INSERT INTO `state` VALUES (1,'Haryana',1);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `salutation_id` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `department_designation_id` int NOT NULL,
  `email` varchar(70) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(224) NOT NULL,
  `gender_id` int NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_joining` date NOT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `user_to_salutation_idx` (`salutation_id`),
  KEY `user_to_department_designation_id_idx` (`department_designation_id`),
  KEY `user_to_gender_idx` (`gender_id`),
  CONSTRAINT `user_to_department_designation_id` FOREIGN KEY (`department_designation_id`) REFERENCES `department_designation` (`department_designation_id`),
  CONSTRAINT `user_to_gender` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`),
  CONSTRAINT `user_to_salutation` FOREIGN KEY (`salutation_id`) REFERENCES `salutation` (`salutation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (16,8,'abc','cde','def',1,'abc@gmail.com','abc','bdd03d560993e675516ba5a50638b6531ac2ac3d5847c61916cfced6',1,'2019-05-05','2019-06-04',_binary ''),(28,5,'Suraj','Singh','Rawat',1,'ssrawat@ex2india.com','Suraj','e2e71c2a34e9165e9c8ae4746f7826cd688a182d1afb25fcfe8734f7',1,'1998-02-02','2020-01-15',_binary '');
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
INSERT INTO `user_to_address` VALUES (28,40),(28,41);
/*!40000 ALTER TABLE `user_to_address` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `user_to_contact` VALUES (28,21);
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
  `dependent_id` int NOT NULL,
  PRIMARY KEY (`user_to_dependent_id`),
  KEY `user_map_user_to_dependent_idx` (`user_id`),
  KEY `dependent_map_user_to_dependent_idx` (`dependent_id`),
  CONSTRAINT `dependent_map_user_to_dependent` FOREIGN KEY (`dependent_id`) REFERENCES `dependent` (`dependent_id`),
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
  `education_details_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`education_details_id`),
  KEY `education_map_user_to_education_idx` (`education_details_id`),
  CONSTRAINT `education_map_user_to_education` FOREIGN KEY (`education_details_id`) REFERENCES `education_details` (`education_details_id`)
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
INSERT INTO `user_to_role` VALUES (28,1);
/*!40000 ALTER TABLE `user_to_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_final'
--

--
-- Dumping routines for database 'db_final'
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
addres_type varchar(15),
addres text,
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
    
    INSERT INTO `db_final`.`address`(`address_type_id`,`address`, `city_id`, `PIN`)
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
/*!50003 DROP PROCEDURE IF EXISTS `delete_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user`(
	in username varchar(45)
)
BEGIN
	declare id int;
	declare tempid int;
    /*declare exit handler for sqlexception
    begin
		rollback;
	end;*/
    start transaction;
    select user_id into id from user where user.username=username;
	#delete user, contact_number, user_to_contact, user_to_address, education_details, user_to_education, bank_details, user_to_dependent from user inner join user_to_contact on user.user_id=id and user.user_id=user_to_contact.user_id inner join contact_number on user_to_contact.contact_id=contact_number.contact_id inner join user_to_address on user.user_id=user_to_address.user_id inner join user_to_role on user.user_id=user_to_role.user_id inner join user_to_education on user.user_id=user_to_education.user_id inner join education_details on education_details.education_id=user_to_education.education_id inner join user_to_dependent on user.user_id=user_to_dependent.user_id inner join bank_details on user.user_id=bank_details.user_id where user.user_id=id;  
	delete from bank_details where user_id=id;
    delete from user_to_address where user_id=id;
    select user_to_contact.contact_id into tempid from user_to_contact where user_to_contact.user_id=id;
    delete from user_to_contact where user_id=id;
    
    delete from contact_number where contact_id=tempid;
    delete from user_to_dependent where user_id=id;
    delete from user_to_role where user_id=id;
    
    select user_to_education.education_details_id into tempid from user_to_education where user_to_education.user_id=id;
    delete from user_to_education where user_id=id;
    delete from education_details where education_details_id=tempid;
    delete from user where user_id=id;
	commit;
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
in username varchar(50),
in pass varchar(50),
in dob date,
in gend varchar(45),
in doj date,
in ph_num_type varchar(45),
in ph_number varchar(45),
in ph_ext varchar(15),
in addres_type varchar(45),
in addres text,
in city varchar(45),
in state varchar(45),
in country varchar(45),
in pin varchar(6),
in addres_type2 varchar(45),
in addres2 text,
in city2 varchar(45),
in state2 varchar(45),
in country2 varchar(45),
in pin2 varchar(6),
in is_ac bit(1),
out username_out varchar(45)
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
    declare dept_desig_id int;
    declare g_id int;
    /*
    declare exit handler for sqlexception
    begin
		rollback;
	end;
    */
	SELECT salutation_id INTO sal_id FROM salutation WHERE salutation = salut;
    SELECT department_id INTO dept_id FROM department WHERE department_name = dept_name;
	SELECT designation_id INTO des_id FROM designation WHERE designation = desig;
    select department_designation_id into dept_desig_id from department_designation where department_designation.department_id=department_id and department_designation.designation_id=designation_id;
	SELECT country_id INTO ctry_id FROM country WHERE country_name = country;
	SELECT role_id INTO user_role FROM role WHERE role_name = 'user';
    SELECT contact_type_id INTO contact_id FROM contact_type WHERE contact_type.contact_type = ph_num_type;
    SELECT gender_id INTO g_id FROM gender WHERE gender.gender = gend;
    
    
     start transaction;
        
        INSERT INTO `db_final`.`user`
		(`salutation_id`,`first_name`,`middle_name`,`last_name`,`department_designation_id`,`email`,`username`,`password`,`gender_id`,`date_of_birth`,`date_of_joining`,`is_active`)
		VALUES
		(sal_id,f_name,m_name,l_name,dept_desig_id,email,username,SHA2(pass, 224),g_id,dob,doj,is_ac);
		set empl_id:=last_insert_id();

   
		INSERT INTO `db_final`.`contact_number`(`contact_type_id`,`country_id`,`area_code`,`number`)
		VALUES(contact_id, ctry_id,ph_ext, ph_number);
		set ph_id:=last_insert_id();
	
    
		#INSERT INTO `db_final`.`bank_details`(`user_id`,`aadhar_number`,`pan_number`,`bank_name`,`bank_branch_name`,`bank_account_number`,`ifsc_code`)
		#VALUES(empl_id,SHA2(aadhar, 224),SHA2(pan, 224),bank_name,branch_name,SHA2(account_number, 224),SHA2(ifsc, 224));
		#set id_details:=last_insert_id();
    
    	
		set adrss_id:=insert_address(addres_type, addres, city, state, country, pin);
		insert into user_to_address values(empl_id, adrss_id);
		if addres2 is not null then
			set adrss_id:=insert_address(addres_type2, addres2, city2, state2, country2, pin2);
			insert into user_to_address values(empl_id, adrss_id);
		end if;
		
		insert into user_to_contact values(empl_id, ph_id);
   
		insert into user_to_role values(empl_id, user_role);
        select username into username_out from user where user_id=empl_id;
	commit;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(
    in username varchar(45),
    in pass varchar(20),
    out username_out varchar(20)
    )
BEGIN
    	declare email_var int;
        select username into username_out from `user` where `username`=username and `password`=sha2(pass, 224);
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

-- Dump completed on 2020-03-11 16:59:34
