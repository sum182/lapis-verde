-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: agenda
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `agenda_aluno`
--

DROP TABLE IF EXISTS `agenda_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda_aluno` (
  `agenda_id` int(11) NOT NULL,
  `aluno_id` int(11) NOT NULL,
  PRIMARY KEY (`agenda_id`,`aluno_id`),
  KEY `fk_agenda_x_aluno_idx` (`aluno_id`),
  CONSTRAINT `fk_agenda_aluno_x_agenda` FOREIGN KEY (`agenda_id`) REFERENCES `agenda` (`agenda_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_agenda_aluno_x_aluno` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`aluno_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_aluno`
--

LOCK TABLES `agenda_aluno` WRITE;
/*!40000 ALTER TABLE `agenda_aluno` DISABLE KEYS */;
INSERT INTO `agenda_aluno` VALUES (13,19),(14,19),(19,19),(26,19),(27,19),(29,19),(30,19),(32,19),(38,19),(40,19),(41,19),(42,19),(43,19),(44,19),(26,25),(27,25),(29,25),(30,25),(32,25),(38,25),(40,25),(26,27),(27,27),(28,27),(29,27),(30,27),(31,27),(32,27),(34,27),(36,27),(38,27),(45,27),(47,27),(50,27),(20,28),(26,28),(27,28),(29,28),(30,28),(32,28),(33,28),(35,28),(37,28),(38,28),(39,28),(46,28),(48,28),(49,28);
/*!40000 ALTER TABLE `agenda_aluno` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-13 12:39:37
