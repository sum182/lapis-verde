-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: agendadb.cfmlnopzuyrp.sa-east-1.rds.amazonaws.com    Database: agendadb
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
  `agenda_id` varchar(100) NOT NULL,
  `aluno_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`agenda_id`,`aluno_id`),
  KEY `fk_agenda_x_aluno_idx` (`aluno_id`),
  KEY `fk_agenda_x_agenda_idx` (`agenda_id`),
  CONSTRAINT `fk_agenda_aluno_x_agenda` FOREIGN KEY (`agenda_id`) REFERENCES `agenda` (`agenda_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_agenda_aluno_x_aluno` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`aluno_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_aluno`
--

LOCK TABLES `agenda_aluno` WRITE;
/*!40000 ALTER TABLE `agenda_aluno` DISABLE KEYS */;
INSERT INTO `agenda_aluno` VALUES ('2AB762D8-BCE4-E511-AD9F-2D5B12EB029A',19),('379F50E2-32A2-4EAB-A855-AFB0E200BB9F',19),('5FE07333-20C0-4914-A29E-EE5796CCA1E5',19),('728377B8-9C92-4C24-A550-DB28954EEBAA',19),('AF6EED5C-2C67-40F8-A72C-FBB6604779A2',19),('BE990E93-8999-467A-8BA9-E5514529837B',19),('EA50F76A-797D-4918-8528-2B61B7B05734',19);
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

-- Dump completed on 2016-03-07 20:35:01
