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
  `agenda_id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` text,
  `data` datetime DEFAULT NULL,
  `agenda_tipo_id` smallint(6) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `escola_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`agenda_id`),
  KEY `fk_agenda_agenda_tipo_idx` (`agenda_tipo_id`),
  KEY `fk_agenda_x_funcionario_idx` (`funcionario_id`),
  KEY `idx_agenda_data` (`data`),
  KEY `fk_agenda_x_escola_idx` (`escola_id`),
  CONSTRAINT `fk_agenda_x_agenda_tipo` FOREIGN KEY (`agenda_tipo_id`) REFERENCES `agenda_tipo` (`agenda_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenda_x_escola` FOREIGN KEY (`escola_id`) REFERENCES `escola` (`escola_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenda_x_funcionario` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`funcionario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
INSERT INTO `agenda` VALUES (1,NULL,NULL,NULL,NULL,NULL),(2,'descr',NULL,NULL,NULL,NULL),(3,'pessoal hj nao teremos aula','2016-01-05 16:55:18',NULL,NULL,NULL),(4,'aaaaaaaaaaa','2016-01-05 17:01:35',NULL,NULL,NULL),(5,'aaaa','2016-01-05 17:02:40',NULL,NULL,NULL),(6,'dfsaf\r\nfd\r\nasf\r\ndasd\r\nfas\r\nf\r\nasdf\r\nas\r\nfas\r\nf\r\nas\r\nfas\r\ndf\r\nas\r\nfas\r\ndf\r\nasd\r\nfas\r\ndf\r\nasdf\r\n','2016-01-05 17:03:27',NULL,NULL,NULL),(7,'fdasfas','2016-01-05 17:07:00',NULL,NULL,NULL),(8,'fadsfas','2016-01-05 17:07:03',NULL,NULL,NULL),(9,'aaaa','2016-01-05 17:10:25',NULL,NULL,2),(10,'aaa','2016-01-05 17:11:14',NULL,NULL,1),(11,'fdas','2016-01-05 17:32:59',NULL,NULL,1),(12,'fasdfas','2016-01-05 17:40:13',NULL,NULL,1),(13,'aaa leo','2016-01-05 17:49:28',NULL,NULL,1),(14,'aaa','2016-01-05 17:50:25',NULL,NULL,1),(15,NULL,'2016-01-05 17:52:03',NULL,NULL,1),(16,'aaa','2016-01-05 17:53:45',NULL,NULL,1),(17,'dfas','2016-01-05 17:58:39',NULL,NULL,1),(18,'fdadsfa','2016-01-05 17:59:26',NULL,NULL,1),(19,'fads','2016-01-05 18:00:23',NULL,NULL,1),(20,'fdasfas','2016-01-05 18:01:09',NULL,NULL,1),(21,'fdasdfasdf','2016-01-06 12:29:50',NULL,NULL,1),(22,'aaaaaa','2016-01-06 12:44:29',NULL,NULL,1),(23,NULL,'2016-01-06 12:44:49',NULL,NULL,1),(24,NULL,'2016-01-06 12:45:43',NULL,NULL,1),(25,NULL,'2016-01-06 12:46:16',NULL,NULL,1),(26,NULL,'2016-01-06 12:46:49',NULL,NULL,1),(27,NULL,'2016-01-06 12:46:57',NULL,NULL,1),(28,'dfasf','2016-01-06 12:52:30',NULL,NULL,1),(29,NULL,'2016-01-06 12:52:45',NULL,NULL,1),(30,'dfasfdsa','2016-01-06 13:00:33',NULL,NULL,1),(31,'sss','2016-01-06 13:00:38',NULL,NULL,1),(32,'aaa','2016-01-06 14:38:41',NULL,NULL,1),(33,'fdasf','2016-01-06 14:43:03',NULL,NULL,1),(34,'dfafas','2016-01-06 14:48:35',NULL,NULL,1),(35,'dfa','2016-01-06 14:48:39',NULL,NULL,1),(36,'fadsfa','2016-01-06 14:53:30',NULL,NULL,1),(37,'fdasf','2016-01-06 15:55:24',NULL,NULL,1),(38,'fad','2016-01-06 15:55:44',NULL,NULL,1),(39,'sedf','2016-01-06 15:56:14',NULL,NULL,1),(40,'fda','2016-01-06 15:56:26',NULL,NULL,1),(41,'fda','2016-01-06 15:56:57',NULL,NULL,1),(42,'dfs','2016-01-06 15:57:41',NULL,NULL,1),(43,'asdf','2016-01-06 15:58:23',NULL,NULL,1),(44,'dfsa','2016-01-07 16:32:23',NULL,16,1),(45,'aa','2016-01-07 16:35:26',NULL,NULL,1),(46,'a','2016-01-07 17:59:20',NULL,16,1),(47,'aa','2016-01-07 18:00:12',NULL,16,1),(48,'dcxvf','2016-01-07 18:03:51',NULL,16,1),(49,'aa','2016-01-08 15:19:22',NULL,16,1),(50,'aa','2016-01-08 16:28:31',NULL,16,1),(51,'dasf','2016-01-13 16:03:23',NULL,16,1),(52,'asdaf','2016-01-14 17:56:09',NULL,16,1),(53,'aa','2016-01-31 20:30:03',NULL,16,1),(54,'sss','2016-01-31 20:31:12',NULL,16,1),(55,'aaa','2016-02-01 15:00:37',NULL,16,1),(56,'sfddsfs','2016-02-01 16:09:29',NULL,16,1),(57,'teste novo',NULL,NULL,NULL,1);
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

-- Dump completed on 2016-03-04 16:16:52
