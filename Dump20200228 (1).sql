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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `address_type` enum('Current','Permanent') NOT NULL,
  `address` text,
  `PIN` varchar(6) NOT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `address_to_location_idx` (`location_id`),
  CONSTRAINT `address_to_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Current','11, girls hostel, YMCA','132103',1),(2,'Current','420-G Sec 28','121010',1),(3,'Current','921-1 Neher Par Sec 82','121001',1),(4,'Current','111-13 Sec 22','121006',7),(5,'Current','Pipal tree Aravali Jungles','121001',1),(6,'Current','Pahado ke upar, jungle ke par','121001',1),(9,'Current','4643-Terrace Sec 28','121005',1),(10,'Permanent','9211,halwai ki dukan,main market','262406',8);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
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
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_id_UNIQUE` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Faridabad'),(2,'Panipat'),(3,'Delhi'),(4,'Gurgaon'),(9,'Bareilly');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=721 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'India','91'),(482,'Afghanistan','93'),(483,'Albania','355'),(484,'Algeria','213'),(485,'American Samoa','1-684'),(486,'Andorra','376'),(487,'Angola','244'),(488,'Anguilla','1-264'),(489,'Antarctica','672'),(490,'Antigua and Barbuda','1-268'),(491,'Argentina','54'),(492,'Armenia','374'),(493,'Aruba','297'),(494,'Australia','61'),(495,'Austria','43'),(496,'Azerbaijan','994'),(497,'Bahamas','1-242'),(498,'Bahrain','973'),(499,'Bangladesh','880'),(500,'Barbados','1-246'),(501,'Belarus','375'),(502,'Belgium','32'),(503,'Belize','501'),(504,'Benin','229'),(505,'Bermuda','1-441'),(506,'Bhutan','975'),(507,'Bolivia','591'),(508,'Bosnia and Herzegovina','387'),(509,'Botswana','267'),(510,'Brazil','55'),(511,'British Indian Ocean Territory','246'),(512,'British Virgin Islands','1-284'),(513,'Brunei','673'),(514,'Bulgaria','359'),(515,'Burkina Faso','226'),(516,'Burundi','257'),(517,'Cambodia','855'),(518,'Cameroon','237'),(519,'Canada','1'),(520,'Cape Verde','238'),(521,'Cayman Islands','1-345'),(522,'Central African Republic','236'),(523,'Chad','235'),(524,'Chile','56'),(525,'China','86'),(526,'Christmas Island','61'),(527,'Cocos Islands','61'),(528,'Colombia','57'),(529,'Comoros','269'),(530,'Cook Islands','682'),(531,'Costa Rica','506'),(532,'Croatia','385'),(533,'Cuba','53'),(534,'Curacao','599'),(535,'Cyprus','357'),(536,'Czech Republic','420'),(537,'Democratic Republic of the Congo','243'),(538,'Denmark','45'),(539,'Djibouti','253'),(540,'Dominica','1-767'),(541,'Dominican Republic','1-809, 1-829, 1-849'),(542,'East Timor','670'),(543,'Ecuador','593'),(544,'Egypt','20'),(545,'El Salvador','503'),(546,'Equatorial Guinea','240'),(547,'Eritrea','291'),(548,'Estonia','372'),(549,'Ethiopia','251'),(550,'Falkland Islands','500'),(551,'Faroe Islands','298'),(552,'Fiji','679'),(553,'Finland','358'),(554,'France','33'),(555,'French Polynesia','689'),(556,'Gabon','241'),(557,'Gambia','220'),(558,'Georgia','995'),(559,'Germany','49'),(560,'Ghana','233'),(561,'Gibraltar','350'),(562,'Greece','30'),(563,'Greenland','299'),(564,'Grenada','1-473'),(565,'Guam','1-671'),(566,'Guatemala','502'),(567,'Guernsey','44-1481'),(568,'Guinea','224'),(569,'Guinea-Bissau','245'),(570,'Guyana','592'),(571,'Haiti','509'),(572,'Honduras','504'),(573,'Hong Kong','852'),(574,'Hungary','36'),(575,'Iceland','354'),(576,'Indonesia','62'),(577,'Iran','98'),(578,'Iraq','964'),(579,'Ireland','353'),(580,'Isle of Man','44-1624'),(581,'Israel','972'),(582,'Italy','39'),(583,'Ivory Coast','225'),(584,'Jamaica','1-876'),(585,'Japan','81'),(586,'Jersey','44-1534'),(587,'Jordan','962'),(588,'Kazakhstan','7'),(589,'Kenya','254'),(590,'Kiribati','686'),(591,'Kosovo','383'),(592,'Kuwait','965'),(593,'Kyrgyzstan','996'),(594,'Laos','856'),(595,'Latvia','371'),(596,'Lebanon','961'),(597,'Lesotho','266'),(598,'Liberia','231'),(599,'Libya','218'),(600,'Liechtenstein','423'),(601,'Lithuania','370'),(602,'Luxembourg','352'),(603,'Macau','853'),(604,'Macedonia','389'),(605,'Madagascar','261'),(606,'Malawi','265'),(607,'Malaysia','60'),(608,'Maldives','960'),(609,'Mali','223'),(610,'Malta','356'),(611,'Marshall Islands','692'),(612,'Mauritania','222'),(613,'Mauritius','230'),(614,'Mayotte','262'),(615,'Mexico','52'),(616,'Micronesia','691'),(617,'Moldova','373'),(618,'Monaco','377'),(619,'Mongolia','976'),(620,'Montenegro','382'),(621,'Montserrat','1-664'),(622,'Morocco','212'),(623,'Mozambique','258'),(624,'Myanmar','95'),(625,'Namibia','264'),(626,'Nauru','674'),(627,'Nepal','977'),(628,'Netherlands','31'),(629,'Netherlands Antilles','599'),(630,'New Caledonia','687'),(631,'New Zealand','64'),(632,'Nicaragua','505'),(633,'Niger','227'),(634,'Nigeria','234'),(635,'Niue','683'),(636,'North Korea','850'),(637,'Northern Mariana Islands','1-670'),(638,'Norway','47'),(639,'Oman','968'),(640,'Pakistan','92'),(641,'Palau','680'),(642,'Palestine','970'),(643,'Panama','507'),(644,'Papua New Guinea','675'),(645,'Paraguay','595'),(646,'Peru','51'),(647,'Philippines','63'),(648,'Pitcairn','64'),(649,'Poland','48'),(650,'Portugal','351'),(651,'Puerto Rico','1-787, 1-939'),(652,'Qatar','974'),(653,'Republic of the Congo','242'),(654,'Reunion','262'),(655,'Romania','40'),(656,'Russia','7'),(657,'Rwanda','250'),(658,'Saint Barthelemy','590'),(659,'Saint Helena','290'),(660,'Saint Kitts and Nevis','1-869'),(661,'Saint Lucia','1-758'),(662,'Saint Martin','590'),(663,'Saint Pierre and Miquelon','508'),(664,'Saint Vincent and the Grenadines','1-784'),(665,'Samoa','685'),(666,'San Marino','378'),(667,'Sao Tome and Principe','239'),(668,'Saudi Arabia','966'),(669,'Senegal','221'),(670,'Serbia','381'),(671,'Seychelles','248'),(672,'Sierra Leone','232'),(673,'Singapore','65'),(674,'Sint Maarten','1-721'),(675,'Slovakia','421'),(676,'Slovenia','386'),(677,'Solomon Islands','677'),(678,'Somalia','252'),(679,'South Africa','27'),(680,'South Korea','82'),(681,'South Sudan','211'),(682,'Spain','34'),(683,'Sri Lanka','94'),(684,'Sudan','249'),(685,'Suriname','597'),(686,'Svalbard and Jan Mayen','47'),(687,'Swaziland','268'),(688,'Sweden','46'),(689,'Switzerland','41'),(690,'Syria','963'),(691,'Taiwan','886'),(692,'Tajikistan','992'),(693,'Tanzania','255'),(694,'Thailand','66'),(695,'Togo','228'),(696,'Tokelau','690'),(697,'Tonga','676'),(698,'Trinidad and Tobago','1-868'),(699,'Tunisia','216'),(700,'Turkey','90'),(701,'Turkmenistan','993'),(702,'Turks and Caicos Islands','1-649'),(703,'Tuvalu','688'),(704,'U.S. Virgin Islands','1-340'),(705,'Uganda','256'),(706,'Ukraine','380'),(707,'United Arab Emirates','971'),(708,'United Kingdom','44'),(709,'United States','1'),(710,'Uruguay','598'),(711,'Uzbekistan','998'),(712,'Vanuatu','678'),(713,'Vatican','379'),(714,'Venezuela','58'),(715,'Vietnam','84'),(716,'Wallis and Futuna','681'),(717,'Western Sahara','212'),(718,'Yemen','967'),(719,'Zambia','260'),(720,'Zimbabwe','263');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
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
-- Table structure for table `identification_details`
--

DROP TABLE IF EXISTS `identification_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identification_details` (
  `identification_details_id` int NOT NULL AUTO_INCREMENT,
  `aadhar_number` varchar(224) DEFAULT NULL,
  `pan_number` varchar(224) NOT NULL,
  PRIMARY KEY (`identification_details_id`),
  UNIQUE KEY `pan_number_UNIQUE` (`pan_number`),
  UNIQUE KEY `aadhar_number_UNIQUE` (`aadhar_number`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identification_details`
--

LOCK TABLES `identification_details` WRITE;
/*!40000 ALTER TABLE `identification_details` DISABLE KEYS */;
INSERT INTO `identification_details` VALUES (1,'3f87cbea323c930581766f0cad50f5fb89c09551e5834f7e10fbbba3','d63b58e1a50cb427e9a9f81e5c0dab7dc43b31b888a42b5d2cc30a6f'),(2,'807b9bcd628c90a1bcdedaaddb15f1a25366af53a8b4e2c692d80bb8','20a69e5abcfbae47f0b0aa514561e3ffbbf75100ef59906157793f86'),(3,'96bbc1bd683a7bec15cfc46b095af2125e9be8badea78ad61e9252e0','58f478b13f788d1e5d9245e0e2edf791c4bc1168fc0326c5a8ac395c'),(4,'d1320901ef8eb3a296e105479ab3e35774c0126ddde7055d2968974f','7a60e8534ea4700b480cfb7822c96bb47c91020251953901bde56617'),(5,'7f18b1beec3e2b5517f3c4b3c494210fa84da952b1aac17fcd8c11ba','4e1766f037f8c097da69889dba323d622920eb057834702643082d27'),(18,'fd135afab1c4add51a929206be279cf8c3258198a5b9e1c6bd573e48','414116c3f3f46126138e4434d7d0d225d33979aacc18694f2a16dbed'),(22,'0eddb2b4ef5b7db707ff86aa51c07bc3a6e8ac7fa713b158464b3f99','86db4de9d4df56f35cb7d4fe4e231abc720eafa2403ebc3352173ee3');
/*!40000 ALTER TABLE `identification_details` ENABLE KEYS */;
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
INSERT INTO `issue_return` VALUES (1,1,1,1,'2020-02-27 10:15:42','2020-03-01 10:15:42',NULL,NULL),(2,8,2,2,'2020-02-28 05:38:51','2020-03-02 05:38:51',NULL,NULL);
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
  `city_id` int NOT NULL,
  `state_id` int DEFAULT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `loc_to_country_idx` (`country_id`),
  KEY `loc_to_state_idx` (`state_id`),
  KEY `loc_to_city_idx` (`city_id`),
  CONSTRAINT `loc_to_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  CONSTRAINT `loc_to_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`),
  CONSTRAINT `loc_to_state` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,1,1,1),(2,2,1,1),(3,4,1,1),(7,3,2,1),(8,9,8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
INSERT INTO `phone` VALUES (1,'Mobile',1,'6983843875',NULL),(2,'Mobile',1,'4785487584',NULL),(3,'Mobile',1,'5748396602',NULL),(4,'Mobile',1,'4785123584',NULL),(5,'Mobile',1,'4785123584',NULL),(6,'Mobile',1,'2778704032',NULL),(14,'Mobile',1,'2756404032',NULL),(16,'Mobile',1,'2756404032',NULL),(18,'Mobile',1,'2756404032',NULL),(19,'Mobile',1,'2756404032',NULL),(23,'Mobile',1,'4564843278',NULL);
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
INSERT INTO `request` VALUES (1,1,1,'2020-02-27 10:11:11','2020-03-01 10:11:11','Accepted','Medium'),(2,8,2,'2020-02-27 10:11:11','2020-03-01 10:11:11','Accepted','High');
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
INSERT INTO `salutation` VALUES (4,'Dr'),(1,'Mr'),(3,'Mrs'),(2,'Ms');
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
  PRIMARY KEY (`state_id`),
  UNIQUE KEY `state_id_UNIQUE` (`state_id`),
  UNIQUE KEY `state_name_UNIQUE` (`state_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Haryana'),(2,'New Delhi'),(8,'Uttar Pradesh');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
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
  `email` varchar(50) NOT NULL,
  `password` varchar(224) NOT NULL,
  `date_of_birth` date NOT NULL,
  `is_married` bit(1) NOT NULL,
  `gender` enum('m','f','o') NOT NULL,
  `date_of_joining` date NOT NULL,
  `identification_details_id` int NOT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `user_to_designation_idx` (`designation_id`),
  KEY `user_to_salutation_idx` (`salutation_id`),
  KEY `user_to_details_idx` (`identification_details_id`),
  CONSTRAINT `user_to_designation` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`designation_id`),
  CONSTRAINT `user_to_details` FOREIGN KEY (`identification_details_id`) REFERENCES `identification_details` (`identification_details_id`),
  CONSTRAINT `user_to_salutation` FOREIGN KEY (`salutation_id`) REFERENCES `salutation` (`salutation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,2,'Megha',NULL,'Gupta',1,'mgupta@ex2india.com','cb60166bbf329c41e3163837cf5b3b969850fcc52306b7bd70537a29','1997-02-10',_binary '','f','2020-01-15',1,_binary ''),(8,1,'Suraj','Singh','Rawat',1,'ssrawat@ex2india.com','c8eb04cd283e227a68840003ccd50fbc5b2d230a84d29ef5dfbd4e15','1997-05-12',_binary '\0','m','2020-01-15',4,_binary ''),(9,1,'Rishabh',NULL,'Bisht',1,'rbisht@ex2india.com','2e68eced966a6997474f67d2d283323ff8441cd9cd7269ecb5e418cb','1997-01-01',_binary '\0','m','2020-01-15',5,_binary ''),(10,1,'Jaswinder','Singh','Chawla',1,'jschawla@ex2india.com','e9ddce690a9adc0ae345cd72f41d74120706d9833c2b4799e49f03cb','1998-05-24',_binary '\0','m','2020-01-15',2,_binary '\0'),(11,2,'Prakshee',NULL,'Rajpurohit',1,'prajpurohit@ex2india.com','f6736487a9b4e90bd17e4eab0161f998510d0077d955f0463f7f220c','1998-03-06',_binary '\0','f','2020-01-15',3,_binary ''),(20,1,'Sagar',NULL,'Jangra',1,'sjangra@ex2india.com','6114b0c792a88b0b90194e058d3e5a8cc40b5a526f095d94d5c61d6c','1998-12-05',_binary '\0','m','2020-01-15',18,_binary ''),(23,1,'Animash',NULL,'Das',1,'adas@ex2india.com','f51859005e599fe6a1f5565199a4ef4b6ed0938e950e67b16cd3d4b1','1998-06-06',_binary '\0','m','2020-02-03',22,_binary '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_address`
--

DROP TABLE IF EXISTS `user_to_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_to_address` (
  `emp_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`emp_id`,`address_id`),
  KEY `address_map_address_idx` (`address_id`),
  CONSTRAINT `address_map_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `user_map_address_user` FOREIGN KEY (`emp_id`) REFERENCES `user` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_address`
--

LOCK TABLES `user_to_address` WRITE;
/*!40000 ALTER TABLE `user_to_address` DISABLE KEYS */;
INSERT INTO `user_to_address` VALUES (1,1),(8,2),(9,3),(10,4),(11,5),(20,6),(23,9),(23,10);
/*!40000 ALTER TABLE `user_to_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_phone`
--

DROP TABLE IF EXISTS `user_to_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_to_phone` (
  `emp_id` int NOT NULL,
  `phone_id` int NOT NULL,
  PRIMARY KEY (`emp_id`,`phone_id`),
  KEY `phone_map_phone_idx` (`phone_id`),
  CONSTRAINT `phone_map_phone` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`phone_id`),
  CONSTRAINT `user_map_phone_user` FOREIGN KEY (`emp_id`) REFERENCES `user` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_phone`
--

LOCK TABLES `user_to_phone` WRITE;
/*!40000 ALTER TABLE `user_to_phone` DISABLE KEYS */;
INSERT INTO `user_to_phone` VALUES (1,1),(8,2),(9,3),(10,5),(11,6),(20,19),(23,23);
/*!40000 ALTER TABLE `user_to_phone` ENABLE KEYS */;
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
  CONSTRAINT `role_id_to_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_role`
--

LOCK TABLES `user_to_role` WRITE;
/*!40000 ALTER TABLE `user_to_role` DISABLE KEYS */;
INSERT INTO `user_to_role` VALUES (1,1),(8,1),(9,1),(10,1),(11,1),(20,1),(23,1);
/*!40000 ALTER TABLE `user_to_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'newdbb'
--

--
-- Dumping routines for database 'newdbb'
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
city varchar(45),
state_n varchar(45),
country varchar(45),
pin varchar(6)) RETURNS int
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	declare city_id varchar(45);
    declare state_id int;
    declare ctry_id int;
    declare adrss_id int;
    
     select country_id into ctry_id from country where country_name=country;
     
     if not exists(select city_id from city where city.city_name=city) then
		begin
			INSERT INTO `newdbb`.`city`(`city_name`) VALUES (city);
            set city_id:=last_insert_id();
		end;
	else
		select city.city_id into city_id from city where city_name=city;
	end if;
    
    if not exists (select state_id from state where state.state_name=state_n) then
		begin
			INSERT INTO `newdbb`.`state`(`state_name`) VALUES (state_n);
            set state_id:=last_insert_id();
		end;
	else
		select state.state_id into state_id from state where state_name=state_n;
	end if;
    
    if(SELECT count(location_id) from location where location.city_id=city_id and location.state_id=state_id and location.country_id=ctry_id) = 0 then
		begin
			INSERT INTO `newdbb`.`location`(`city_id`,`state_id`,`country_id`) VALUES (city_id, state_id, ctry_id);
			set adrss_id:=last_insert_id();
		end;
	else
		begin
			SELECT location_id into adrss_id from location where  location.city_id=city_id and location.state_id=state_id and location.country_id=ctry_id;
            end;
	end if;
    
    
    INSERT INTO `newdbb`.`address`(`address_type`,`address`, `PIN`, `location_id`)
	VALUES
	(addres_type, addres, pin, adrss_id);
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
in desig varchar(30),
in email varchar(50),
in pass varchar(50),
in dob date,
in is_m bit(1),
in gend char(1),
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
in is_ac bit(1)
)
BEGIN 
	
    
	declare sal_id int;
    declare des_id int;
    declare city_id int;
    declare state_id int;
    declare ctry_id int;
    declare ph_id int;
    declare empl_id int;
    declare adrss_id int;
    declare user_role int;
    declare id_details int;
    
    declare exit handler for sqlexception
    begin
		rollback;
	end;
    
	SELECT salutation_id INTO sal_id FROM salutation WHERE salutation = salut;
	SELECT 
    designation_id
INTO des_id FROM
    designation
WHERE
    designation = desig;
	SELECT 
    country_id
INTO ctry_id FROM
    country
WHERE
    country_name = country;
	SELECT 
    role_id
INTO user_role FROM
    role
WHERE
    role_name = 'user';
    
    

    start transaction;
		INSERT INTO `newdbb`.`phone`
		(`number_type`,`country_id`,`number`,`extension`)
		VALUES
		(ph_num_type, ctry_id, ph_number, ph_ext);
		set ph_id:=last_insert_id();
	
    
		INSERT INTO `newdbb`.`identification_details`(`aadhar_number`,`pan_number`) VALUES(sha2(aadhar, 224), sha2(pan, 224));
		set id_details:=last_insert_id();

    
		INSERT INTO `newdbb`.`user`
		(`salutation_id`,`first_name`,`middle_name`,`last_name`,`designation_id`,`email`,`password`,`date_of_birth`,`is_married`,`gender`,`date_of_joining`,`identification_details_id`,`is_active`)
		VALUES
		(sal_id,f_name,m_name,l_name,des_id,email,SHA2(pass, 224),dob,is_m,gend,doj,id_details,is_ac);
		set empl_id:=last_insert_id();
    
    	
		set adrss_id:=insert_address(addres, 'Current', city, state, country, pin);
		insert into user_to_address values(empl_id, adrss_id);
		if addres2 is not null then
			set adrss_id:=insert_address(addres2, 'Permanent', city2, state2, country2, pin2);
			insert into user_to_address values(empl_id, adrss_id);
		end if;
		
		insert into user_to_phone values(empl_id, ph_id);
   
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

-- Dump completed on 2020-03-03 15:20:45
