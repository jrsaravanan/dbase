CREATE DATABASE  IF NOT EXISTS `test` DEFAULT CHARSET=utf8;


#echo "Creating user"
CREATE USER 'appuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'appuser'@'localhost';
 GRANT ALL PRIVILEGES ON *.* TO 'appuser'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;


USE `test`;

-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version 5.5.40-0ubuntu0.14.04.1

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
-- Table structure for table `DEPARTMENT`
--

DROP TABLE IF EXISTS `DEPARTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTMENT` (
  `DEPT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DEPT_ID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `DEPARTMENT` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `DEPARTMENT` VALUES (1,'TEST Department','DPE'),(2,'CMP Department','CMP');
/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPARTMENT_PERSON`
--

DROP TABLE IF EXISTS `DEPARTMENT_PERSON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTMENT_PERSON` (
  `DEPARTMENT_DEPT_ID` bigint(20) NOT NULL,
  `persons_PERSON_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`DEPARTMENT_DEPT_ID`,`persons_PERSON_ID`),
  UNIQUE KEY `persons_PERSON_ID` (`persons_PERSON_ID`),
  KEY `FKA4CBDCE238967112` (`persons_PERSON_ID`),
  KEY `FKA4CBDCE2AD4876B3` (`DEPARTMENT_DEPT_ID`),
  CONSTRAINT `FKA4CBDCE2AD4876B3` FOREIGN KEY (`DEPARTMENT_DEPT_ID`) REFERENCES `DEPARTMENT` (`DEPT_ID`),
  CONSTRAINT `FKA4CBDCE238967112` FOREIGN KEY (`persons_PERSON_ID`) REFERENCES `PERSON` (`PERSON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT_PERSON`
--

LOCK TABLES `DEPARTMENT_PERSON` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT_PERSON` DISABLE KEYS */;
/*!40000 ALTER TABLE `DEPARTMENT_PERSON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSON`
--

DROP TABLE IF EXISTS `PERSON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSON` (
  `PERSON_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `department_DEPT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PERSON_ID`),
  KEY `FK8C768F55AD4876B3` (`department_DEPT_ID`),
  CONSTRAINT `FK8C768F55AD4876B3` FOREIGN KEY (`department_DEPT_ID`) REFERENCES `DEPARTMENT` (`DEPT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSON`
--

LOCK TABLES `PERSON` WRITE;
/*!40000 ALTER TABLE `PERSON` DISABLE KEYS */;
INSERT INTO `PERSON` VALUES (1,'some description','Bob','Jones',1),(2,'some description','Chandra','Narayanasamy',1),(3,'some description','Mukunth','Chandra',1),(4,'some description','Shiva','Chandra',2);
/*!40000 ALTER TABLE `PERSON` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-07  4:38:37
