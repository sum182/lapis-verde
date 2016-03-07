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
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda` (
  `agenda_id` varchar(100) NOT NULL DEFAULT '',
  `descricao` text,
  `data_insert_local` datetime DEFAULT NULL,
  `data_insert_server` datetime DEFAULT NULL,
  `agenda_tipo_id` smallint(6) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `escola_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`agenda_id`),
  KEY `fk_agenda_agenda_tipo_idx` (`agenda_tipo_id`),
  KEY `fk_agenda_x_funcionario_idx` (`funcionario_id`),
  KEY `idx_agenda_data` (`data_insert_local`),
  KEY `fk_agenda_x_escola_idx` (`escola_id`),
  CONSTRAINT `fk_agenda_x_agenda_tipo` FOREIGN KEY (`agenda_tipo_id`) REFERENCES `agenda_tipo` (`agenda_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenda_x_escola` FOREIGN KEY (`escola_id`) REFERENCES `escola` (`escola_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenda_x_funcionario` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`funcionario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
INSERT INTO `agenda` VALUES ('2AB762D8-BCE4-E511-AD9F-2D5B12EB029A','5','2016-03-07 20:32:24','2016-03-07 20:32:46',NULL,16,1),('379F50E2-32A2-4EAB-A855-AFB0E200BB9F','888','2016-03-06 17:22:27','2016-03-07 20:32:46',NULL,16,1),('5FE07333-20C0-4914-A29E-EE5796CCA1E5','3','2016-03-07 20:22:45','2016-03-07 20:23:02',NULL,16,1),('728377B8-9C92-4C24-A550-DB28954EEBAA','4','2016-03-07 20:23:41','2016-03-07 20:23:42',NULL,16,1),('AF6EED5C-2C67-40F8-A72C-FBB6604779A2','888','2016-03-06 17:22:41','2016-03-07 20:32:46',NULL,16,1),('BE990E93-8999-467A-8BA9-E5514529837B','1','2016-03-07 20:22:42','2016-03-07 20:23:02',NULL,16,1),('EA50F76A-797D-4918-8528-2B61B7B05734','2','2016-03-07 20:22:44','2016-03-07 20:23:02',NULL,16,1);
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-07 20:35:11
