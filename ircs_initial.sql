-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: ircs
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_eve_register`
--

DROP TABLE IF EXISTS `act_eve_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_eve_register` (
  `eventID` int(15) unsigned NOT NULL,
  `locationID` int(10) unsigned DEFAULT NULL,
  `type_code` char(1) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `org_by` int(10) unsigned DEFAULT NULL,
  `venue` varchar(50) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `active` char(1) NOT NULL DEFAULT 'Y',
  `purpose` varchar(250) DEFAULT NULL,
  `participation` int(10) unsigned DEFAULT NULL,
  `comments` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`eventID`),
  KEY `FK_5` (`locationID`),
  KEY `FK_4` (`type_code`,`eventID`),
  CONSTRAINT `FK_4` FOREIGN KEY (`type_code`, `eventID`) REFERENCES `event_activity_code` (`type_code`, `id`),
  CONSTRAINT `FK_5` FOREIGN KEY (`locationID`) REFERENCES `locations` (`locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_eve_register`
--

LOCK TABLES `act_eve_register` WRITE;
/*!40000 ALTER TABLE `act_eve_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_eve_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_details`
--

DROP TABLE IF EXISTS `contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_details` (
  `reg_id` int(10) unsigned NOT NULL,
  `email` varchar(30) NOT NULL,
  `ph_no` varchar(15) NOT NULL,
  `curr_addr_state` varchar(30) NOT NULL,
  `curr_addr_district` varchar(30) DEFAULT NULL,
  `curr_addr_city` varchar(30) DEFAULT NULL,
  `curr_addr` varchar(50) NOT NULL,
  `curr_addr_pincode` varchar(7) DEFAULT NULL,
  `perm_addr_state` varchar(30) NOT NULL,
  `perm_addr_district` varchar(30) DEFAULT NULL,
  `perm_addr_city` varchar(30) DEFAULT NULL,
  `perm_addr` varchar(50) DEFAULT NULL,
  `perm_addr_pincode` varchar(7) DEFAULT NULL,
  `fb` varchar(100) DEFAULT '0',
  `twitter` varchar(100) DEFAULT '0',
  `linkedin` varchar(100) DEFAULT '0',
  PRIMARY KEY (`reg_id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `FK_1` FOREIGN KEY (`reg_id`) REFERENCES `volunteer_details` (`reg_id`),
  CONSTRAINT `FK_2` FOREIGN KEY (`email`) REFERENCES `volunteer_details` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_details`
--

LOCK TABLES `contact_details` WRITE;
/*!40000 ALTER TABLE `contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_activity_code`
--

DROP TABLE IF EXISTS `event_activity_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_activity_code` (
  `type_code` char(1) DEFAULT NULL,
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL,
  `subtype` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_type` (`type_code`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_activity_code`
--

LOCK TABLES `event_activity_code` WRITE;
/*!40000 ALTER TABLE `event_activity_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_activity_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `locationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `countryRegionName` varchar(5) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `ISOcode` varchar(20) DEFAULT NULL,
  `CityPlaceName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_details`
--

DROP TABLE IF EXISTS `login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_details` (
  `email` varchar(30) NOT NULL,
  `pword` int(64) unsigned DEFAULT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `FK_3` FOREIGN KEY (`email`) REFERENCES `volunteer_details` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_details`
--

LOCK TABLES `login_details` WRITE;
/*!40000 ALTER TABLE `login_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vol_location`
--

DROP TABLE IF EXISTS `vol_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vol_location` (
  `reg_id` int(10) unsigned NOT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `district` varchar(30) DEFAULT NULL,
  `nature` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vol_location`
--

LOCK TABLES `vol_location` WRITE;
/*!40000 ALTER TABLE `vol_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `vol_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vol_participation_register`
--

DROP TABLE IF EXISTS `vol_participation_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vol_participation_register` (
  `eventID` int(15) unsigned NOT NULL,
  `volunteerID` int(10) unsigned NOT NULL,
  `role` varchar(15) DEFAULT NULL,
  `dat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`eventID`,`volunteerID`),
  KEY `FK_7` (`volunteerID`),
  CONSTRAINT `FK_6` FOREIGN KEY (`eventID`) REFERENCES `event_activity_code` (`id`),
  CONSTRAINT `FK_7` FOREIGN KEY (`volunteerID`) REFERENCES `volunteer_details` (`reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vol_participation_register`
--

LOCK TABLES `vol_participation_register` WRITE;
/*!40000 ALTER TABLE `vol_participation_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `vol_participation_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer_details`
--

DROP TABLE IF EXISTS `volunteer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volunteer_details` (
  `reg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `middle_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `father_name` varchar(35) NOT NULL,
  `mother_name` varchar(35) NOT NULL,
  `dob` date NOT NULL,
  `marital_status` varchar(7) DEFAULT NULL,
  `occupation` varchar(20) DEFAULT NULL,
  `qualification` varchar(20) DEFAULT NULL,
  `training` varchar(5) NOT NULL,
  `volunteer_type` varchar(5) DEFAULT NULL,
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `approval_date` datetime DEFAULT NULL,
  `active` char(1) NOT NULL DEFAULT 'Y',
  `photo_id_type` varchar(20) DEFAULT NULL,
  `photo_id_no` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`reg_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `photo_id_no` (`photo_id_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer_details`
--

LOCK TABLES `volunteer_details` WRITE;
/*!40000 ALTER TABLE `volunteer_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `volunteer_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-11 10:51:48
