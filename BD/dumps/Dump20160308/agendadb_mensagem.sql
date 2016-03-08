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
-- Table structure for table `mensagem`
--

DROP TABLE IF EXISTS `mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensagem` (
  `mensagem_id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` text,
  `data` datetime DEFAULT NULL,
  `mensagem_tipo_id` smallint(6) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `aluno_id` int(11) DEFAULT NULL,
  `escola_id` int(11) DEFAULT NULL,
  `responsavel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`mensagem_id`),
  KEY `fk_mensagem_x_funcionario_idx` (`funcionario_id`),
  KEY `fk_mensagem_x_responsavel_idx` (`aluno_id`),
  KEY `fk_mensagem_x_mensagem_tipo_idx` (`mensagem_tipo_id`),
  KEY `idx_mensage_data` (`data`),
  KEY `fk_mensagem_x_escola_idx` (`escola_id`),
  KEY `fk_mensagem_x_responsavel_idx1` (`responsavel_id`),
  CONSTRAINT `fk_mensagem_x_aluno` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`aluno_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mensagem_x_escola` FOREIGN KEY (`escola_id`) REFERENCES `escola` (`escola_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mensagem_x_funcionario` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`funcionario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mensagem_x_mensagem_tipo` FOREIGN KEY (`mensagem_tipo_id`) REFERENCES `mensagem_tipo` (`mensagem_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mensagem_x_responsavel` FOREIGN KEY (`responsavel_id`) REFERENCES `responsavel` (`responsavel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensagem`
--

LOCK TABLES `mensagem` WRITE;
/*!40000 ALTER TABLE `mensagem` DISABLE KEYS */;
INSERT INTO `mensagem` VALUES (1,'teste','2016-01-08 15:58:09',1,16,19,1,NULL),(2,'fdas','2016-01-08 16:01:52',1,16,19,1,NULL),(3,'vcz','2016-01-08 16:02:07',1,16,19,1,NULL),(4,'fdasfa\r\nfdasfa\r\nfdasfas\r\nfdasfa','2016-01-08 16:02:16',1,16,19,1,NULL),(5,'aaa','2016-01-08 16:21:27',1,16,19,NULL,NULL),(6,'aa','2016-01-08 16:21:32',1,16,25,NULL,NULL),(7,'aa','2016-01-08 16:21:36',1,16,28,NULL,NULL),(8,'teste','2016-01-08 16:21:47',1,16,28,NULL,NULL),(9,'aaa','2016-01-08 16:22:44',1,16,19,NULL,NULL),(10,'aa','2016-01-08 16:23:05',1,16,19,NULL,NULL),(11,'aa','2016-01-08 16:24:10',1,16,19,NULL,NULL),(12,'aa','2016-01-08 16:25:25',1,16,19,1,NULL),(13,'aa','2016-01-08 16:25:31',1,16,25,1,NULL),(14,'aaa','2016-01-08 16:28:35',1,16,19,1,NULL),(15,'fdas','2016-01-08 16:28:37',1,16,19,1,NULL),(16,'fdas','2016-01-08 16:28:39',1,16,19,1,NULL),(17,'03213','2016-01-13 15:57:02',1,16,19,1,NULL),(18,'aaa','2016-02-01 15:00:47',1,16,19,1,NULL);
/*!40000 ALTER TABLE `mensagem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-08 17:59:20
