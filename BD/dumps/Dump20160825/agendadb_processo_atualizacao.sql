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
-- Table structure for table `processo_atualizacao`
--

DROP TABLE IF EXISTS `processo_atualizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processo_atualizacao` (
  `processo_atualizacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `processo` varchar(200) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `escola_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `responsavel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`processo_atualizacao_id`),
  KEY `fk_tabela_atualizacao_x_escola_idx` (`escola_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processo_atualizacao`
--

LOCK TABLES `processo_atualizacao` WRITE;
/*!40000 ALTER TABLE `processo_atualizacao` DISABLE KEYS */;
INSERT INTO `processo_atualizacao` VALUES (33,'aluno','2016-08-22 12:46:39',1,NULL,NULL),(34,'turma','2016-08-23 11:12:26',1,NULL,NULL),(35,'escola','2016-07-29 16:49:23',1,NULL,NULL),(36,'funcionario','2016-08-23 11:12:12',1,NULL,NULL),(38,'periodo_tipo','2016-04-25 12:45:38',0,NULL,NULL),(39,'responsavel_tipo','2016-08-22 12:49:29',0,NULL,NULL),(40,'funcionario_tipo','2016-04-22 10:47:51',0,NULL,NULL),(41,'telefone_tipo','2016-04-22 10:48:00',0,NULL,NULL),(42,'agenda_tipo','2016-04-23 00:59:16',0,NULL,NULL),(44,'responsavel','2016-08-23 11:12:05',0,NULL,NULL),(45,'responsavel','2016-08-23 11:12:05',1,NULL,NULL),(46,'responsavel','2016-08-11 12:03:19',2,NULL,NULL),(55,'configuracoes','2016-08-25 15:46:10',NULL,NULL,75),(56,'configuracoes','2016-08-25 15:46:45',NULL,18,NULL),(58,'configuracoes','2016-08-25 15:47:46',NULL,6,NULL);
/*!40000 ALTER TABLE `processo_atualizacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-25 15:50:20
